package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商户审核VO（用于列表展示）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MerchantAuditVo {

    /**
     * 审核ID
     */
    private Long id;

    /**
     * 商户ID
     */
    private Long merchantId;

    /**
     * 商户名称（冗余展示字段）
     */
    private String merchantName;

    /**
     * 审核类型（1入驻申请 2信息变更 3状态变更）
     */
    private String auditType;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）
     */
    private String auditStatus;

    /**
     * 提交材料（JSON格式）
     */
    private String submitMaterial;

    /**
     * 审核意见
     */
    private String auditOpinion;

    /**
     * 审核人ID
     */
    private Long auditorId;

    /**
     * 审核人姓名
     */
    private String auditorName;

    /**
     * 提交时间
     */
    private Date submitTime;

    /**
     * 审核时间
     */
    private Date auditTime;

    /**
     * 创建时间
     */
    private Date createTime;
}
