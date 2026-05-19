package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.OrderDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.mapper.OrderMapper;
import com.zsc.module.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * 订单服务实现类
 */
@Service
@Transactional
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Override
    public Long createOrder(OrderDto orderDto) {
        Order order = new Order();
        BeanUtils.copyProperties(orderDto, order);
        // 生成订单号
        order.setOrderNo("ORD" + UUID.randomUUID().toString().replace("-", "").substring(0, 18).toUpperCase());
        order.setStatus("0"); // 待支付
        order.setCreateTime(new Date());
        order.setUpdateTime(new Date());
        if (!this.save(order)) {
            throw new ServiceException("系统错误，订单创建失败！");
        }
        return order.getId();
    }

    @Override
    public void updateOrderStatus(Long orderId, String status) {
        Order order = this.getById(orderId);
        if (order == null) {
            throw new ServiceException("订单不存在！");
        }
        order.setStatus(status);
        order.setUpdateTime(new Date());
        if ("1".equals(status)) {
            order.setPayTime(new Date());
        }
        if (!this.updateById(order)) {
            throw new ServiceException("系统错误，订单状态更新失败！");
        }
    }

    @Override
    public PageResult queryOrders(Integer pageNum, Integer pageSize, Long userId, String status) {
        Page<Order> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(userId != null, Order::getUserId, userId)
                .eq(StringUtils.isNotBlank(status), Order::getStatus, status)
                .orderByDesc(Order::getCreateTime);
        Page<Order> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }
}