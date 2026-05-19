package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * 支付DTO
 */
@Data
public class PaymentDto {

    private Long id;

    @NotNull(message = "订单ID不能为空")
    private Long orderId;

    @NotNull(message = "支付金额不能为空")
    private BigDecimal payAmount;

    private String payType;

    private String payStatus;

    private String transactionId;
}