package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户首页统计 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDashboardStatsVo {

    /** 订单总数 */
    private Long orderCount;

    /** 进行中订单数（待支付 + 已支付 + 退款中） */
    private Long activeOrders;

    /** 评价数 */
    private Long reviewCount;

    /** 待评价数 */
    private Long pendingReviews;

    /** 收藏数 */
    private Long favoriteCount;

    /** 已完成订单数 */
    private Long completedOrders;

    /** 已取消/退款订单数 */
    private Long cancelledOrders;

    /** 用户积分 */
    private Integer points;
}
