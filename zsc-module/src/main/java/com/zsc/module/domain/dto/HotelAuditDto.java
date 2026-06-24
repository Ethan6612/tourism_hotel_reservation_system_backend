package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 酒店审核DTO（用于审核操作）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HotelAuditDto {

    /**
     * 审核ID（审核操作时必传）
     */
    private Long id;

    /**
     * 酒店ID
     */
    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    /**
     * 审核状态（1审核通过 2审核驳回）
     */
    private String auditStatus;

    /**
     * 审核意见
     */
    private String auditOpinion;
}
