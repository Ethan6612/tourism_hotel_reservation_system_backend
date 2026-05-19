package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.PaymentDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.mapper.PaymentMapper;
import com.zsc.module.service.PaymentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 支付服务实现类
 */
@Service
@Transactional
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements PaymentService {

    @Override
    public Long createPayment(PaymentDto paymentDto) {
        Payment payment = new Payment();
        BeanUtils.copyProperties(paymentDto, payment);
        payment.setPayStatus("0"); // 待支付
        payment.setCreateTime(new Date());
        payment.setUpdateTime(new Date());
        if (!this.save(payment)) {
            throw new ServiceException("系统错误，支付记录创建失败！");
        }
        return payment.getId();
    }

    @Override
    public void updatePaymentStatus(Long paymentId, String status, String transactionId) {
        Payment payment = this.getById(paymentId);
        if (payment == null) {
            throw new ServiceException("支付记录不存在！");
        }
        payment.setPayStatus(status);
        payment.setTransactionId(transactionId);
        if ("1".equals(status)) {
            payment.setPayTime(new Date());
        }
        payment.setUpdateTime(new Date());
        if (!this.updateById(payment)) {
            throw new ServiceException("系统错误，支付状态更新失败！");
        }
    }

    @Override
    public PageResult queryPayments(Integer pageNum, Integer pageSize, Long orderId, String payStatus) {
        Page<Payment> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Payment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(orderId != null, Payment::getOrderId, orderId)
                .eq(StringUtils.isNotBlank(payStatus), Payment::getPayStatus, payStatus)
                .orderByDesc(Payment::getCreateTime);
        Page<Payment> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }
}