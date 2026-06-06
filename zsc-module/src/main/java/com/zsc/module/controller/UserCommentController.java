package com.zsc.module.controller;

import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.dto.UserCommentSubmitDto;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;
import com.zsc.module.service.CommentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户评价控制器（用户端个人评价管理）
 *
 * @author zsc
 */
@Tag(name = "用户评价管理")
@Validated
@RestController
@RequestMapping("/api/user/comment")
public class UserCommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    /**
     * 我的评价列表
     */
    @Operation(summary = "查询我的评价列表")
    @GetMapping("/list")
    public AjaxResult myComments(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize) {
        PageResult<CommentVo> result = commentService.queryMyComments(pageNum, pageSize);
        return success(result);
    }

    /**
     * 提交评价（用户端，userId自动从登录信息获取）
     */
    @Operation(summary = "用户提交评价")
    @PostMapping
    public AjaxResult submit(@Valid @RequestBody UserCommentSubmitDto submitDto) {
        // 转换为CommentDto，userId从SecurityContext获取，防止伪造
        CommentDto commentDto = new CommentDto();
        commentDto.setUserId(SecurityUtils.getUserId());
        commentDto.setHotelId(submitDto.getHotelId());
        commentDto.setRoomId(submitDto.getRoomId());
        commentDto.setOrderId(submitDto.getOrderId());
        commentDto.setScore(submitDto.getScore());
        commentDto.setContent(submitDto.getContent());
        commentDto.setImages(submitDto.getImages());
        commentDto.setImgUrl(submitDto.getImgUrl());
        commentDto.setIsAnonymous(submitDto.getIsAnonymous());
        commentService.addComment(commentDto);
        return success("评价提交成功，感谢您的反馈！");
    }

    /**
     * 删除我的评价
     */
    @Operation(summary = "删除我的评价")
    @DeleteMapping("/{id}")
    public AjaxResult delete(@PathVariable Long id) {
        commentService.deleteComment(id);
        return success("评价已删除！");
    }

    /**
     * 检查是否可以评价
     */
    @Operation(summary = "检查订单是否可评价")
    @GetMapping("/canComment/{orderId}")
    public AjaxResult canComment(@PathVariable Long orderId) {
        Long userId = SecurityUtils.getUserId();
        boolean canComment = commentService.canComment(userId, orderId);
        Map<String, Object> result = new HashMap<>();
        result.put("canComment", canComment);
        result.put("userId", userId);
        result.put("orderId", orderId);
        return success(result);
    }

    /**
     * 我的评价统计
     */
    @Operation(summary = "获取我的评价统计")
    @GetMapping("/statistics")
    public AjaxResult myStatistics() {
        Long userId = SecurityUtils.getUserId();
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setUserId(userId);
        queryDto.setPageNum(1);
        queryDto.setPageSize(1);
        PageResult<CommentVo> pageResult = commentService.queryCommentsWithUserInfo(queryDto);

        Map<String, Object> stats = new HashMap<>();
        stats.put("totalComments", pageResult.getTotal());
        stats.put("userId", userId);
        return success(stats);
    }

    /**
     * 查询指定酒店我的评价
     */
    @Operation(summary = "查询指定酒店我的评价")
    @GetMapping("/hotel/{hotelId}")
    public AjaxResult myHotelComment(@PathVariable Long hotelId) {
        Long userId = SecurityUtils.getUserId();
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setUserId(userId);
        queryDto.setHotelId(hotelId);
        queryDto.setPageNum(1);
        queryDto.setPageSize(1);
        PageResult<CommentVo> pageResult = commentService.queryCommentsWithUserInfo(queryDto);

        if (pageResult.getRows() != null && !pageResult.getRows().isEmpty()) {
            return success(pageResult.getRows().get(0));
        }
        return success(null);
    }
}
