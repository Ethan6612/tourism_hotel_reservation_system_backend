package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 商户仪表盘 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MerchantDashboardVo {

    /** 酒店总数 */
    private Long hotelCount;

    /** 房型总数 */
    private Long roomCount;

    /** 订单总数 */
    private Long orderCount;

    /** 今日订单数 */
    private Long todayOrderCount;

    /** 总收入 */
    private BigDecimal totalRevenue;

    /** 本月收入 */
    private BigDecimal monthRevenue;

    /** 评价总数 */
    private Long commentCount;

    /** 平均评分 */
    private BigDecimal averageScore;

    /** 待处理（待审核酒店数） */
    private Long pendingCount;
}
