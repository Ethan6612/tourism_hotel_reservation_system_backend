package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.query.OrderQueryDto;
import com.zsc.module.domain.vo.OrderVo;
import com.zsc.module.service.MerchantService;
import com.zsc.module.service.OrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "商户订单管理")
@RestController
@RequestMapping("/api/merchant/order")
public class MerchantOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private MerchantService merchantService;

    @Operation(summary = "查询商户订单列表")
    @GetMapping("/list")
    public ResultVo<PageResult<OrderVo>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String orderNo,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String orderBy) {

        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        if (hotelIds.isEmpty()) {
            return ResultVo.ok(new PageResult<>());
        }
        if (hotelId != null) {
            if (!hotelIds.contains(hotelId)) {
                return ResultVo.ok(new PageResult<>());
            }
            hotelIds = List.of(hotelId);
        }

        OrderQueryDto queryDto = new OrderQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setOrderNo(orderNo);
        queryDto.setStatus(status);
        queryDto.setBeginTime(beginTime);
        queryDto.setEndTime(endTime);
        queryDto.setKeyword(keyword);
        queryDto.setOrderBy(orderBy);
        queryDto.setHotelIds(hotelIds);

        PageResult<OrderVo> result = orderService.queryOrders(queryDto);
        return ResultVo.ok(result);
    }

    @Operation(summary = "获取商户订单详情")
    @GetMapping("/{id}")
    public ResultVo<OrderVo> get(@PathVariable Long id) {
        OrderVo vo = orderService.getOrderDetail(id);
        merchantService.checkHotelOwnership(vo.getHotelId());
        return ResultVo.ok(vo);
    }

    @Operation(summary = "修改备注")
    @Log(title = "商户订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/remark")
    public ResultVo<String> updateRemark(@PathVariable Long id,
            @RequestParam(required = false) String remark) {
        checkOrderOwnership(id);
        orderService.updateRemark(id, remark);
        return ResultVo.ok("备注已更新");
    }

    @Operation(summary = "办理入住")
    @Log(title = "商户订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/checkin")
    public ResultVo<String> checkin(@PathVariable Long id,
            @RequestParam(required = false) String remark) {
        checkOrderOwnership(id);
        orderService.checkinOrder(id, remark);
        return ResultVo.ok("已办理入住");
    }

    @Operation(summary = "办理退房")
    @Log(title = "商户订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/checkout")
    public ResultVo<String> checkout(@PathVariable Long id,
            @RequestParam(required = false) String remark) {
        checkOrderOwnership(id);
        orderService.checkoutOrder(id, remark);
        return ResultVo.ok("已办理退房，订单已完成");
    }

    @Operation(summary = "取消订单")
    @Log(title = "商户订单管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/cancel")
    public ResultVo<String> cancel(@PathVariable Long id,
            @RequestParam(required = false) String reason) {
        checkOrderOwnership(id);
        orderService.cancelOrder(id, reason);
        return ResultVo.ok("订单已取消");
    }

    private void checkOrderOwnership(Long orderId) {
        OrderVo vo = orderService.getOrderDetail(orderId);
        merchantService.checkHotelOwnership(vo.getHotelId());
    }
}
