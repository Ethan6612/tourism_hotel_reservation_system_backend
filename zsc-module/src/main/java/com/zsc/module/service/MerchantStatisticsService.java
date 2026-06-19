package com.zsc.module.service;

import com.zsc.module.domain.vo.DailyRevenueVo;
import com.zsc.module.domain.vo.MerchantDashboardVo;
import com.zsc.module.domain.vo.RevenueReportVo;

import java.util.List;

/**
 * 商户数据统计服务接口
 *
 * @author zsc
 */
public interface MerchantStatisticsService {

    /**
     * 获取商户仪表盘数据
     *
     * @param merchantId 商户ID
     * @param hotelIds   商户拥有的酒店ID列表
     * @return 仪表盘VO
     */
    MerchantDashboardVo getDashboard(Long merchantId, List<Long> hotelIds);

    /**
     * 获取营收报表
     *
     * @param merchantId 商户ID
     * @param hotelIds   商户拥有的酒店ID列表
     * @param beginTime  开始时间 (yyyy-MM-dd)
     * @param endTime    结束时间 (yyyy-MM-dd)
     * @return 营收报表VO
     */
    RevenueReportVo getRevenueReport(Long merchantId, List<Long> hotelIds,
                                     String beginTime, String endTime);

    /**
     * 获取营收趋势（按天或按月）
     *
     * @param merchantId  商户ID
     * @param hotelIds    商户拥有的酒店ID列表
     * @param beginTime   开始时间 (yyyy-MM-dd)
     * @param endTime     结束时间 (yyyy-MM-dd)
     * @param granularity 粒度 (day/month)
     * @return 每日/每月营收列表
     */
    List<DailyRevenueVo> getRevenueTrend(Long merchantId, List<Long> hotelIds,
                                         String beginTime, String endTime, String granularity);
}
