package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 订单状态更新 DTO
 *
 * @author zsc
 */
@Data
public class OrderStatusUpdateDto {

    /** 目标状态 */
    @NotBlank(message = "状态不能为空")
    private String status;

    /** 操作原因（取消/退款时使用） */
    private String reason;
}
