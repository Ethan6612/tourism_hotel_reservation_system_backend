package com.zsc.module.controller;

import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.domain.vo.UserDashboardStatsVo;
import com.zsc.module.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * 用户端订单控制器
 *
 * @author zsc
 */
@Tag(name = "用户端订单")
@Validated
@RestController
@RequestMapping("/api/user")
public class UserOrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    // ==================== 我的订单 ====================

    /**
     * 查询当前用户的订单列表
     */
    @Operation(summary = "查询我的订单列表")
    @GetMapping("/order/list")
    public AjaxResult listMyOrders(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String orderBy) {
        Long userId = SecurityUtils.getUserId();
        OrderQueryDto queryDto = new OrderQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setUserId(userId);
        // 支持逗号分隔的多状态查询（如 "0,1,4"）
        if (status != null && status.contains(",")) {
            queryDto.setStatusList(Arrays.asList(status.split(",")));
        } else {
            queryDto.setStatus(status);
        }
        queryDto.setOrderBy(orderBy != null ? orderBy : "o.create_time DESC");
        PageResult<OrderVo> result = orderService.queryUserOrders(queryDto);
        return success(result);
    }

    /**
     * 获取订单详情（仅限自己的订单）
     */
    @Operation(summary = "获取我的订单详情")
    @GetMapping("/order/{id}")
    public AjaxResult getMyOrder(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        OrderVo vo = orderService.getUserOrderDetail(id, userId);
        return success(vo);
    }

    /**
     * 取消订单（仅限自己的待支付订单）
     */
    @Operation(summary = "取消我的订单")
    @PutMapping("/order/{id}/cancel")
    public AjaxResult cancelMyOrder(
            @PathVariable Long id,
            @RequestParam(required = false) String reason) {
        Long userId = SecurityUtils.getUserId();
        orderService.cancelUserOrder(id, userId, reason);
        return success("订单已取消");
    }

    /**
     * 删除订单（仅限自己的已取消/已完成/已退款订单）
     */
    @Operation(summary = "删除我的订单")
    @DeleteMapping("/order/{id}")
    public AjaxResult deleteMyOrder(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        orderService.deleteUserOrder(id, userId);
        return success("订单已删除");
    }

    // ==================== 用户首页统计 ====================

    /**
     * 获取用户首页统计数据
     */
    @Operation(summary = "获取用户首页统计数据")
    @GetMapping("/dashboard/stats")
    public AjaxResult getDashboardStats() {
        Long userId = SecurityUtils.getUserId();
        UserDashboardStatsVo stats = orderService.getUserDashboardStats(userId);
        return success(stats);
    }
}
