package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.HotelDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;
import com.zsc.module.service.HotelService;
import com.zsc.module.service.MerchantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 商户端酒店管理控制器
 *
 * @author zsc
 */
@Tag(name = "商户酒店管理")
@RestController
@RequestMapping("/api/merchant/hotel")
public class MerchantHotelController {

    @Autowired
    private HotelService hotelService;

    @Autowired
    private MerchantService merchantService;

    /**
     * 分页查询自己的酒店列表
     */
    @Operation(summary = "查询我的酒店列表")
    @PostMapping("/query")
    public ResultVo<PageResult<HotelListVO>> query(@RequestBody HotelQueryDto queryDto) {
        Long businessId = merchantService.getCurrentMerchantId();
        PageResult<HotelListVO> result = hotelService.queryMerchantHotels(queryDto, businessId);
        return ResultVo.ok(result);
    }

    /**
     * 获取酒店详情（校验所有权）
     */
    @Operation(summary = "获取我的酒店详情")
    @GetMapping("/{id}")
    public ResultVo<HotelDetailVO> get(@PathVariable Long id) {
        merchantService.checkHotelOwnership(id);
        HotelDetailVO vo = hotelService.getHotelDetail(id);
        return ResultVo.ok(vo);
    }

    /**
     * 新增酒店（自动绑定当前商户）
     */
    @Operation(summary = "新增酒店")
    @Log(title = "商户酒店管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo<Long> add(@Valid @RequestBody HotelDTO dto) {
        Long businessId = merchantService.getCurrentMerchantId();
        Long id = hotelService.addMerchantHotel(dto, businessId);
        return ResultVo.ok(id);
    }

    /**
     * 编辑酒店（校验所有权）
     */
    @Operation(summary = "编辑酒店")
    @Log(title = "商户酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo<String> update(@Valid @RequestBody HotelDTO dto) {
        if (dto.getId() != null) {
            merchantService.checkHotelOwnership(dto.getId());
        }
        Long businessId = merchantService.getCurrentMerchantId();
        hotelService.updateMerchantHotel(dto, businessId);
        return ResultVo.ok("修改成功");
    }

    /**
     * 删除酒店（校验所有权）
     */
    @Operation(summary = "删除酒店")
    @Log(title = "商户酒店管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo<String> delete(@PathVariable Long id) {
        merchantService.checkHotelOwnership(id);
        hotelService.deleteHotel(id);
        return ResultVo.ok("删除成功");
    }

    /**
     * 修改酒店状态（校验所有权）
     */
    @Operation(summary = "修改酒店状态")
    @Log(title = "商户酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status/{status}")
    public ResultVo<String> updateStatus(@PathVariable Long id, @PathVariable String status) {
        merchantService.checkHotelOwnership(id);
        hotelService.updateStatus(id, status);
        return ResultVo.ok("状态修改成功");
    }

    /**
     * 提交上架申请（草稿 → 待审核）
     */
    @Operation(summary = "提交上架申请")
    @Log(title = "商户酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/submitAudit")
    public ResultVo<String> submitAudit(@PathVariable Long id) {
        merchantService.checkHotelOwnership(id);
        hotelService.submitAudit(id);
        return ResultVo.ok("上架申请已提交");
    }
}
