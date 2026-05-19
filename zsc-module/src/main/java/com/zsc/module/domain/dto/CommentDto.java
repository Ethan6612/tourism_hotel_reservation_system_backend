package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * 评价DTO
 */
@Data
public class CommentDto {

    private Long id;

    @NotNull(message = "用户ID不能为空")
    private Long userId;

    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    private Long roomId;

    @Min(value = 1, message = "评分最小为1")
    @Max(value = 5, message = "评分最大为5")
    private Integer score;

    @NotBlank(message = "评价内容不能为空")
    private String content;

    private String imgUrl;
}