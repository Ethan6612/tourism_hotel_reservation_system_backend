package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单DTO
 */
@Data
public class OrderDto {

    private Long id;

    private String orderNo;

    @NotNull(message = "用户ID不能为空")
    private Long userId;

    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    @NotNull(message = "房型ID不能为空")
    private Long roomId;

    @NotNull(message = "入住日期不能为空")
    private Date startDate;

    @NotNull(message = "离店日期不能为空")
    private Date endDate;

    @NotNull(message = "总价格不能为空")
    private BigDecimal totalPrice;

    private String status;

    private Date payTime;
}