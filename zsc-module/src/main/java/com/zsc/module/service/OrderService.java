package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.OrderDto;
import com.zsc.module.domain.entity.Order;

/**
 * 订单服务接口
 */
public interface OrderService extends IService<Order> {

    /**
     * 创建订单
     */
    Long createOrder(OrderDto orderDto);

    /**
     * 更新订单状态
     */
    void updateOrderStatus(Long orderId, String status);

    /**
     * 分页查询订单列表
     */
    PageResult queryOrders(Integer pageNum, Integer pageSize, Long userId, String status);
}