package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.PaymentDto;
import com.zsc.module.domain.entity.Payment;

/**
 * 支付服务接口
 */
public interface PaymentService extends IService<Payment> {

    /**
     * 创建支付记录
     */
    Long createPayment(PaymentDto paymentDto);

    /**
     * 更新支付状态
     */
    void updatePaymentStatus(Long paymentId, String status, String transactionId);

    /**
     * 分页查询支付列表
     */
    PageResult queryPayments(Integer pageNum, Integer pageSize, Long orderId, String payStatus);
}