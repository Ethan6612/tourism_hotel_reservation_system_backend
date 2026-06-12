package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.RoomDTO;
import com.zsc.module.domain.dto.query.RoomQueryDto;
import com.zsc.module.domain.vo.RoomVo;
import com.zsc.module.service.RoomService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 房型管理控制器
 *
 * @author zsc
 */
@Tag(name = "房型管理")
@Validated
@RestController
@RequestMapping("/api/room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    // ==================== 增删改查接口 ====================

    /**
     * 获取房型详情
     */
    @Operation(summary = "获取房型详情")
    @PreAuthorize("@ss.hasPermi('biz:room:query')")
    @GetMapping("/{id}")
    public ResultVo<RoomVo> get(@PathVariable Long id) {
        RoomVo vo = roomService.getRoomDetail(id);
        return ResultVo.ok(vo);
    }

    /**
     * 新增房型
     */
    @Operation(summary = "新增房型")
    @PreAuthorize("@ss.hasPermi('biz:room:add')")
    @Log(title = "房型管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo<Long> add(@Valid @RequestBody RoomDTO dto) {
        Long id = roomService.addRoom(dto);
        return ResultVo.ok(id);
    }

    /**
     * 编辑房型
     */
    @Operation(summary = "编辑房型")
    @PreAuthorize("@ss.hasPermi('biz:room:edit')")
    @Log(title = "房型管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo<String> update(@Valid @RequestBody RoomDTO dto) {
        roomService.updateRoom(dto);
        return ResultVo.ok("修改成功");
    }

    /**
     * 删除房型
     */
    @Operation(summary = "删除房型")
    @PreAuthorize("@ss.hasPermi('biz:room:remove')")
    @Log(title = "房型管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo<String> delete(@PathVariable Long id) {
        roomService.deleteRoom(id);
        return ResultVo.ok("删除成功");
    }

    // ==================== 状态管理接口 ====================

    /**
     * 房型上下架
     */
    @Operation(summary = "房型上下架")
    @PreAuthorize("@ss.hasPermi('biz:room:edit')")
    @Log(title = "房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status/{status}")
    public ResultVo<String> updateStatus(@PathVariable Long id, @PathVariable String status) {
        roomService.updateStatus(id, status);
        return ResultVo.ok("状态修改成功");
    }

    // ==================== 价格管理接口 ====================

    /**
     * 修改房型价格
     */
    @Operation(summary = "修改房型价格")
    @PreAuthorize("@ss.hasPermi('biz:room:edit')")
    @Log(title = "房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/price")
    public ResultVo<String> updatePrice(
            @PathVariable Long id,
            @RequestParam @Min(value = 1, message = "价格必须大于0") BigDecimal price) {
        roomService.updatePrice(id, price);
        return ResultVo.ok("价格修改成功");
    }

    // ==================== 库存管理接口 ====================

    /**
     * 修改房型库存
     */
    @Operation(summary = "修改房型库存")
    @PreAuthorize("@ss.hasPermi('biz:room:edit')")
    @Log(title = "房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/stock")
    public ResultVo<String> updateStock(
            @PathVariable Long id,
            @RequestParam @Min(value = 0, message = "库存不能小于0") Integer stock) {
        roomService.updateStock(id, stock);
        return ResultVo.ok("库存修改成功");
    }

    /**
     * 批量修改房型库存
     */
    @Operation(summary = "批量修改房型库存")
    @PreAuthorize("@ss.hasPermi('biz:room:edit')")
    @Log(title = "房型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/batchStock")
    public ResultVo<String> batchUpdateStock(
            @RequestParam List<Long> ids,
            @RequestParam @Min(value = 0, message = "库存不能小于0") Integer stock) {
        roomService.batchUpdateStock(ids, stock);
        return ResultVo.ok("批量修改库存成功");
    }

    /**
     * 库存预警查询
     */
    @Operation(summary = "库存预警查询")
    @PreAuthorize("@ss.hasPermi('biz:room:list')")
    @GetMapping("/lowStock")
    public ResultVo<List<RoomVo>> lowStock(
            @RequestParam(required = false, defaultValue = "5") Integer threshold,
            @RequestParam(required = false) Long hotelId) {
        List<RoomVo> list = roomService.getLowStockRooms(threshold, hotelId);
        return ResultVo.ok(list);
    }

    // ==================== 查询接口 ====================

    /**
     * 分页查询房型列表
     */
    @Operation(summary = "查询房型列表")
    @PreAuthorize("@ss.hasPermi('biz:room:list')")
    @PostMapping("/query")
    public ResultVo<PageResult<RoomVo>> query(@RequestBody RoomQueryDto queryDto) {
        PageResult<RoomVo> result = roomService.queryRooms(queryDto);
        return ResultVo.ok(result);
    }

    /**
     * 根据酒店ID查房型列表
     */
    @Operation(summary = "根据酒店ID查房型")
    @GetMapping("/hotel/{hotelId}")
    public ResultVo<List<RoomVo>> getByHotelId(@PathVariable Long hotelId) {
        List<RoomVo> list = roomService.getRoomsByHotelId(hotelId);
        return ResultVo.ok(list);
    }
}
