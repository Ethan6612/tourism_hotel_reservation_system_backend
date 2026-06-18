package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantDto;
import com.zsc.module.domain.dto.query.MerchantQueryDto;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.entity.MerchantAudit;
import com.zsc.module.domain.vo.MerchantVo;
import com.zsc.module.mapper.MerchantAuditMapper;
import com.zsc.module.mapper.MerchantMapper;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.mapper.RoomMapper;
import com.zsc.module.service.MerchantService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商户管理服务实现类
 */
@Service
@Transactional
public class MerchantServiceImpl extends ServiceImpl<MerchantMapper, Merchant> implements MerchantService {

    @Autowired
    private MerchantAuditMapper merchantAuditMapper;

    @Autowired
    private HotelMapper hotelMapper;

    @Autowired
    private RoomMapper roomMapper;

    /**
     * 注册/新增商户
     */
    @Override
    public void addMerchant(MerchantDto merchantDto) {
        // 检查营业执照号是否已存在
        if (existsByLicenseNo(merchantDto.getLicenseNo())) {
            throw new ServiceException("该营业执照号已存在，请勿重复注册！");
        }

        Merchant merchant = new Merchant();
        BeanUtils.copyProperties(merchantDto, merchant);

        // 获取当前登录用户ID并绑定到商户（强制要求）
        Long currentUserId = com.zsc.common.utils.SecurityUtils.getUserId();
        
        // ✅ 添加校验：确保userId不为null
        if (currentUserId == null) {
            throw new ServiceException("系统错误，无法获取当前登录用户信息，请重新登录！");
        }
        
        merchant.setUserId(currentUserId);

        // 设置默认字段
        merchant.setStatus("0"); // 默认正常状态
        merchant.setCreateTime(new Date());
        merchant.setUpdateTime(new Date());

        if (!this.save(merchant)) {
            throw new ServiceException("系统错误，商户注册失败！");
        }

        // 自动创建审核记录（待审核状态）
        createInitialAuditRecord(merchant.getId(), merchant.getUserId());

        // 更新merchant表的审核字段
        merchant.setAuditStatus("0");
        merchant.setSubmitTime(new Date());
        this.updateById(merchant);
    }

    /**
     * 更新商户信息
     */
    @Override
    public void updateMerchant(MerchantDto merchantDto) {
        if (merchantDto.getId() == null) {
            throw new ServiceException("商户ID不能为空！");
        }

        // 检查商户是否存在
        Merchant existing = this.getById(merchantDto.getId());
        if (existing == null) {
            throw new ServiceException("商户不存在，更新失败！");
        }

        // 若营业执照号变更，检查是否与其他商户冲突
        if (StringUtils.isNotBlank(merchantDto.getLicenseNo())
                && !merchantDto.getLicenseNo().equals(existing.getLicenseNo())
                && existsByLicenseNo(merchantDto.getLicenseNo())) {
            throw new ServiceException("该营业执照号已被其他商户使用！");
        }

        Merchant merchant = new Merchant();
        BeanUtils.copyProperties(merchantDto, merchant);
        merchant.setUpdateTime(new Date());

        if (!this.updateById(merchant)) {
            throw new ServiceException("系统错误，商户信息更新失败！");
        }
    }

    /**
     * 获取商户详情（含关联酒店数量）
     */
    @Override
    public MerchantVo getMerchantDetail(Long id) {
        Merchant merchant = this.getById(id);
        if (merchant == null) {
            throw new ServiceException("商户不存在！");
        }

        MerchantVo vo = new MerchantVo();
        BeanUtils.copyProperties(merchant, vo);

        // 查询关联酒店数量
        Integer hotelCount = baseMapper.countHotelsByMerchantId(id);
        vo.setHotelCount(hotelCount != null ? hotelCount : 0);

        return vo;
    }

    /**
     * 分页查询商户列表
     */
    @Override
    public PageResult<MerchantVo> queryMerchants(MerchantQueryDto queryDto) {
        // 如果前端没有传递auditStatus参数，默认只查询审核通过的商户
        if (StringUtils.isBlank(queryDto.getAuditStatus())) {
            queryDto.setAuditStatus("1");
        }
        
        // 使用自定义SQL查询，关联审核表进行过滤
        Page<Merchant> page = queryDto.convetToPage();
        List<Merchant> merchantList = baseMapper.selectMerchantsWithAuditFilter(
                page,
                queryDto.getMerchantName(),
                queryDto.getLicenseNo(),
                queryDto.getLegalPerson(),
                queryDto.getPhone(),
                queryDto.getStatus(),
                queryDto.getAuditStatus()
        );
        
        // 设置分页结果
        page.setRecords(merchantList);

        // 转换为VO列表
        List<MerchantVo> voList = page.getRecords().stream()
                .map(merchant -> {
                    MerchantVo vo = new MerchantVo();
                    BeanUtils.copyProperties(merchant, vo);
                    // 可选：填充关联酒店数量（批量查询优化避免N+1问题）
                    Integer hotelCount = baseMapper.countHotelsByMerchantId(merchant.getId());
                    vo.setHotelCount(hotelCount != null ? hotelCount : 0);
                    return vo;
                })
                .collect(Collectors.toList());

        // 构建分页结果
        PageResult<MerchantVo> result = new PageResult<>();
        result.setTotal(page.getTotal());
        result.setPageSize(page.getSize());
        result.setCurrentPage(page.getCurrent());
        result.setRows(voList);
        return result;
    }

    /**
     * 冻结商户
     */
    @Override
    public void freezeMerchant(Long id) {
        updateMerchantStatus(id, "1", "商户不存在，冻结失败！");
    }

    /**
     * 注销商户
     */
    @Override
    public void deregisterMerchant(Long id) {
        updateMerchantStatus(id, "2", "商户不存在，注销失败！");
    }

    /**
     * 恢复商户（解除冻结）
     */
    @Override
    public void unfreezeMerchant(Long id) {
        updateMerchantStatus(id, "0", "商户不存在，恢复失败！");
    }

    /**
     * 根据营业执照号检查是否已存在
     */
    @Override
    public boolean existsByLicenseNo(String licenseNo) {
        if (StringUtils.isBlank(licenseNo)) {
            return false;
        }
        return this.lambdaQuery()
                .eq(Merchant::getLicenseNo, licenseNo)
                .exists();
    }

    /**
     * 查询当前登录用户的商户信息（含审核状态）
     */
    @Override
    public MerchantVo getMyMerchant(Long userId) {
        if (userId == null) {
            return null;
        }

        // ✅ 添加日志
        System.out.println("=== getMyMerchant调试 ===");
        System.out.println("userId: " + userId);

        // 查询该用户关联的商户（假设一个用户只能有一个商户）
        Merchant merchant = this.lambdaQuery()
                .eq(Merchant::getUserId, userId)
                .last("LIMIT 1")
                .one();

        if (merchant == null) {
            System.out.println("❌ 未找到user_id=" + userId + "的商户记录");
            return null;
        }

        System.out.println("✅ 找到商户记录: id=" + merchant.getId() + ", name=" + merchant.getMerchantName());

        // 转换为VO
        MerchantVo vo = new MerchantVo();
        BeanUtils.copyProperties(merchant, vo);

        // 查询最新审核记录，填充审核状态和驳回原因
        // 使用Mapper中的自定义SQL查询最新审核记录
        com.zsc.module.domain.entity.MerchantAudit latestAudit = 
            baseMapper.selectLatestAuditByMerchantId(merchant.getId());

        if (latestAudit != null) {
            vo.setAuditStatus(latestAudit.getAuditStatus());
            vo.setRejectReason(latestAudit.getAuditOpinion()); // 审核意见即驳回原因
            vo.setSubmitTime(latestAudit.getSubmitTime());
            vo.setAuditTime(latestAudit.getAuditTime());
            System.out.println("✅ 审核状态: " + latestAudit.getAuditStatus());
        } else {
            // 如果没有审核记录，默认设置为待审核
            vo.setAuditStatus("0");
            System.out.println("⚠️ 无审核记录，默认设置为待审核");
        }

        System.out.println("======================");
        return vo;
    }

    /**
     * 获取当前登录用户的商户ID
     */
    @Override
    public Long getCurrentMerchantId() {
        Long userId = com.zsc.common.utils.SecurityUtils.getUserId();
        Merchant merchant = this.lambdaQuery()
                .eq(Merchant::getUserId, userId)
                .one();
        if (merchant == null) {
            throw new ServiceException("未找到关联的商户信息，请先完成商户注册");
        }
        return merchant.getId();
    }

    /**
     * 获取当前商户的所有酒店ID列表
     */
    @Override
    public List<Long> getCurrentMerchantHotelIds() {
        Long merchantId = getCurrentMerchantId();
        List<com.zsc.module.domain.entity.Hotel> hotels = hotelMapper.selectList(
                new com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper<com.zsc.module.domain.entity.Hotel>()
                        .eq(com.zsc.module.domain.entity.Hotel::getBusinessId, merchantId));
        if (hotels == null || hotels.isEmpty()) {
            return new ArrayList<>();
        }
        return hotels.stream()
                .map(com.zsc.module.domain.entity.Hotel::getId)
                .collect(Collectors.toList());
    }

    /**
     * 校验酒店是否属于当前商户
     */
    @Override
    public void checkHotelOwnership(Long hotelId) {
        if (hotelId == null) {
            throw new ServiceException("酒店ID不能为空");
        }
        Long merchantId = getCurrentMerchantId();
        com.zsc.module.domain.entity.Hotel hotel = hotelMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper<com.zsc.module.domain.entity.Hotel>()
                        .eq(com.zsc.module.domain.entity.Hotel::getId, hotelId)
                        .eq(com.zsc.module.domain.entity.Hotel::getBusinessId, merchantId));
        if (hotel == null) {
            throw new ServiceException("无权操作该酒店，该酒店不属于您的商户");
        }
    }

    /**
     * 校验房型是否属于当前商户（通过酒店关联链）
     */
    @Override
    public void checkRoomOwnership(Long roomId) {
        if (roomId == null) {
            throw new ServiceException("房型ID不能为空");
        }
        Long merchantId = getCurrentMerchantId();
        com.zsc.module.domain.entity.Room room = roomMapper.selectById(roomId);
        if (room == null) {
            throw new ServiceException("房型不存在");
        }
        // 通过酒店关联链验证：room → hotel → merchant
        com.zsc.module.domain.entity.Hotel hotel = hotelMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper<com.zsc.module.domain.entity.Hotel>()
                        .eq(com.zsc.module.domain.entity.Hotel::getId, room.getHotelId())
                        .eq(com.zsc.module.domain.entity.Hotel::getBusinessId, merchantId));
        if (hotel == null) {
            throw new ServiceException("无权操作该房型，该房型不属于您的酒店");
        }
    }

    /**
     * 创建初始审核记录（商户注册时自动创建）
     *
     * @param merchantId 商户ID
     * @param userId     申请用户ID
     */
    private void createInitialAuditRecord(Long merchantId, Long userId) {
        MerchantAudit audit = new MerchantAudit();
        audit.setMerchantId(merchantId);
        audit.setAuditType("1"); // 1-入驻申请
        audit.setAuditStatus("0"); // 0-待审核
        audit.setSubmitUserId(userId); // 设置申请用户ID
        audit.setSubmitTime(new Date());
        audit.setCreateTime(new Date());
        audit.setUpdateTime(new Date());

        merchantAuditMapper.insert(audit);
    }

    // ===== 私有辅助方法 =====

    /**
     * 更新商户状态的通用方法
     *
     * @param id            商户ID
     * @param targetStatus  目标状态
     * @param errorMsg      商户不存在时的错误提示
     */
    private void updateMerchantStatus(Long id, String targetStatus, String errorMsg) {
        Merchant merchant = this.getById(id);
        if (merchant == null) {
            throw new ServiceException(errorMsg);
        }

        merchant.setStatus(targetStatus);
        merchant.setUpdateTime(new Date());

        if (!this.updateById(merchant)) {
            throw new ServiceException("系统错误，状态更新失败！");
        }
    }
}
