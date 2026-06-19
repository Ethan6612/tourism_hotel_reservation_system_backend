package com.zsc.module.controller;

import com.zsc.common.utils.poi.ExcelUtil;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.vo.DailyRevenueVo;
import com.zsc.module.domain.vo.MerchantDashboardVo;
import com.zsc.module.domain.vo.RevenueReportVo;
import com.zsc.module.service.MerchantService;
import com.zsc.module.service.MerchantStatisticsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户端数据统计控制器
 *
 * @author zsc
 */
@Tag(name = "商户数据统计")
@RestController
@RequestMapping("/api/merchant/statistics")
public class MerchantStatisticsController {

    @Autowired
    private MerchantStatisticsService merchantStatisticsService;

    @Autowired
    private MerchantService merchantService;

    /**
     * 获取商户仪表盘数据
     */
    @Operation(summary = "获取商户仪表盘数据")
    @GetMapping("/dashboard")
    public ResultVo<MerchantDashboardVo> dashboard() {
        Long merchantId = merchantService.getCurrentMerchantId();
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        MerchantDashboardVo vo = merchantStatisticsService.getDashboard(merchantId, hotelIds);
        return ResultVo.ok(vo);
    }

    /**
     * 获取营收报表（支持时间段筛选）
     */
    @Operation(summary = "获取营收报表")
    @GetMapping("/revenue")
    public ResultVo<RevenueReportVo> revenueReport(
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime) {
        Long merchantId = merchantService.getCurrentMerchantId();
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        RevenueReportVo vo = merchantStatisticsService.getRevenueReport(merchantId, hotelIds, beginTime, endTime);
        return ResultVo.ok(vo);
    }

    /**
     * 获取营收趋势（按天）
     */
    @Operation(summary = "获取营收趋势")
    @GetMapping("/trend")
    public ResultVo<List<DailyRevenueVo>> revenueTrend(
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime,
            @RequestParam(defaultValue = "day") String granularity) {
        Long merchantId = merchantService.getCurrentMerchantId();
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        List<DailyRevenueVo> list = merchantStatisticsService.getRevenueTrend(merchantId, hotelIds, beginTime, endTime, granularity);
        return ResultVo.ok(list);
    }

    /**
     * 导出营收报表Excel
     */
    @Operation(summary = "导出营收报表Excel")
    @GetMapping("/export")
    public void exportReport(
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime,
            HttpServletResponse response) {
        Long merchantId = merchantService.getCurrentMerchantId();
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        List<DailyRevenueVo> list = merchantStatisticsService.getRevenueTrend(merchantId, hotelIds, beginTime, endTime, "day");
        ExcelUtil<DailyRevenueVo> util = new ExcelUtil<>(DailyRevenueVo.class);
        util.exportExcel(response, list, "营收报表");
    }
}
