package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.service.CommentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

/**
 * 评价控制器
 */
@Tag(name = "评价管理")
@Validated
@RestController
@RequestMapping("/api/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    /**
     * 查询评价列表
     */
    @Operation(summary = "查询评价列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Long roomId) {
        PageResult result = commentService.queryComments(pageNum, pageSize, hotelId, roomId);
        return success(result);
    }

    /**
     * 获取评价详情
     */
    @Operation(summary = "获取评价详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        Comment comment = commentService.getById(id);
        return success(comment);
    }

    /**
     * 添加评价
     */
    @Operation(summary = "添加评价")
    @PostMapping
    public AjaxResult add(@Valid @RequestBody CommentDto commentDto) {
        commentService.addComment(commentDto);
        return success();
    }

    /**
     * 回复评价
     */
    @Operation(summary = "回复评价")
    @PreAuthorize("@ss.hasPermi('comment:reply')")
    @Log(title = "评价管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/reply")
    public AjaxResult reply(@PathVariable Long id, @RequestParam String replyContent) {
        commentService.replyComment(id, replyContent);
        return success();
    }
}