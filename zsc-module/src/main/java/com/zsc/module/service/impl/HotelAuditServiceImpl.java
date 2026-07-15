package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.HotelAuditQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.entity.HotelAudit;
import com.zsc.module.domain.enums.HotelAuditStatusEnum;
import com.zsc.module.domain.enums.HotelStatusEnum;
import com.zsc.module.domain.vo.HotelAuditVo;
import com.zsc.module.mapper.HotelAuditMapper;
import com.zsc.module.service.HotelAuditService;
import com.zsc.module.service.HotelService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 酒店审核服务实现类
 */
@Service
@Transactional
public class HotelAuditServiceImpl extends ServiceImpl<HotelAuditMapper, HotelAudit>
        implements HotelAuditService {

    @Autowired
    private HotelService hotelService;

    /**
     * 分页查询审核记录
     */
    @Override
    public PageResult<HotelAuditVo> queryAudits(HotelAuditQueryDto queryDto) {
        Page<HotelAuditVo> page = queryDto.convetToPage();
        Page<HotelAuditVo> result = baseMapper.selectHotelAuditPage(page, queryDto);

        // 填充审核状态名称
        if (result.getRecords() != null) {
            result.getRecords().forEach(this::fillAuditStatusName);
        }

        return PageResult.fromPage(result);
    }

    /**
     * 获取审核详情
     */
    @Override
    public HotelAuditVo getAuditDetail(Long id) {
        HotelAudit audit = this.getById(id);
        if (audit == null) {
            throw new ServiceException("审核记录不存在！");
        }

        HotelAuditVo vo = new HotelAuditVo();
        BeanUtils.copyProperties(audit, vo);

        // 填充酒店信息
        Hotel hotel = hotelService.getById(audit.getHotelId());
        if (hotel != null) {
            vo.setHotelName(hotel.getName());
            vo.setHotelAddress(hotel.getAddress());
            vo.setHotelStar(hotel.getStar());
            vo.setBusinessId(hotel.getBusinessId());
        }

        fillAuditStatusName(vo);
        return vo;
    }

    /**
     * 审核通过
     */
    @Override
    public void approve(Long hotelId, String auditOpinion) {
        processAudit(hotelId, HotelAuditStatusEnum.APPROVED.getValue(), auditOpinion);
    }

    /**
     * 审核驳回
     */
    @Override
    public void reject(Long hotelId, String auditOpinion) {
        processAudit(hotelId, HotelAuditStatusEnum.REJECTED.getValue(), auditOpinion);
    }

    /**
     * 查询待审核数量
     */
    @Override
    public int countPending() {
        return baseMapper.selectPendingCount();
    }

    // ===== 私有辅助方法 =====

    /**
     * 执行审核操作（通用逻辑）
     *
     * @param hotelId      酒店ID
     * @param auditStatus  审核结果（1通过 2驳回）
     * @param auditOpinion 审核意见
     */
    private void processAudit(Long hotelId, String auditStatus, String auditOpinion) {
        if (hotelId == null) {
            throw new ServiceException("酒店ID不能为空！");
        }
        // 校验酒店是否存在
        Hotel hotel = hotelService.getById(hotelId);
        if (hotel == null) {
            throw new ServiceException("酒店不存在！");
        }
        // 校验酒店必须处于待审核状态
        if (!HotelStatusEnum.PENDING_AUDIT.getValue().equals(hotel.getStatus())) {
            throw new ServiceException("该酒店当前不是待审核状态，无法进行审核操作！");
        }
        // 查找该酒店最新的待审核记录
        HotelAudit audit = this.lambdaQuery()
                .eq(HotelAudit::getHotelId, hotelId)
                .eq(HotelAudit::getAuditStatus, "0")
                .orderByDesc(HotelAudit::getCreateTime)
                .last("LIMIT 1")
                .one();

        if (audit == null) {
            throw new ServiceException("未找到该酒店的待审核记录，请先提交审核申请！");
        }
        // 更新审核记录
        audit.setAuditStatus(auditStatus);
        audit.setAuditOpinion(auditOpinion);
        audit.setAuditorId(SecurityUtils.getUserId());
        audit.setAuditorName(SecurityUtils.getUsername());
        audit.setAuditTime(new Date());
        audit.setUpdateTime(new Date());
        if (!this.updateById(audit)) {
            throw new ServiceException("系统错误，审核操作失败！");
        }
        // 更新酒店状态
        String targetHotelStatus;
        if (HotelAuditStatusEnum.APPROVED.getValue().equals(auditStatus)) {
            targetHotelStatus = HotelStatusEnum.OPEN.getValue(); // 审核通过 → 营业中
        } else {
            targetHotelStatus = HotelStatusEnum.DRAFT.getValue(); // 审核驳回 → 草稿
        }
        hotel.setStatus(targetHotelStatus);
        hotel.setUpdateTime(new Date());
        if (!hotelService.updateById(hotel)) {
            throw new ServiceException("系统错误，更新酒店状态失败！");
        }
    }

    /**
     * 填充审核状态名称
     */
    private void fillAuditStatusName(HotelAuditVo vo) {
        if (vo == null) {
            return;
        }
        HotelAuditStatusEnum statusEnum = HotelAuditStatusEnum.getByValue(vo.getAuditStatus());
        if (statusEnum != null) {
            vo.setAuditStatusName(statusEnum.getLabel());
        }
    }
}
