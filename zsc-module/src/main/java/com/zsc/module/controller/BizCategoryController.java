package com.zsc.module.controller;

import com.zsc.common.annotation.Anonymous;
import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.BizCategoryDto;
import com.zsc.module.domain.dto.query.BizCategoryQueryDto;
import com.zsc.module.domain.vo.BizCategoryVo;
import com.zsc.module.service.BizCategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 业务类别控制器
 *
 * @author zsc
 */
@Tag(name = "业务类别管理")
@Validated
@RestController
@RequestMapping("/api/category")
public class BizCategoryController {

    @Autowired
    private BizCategoryService bizCategoryService;

    // ==================== 增删改查接口 ====================

    /**
     * 获取分类详情
     */
    @Operation(summary = "获取分类详情")
    @PreAuthorize("@ss.hasPermi('biz:category:query')")
    @GetMapping("/{categoryId}")
    public ResultVo<BizCategoryVo> get(@PathVariable Long categoryId) {
        BizCategoryVo vo = bizCategoryService.getCategoryDetail(categoryId);
        return ResultVo.ok(vo);
    }

    /**
     * 新增分类
     */
    @Operation(summary = "新增分类")
    @PreAuthorize("@ss.hasPermi('biz:category:add')")
    @Log(title = "业务类别管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo<String> add(@Valid @RequestBody BizCategoryDto dto) {
        bizCategoryService.addCategory(dto);
        return ResultVo.ok("新增成功");
    }

    /**
     * 编辑分类
     */
    @Operation(summary = "编辑分类")
    @PreAuthorize("@ss.hasPermi('biz:category:edit')")
    @Log(title = "业务类别管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo<String> update(@Valid @RequestBody BizCategoryDto dto) {
        bizCategoryService.updateCategory(dto);
        return ResultVo.ok("修改成功");
    }

    /**
     * 删除分类
     */
    @Operation(summary = "删除分类")
    @PreAuthorize("@ss.hasPermi('biz:category:remove')")
    @Log(title = "业务类别管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryId}")
    public ResultVo<String> delete(@PathVariable Long categoryId) {
        bizCategoryService.deleteCategory(categoryId);
        return ResultVo.ok("删除成功");
    }

    // ==================== 状态管理接口 ====================

    /**
     * 修改分类状态（启用/停用）
     */
    @Operation(summary = "修改分类状态")
    @PreAuthorize("@ss.hasPermi('biz:category:edit')")
    @Log(title = "业务类别管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{categoryId}/status/{status}")
    public ResultVo<String> updateStatus(@PathVariable Long categoryId, @PathVariable String status) {
        bizCategoryService.updateStatus(categoryId, status);
        return ResultVo.ok("状态修改成功");
    }

    // ==================== 查询接口 ====================

    /**
     * 后台分页查询分类列表
     */
    @Operation(summary = "查询分类列表")
    @PreAuthorize("@ss.hasPermi('biz:category:list')")
    @PostMapping("/query")
    public ResultVo<PageResult<BizCategoryVo>> query(@RequestBody BizCategoryQueryDto queryDto) {
        PageResult<BizCategoryVo> result = bizCategoryService.queryCategories(queryDto);
        return ResultVo.ok(result);
    }

    /**
     * 前端下拉数据源查询（只返回启用状态）
     */
    @Anonymous
    @Operation(summary = "下拉查询分类列表")
    @GetMapping("/select")
    public ResultVo<List<BizCategoryVo>> select() {
        List<BizCategoryVo> list = bizCategoryService.listForSelect();
        return ResultVo.ok(list);
    }
}
