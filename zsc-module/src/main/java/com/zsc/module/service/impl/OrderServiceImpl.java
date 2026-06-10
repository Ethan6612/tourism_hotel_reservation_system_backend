package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.mapper.PaymentMapper;
import com.zsc.module.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 订单服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public PageResult<OrderVo> queryOrders(OrderQueryDto queryDto) {
        Page<OrderVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<OrderVo> result = orderMapper.selectOrderVoPage(page, queryDto);
        return PageResult.fromPage(result);
    }

    @Override
    public OrderVo getOrderDetail(Long id) {
        OrderVo vo = orderMapper.selectOrderVoById(id);
        if (vo == null) {
            throw new ServiceException("订单不存在");
        }
        return vo;
    }

    @Override
    public void updateOrderStatus(Long id, String status, String reason) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }

        String oldStatus = order.getStatus();
        String newStatus = status;

        // 状态流转校验
        if (!isValidStatusTransition(oldStatus, newStatus)) {
            throw new ServiceException("非法的状态变更: " + getStatusName(oldStatus) + " → " + getStatusName(newStatus));
        }

        order.setStatus(newStatus);
        order.setUpdateTime(new Date());

        // 退款完成时释放库存
        if (Order.STATUS_REFUNDED.equals(newStatus)) {
            updateById(order);
            // TODO: 释放库存 - 需要对接Room模块
        } else if (Order.STATUS_PAID.equals(newStatus)) {
            order.setPayTime(new Date());
            updateById(order);
        } else {
            updateById(order);
        }
    }

    @Override
    public void cancelOrder(Long id, String reason) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!Order.STATUS_PENDING.equals(order.getStatus())) {
            throw new ServiceException("只有待支付订单才能取消，当前状态: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_CANCELLED);
        order.setUpdateTime(new Date());
        updateById(order);

        // 同时取消关联的支付记录
        Payment payment = paymentMapper.selectByOrderId(id);
        if (payment != null && Payment.PAY_STATUS_PENDING.equals(payment.getPayStatus())) {
            payment.setPayStatus(Payment.PAY_STATUS_FAILED);
            payment.setUpdateTime(new Date());
            paymentMapper.updateById(payment);
        }
    }

    @Override
    public void completeOrder(Long id) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!Order.STATUS_PAID.equals(order.getStatus())) {
            throw new ServiceException("只有已支付订单才能完成，当前状态: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_COMPLETED);
        order.setUpdateTime(new Date());
        updateById(order);
    }

    @Override
    public void applyRefund(Long id, String reason) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!Order.STATUS_PAID.equals(order.getStatus()) && !Order.STATUS_COMPLETED.equals(order.getStatus())) {
            throw new ServiceException("当前订单状态不支持退款: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_REFUNDING);
        order.setUpdateTime(new Date());
        updateById(order);
    }

    @Override
    public void confirmRefund(Long id) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!Order.STATUS_REFUNDING.equals(order.getStatus())) {
            throw new ServiceException("只有退款中的订单才能确认退款，当前状态: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_REFUNDED);
        order.setUpdateTime(new Date());
        updateById(order);

        // 更新支付记录状态为已退款
        Payment payment = paymentMapper.selectByOrderId(id);
        if (payment != null) {
            payment.setPayStatus(Payment.PAY_STATUS_REFUNDED);
            payment.setUpdateTime(new Date());
            paymentMapper.updateById(payment);
        }
    }

    @Override
    public void rejectRefund(Long id, String reason) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!Order.STATUS_REFUNDING.equals(order.getStatus())) {
            throw new ServiceException("只有退款中的订单才能驳回，当前状态: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_REFUND_REJECTED);
        order.setUpdateTime(new Date());
        updateById(order);

        // 同步更新支付记录状态
        Payment payment = paymentMapper.selectByOrderId(id);
        if (payment != null) {
            payment.setPayStatus(Payment.PAY_STATUS_FAILED);
            payment.setUpdateTime(new Date());
            paymentMapper.updateById(payment);
        }
    }

    @Override
    public String generateOrderNo() {
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        int random = new Random().nextInt(90000) + 10000;
        return "ORD" + date + random;
    }

    /**
     * 校验状态流转是否合法
     */
    private boolean isValidStatusTransition(String from, String to) {
        if (from == null || to == null) return false;
        if (from.equals(to)) return false;

        switch (from) {
            case Order.STATUS_PENDING:  // 0 待支付
                return Order.STATUS_PAID.equals(to) || Order.STATUS_CANCELLED.equals(to);
            case Order.STATUS_PAID:     // 1 已支付
                return Order.STATUS_COMPLETED.equals(to) || Order.STATUS_REFUNDING.equals(to);
            case Order.STATUS_REFUNDING: // 4 退款中
                return Order.STATUS_REFUNDED.equals(to) || Order.STATUS_REFUND_REJECTED.equals(to);
            default:
                return false;
        }
    }

    private String getStatusName(String status) {
        if (status == null) return "未知";
        switch (status) {
            case Order.STATUS_PENDING: return "待支付";
            case Order.STATUS_PAID: return "已支付";
            case Order.STATUS_CANCELLED: return "已取消";
            case Order.STATUS_COMPLETED: return "已完成";
            case Order.STATUS_REFUNDING: return "退款中";
            case Order.STATUS_REFUNDED: return "已退款";
            default: return "未知";
        }
    }
}
