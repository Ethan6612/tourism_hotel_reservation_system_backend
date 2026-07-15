package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.common.core.domain.entity.SysUser;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantAuditDto;
import com.zsc.module.domain.dto.query.MerchantAuditQueryDto;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.entity.MerchantAudit;
import com.zsc.module.domain.vo.MerchantAuditVo;
import com.zsc.module.mapper.MerchantAuditMapper;
import com.zsc.module.service.MerchantAuditService;
import com.zsc.module.service.MerchantService;
import com.zsc.system.domain.SysNotice;
import com.zsc.system.mapper.SysUserMapper;
import com.zsc.system.service.ISysNoticeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商户审核服务实现类
 */
@Service
@Transactional
public class MerchantAuditServiceImpl extends ServiceImpl<MerchantAuditMapper, MerchantAudit>
        implements MerchantAuditService {

    @Autowired
    private MerchantService merchantService;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private ISysNoticeService sysNoticeService;

    /**
     * 提交审核申请
     */
    @Override
    public void submitAudit(MerchantAuditDto auditDto) {
        // 验证商户是否存在
        Merchant merchant = merchantService.getById(auditDto.getMerchantId());
        if (merchant == null) {
            throw new ServiceException("商户不存在，无法提交审核！");
        }

        // 检查是否已有待审核的记录
        boolean hasPending = this.lambdaQuery()
                .eq(MerchantAudit::getMerchantId, auditDto.getMerchantId())
                .eq(MerchantAudit::getAuditStatus, "0")
                .exists();
        if (hasPending) {
            throw new ServiceException("该商户已有待审核的申请，请勿重复提交！");
        }

        MerchantAudit audit = new MerchantAudit();
        BeanUtils.copyProperties(auditDto, audit);
        audit.setAuditStatus("0"); // 待审核
        audit.setSubmitTime(new Date());
        audit.setCreateTime(new Date());
        audit.setUpdateTime(new Date());

        if (!this.save(audit)) {
            throw new ServiceException("系统错误，审核申请提交失败！");
        }
    }

    /**
     * 执行审核操作（通过/驳回）
     */
    @Override
    public void processAudit(MerchantAuditDto auditDto) {
        if (auditDto.getId() == null) {
            throw new ServiceException("审核记录ID不能为空！");
        }

        // 查询审核记录
        MerchantAudit audit = this.getById(auditDto.getId());
        if (audit == null) {
            throw new ServiceException("审核记录不存在！");
        }

        // 校验审核记录状态必须为待审核
        if (!"0".equals(audit.getAuditStatus())) {
            throw new ServiceException("该审核记录已被处理，不可重复操作！");
        }

        // 校验审核结果状态（只允许通过或驳回）
        String auditStatus = auditDto.getAuditStatus();
        if (!"1".equals(auditStatus) && !"2".equals(auditStatus)) {
            throw new ServiceException("审核状态无效，只能为通过(1)或驳回(2)！");
        }

        // 更新审核记录
        audit.setAuditStatus(auditStatus);
        audit.setAuditOpinion(auditDto.getAuditOpinion());
        audit.setAuditTime(new Date());
        audit.setUpdateTime(new Date());
        audit.setAuditorId(com.zsc.common.utils.SecurityUtils.getUserId());
        audit.setAuditorName(com.zsc.common.utils.SecurityUtils.getUsername());

        if (!this.updateById(audit)) {
            throw new ServiceException("系统错误，审核操作失败！");
        }

        // ✅ 同步更新 merchant 表的审核状态和提交时间
        Merchant merchant = merchantService.getById(audit.getMerchantId());
        if (merchant != null) {
            merchant.setAuditStatus(auditStatus);
            merchant.setSubmitTime(audit.getSubmitTime());
            merchant.setUpdateTime(new Date());

            if (!merchantService.updateById(merchant)) {
                throw new ServiceException("系统错误，更新商户审核状态失败！");
            }

            // 发送审核结果通知给商户
            sendAuditNotification(merchant, auditStatus, auditDto.getAuditOpinion());
        }
    }

    /**
     * 分页查询审核记录
     */
    @Override
    public PageResult<MerchantAuditVo> queryAudits(MerchantAuditQueryDto queryDto) {
        Page<MerchantAudit> page = this.lambdaQuery()
                .eq(queryDto.getMerchantId() != null,
                        MerchantAudit::getMerchantId, queryDto.getMerchantId())
                .eq(StringUtils.isNotBlank(queryDto.getAuditType()),
                        MerchantAudit::getAuditType, queryDto.getAuditType())
                .eq(StringUtils.isNotBlank(queryDto.getAuditStatus()),
                        MerchantAudit::getAuditStatus, queryDto.getAuditStatus())
                .orderByDesc(MerchantAudit::getCreateTime)
                .page(queryDto.convetToPage());

        // 转换为VO列表
        List<MerchantAuditVo> voList = page.getRecords().stream()
                .map(this::convertToVo)
                .collect(Collectors.toList());

        // 构建分页结果
        PageResult<MerchantAuditVo> result = new PageResult<>();
        result.setTotal(page.getTotal());
        result.setPageSize(page.getSize());
        result.setCurrentPage(page.getCurrent());
        result.setRows(voList);
        return result;
    }

    /**
     * 获取审核详情
     */
    @Override
    public MerchantAuditVo getAuditDetail(Long id) {
        MerchantAudit audit = this.getById(id);
        if (audit == null) {
            throw new ServiceException("审核记录不存在！");
        }
        return convertToVo(audit);
    }

    // ===== 私有辅助方法 =====

    /**
     * 将审核实体转换为VO，并填充商户名称和申请用户信息
     *
     * @param audit 审核实体
     * @return 审核VO
     */
    private MerchantAuditVo convertToVo(MerchantAudit audit) {
        MerchantAuditVo vo = new MerchantAuditVo();
        BeanUtils.copyProperties(audit, vo);

        // 填充商户名称
        if (audit.getMerchantId() != null) {
            Merchant merchant = merchantService.getById(audit.getMerchantId());
            if (merchant != null) {
                vo.setMerchantName(merchant.getMerchantName());
            }
        }

        // 填充申请用户姓名
        if (audit.getSubmitUserId() != null) {
            SysUser user = sysUserMapper.selectUserById(audit.getSubmitUserId());
            if (user != null) {
                vo.setSubmitUserName(user.getNickName());
            }
        }

        return vo;
    }

    /**
     * 发送审核结果通知给商户
     *
     * @param merchant    商户实体
     * @param auditStatus 审核状态 (1=通过, 2=驳回)
     * @param opinion     审核意见
     */
    private void sendAuditNotification(Merchant merchant, String auditStatus, String opinion) {
        if (merchant.getUserId() == null) {
            return;
        }
        try {
            SysUser merchantUser = sysUserMapper.selectUserById(merchant.getUserId());
            String targetUsername = merchantUser != null ? merchantUser.getUserName() : null;
            if (targetUsername == null) {
                return;
            }
            SysNotice notice = new SysNotice();
            notice.setNoticeType("1"); // 1=通知（定向推送）
            notice.setStatus("0");     // 0=正常
            notice.setCreateBy(targetUsername);
            notice.setCreateTime(new Date());
            if ("1".equals(auditStatus)) {
                notice.setNoticeTitle("入驻申请审核通过");
                notice.setNoticeContent("恭喜！您的入驻申请已审核通过，您现在可以正常使用商户功能，包括添加酒店、管理房型等。");
            } else if ("2".equals(auditStatus)) {
                notice.setNoticeTitle("入驻申请审核驳回");
                String reason = (opinion != null && !opinion.isEmpty()) ? "，原因：" + opinion : "";
                notice.setNoticeContent("您的入驻申请已被驳回" + reason + "。请根据驳回原因修改后重新提交申请。");
            }
            sysNoticeService.insertNotice(notice);
        } catch (Exception e) {
            // 通知发送失败不阻断审核流程
            System.err.println("发送审核通知失败: " + e.getMessage());
        }
    }
}
