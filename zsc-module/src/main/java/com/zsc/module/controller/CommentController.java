package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.dto.ScoreStatisticsDto;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;
import com.zsc.module.service.CommentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import java.util.List;

/**
 * 评价控制器
 *
 * @author zsc
 */
@Tag(name = "评价管理")
@Validated
@RestController
@RequestMapping("/api/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    // ==================== 查询接口 ====================

    /**
     * 查询评价列表（基础分页查询）
     */
    @Operation(summary = "查询评价列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Long roomId,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) Integer score,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String orderBy) {
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setHotelId(hotelId);
        queryDto.setRoomId(roomId);
        queryDto.setUserId(userId);
        queryDto.setScore(score);
        queryDto.setKeyword(keyword);
        queryDto.setOrderBy(orderBy);
        PageResult<CommentVo> result = commentService.queryCommentsWithUserInfo(queryDto);
        return success(result);
    }

    /**
     * 查询评价列表（带用户、酒店、房型信息）
     */
    @Operation(summary = "查询评价列表（带用户、酒店、房型信息）")
    @GetMapping("/listWithUserInfo")
    public AjaxResult listWithUserInfo(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Long roomId,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) Integer score,
            @RequestParam(required = false) Integer minScore,
            @RequestParam(required = false) Integer maxScore,
            @RequestParam(required = false) Boolean hasReply,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime,
            @RequestParam(required = false) String orderBy) {
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setHotelId(hotelId);
        queryDto.setRoomId(roomId);
        queryDto.setUserId(userId);
        queryDto.setScore(score);
        queryDto.setMinScore(minScore);
        queryDto.setMaxScore(maxScore);
        queryDto.setHasReply(hasReply);
        queryDto.setKeyword(keyword);
        queryDto.setBeginTime(beginTime);
        queryDto.setEndTime(endTime);
        queryDto.setOrderBy(orderBy);
        PageResult<CommentVo> result = commentService.queryCommentsWithUserInfo(queryDto);
        return success(result);
    }

    /**
     * 查询我的评价列表
     */
    @Operation(summary = "查询我的评价列表")
    @GetMapping("/my")
    public AjaxResult myComments(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize) {
        PageResult<CommentVo> result = commentService.queryMyComments(pageNum, pageSize);
        return success(result);
    }

    /**
     * 获取评价详情
     */
    @Operation(summary = "获取评价详情")
    @GetMapping("/{id}")
    public AjaxResult get(@PathVariable Long id) {
        CommentVo vo = commentService.getCommentDetail(id);
        return success(vo);
    }

    // ==================== 新增接口 ====================

    /**
     * 添加评价
     */
    @Operation(summary = "添加评价（需入住完成后才可评价）")
    @PostMapping
    @PreAuthorize("@ss.hasPermi('comment:add')")
    @Log(title = "评价管理", businessType = BusinessType.INSERT)
    public AjaxResult add(@Valid @RequestBody CommentDto commentDto) {
        commentService.addComment(commentDto);
        return success("评价提交成功！");
    }

    // ==================== 回复接口 ====================

    /**
     * 回复评价（商家/管理员）
     */
    @Operation(summary = "回复评价")
    @PreAuthorize("@ss.hasPermi('comment:reply')")
    @Log(title = "评价管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/reply")
    public AjaxResult reply(
            @PathVariable Long id,
            @RequestParam @jakarta.validation.constraints.NotBlank(message = "回复内容不能为空") String replyContent) {
        commentService.replyComment(id, replyContent);
        return success("回复成功！");
    }

    // ==================== 删除接口 ====================

    /**
     * 删除评价
     */
    @Operation(summary = "删除评价")
    @PreAuthorize("@ss.hasPermi('comment:remove')")
    @Log(title = "评价管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        commentService.deleteComment(id);
        return success("删除成功！");
    }

    /**
     * 批量删除评价（管理员）
     */
    @Operation(summary = "批量删除评价")
    @PreAuthorize("@ss.hasPermi('comment:remove')")
    @Log(title = "评价管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/batch")
    public AjaxResult batchRemove(@RequestBody @NotEmpty(message = "请选择要删除的评价") List<Long> ids) {
        commentService.batchDeleteComments(ids);
        return success("批量删除成功！");
    }

    // ==================== 统计接口 ====================

    /**
     * 获取评分统计
     */
    @Operation(summary = "获取评分统计")
    @GetMapping("/statistics")
    public AjaxResult getStatistics(
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Long roomId,
            @RequestParam(required = false) String beginTime,
            @RequestParam(required = false) String endTime) {
        ScoreStatisticsDto dto = new ScoreStatisticsDto();
        dto.setHotelId(hotelId);
        dto.setRoomId(roomId);
        dto.setBeginTime(beginTime);
        dto.setEndTime(endTime);
        ScoreStatisticsVo statistics = commentService.getScoreStatistics(dto);
        return success(statistics);
    }

    /**
     * 获取酒店评分分布（含各星级数量统计）
     */
    @Operation(summary = "获取酒店评分分布统计")
    @GetMapping("/statistics/hotel/{hotelId}")
    public AjaxResult getHotelDistribution(@PathVariable Long hotelId) {
        ScoreStatisticsVo statistics = commentService.getHotelScoreDistribution(hotelId);
        return success(statistics);
    }

    /**
     * 批量获取酒店平均评分
     */
    @Operation(summary = "批量获取酒店平均评分")
    @PostMapping("/statistics/hotels")
    public AjaxResult getHotelsAverageScore(@RequestBody List<Long> hotelIds) {
        List<ScoreStatisticsVo> list = commentService.getHotelsAverageScore(hotelIds);
        return success(list);
    }

    // ==================== 互动接口 ====================

    /**
     * 点赞评价
     */
    @Operation(summary = "点赞评价")
    @PostMapping("/{id}/like")
    public AjaxResult like(@PathVariable Long id) {
        commentService.likeComment(id);
        return success("点赞成功！");
    }

    /**
     * 取消点赞
     */
    @Operation(summary = "取消点赞")
    @PostMapping("/{id}/unlike")
    public AjaxResult unlike(@PathVariable Long id) {
        commentService.unlikeComment(id);
        return success("取消点赞成功！");
    }

    // ==================== 审核接口 ====================

    /**
     * 审核评价（管理员：通过/拒绝）
     */
    @Operation(summary = "审核评价")
    @PreAuthorize("@ss.hasPermi('comment:audit')")
    @Log(title = "评价管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/audit")
    public AjaxResult audit(
            @PathVariable Long id,
            @RequestParam @jakarta.validation.constraints.Pattern(regexp = "[12]", message = "审核状态只能为1(通过)或2(拒绝)") String status) {
        commentService.auditComment(id, status);
        return success(status.equals("1") ? "审核通过！" : "已拒绝该评价！");
    }

    // ==================== 校验接口 ====================

    /**
     * 检查用户是否可以对订单进行评价
     */
    @Operation(summary = "检查是否可以评价")
    @GetMapping("/canComment")
    public AjaxResult canComment(
            @RequestParam Long userId,
            @RequestParam Long orderId) {
        boolean canComment = commentService.canComment(userId, orderId);
        return success(canComment ? "可以评价" : "不可评价");
    }

    // ==================== 按酒店维度查询 ====================

    /**
     * 按酒店分组查询评价列表（管理端左侧酒店列表）
     */
    @Operation(summary = "按酒店分组查询评价")
    @GetMapping("/groupByHotel")
    public AjaxResult groupByHotel(
            @RequestParam(required = false) String keyword) {
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setKeyword(keyword);
        List<CommentVo> list = commentService.queryCommentGroupByHotel(queryDto);
        return success(list);
    }

    /**
     * 查询指定酒店的所有评价
     */
    @Operation(summary = "查询指定酒店的评价列表")
    @GetMapping("/byHotel/{hotelId}")
    public AjaxResult listByHotel(
            @PathVariable Long hotelId,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Integer score,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String keyword) {
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setHotelId(hotelId);
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setScore(score);
        queryDto.setStatus(status);
        queryDto.setKeyword(keyword);
        PageResult<CommentVo> result = commentService.queryCommentsWithUserInfo(queryDto);
        return success(result);
    }

    // ==================== 申诉审核接口 ====================

    /**
     * 审核申诉（管理员）
     * @param appealStatus 2=申诉通过 3=申诉驳回
     */
    @Operation(summary = "审核申诉")
    @PreAuthorize("@ss.hasPermi('comment:audit')")
    @Log(title = "申诉审核", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/auditAppeal")
    public AjaxResult auditAppeal(
            @PathVariable Long id,
            @RequestParam @jakarta.validation.constraints.Pattern(regexp = "[23]", message = "申诉审核状态只能为2(通过)或3(驳回)") String appealStatus,
            @RequestParam(required = false) String remark) {
        commentService.auditAppeal(id, appealStatus, remark);
        return success(appealStatus.equals("2") ? "申诉通过，评价已保留！" : "申诉驳回，评价已撤销！");
    }
}

