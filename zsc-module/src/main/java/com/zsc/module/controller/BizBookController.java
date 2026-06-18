package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.BizBookDto;
import com.zsc.module.domain.dto.query.BizBookQueryDto;
import com.zsc.module.domain.entity.BizBook;
import com.zsc.module.service.BizBookService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 图书信息控制器
 */
@Tag(name = "图书信息管理")
@Validated
@RestController
@RequestMapping("/api/book")
public class BizBookController {

    @Autowired
    private BizBookService bizBookService;

    /**
     * 获取指定ID的图书信息
     */
    @Operation(summary = "获取图书详情")
    @PreAuthorize("@ss.hasPermi('biz:book:query')")
    @GetMapping("/{id}")
    public ResultVo<BizBook> get(@PathVariable long id) {
        BizBook book = bizBookService.getById(id);
        return ResultVo.ok(book);
    }

    /**
     * 添加新的图书信息
     */
    @Operation(summary = "新增图书")
    @PreAuthorize("@ss.hasPermi('biz:book:add')")
    @Log(title = "图书信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo add(@Valid @RequestBody BizBookDto bookDto) {
        bizBookService.addBook(bookDto);
        return ResultVo.ok();
    }

    /**
     * 更新图书信息
     */
    @Operation(summary = "修改图书")
    @PreAuthorize("@ss.hasPermi('biz:book:edit')")
    @Log(title = "图书信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo update(@Valid @RequestBody BizBookDto bookDto) {
        bizBookService.updateBook(bookDto);
        return ResultVo.ok();
    }

    /**
     * 删除指定ID的图书
     */
    @Operation(summary = "删除图书")
    @PreAuthorize("@ss.hasPermi('biz:book:remove')")
    @Log(title = "图书信息管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo delete(@PathVariable @Min(value = 1, message = "图书ID不能小于1") long id) {
        return bizBookService.removeById(id)
                ? ResultVo.ok("删除成功")
                : ResultVo.fail("数据不存在，删除失败");
    }

    /**
     * 分页查询图书列表
     * 任务1：返回分类名称
     * 任务2：支持时间范围查询
     */
    @Operation(summary = "查询图书列表")
    @PreAuthorize("@ss.hasPermi('biz:book:list')")
    @PostMapping("/query")
    public ResultVo<PageResult> query(@RequestBody BizBookQueryDto queryDto) {
        return ResultVo.ok(bizBookService.queryBooks(queryDto));
    }
}
