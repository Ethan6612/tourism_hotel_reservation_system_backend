package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.RoomDTO;
import com.zsc.module.domain.dto.query.RoomQueryDto;
import com.zsc.module.domain.vo.RoomVo;
import com.zsc.module.service.MerchantService;
import com.zsc.module.service.RoomService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 商户端房型管理控制器
 *
 * @author zsc
 */
@Tag(name = "商户房型管理")
@RestController
@RequestMapping("/api/merchant/room")
public class MerchantRoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private MerchantService merchantService;

    /**
     * 分页查询自己酒店下的房型列表
     */
    @Operation(summary = "查询我的房型列表")
    @PostMapping("/query")
    public ResultVo<PageResult<RoomVo>> query(@RequestBody RoomQueryDto queryDto) {
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        PageResult<RoomVo> result = roomService.queryMerchantRooms(queryDto, hotelIds);
        return ResultVo.ok(result);
    }

    /**
     * 获取房型详情（校验所有权链）
     */
    @Operation(summary = "获取我的房型详情")
    @GetMapping("/{id}")
    public ResultVo<RoomVo> get(@PathVariable Long id) {
        merchantService.checkRoomOwnership(id);
        RoomVo vo = roomService.getRoomDetail(id);
        return ResultVo.ok(vo);
    }

    /**
     * 新增房型（校验hotelId属于当前商户）
     */
    @Operation(summary = "新增房型")
    @Log(title = "商户房型管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo<Long> add(@Valid @RequestBody RoomDTO dto) {
        // 校验酒店所有权
        if (dto.getHotelId() != null) {
            merchantService.checkHotelOwnership(dto.getHotelId());
        }
        Long id = roomService.addRoom(dto);
        return ResultVo.ok(id);
    }

    /**
     * 编辑房型（校验所有权链）
     */
    @Operation(summary = "编辑房型")
    @Log(title = "商户房型管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo<String> update(@Valid @RequestBody RoomDTO dto) {
        if (dto.getId() != null) {
            merchantService.checkRoomOwnership(dto.getId());
        }
        // 如果修改了hotelId，校验新酒店所有权
        if (dto.getHotelId() != null) {
            merchantService.checkHotelOwnership(dto.getHotelId());
        }
        roomService.updateRoom(dto);
        return ResultVo.ok("修改成功");
    }

    /**
     * 删除房型（校验所有权链）
     */
    @Operation(summary = "删除房型")
    @Log(title = "商户房型管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo<String> delete(@PathVariable Long id) {
        merchantService.checkRoomOwnership(id);
        roomService.deleteRoom(id);
        return ResultVo.ok("删除成功");
    }

    /**
     * 房型上下架（校验所有权链）
     */
    @Operation(summary = "房型上下架")
    @Log(title = "商户房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status/{status}")
    public ResultVo<String> updateStatus(@PathVariable Long id, @PathVariable String status) {
        merchantService.checkRoomOwnership(id);
        roomService.updateStatus(id, status);
        return ResultVo.ok("状态修改成功");
    }

    /**
     * 修改房型价格（校验所有权链）
     */
    @Operation(summary = "修改房型价格")
    @Log(title = "商户房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/price")
    public ResultVo<String> updatePrice(
            @PathVariable Long id,
            @RequestParam @Min(value = 1, message = "价格必须大于0") BigDecimal price) {
        merchantService.checkRoomOwnership(id);
        roomService.updatePrice(id, price);
        return ResultVo.ok("价格修改成功");
    }

    /**
     * 修改房型库存（校验所有权链）
     */
    @Operation(summary = "修改房型库存")
    @Log(title = "商户房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/stock")
    public ResultVo<String> updateStock(
            @PathVariable Long id,
            @RequestParam @Min(value = 0, message = "库存不能小于0") Integer stock) {
        merchantService.checkRoomOwnership(id);
        roomService.updateStock(id, stock);
        return ResultVo.ok("库存修改成功");
    }

    /**
     * 按酒店ID查询房型（校验酒店所有权）
     */
    @Operation(summary = "按酒店查房型")
    @GetMapping("/hotel/{hotelId}")
    public ResultVo<List<RoomVo>> getByHotelId(@PathVariable Long hotelId) {
        merchantService.checkHotelOwnership(hotelId);
        List<RoomVo> list = roomService.getRoomsByHotelId(hotelId);
        return ResultVo.ok(list);
    }

    /**
     * 库存预警查询（只查自己酒店下的）
     */
    @Operation(summary = "库存预警查询")
    @GetMapping("/lowStock")
    public ResultVo<List<RoomVo>> lowStock(
            @RequestParam(required = false, defaultValue = "5") Integer threshold,
            @RequestParam(required = false) Long hotelId) {
        // 如果未指定hotelId，自动使用商户的第一个酒店
        if (hotelId == null) {
            List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
            if (hotelIds != null && !hotelIds.isEmpty()) {
                hotelId = hotelIds.get(0);
            }
        }
        // 校验酒店所有权
        if (hotelId != null) {
            merchantService.checkHotelOwnership(hotelId);
        }
        List<RoomVo> list = roomService.getLowStockRooms(threshold, hotelId);
        return ResultVo.ok(list);
    }
}
