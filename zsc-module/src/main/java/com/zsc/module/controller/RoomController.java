package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.RoomDto;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.service.RoomService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

/**
 * 房源控制器
 */
@Tag(name = "房源管理")
@Validated
@RestController
@RequestMapping("/api/room")
public class RoomController extends BaseController {

    @Autowired
    private RoomService roomService;

    /**
     * 查询房源列表
     */
    @Operation(summary = "查询房源列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) String status) {
        PageResult result = roomService.queryRooms(pageNum, pageSize, hotelId, status);
        return success(result);
    }

    /**
     * 获取房源详情
     */
    @Operation(summary = "获取房源详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        Room room = roomService.getById(id);
        return success(room);
    }

    /**
     * 新增房源
     */
    @Operation(summary = "新增房源")
    @PreAuthorize("@ss.hasPermi('room:add')")
    @Log(title = "房源管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Valid @RequestBody RoomDto roomDto) {
        roomService.addRoom(roomDto);
        return success();
    }

    /**
     * 修改房源
     */
    @Operation(summary = "修改房源")
    @PreAuthorize("@ss.hasPermi('room:edit')")
    @Log(title = "房源管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Valid @RequestBody RoomDto roomDto) {
        roomService.updateRoom(roomDto);
        return success();
    }

    /**
     * 删除房源
     */
    @Operation(summary = "删除房源")
    @PreAuthorize("@ss.hasPermi('room:remove')")
    @Log(title = "房源管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        return toAjax(roomService.removeById(id));
    }
}