package com.zsc.module.domain.dto.query;

import lombok.Data;

/**
 * 支付记录查询 DTO
 *
 * @author zsc
 */
@Data
public class PaymentQueryDto {

    private Integer pageNum = 1;
    private Integer pageSize = 10;

    /** 订单ID */
    private Long orderId;

    /** 支付状态 */
    private String payStatus;

    /** 支付类型 */
    private String payType;

    /** 开始时间 */
    private String beginTime;

    /** 结束时间 */
    private String endTime;
}
