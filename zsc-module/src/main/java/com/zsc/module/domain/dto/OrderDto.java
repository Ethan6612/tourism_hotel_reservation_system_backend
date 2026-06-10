package com.zsc.module.domain.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单创建/更新 DTO
 *
 * @author zsc
 */
@Data
public class OrderDto {

    /** 用户ID */
    private Long userId;

    /** 酒店ID */
    private Long hotelId;

    /** 房型ID */
    private Long roomId;

    /** 入住日期 */
    private String startDate;

    /** 离店日期 */
    private String endDate;

    /** 总价格 */
    private BigDecimal totalPrice;

    /** 订单状态 */
    private String status;

    /** 支付时间 */
    private String payTime;
}
