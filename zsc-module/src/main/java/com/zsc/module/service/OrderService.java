package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CreateOrderDto;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Order;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.domain.vo.UserDashboardStatsVo;

/**
 * 订单服务接口
 *
 * @author zsc
 */
public interface OrderService extends IService<Order> {

    /**
     * 分页查询订单列表（管理端）
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

    void checkinOrder(Long id, String remark);

    void checkoutOrder(Long id, String remark);

    void updateRemark(Long id, String remark);

    /**
     * 生成订单号
     */
    String generateOrderNo();

    /**
     * 检查房型是否有未完成订单
     * 未完成状态：待支付(0)、已支付(1)、退款中(4)
     *
     * @param roomId 房型ID
     * @return true-存在未完成订单，false-不存在
     */
    boolean hasUnfinishedOrder(Long roomId);

    // ==================== 用户端接口 ====================

    /**
     * 分页查询当前用户的订单列表
     */
    PageResult<OrderVo> queryUserOrders(OrderQueryDto queryDto);

    /**
     * 获取用户自己的订单详情
     */
    OrderVo getUserOrderDetail(Long id, Long userId);

    /**
     * 用户取消自己的订单
     */
    void cancelUserOrder(Long id, Long userId, String reason);

    /**
     * 用户删除自己的订单
     */
    void deleteUserOrder(Long id, Long userId);

    /**
     * 获取用户首页统计数据（含积分）
     */
    UserDashboardStatsVo getUserDashboardStats(Long userId);

    /**
     * 创建订单（用户预订）
     */
    OrderVo createOrder(CreateOrderDto dto, Long userId);
}
