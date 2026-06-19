package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.vo.DailyRevenueVo;
import com.zsc.module.domain.vo.OrderVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

    /**
     * 分页查询订单列表（关联用户、酒店、房型、支付信息）
     */
    Page<OrderVo> selectOrderVoPage(Page<OrderVo> page, @Param("query") OrderQueryDto query);

    /**
     * 查询订单详情
     */
    OrderVo selectOrderVoById(@Param("id") Long id);

    /**
     * 统计订单数量
     */
    Long countOrders(@Param("query") OrderQueryDto query);

    /**
     * 查询用户自己的订单详情
     */
    OrderVo selectUserOrderVoById(@Param("id") Long id, @Param("userId") Long userId);

    /**
     * 统计用户某个状态的订单数
     */
    Long countUserOrdersByStatus(@Param("userId") Long userId, @Param("status") String status);

    /**
     * 统计用户所有订单数
     */
    Long countUserOrders(@Param("userId") Long userId);

    /**
     * 统计用户已完成但未评价的订单数
     */
    Long countUserPendingReviewOrders(@Param("userId") Long userId);

    /**
     * 统计指定酒店ID列表的订单总数（商户端专用）
     */
    Long countOrdersByHotelIds(@Param("hotelIds") List<Long> hotelIds);

    /**
     * 统计指定酒店ID列表的总收入（已支付+已完成）
     */
    java.math.BigDecimal sumRevenueByHotelIds(@Param("hotelIds") List<Long> hotelIds);

    /**
     * 统计指定酒店ID列表的今日订单数
     */
    Long countTodayOrdersByHotelIds(@Param("hotelIds") List<Long> hotelIds);

    /**
     * 统计指定酒店ID列表的本月收入
     */
    java.math.BigDecimal sumMonthRevenueByHotelIds(@Param("hotelIds") List<Long> hotelIds);

    /**
     * 统计指定酒店ID列表的指定状态订单数
     */
    Long countOrdersByStatusAndHotelIds(@Param("hotelIds") List<Long> hotelIds, @Param("status") String status);

    /**
     * 按天汇总指定酒店的收入趋势（最近N天，仅已支付+已完成）
     */
    List<DailyRevenueVo> selectDailyRevenue(@Param("hotelIds") List<Long> hotelIds, @Param("days") int days);

    /**
     * 按天汇总指定酒店的订单数量趋势（最近N天，全部状态）
     */
    List<DailyRevenueVo> selectDailyOrderCount(@Param("hotelIds") List<Long> hotelIds, @Param("days") int days);

    /**
     * 按日期范围统计指定酒店的总收入（已支付+已完成）
     */
    java.math.BigDecimal sumRevenueByHotelIdsAndDateRange(@Param("hotelIds") List<Long> hotelIds,
                                                          @Param("beginTime") String beginTime,
                                                          @Param("endTime") String endTime);

    /**
     * 按日期范围统计指定酒店的订单总数
     */
    Long countOrdersByHotelIdsAndDateRange(@Param("hotelIds") List<Long> hotelIds,
                                           @Param("beginTime") String beginTime,
                                           @Param("endTime") String endTime);

    /**
     * 按日期范围按天汇总指定酒店的收入明细
     */
    List<DailyRevenueVo> selectDailyRevenueByDateRange(@Param("hotelIds") List<Long> hotelIds,
                                                       @Param("beginTime") String beginTime,
                                                       @Param("endTime") String endTime);
}
