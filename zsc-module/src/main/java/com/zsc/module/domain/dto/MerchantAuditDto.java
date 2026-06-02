package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 商户审核DTO（用于提交审核/审核操作）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MerchantAuditDto {

    /**
     * 审核ID（审核操作时必传）
     */
    private Long id;

    /**
     * 商户ID
     */
    @NotNull(message = "商户ID不能为空")
    private Long merchantId;

    /**
     * 审核类型（1入驻申请 2信息变更 3状态变更）
     */
    @NotBlank(message = "审核类型不能为空")
    private String auditType;

    /**
     * 提交材料（JSON格式，营业执照图片URL等）
     */
    private String submitMaterial;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）——审核操作时传入
     */
    private String auditStatus;

    /**
     * 审核意见——审核操作时传入
     */
    private String auditOpinion;
}
