package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.ScoreStatisticsDto;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;
import com.zsc.module.service.CommentService;
import com.zsc.module.service.MerchantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户端评价控制器
 *
 * @author zsc
 */
@Tag(name = "商户评价管理")
@Validated
@RestController
@RequestMapping("/api/merchant/comment")
public class MerchantCommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private MerchantService merchantService;

    /**
     * 查询商户下酒店的评价列表
     */
    @Operation(summary = "查询商户评价列表")
    @GetMapping("/list")
    public AjaxResult list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long hotelId,
            @RequestParam(required = false) Integer score,
            @RequestParam(required = false) String keyword) {
        CommentQueryDto queryDto = new CommentQueryDto();
        queryDto.setPageNum(pageNum);
        queryDto.setPageSize(pageSize);
        queryDto.setHotelId(hotelId);
        queryDto.setScore(score);
        queryDto.setKeyword(keyword);
        PageResult<CommentVo> result = commentService.queryMerchantComments(queryDto);
        return success(result);
    }

    /**
     * 商家回复评价
     */
    @Operation(summary = "商家回复评价")
    @PutMapping("/{id}/reply")
    @Log(title = "商户评价管理", businessType = BusinessType.UPDATE)
    public AjaxResult reply(
            @PathVariable Long id,
            @RequestParam String replyContent) {
        commentService.replyComment(id, replyContent);
        return success("回复成功！");
    }

    /**
     * 商家申诉评价
     */
    @Operation(summary = "申诉评价")
    @PutMapping("/{id}/appeal")
    @Log(title = "商户评价管理", businessType = BusinessType.UPDATE)
    public AjaxResult appeal(
            @PathVariable Long id,
            @RequestParam String reason) {
        commentService.appealComment(id, reason);
        return success("申诉已提交，等待管理员审核！");
    }

    /**
     * 获取评价详情（需校验所属权）
     */
    @Operation(summary = "获取评价详情")
    @GetMapping("/{id}")
    public AjaxResult getDetail(@PathVariable Long id) {
        CommentVo vo = commentService.getCommentDetail(id);
        if (vo == null) {
            return error("评价不存在");
        }
        // 校验该评价是否属于商户的酒店
        if (vo.getHotelId() != null) {
            merchantService.checkHotelOwnership(vo.getHotelId());
        }
        return success(vo);
    }

    /**
     * 获取商户评价统计（旗下所有酒店的评分概览）
     */
    @Operation(summary = "获取商户评价统计")
    @GetMapping("/statistics")
    public AjaxResult getStatistics() {
        List<Long> hotelIds = merchantService.getCurrentMerchantHotelIds();
        if (hotelIds.isEmpty()) {
            return success(ScoreStatisticsVo.builder()
                    .averageScore(java.math.BigDecimal.ZERO)
                    .totalComments(0L)
                    .build());
        }
        List<ScoreStatisticsVo> scoreList = commentService.getHotelsAverageScore(hotelIds);
        return success(scoreList);
    }

    /**
     * 获取指定酒店的评价统计
     */
    @Operation(summary = "获取指定酒店的评价统计")
    @GetMapping("/statistics/hotel/{hotelId}")
    public AjaxResult getHotelStatistics(@PathVariable Long hotelId) {
        merchantService.checkHotelOwnership(hotelId);
        ScoreStatisticsVo statistics = commentService.getHotelScoreDistribution(hotelId);
        return success(statistics);
    }
}
