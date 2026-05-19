package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.PaymentDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.service.PaymentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

/**
 * 支付控制器
 */
@Tag(name = "支付管理")
@Validated
@RestController
@RequestMapping("/api/payment")
public class PaymentController extends BaseController {

    @Autowired
    private PaymentService paymentService;

    /**
     * 查询支付列表
     */
    @Operation(summary = "查询支付列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long orderId,
            @RequestParam(required = false) String payStatus) {
        PageResult result = paymentService.queryPayments(pageNum, pageSize, orderId, payStatus);
        return success(result);
    }

    /**
     * 获取支付详情
     */
    @Operation(summary = "获取支付详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        Payment payment = paymentService.getById(id);
        return success(payment);
    }

    /**
     * 创建支付记录
     */
    @Operation(summary = "创建支付记录")
    @PostMapping
    public AjaxResult add(@Valid @RequestBody PaymentDto paymentDto) {
        Long paymentId = paymentService.createPayment(paymentDto);
        return success(paymentId);
    }

    /**
     * 更新支付状态
     */
    @Operation(summary = "更新支付状态")
    @PreAuthorize("@ss.hasPermi('payment:edit')")
    @Log(title = "支付管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status")
    public AjaxResult updateStatus(
            @PathVariable Long id,
            @RequestParam String status,
            @RequestParam(required = false) String transactionId) {
        paymentService.updatePaymentStatus(id, status, transactionId);
        return success();
    }
}