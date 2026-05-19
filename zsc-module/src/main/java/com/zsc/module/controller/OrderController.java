package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.OrderDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

/**
 * 订单控制器
 */
@Tag(name = "订单管理")
@Validated
@RestController
@RequestMapping("/api/order")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    /**
     * 查询订单列表
     */
    @Operation(summary = "查询订单列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) String status) {
        PageResult result = orderService.queryOrders(pageNum, pageSize, userId, status);
        return success(result);
    }

    /**
     * 获取订单详情
     */
    @Operation(summary = "获取订单详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        Order order = orderService.getById(id);
        return success(order);
    }

    /**
     * 创建订单
     */
    @Operation(summary = "创建订单")
    @PostMapping
    public AjaxResult add(@Valid @RequestBody OrderDto orderDto) {
        Long orderId = orderService.createOrder(orderDto);
        return success(orderId);
    }

    /**
     * 更新订单状态
     */
    @Operation(summary = "更新订单状态")
    @PreAuthorize("@ss.hasPermi('order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status")
    public AjaxResult updateStatus(@PathVariable Long id, @RequestParam String status) {
        orderService.updateOrderStatus(id, status);
        return success();
    }
}