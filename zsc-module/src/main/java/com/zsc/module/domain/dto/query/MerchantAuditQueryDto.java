package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

/**
 * 商户审核查询DTO（分页查询审核记录）
 */
@Data
public class MerchantAuditQueryDto extends BasePageReq {

    /**
     * 商户ID
     */
    private Long merchantId;

    /**
     * 审核类型（1入驻申请 2信息变更 3状态变更）
     */
    private String auditType;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）
     */
    private String auditStatus;
}
