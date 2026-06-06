package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantAuditDto;
import com.zsc.module.domain.dto.query.MerchantAuditQueryDto;
import com.zsc.module.domain.entity.MerchantAudit;
import com.zsc.module.domain.vo.MerchantAuditVo;

/**
 * 商户审核服务接口
 */
public interface MerchantAuditService extends IService<MerchantAudit> {

    /**
     * 提交审核申请
     *
     * @param auditDto 审核申请DTO
     */
    void submitAudit(MerchantAuditDto auditDto);

    /**
     * 执行审核操作（通过/驳回）
     *
     * @param auditDto 审核操作DTO（需包含id、auditStatus、auditOpinion）
     */
    void processAudit(MerchantAuditDto auditDto);

    /**
     * 分页查询审核记录
     *
     * @param queryDto 查询条件DTO
     * @return 分页结果
     */
    PageResult<MerchantAuditVo> queryAudits(MerchantAuditQueryDto queryDto);

    /**
     * 获取审核详情
     *
     * @param id 审核记录ID
     * @return 审核详情VO
     */
    MerchantAuditVo getAuditDetail(Long id);
}
