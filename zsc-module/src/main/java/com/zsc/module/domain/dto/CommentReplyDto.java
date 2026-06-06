package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * 评价回复DTO
 *
 * @author zsc
 */
@Data
public class CommentReplyDto {

    @NotNull(message = "评价ID不能为空")
    private Long commentId;

    @NotBlank(message = "回复内容不能为空")
    private String replyContent;
}
