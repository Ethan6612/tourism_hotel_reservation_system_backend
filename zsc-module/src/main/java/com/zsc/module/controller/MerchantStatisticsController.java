package com.zsc.module.controller;

import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.vo.MerchantDashboardVo;
import com.zsc.module.service.MerchantService;
import com.zsc.module.service.MerchantStatisticsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
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
}
