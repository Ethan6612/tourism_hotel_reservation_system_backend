package com.zsc.module.service;

import com.zsc.module.domain.vo.MerchantDashboardVo;

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
}
