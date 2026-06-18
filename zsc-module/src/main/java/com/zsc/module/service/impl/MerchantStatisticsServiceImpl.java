package com.zsc.module.service.impl;

import com.zsc.module.domain.vo.MerchantDashboardVo;
import com.zsc.module.mapper.CommentMapper;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.mapper.RoomMapper;
import com.zsc.module.service.MerchantStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
        if (!hotelIds.isEmpty()) {
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
                    averageScore = totalScore.divide(BigDecimal.valueOf(count), 2, BigDecimal.ROUND_HALF_UP);
                }
            }
        }

        // 待处理数（待审核酒店）
        Long pendingCount = 0L;

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
                .build();
    }
}
