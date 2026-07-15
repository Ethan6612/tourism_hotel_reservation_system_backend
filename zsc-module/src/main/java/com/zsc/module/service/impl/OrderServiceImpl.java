package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CreateOrderDto;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.domain.vo.UserDashboardStatsVo;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.mapper.PaymentMapper;
import com.zsc.module.service.OrderService;
import com.zsc.module.service.RoomService;
import com.zsc.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
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

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private com.zsc.module.mapper.RoomMapper roomMapper;

    @Autowired
    private RoomService roomService;

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
            // 释放库存
            roomService.releaseStock(order.getRoomId(), 1);
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

        // 释放库存
        roomService.releaseStock(order.getRoomId(), 1);

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

        // 积分奖励：1元=1积分
        awardPoints(order.getUserId(), order.getTotalPrice());
    }

    /**
     * 奖励积分（1元=1积分）
     */
    private void awardPoints(Long userId, BigDecimal totalPrice) {
        if (userId == null || totalPrice == null) {
            return;
        }
        int pointsToAdd = totalPrice.intValue();
        if (pointsToAdd <= 0) {
            return;
        }
        sysUserMapper.addUserPoints(userId, pointsToAdd);
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

        // 释放库存
        roomService.releaseStock(order.getRoomId(), 1);

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
    public void updateRemark(Long id, String remark) {
        Order order = getById(id);
        if (order == null) throw new ServiceException("订单不存在");
        order.setRemark(remark);
        order.setUpdateTime(new Date());
        updateById(order);
    }

    @Override
    public void checkinOrder(Long id, String remark) {
        Order order = getById(id);
        if (order == null) throw new ServiceException("订单不存在");
        if (!Order.STATUS_PAID.equals(order.getStatus()))
            throw new ServiceException("只有已支付的订单才能办理入住，当前状态: " + getStatusName(order.getStatus()));
        order.setStatus(Order.STATUS_CHECKED_IN);
        order.setUpdateTime(new Date());
        updateById(order);
    }

    @Override
    public void checkoutOrder(Long id, String remark) {
        Order order = getById(id);
        if (order == null) throw new ServiceException("订单不存在");
        if (!Order.STATUS_CHECKED_IN.equals(order.getStatus()))
            throw new ServiceException("只有已入住的订单才能办理退房，当前状态: " + getStatusName(order.getStatus()));
        order.setStatus(Order.STATUS_COMPLETED);
        order.setUpdateTime(new Date());
        updateById(order);
        awardPoints(order.getUserId(), order.getTotalPrice());
    }

    @Override
    public OrderVo createOrder(CreateOrderDto dto, Long userId) {
        // 验证房型存在
        Room room = roomMapper.selectById(dto.getRoomId());
        if (room == null) {
            throw new ServiceException("房型不存在");
        }
        // 计算天数
        long diffMs = dto.getEndDate().getTime() - dto.getStartDate().getTime();
        long nights = diffMs / (1000 * 60 * 60 * 24);
        if (nights <= 0) {
            throw new ServiceException("退房日期必须晚于入住日期");
        }
        // 计算总价
        BigDecimal totalPrice = room.getPrice().multiply(BigDecimal.valueOf(nights));
        // 创建订单
        Order order = Order.builder()
                .orderNo(generateOrderNo())
                .userId(userId)
                .hotelId(dto.getHotelId())
                .roomId(dto.getRoomId())
                .startDate(dto.getStartDate())
                .endDate(dto.getEndDate())
                .totalPrice(totalPrice)
                .status(Order.STATUS_PENDING)
                .createTime(new Date())
                .updateTime(new Date())
                .build();
        save(order);
        // 锁定库存（下单时扣减）
        roomService.lockStock(dto.getRoomId(), 1);
        return orderMapper.selectOrderVoById(order.getId());
    }

    @Override
    public String generateOrderNo() {
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        int random = new Random().nextInt(90000) + 10000;
        return "ORD" + date + random;
    }

    /**
     * 检查房型是否有未完成订单
     * 未完成状态：待支付(0)、已支付(1)、退款中(4)
     */
    @Override
    public boolean hasUnfinishedOrder(Long roomId) {
        if (roomId == null) {
            return false;
        }
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Order::getRoomId, roomId)
                .in(Order::getStatus,
                        Order.STATUS_PENDING,
                        Order.STATUS_PAID,
                        Order.STATUS_CHECKED_IN,
                        Order.STATUS_REFUNDING
                );
        return this.count(wrapper) > 0;
    }

    // ==================== 用户端接口实现 ====================

    @Override
    public PageResult<OrderVo> queryUserOrders(OrderQueryDto queryDto) {
        Page<OrderVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<OrderVo> result = orderMapper.selectOrderVoPage(page, queryDto);
        return PageResult.fromPage(result);
    }

    @Override
    public OrderVo getUserOrderDetail(Long id, Long userId) {
        OrderVo vo = orderMapper.selectUserOrderVoById(id, userId);
        if (vo == null) {
            throw new ServiceException("订单不存在或无权查看");
        }
        return vo;
    }

    @Override
    public void cancelUserOrder(Long id, Long userId, String reason) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!order.getUserId().equals(userId)) {
            throw new ServiceException("无权操作此订单");
        }
        if (!Order.STATUS_PENDING.equals(order.getStatus())) {
            throw new ServiceException("只有待支付订单才能取消，当前状态: " + getStatusName(order.getStatus()));
        }
        order.setStatus(Order.STATUS_CANCELLED);
        order.setUpdateTime(new Date());
        updateById(order);

        // 释放库存
        roomService.releaseStock(order.getRoomId(), 1);

        // 同时取消关联的支付记录
        Payment payment = paymentMapper.selectByOrderId(id);
        if (payment != null && Payment.PAY_STATUS_PENDING.equals(payment.getPayStatus())) {
            payment.setPayStatus(Payment.PAY_STATUS_FAILED);
            payment.setUpdateTime(new Date());
            paymentMapper.updateById(payment);
        }
    }

    @Override
    public void deleteUserOrder(Long id, Long userId) {
        Order order = getById(id);
        if (order == null) {
            throw new ServiceException("订单不存在");
        }
        if (!order.getUserId().equals(userId)) {
            throw new ServiceException("无权操作此订单");
        }
        // 只允许删除已完成、已取消、已退款的订单
        if (!Order.STATUS_COMPLETED.equals(order.getStatus())
                && !Order.STATUS_CANCELLED.equals(order.getStatus())
                && !Order.STATUS_REFUNDED.equals(order.getStatus())) {
            throw new ServiceException("只能删除已完成、已取消或已退款的订单");
        }
        removeById(id);
    }

    @Override
    public UserDashboardStatsVo getUserDashboardStats(Long userId) {
        // 订单总数
        Long orderCount = orderMapper.countUserOrders(userId);

        // 进行中订单（待支付 + 已支付 + 退款中）
        Long pendingCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_PENDING);
        Long paidCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_PAID);
        Long refundingCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_REFUNDING);
        Long activeOrders = (pendingCount != null ? pendingCount : 0)
                + (paidCount != null ? paidCount : 0)
                + (refundingCount != null ? refundingCount : 0);

        // 已完成订单数
        Long completedCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_COMPLETED);

        // 已取消/退款订单数
        Long cancelledCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_CANCELLED);
        Long refundedCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_REFUNDED);
        Long refundRejectedCount = orderMapper.countUserOrdersByStatus(userId, Order.STATUS_REFUND_REJECTED);
        Long cancelledOrders = (cancelledCount != null ? cancelledCount : 0)
                + (refundedCount != null ? refundedCount : 0)
                + (refundRejectedCount != null ? refundRejectedCount : 0);

        // 已完成但未评价的订单数
        Long pendingReviews = orderMapper.countUserPendingReviewOrders(userId);

        // 用户积分（专用查询，不依赖 sys_user 表结构）
        Integer points = sysUserMapper.selectUserPoints(userId);
        if (points == null) points = 0;

        return UserDashboardStatsVo.builder()
                .orderCount(orderCount != null ? orderCount : 0)
                .activeOrders(activeOrders)
                .completedOrders(completedCount != null ? completedCount : 0)
                .cancelledOrders(cancelledOrders)
                .reviewCount(0L)  // 由前端调用评价接口获取
                .pendingReviews(pendingReviews != null ? pendingReviews : 0)
                .favoriteCount(0L)  // 由前端调用收藏接口获取
                .points(points)
                .build();
    }

    /**
     * 校验状态流转是否合法
     */
    private boolean isValidStatusTransition(String from, String to) {
        if (from == null || to == null) return false;
        if (from.equals(to)) return false;

        switch (from) {
            case Order.STATUS_PENDING:
                return Order.STATUS_PAID.equals(to) || Order.STATUS_CANCELLED.equals(to);
            case Order.STATUS_PAID:
                return Order.STATUS_COMPLETED.equals(to) || Order.STATUS_REFUNDING.equals(to) || Order.STATUS_CHECKED_IN.equals(to);
            case Order.STATUS_CHECKED_IN:
                return Order.STATUS_COMPLETED.equals(to) || Order.STATUS_REFUNDING.equals(to);
            case Order.STATUS_REFUNDING:
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
            case Order.STATUS_REFUND_REJECTED: return "退款驳回";
            case Order.STATUS_CHECKED_IN: return "已入住";
            default: return "未知";
        }
    }
}
