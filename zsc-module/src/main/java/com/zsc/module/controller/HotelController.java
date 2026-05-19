package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.service.HotelService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

/**
 * 酒店控制器
 */
@Tag(name = "酒店管理")
@Validated
@RestController
@RequestMapping("/api/hotel")
public class HotelController extends BaseController {

    @Autowired
    private HotelService hotelService;

    /**
     * 查询酒店列表
     */
    @Operation(summary = "查询酒店列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Integer star,
            @RequestParam(required = false) String status) {
        PageResult result = hotelService.queryHotels(pageNum, pageSize, name, star, status);
        return success(result);
    }

    /**
     * 获取酒店详情
     */
    @Operation(summary = "获取酒店详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        Hotel hotel = hotelService.getById(id);
        return success(hotel);
    }

    /**
     * 新增酒店
     */
    @Operation(summary = "新增酒店")
    @PreAuthorize("@ss.hasPermi('hotel:add')")
    @Log(title = "酒店管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Valid @RequestBody HotelDto hotelDto) {
        hotelService.addHotel(hotelDto);
        return success();
    }

    /**
     * 修改酒店
     */
    @Operation(summary = "修改酒店")
    @PreAuthorize("@ss.hasPermi('hotel:edit')")
    @Log(title = "酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Valid @RequestBody HotelDto hotelDto) {
        hotelService.updateHotel(hotelDto);
        return success();
    }

    /**
     * 删除酒店
     */
    @Operation(summary = "删除酒店")
    @PreAuthorize("@ss.hasPermi('hotel:remove')")
    @Log(title = "酒店管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        return toAjax(hotelService.removeById(id));
    }
}