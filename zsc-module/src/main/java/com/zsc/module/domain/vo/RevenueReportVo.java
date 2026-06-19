package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * 营收报表 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RevenueReportVo {

    /** 总收入 */
    private BigDecimal totalRevenue;

    /** 总订单数 */
    private Long totalOrders;

    /** 日均收入 */
    private BigDecimal dailyAvgRevenue;

    /** 日均订单数 */
    private Long dailyAvgOrders;

    /** 按日明细 */
    private List<DailyRevenueVo> details;
}
