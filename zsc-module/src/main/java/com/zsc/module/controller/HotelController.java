package com.zsc.module.controller;

import com.zsc.common.annotation.Anonymous;
import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.HotelDTO;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.vo.HotCityVo;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;
import com.zsc.module.domain.vo.HotelSalesRankVO;
import com.zsc.module.service.HotelService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * 酒店管理控制器
 *
 * @author zsc
 */
@Tag(name = "酒店管理")
@Validated
@RestController
@RequestMapping("/api/hotel")
public class HotelController {

    @Autowired
    private HotelService hotelService;

    // ==================== 前台推荐接口 ====================

    /**
     * 热门城市（按酒店数量排名）
     */
    @Anonymous
    @Operation(summary = "热门城市")
    @GetMapping("/hotCities")
    public ResultVo<List<HotCityVo>> hotCities() {
        List<HotCityVo> list = hotelService.getHotCities(12);
        return ResultVo.ok(list);
    }

    /**
     * 推荐酒店（按类型：recommend 推荐 / hot 热门 / luxury 高档 / budget 经济型）
     */
    @Anonymous
    @Operation(summary = "推荐酒店")
    @GetMapping("/recommend")
    public ResultVo<List<HotelListVO>> recommend(@RequestParam(defaultValue = "recommend") String type) {
        List<HotelListVO> list = hotelService.getRecommendHotels(10, type);
        return ResultVo.ok(list);
    }

    /**
     * 个性化推荐（根据用户历史偏好）
     */
    @Operation(summary = "个性化推荐")
    @GetMapping("/personalRecommend")
    public ResultVo<List<HotelListVO>> personalRecommend(@RequestParam(required = false) Long refresh) {
        Long userId = SecurityUtils.getUserId();
        List<HotelListVO> list = hotelService.getPersonalRecommend(userId, 10);
        // 如果传了 refresh 参数，随机打乱结果
        if (refresh != null && list != null) {
            java.util.Collections.shuffle(list);
        }
        return ResultVo.ok(list);
    }

    /**
     * 热销排行榜（按订单数排序）
     */
    @Anonymous
    @Operation(summary = "热销排行榜")
    @GetMapping("/hotSales")
    public ResultVo<List<HotelSalesRankVO>> hotSales() {
        List<HotelSalesRankVO> list = hotelService.getHotSalesRank(10);
        return ResultVo.ok(list);
    }

    // ==================== 增删改查接口 ====================

    /**
     * 获取酒店详情
     */
    @Operation(summary = "获取酒店详情")
    @PreAuthorize("@ss.hasPermi('biz:hotel:query')")
    @GetMapping("/{id:\\d+}")
    public ResultVo<HotelDetailVO> get(@PathVariable Long id) {
        HotelDetailVO vo = hotelService.getHotelDetail(id);
        return ResultVo.ok(vo);
    }

    /**
     * 新增酒店
     */
    @Operation(summary = "新增酒店")
    @PreAuthorize("@ss.hasPermi('biz:hotel:add')")
    @Log(title = "酒店管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo<Long> add(@Valid @RequestBody HotelDTO dto) {
        Long id = hotelService.addHotel(dto);
        return ResultVo.ok(id);
    }

    /**
     * 编辑酒店
     */
    @Operation(summary = "编辑酒店")
    @PreAuthorize("@ss.hasPermi('biz:hotel:edit')")
    @Log(title = "酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo<String> update(@Valid @RequestBody HotelDTO dto) {
        hotelService.updateHotel(dto);
        return ResultVo.ok("修改成功");
    }

    /**
     * 删除酒店
     */
    @Operation(summary = "删除酒店")
    @PreAuthorize("@ss.hasPermi('biz:hotel:remove')")
    @Log(title = "酒店管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo<String> delete(@PathVariable Long id) {
        hotelService.deleteHotel(id);
        return ResultVo.ok("删除成功");
    }

    // ==================== 状态管理接口 ====================

    /**
     * 修改酒店状态
     */
    @Operation(summary = "修改酒店状态")
    @PreAuthorize("@ss.hasPermi('biz:hotel:edit')")
    @Log(title = "酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/status/{status}")
    public ResultVo<String> updateStatus(@PathVariable Long id, @PathVariable String status) {
        hotelService.updateStatus(id, status);
        return ResultVo.ok("状态修改成功");
    }

    /**
     * 提交上架申请（草稿 → 待审核）
     */
    @Operation(summary = "提交上架申请")
    @PreAuthorize("@ss.hasPermi('biz:hotel:edit')")
    @Log(title = "酒店管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/submitAudit")
    public ResultVo<String> submitAudit(@PathVariable Long id) {
        hotelService.submitAudit(id);
        return ResultVo.ok("上架申请已提交");
    }

    // ==================== 查询接口 ====================

    /**
     * 后台管理列表接口
     */
    @Operation(summary = "查询酒店列表")
    @PreAuthorize("@ss.hasPermi('biz:hotel:list')")
    @PostMapping("/query")
    public ResultVo<PageResult<HotelListVO>> query(@RequestBody HotelQueryDto queryDto) {
        PageResult<HotelListVO> result = hotelService.queryHotels(queryDto);
        return ResultVo.ok(result);
    }

    /**
     * 酒店多维度搜索接口（前台用户）
     */
    @Anonymous
    @Operation(summary = "酒店多维度搜索")
    @PostMapping("/search")
    public ResultVo<PageResult<HotelListVO>> search(@RequestBody HotelSearchDTO searchDTO) {
        PageResult<HotelListVO> result = hotelService.searchHotels(searchDTO);
        return ResultVo.ok(result);
    }

    /**
     * 酒店详情查询接口
     */
    @Operation(summary = "查询酒店详情")
    @GetMapping("/detail/{id}")
    public ResultVo<HotelDetailVO> detail(@PathVariable Long id) {
        HotelDetailVO vo = hotelService.getHotelDetail(id);
        return ResultVo.ok(vo);
    }
}
