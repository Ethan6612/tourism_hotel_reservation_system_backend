package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.service.CommentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
}
