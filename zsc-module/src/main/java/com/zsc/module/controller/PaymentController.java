package com.zsc.module.controller;

import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.vo.PaymentVo;
import com.zsc.module.service.PaymentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 支付记录控制器（管理端）
 *
 * @author zsc
 */
@Tag(name = "支付管理")
@Validated
@RestController
@RequestMapping("/api/payment")
public class PaymentController extends BaseController {

    @Autowired
    private PaymentService paymentService;

    // ==================== 查询接口 ====================

    /**
     * 查询支付记录列表
     */
    @Operation(summary = "查询支付记录列表")
    @GetMapping("/list")
    @PreAuthorize("@ss.hasPermi('payment:list')")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long orderId,
            @RequestParam(required = false) String payStatus,
            @RequestParam(required = false) String payType,
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime) {
        PaymentQueryDto queryDto = new PaymentQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setOrderId(orderId);
        queryDto.setPayStatus(payStatus);
        queryDto.setPayType(payType);
        queryDto.setBeginTime(beginTime);
        queryDto.setEndTime(endTime);
        PageResult<PaymentVo> result = paymentService.queryPayments(queryDto);
        return success(result);
    }

    /**
     * 获取支付记录详情
     */
    @Operation(summary = "获取支付记录详情")
    @GetMapping("/{id}")
    @PreAuthorize("@ss.hasPermi('payment:query')")
    public AjaxResult get(@PathVariable Long id) {
        PaymentVo vo = paymentService.getPaymentDetail(id);
        return success(vo);
    }

    /**
     * 根据订单ID获取支付记录
     */
    @Operation(summary = "根据订单ID获取支付记录")
    @GetMapping("/byOrder/{orderId}")
    @PreAuthorize("@ss.hasPermi('payment:query')")
    public AjaxResult getByOrderId(@PathVariable Long orderId) {
        PaymentVo vo = paymentService.getPaymentByOrderId(orderId);
        return success(vo);
    }
}
