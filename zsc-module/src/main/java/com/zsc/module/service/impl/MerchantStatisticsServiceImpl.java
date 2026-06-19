package com.zsc.module.service.impl;

import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.vo.DailyRevenueVo;
import com.zsc.module.domain.vo.MerchantDashboardVo;
import com.zsc.module.domain.vo.RevenueReportVo;
import com.zsc.module.mapper.CommentMapper;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.mapper.RoomMapper;
import com.zsc.module.service.MerchantStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

/**
 * 商户数据统计服务实现类
 *
 * @author zsc
 */
@Service
public class MerchantStatisticsServiceImpl implements MerchantStatisticsService {

    @Autowired
    private HotelMapper hotelMapper;

    @Autowired
    private RoomMapper roomMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public MerchantDashboardVo getDashboard(Long merchantId, List<Long> hotelIds) {
        // 酒店数量
        Long hotelCount = (long) hotelIds.size();

        // 商户还没有酒店，直接返回空数据
        if (hotelIds == null || hotelIds.isEmpty()) {
            return MerchantDashboardVo.builder()
                    .hotelCount(0L)
                    .roomCount(0L)
                    .orderCount(0L)
                    .todayOrderCount(0L)
                    .totalRevenue(BigDecimal.ZERO)
                    .monthRevenue(BigDecimal.ZERO)
                    .commentCount(0L)
                    .averageScore(BigDecimal.ZERO)
                    .pendingCount(0L)
                    .revenueTrend(new ArrayList<>())
                    .orderCountTrend(new ArrayList<>())
                    .build();
        }

        // 房型总数
        Long roomCount = roomMapper.countRoomsByHotelIds(hotelIds);
        if (roomCount == null) roomCount = 0L;

        // 订单总数
        Long orderCount = orderMapper.countOrdersByHotelIds(hotelIds);
        if (orderCount == null) orderCount = 0L;

        // 今日订单数
        Long todayOrderCount = orderMapper.countTodayOrdersByHotelIds(hotelIds);
        if (todayOrderCount == null) todayOrderCount = 0L;

        // 总收入
        BigDecimal totalRevenue = orderMapper.sumRevenueByHotelIds(hotelIds);
        if (totalRevenue == null) totalRevenue = BigDecimal.ZERO;

        // 本月收入
        BigDecimal monthRevenue = orderMapper.sumMonthRevenueByHotelIds(hotelIds);
        if (monthRevenue == null) monthRevenue = BigDecimal.ZERO;

        // 评价总数和平均评分
        Long commentCount = 0L;
        BigDecimal averageScore = BigDecimal.ZERO;
        List<com.zsc.module.domain.vo.ScoreStatisticsVo> scoreList =
                commentMapper.selectHotelsAverageScore(hotelIds);
        if (scoreList != null) {
            long totalComments = 0;
            BigDecimal totalScore = BigDecimal.ZERO;
            int count = 0;
            for (com.zsc.module.domain.vo.ScoreStatisticsVo s : scoreList) {
                if (s.getTotalComments() != null) {
                    totalComments += s.getTotalComments();
                }
                if (s.getAverageScore() != null) {
                    totalScore = totalScore.add(s.getAverageScore());
                    count++;
                }
            }
            commentCount = totalComments;
            if (count > 0) {
                averageScore = totalScore.divide(BigDecimal.valueOf(count), 2, RoundingMode.HALF_UP);
            }
        }

        // 待处理数（待支付订单）
        Long pendingCount = orderMapper.countOrdersByStatusAndHotelIds(hotelIds, Order.STATUS_PENDING);
        if (pendingCount == null) pendingCount = 0L;

        // 近7天收入趋势
        List<DailyRevenueVo> revenueTrend = orderMapper.selectDailyRevenue(hotelIds, 7);
        if (revenueTrend == null) revenueTrend = new ArrayList<>();

        // 近7天订单数趋势
        List<DailyRevenueVo> orderCountTrend = orderMapper.selectDailyOrderCount(hotelIds, 7);
        if (orderCountTrend == null) orderCountTrend = new ArrayList<>();

        return MerchantDashboardVo.builder()
                .hotelCount(hotelCount)
                .roomCount(roomCount)
                .orderCount(orderCount)
                .todayOrderCount(todayOrderCount)
                .totalRevenue(totalRevenue)
                .monthRevenue(monthRevenue)
                .commentCount(commentCount)
                .averageScore(averageScore)
                .pendingCount(pendingCount)
                .revenueTrend(revenueTrend)
                .orderCountTrend(orderCountTrend)
                .build();
    }

    @Override
    public RevenueReportVo getRevenueReport(Long merchantId, List<Long> hotelIds,
                                            String beginTime, String endTime) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            return RevenueReportVo.builder()
                    .totalRevenue(BigDecimal.ZERO)
                    .totalOrders(0L)
                    .dailyAvgRevenue(BigDecimal.ZERO)
                    .dailyAvgOrders(0L)
                    .details(new ArrayList<>())
                    .build();
        }

        BigDecimal totalRevenue = orderMapper.sumRevenueByHotelIdsAndDateRange(hotelIds, beginTime, endTime);
        if (totalRevenue == null) totalRevenue = BigDecimal.ZERO;

        Long totalOrders = orderMapper.countOrdersByHotelIdsAndDateRange(hotelIds, beginTime, endTime);
        if (totalOrders == null) totalOrders = 0L;

        List<DailyRevenueVo> details = orderMapper.selectDailyRevenueByDateRange(hotelIds, beginTime, endTime);
        if (details == null) details = new ArrayList<>();

        // 计算日均值
        BigDecimal dailyAvgRevenue = BigDecimal.ZERO;
        Long dailyAvgOrders = 0L;
        if (!details.isEmpty()) {
            dailyAvgRevenue = totalRevenue.divide(BigDecimal.valueOf(details.size()), 2, RoundingMode.HALF_UP);
            dailyAvgOrders = totalOrders / details.size();
        }

        return RevenueReportVo.builder()
                .totalRevenue(totalRevenue)
                .totalOrders(totalOrders)
                .dailyAvgRevenue(dailyAvgRevenue)
                .dailyAvgOrders(dailyAvgOrders)
                .details(details)
                .build();
    }

    @Override
    public List<DailyRevenueVo> getRevenueTrend(Long merchantId, List<Long> hotelIds,
                                                String beginTime, String endTime, String granularity) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            return new ArrayList<>();
        }
        return orderMapper.selectDailyRevenueByDateRange(hotelIds, beginTime, endTime);
    }
}
