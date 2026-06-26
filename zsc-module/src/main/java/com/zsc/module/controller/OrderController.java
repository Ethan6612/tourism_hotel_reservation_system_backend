package com.zsc.module.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.OrderStatusUpdateDto;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.mapper.MerchantMapper;
import com.zsc.module.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 订单控制器（管理端）
 *
 * @author zsc
 */
@Tag(name = "订单管理")
@Validated
@RestController
@RequestMapping("/api/order")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private MerchantMapper merchantMapper;

    @Autowired
    private HotelMapper hotelMapper;

    // ==================== 查询接口 ====================

    /**
     * 查询订单列表（管理员看全部，商户只看自己酒店的订单）
     */
    @Operation(summary = "查询订单列表")
    @GetMapping("/list")
    @PreAuthorize("@ss.hasPermi('order:list')")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String orderNo,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Long roomId,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String orderBy) {
        OrderQueryDto queryDto = new OrderQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setOrderNo(orderNo);
        queryDto.setUserId(userId);
        queryDto.setHotelId(hotelId);
        queryDto.setRoomId(roomId);
        queryDto.setStatus(status);
        queryDto.setBeginTime(beginTime);
        queryDto.setEndTime(endTime);
        queryDto.setKeyword(keyword);
        queryDto.setOrderBy(orderBy);

        // 商户自动过滤：只显示自己酒店的订单
        Long currentUserId = SecurityUtils.getUserId();
        Merchant merchant = merchantMapper.selectOne(
            new LambdaQueryWrapper<Merchant>().eq(Merchant::getUserId, currentUserId)
        );
        if (merchant != null) {
            List<Hotel> myHotels = hotelMapper.selectList(
                new LambdaQueryWrapper<Hotel>().eq(Hotel::getBusinessId, merchant.getId())
            );
            if (myHotels.isEmpty()) {
                // 商户还没有酒店，返回空列表
                return success(new PageResult<>());
            }
            queryDto.setHotelIds(myHotels.stream().map(Hotel::getId).collect(Collectors.toList()));
        }

        PageResult<OrderVo> result = orderService.queryOrders(queryDto);
        return success(result);
    }

    /**
     * 获取订单详情
     */
    @Operation(summary = "获取订单详情")
    @GetMapping("/{id}")
    @PreAuthorize("@ss.hasPermi('order:query')")
    public AjaxResult get(@PathVariable Long id) {
        OrderVo vo = orderService.getOrderDetail(id);
        return success(vo);
    }

    // ==================== 状态流转接口 ====================

    /**
     * 取消订单（待支付 → 已取消）
     */
    @Operation(summary = "取消订单")
    @PreAuthorize("@ss.hasPermi('order:cancel')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/cancel")
    public AjaxResult cancel(
            @PathVariable Long id,
            @RequestParam(required = false) String reason) {
        orderService.cancelOrder(id, reason);
        return success("订单已取消");
    }

    /**
     * 完成订单（已支付 → 已完成）
     */
    @Operation(summary = "完成订单")
    @PreAuthorize("@ss.hasPermi('order:complete')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/complete")
    public AjaxResult complete(@PathVariable Long id) {
        orderService.completeOrder(id);
        return success("订单已完成");
    }

    /**
     * 申请退款（已支付 → 退款中）
     */
    @Operation(summary = "申请退款")
    @PreAuthorize("@ss.hasPermi('order:refund')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/refund")
    public AjaxResult refund(
            @PathVariable Long id,
            @RequestParam(required = false) String reason) {
        orderService.applyRefund(id, reason);
        return success("退款申请已提交");
    }

    /**
     * 驳回退款（退款中 → 退款驳回）
     */
    @Operation(summary = "驳回退款")
    @PreAuthorize("@ss.hasPermi('order:refund')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/rejectRefund")
    public AjaxResult rejectRefund(
            @PathVariable Long id,
            @RequestParam(required = false) String reason) {
        orderService.rejectRefund(id, reason);
        return success("退款已驳回");
    }

    /**
     * 确认退款（退款中 → 已退款）
     */
    @Operation(summary = "确认退款")
    @PreAuthorize("@ss.hasPermi('order:refund')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/confirmRefund")
    public AjaxResult confirmRefund(@PathVariable Long id) {
        orderService.confirmRefund(id);
        return success("退款已确认");
    }

    /**
     * 修改备注
     */
    @Operation(summary = "修改订单备注")
    @PreAuthorize("@ss.hasPermi('order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/remark")
    public AjaxResult updateRemark(
            @PathVariable Long id,
            @RequestParam(required = false) String remark) {
        orderService.updateRemark(id, remark);
        return success("备注已更新");
    }

    /**
     * 办理入住（已支付 → 已入住）
     */
    @Operation(summary = "办理入住")
    @PreAuthorize("@ss.hasPermi('order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/checkin")
    public AjaxResult checkin(
            @PathVariable Long id,
            @RequestParam(required = false) String remark) {
        orderService.checkinOrder(id, remark);
        return success("已办理入住");
    }

    /**
     * 办理退房（已入住 → 已完成）
     */
    @Operation(summary = "办理退房")
    @PreAuthorize("@ss.hasPermi('order:complete')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/checkout")
    public AjaxResult checkout(
            @PathVariable Long id,
            @RequestParam(required = false) String remark) {
        orderService.checkoutOrder(id, remark);
        return success("已办理退房，订单完成");
    }

    /**
     * 通用状态更新
     */
    @Operation(summary = "更新订单状态")
    @PreAuthorize("@ss.hasPermi('order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status")
    public AjaxResult updateStatus(
            @PathVariable Long id,
            @Valid @RequestBody OrderStatusUpdateDto dto) {
        orderService.updateOrderStatus(id, dto.getStatus(), dto.getReason());
        return success("状态更新成功");
    }

    // ==================== 删除接口 ====================

    /**
     * 删除订单
     */
    @Operation(summary = "删除订单")
    @PreAuthorize("@ss.hasPermi('order:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        orderService.removeById(id);
        return success("删除成功");
    }

    /**
     * 批量删除订单
     */
    @Operation(summary = "批量删除订单")
    @PreAuthorize("@ss.hasPermi('order:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    public AjaxResult batchRemove(@RequestBody @NotEmpty(message = "请选择要删除的订单") List<Long> ids) {
        orderService.removeByIds(ids);
        return success("批量删除成功");
    }
}
