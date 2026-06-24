package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.PaymentVo;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.mapper.PaymentMapper;
import com.zsc.module.service.OrderService;
import com.zsc.module.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 支付服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private OrderService orderService;

    @Override
    public PageResult<PaymentVo> queryPayments(PaymentQueryDto queryDto) {
        Page<PaymentVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<PaymentVo> result = paymentMapper.selectPaymentVoPage(page, queryDto);
        return PageResult.fromPage(result);
    }

    @Override
    public PaymentVo getPaymentDetail(Long id) {
        PaymentVo vo = paymentMapper.selectPaymentVoById(id);
        if (vo == null) {
            throw new ServiceException("支付记录不存在");
        }
        return vo;
    }

    @Override
    public PaymentVo getPaymentByOrderId(Long orderId) {
        Page<PaymentVo> page = new Page<>(1, 1);
        PaymentQueryDto query = new PaymentQueryDto();
        query.setOrderId(orderId);
        Page<PaymentVo> result = paymentMapper.selectPaymentVoPage(page, query);
        if (result.getRecords().isEmpty()) {
            return null;
        }
        return result.getRecords().get(0);
    }

    @Override
    public Map<String, Object> initiateWechatPay(Long orderId, Long userId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!order.getUserId().equals(userId)) {
            throw new ServiceException("无权操作此订单");
        }
        if (!Order.STATUS_PENDING.equals(order.getStatus())) {
            throw new ServiceException("当前订单状态不支持支付");
        }

        // 查找或创建支付记录
        LambdaQueryWrapper<Payment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Payment::getOrderId, orderId);
        Payment payment = getOne(queryWrapper);
        if (payment == null) {
            payment = Payment.builder()
                    .orderId(orderId)
                    .payAmount(order.getTotalPrice())
                    .payType(Payment.PAY_TYPE_WECHAT)
                    .payStatus(Payment.PAY_STATUS_PENDING)
                    .createTime(new Date())
                    .updateTime(new Date())
                    .build();
            save(payment);
        }

        // 生成交易号
        String transactionId = "WX" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
                + String.format("%04d", new Random().nextInt(10000));

        // 构建微信支付参数（模拟）
        Map<String, Object> result = new HashMap<>();
        result.put("paymentId", payment.getId());
        result.put("orderId", orderId);
        result.put("orderNo", order.getOrderNo());
        result.put("payAmount", order.getTotalPrice());
        result.put("payType", "微信支付");
        result.put("payTypeCode", Payment.PAY_TYPE_WECHAT);
        result.put("transactionId", transactionId);
        result.put("qrCodeUrl", "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=WECHAT_PAY_" + transactionId);
        result.put("hotelName", ""); // 由前端已有数据填充

        return result;
    }

    @Override
    public void confirmPay(Long orderId, Long userId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!order.getUserId().equals(userId)) {
            throw new ServiceException("无权操作此订单");
        }
        if (!Order.STATUS_PENDING.equals(order.getStatus())) {
            throw new ServiceException("当前订单状态不支持支付确认");
        }

        // 更新订单状态：待支付 → 已支付
        order.setStatus(Order.STATUS_PAID);
        order.setPayTime(new Date());
        order.setUpdateTime(new Date());
        orderMapper.updateById(order);

        // 更新支付记录
        LambdaQueryWrapper<Payment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Payment::getOrderId, orderId);
        Payment payment = getOne(queryWrapper);
        if (payment != null) {
            String transactionId = "WX" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
                    + String.format("%04d", new Random().nextInt(10000));
            payment.setPayStatus(Payment.PAY_STATUS_PAID);
            payment.setPayTime(new Date());
            payment.setTransactionId(transactionId);
            payment.setUpdateTime(new Date());
            updateById(payment);
        }
    }
}
