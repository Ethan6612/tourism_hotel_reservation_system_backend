package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.vo.OrderVo;

/**
 * 订单服务接口
 *
 * @author zsc
 */
public interface OrderService extends IService<Order> {

    /**
     * 分页查询订单列表
     */
    PageResult<OrderVo> queryOrders(OrderQueryDto queryDto);

    /**
     * 获取订单详情
     */
    OrderVo getOrderDetail(Long id);

    /**
     * 更新订单状态
     * @param id 订单ID
     * @param status 目标状态
     * @param reason 操作原因
     */
    void updateOrderStatus(Long id, String status, String reason);

    /**
     * 取消订单（待支付 → 已取消）
     */
    void cancelOrder(Long id, String reason);

    /**
     * 完成订单（已支付 → 已完成）
     */
    void completeOrder(Long id);

    /**
     * 申请退款（已支付 → 退款中）
     */
    void applyRefund(Long id, String reason);

    /**
     * 确认退款（退款中 → 已退款，释放库存）
     */
    void confirmRefund(Long id);

    /**
     * 驳回退款（退款中 → 退款驳回）
     */
    void rejectRefund(Long id, String reason);

    /**
     * 生成订单号
     */
    String generateOrderNo();
}
