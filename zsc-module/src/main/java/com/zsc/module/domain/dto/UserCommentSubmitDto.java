package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * 用户端评价提交DTO（userId从SecurityContext获取，无需传入）
 *
 * @author zsc
 */
@Data
public class UserCommentSubmitDto {

    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    /** 房型ID（可选） */
    private Long roomId;

    /** 订单ID（用于校验入住完成） */
    @NotNull(message = "订单ID不能为空")
    private Long orderId;

    @NotNull(message = "评分不能为空")
    @Min(value = 1, message = "评分最小为1")
    @Max(value = 5, message = "评分最大为5")
    private Integer score;

    @NotBlank(message = "评价内容不能为空")
    private String content;

    /** 评价图片，JSON数组格式 */
    private String images;

    /** 单张图片URL（兼容） */
    private String imgUrl;

    /** 是否匿名评价（0=否 1=是） */
    private String isAnonymous;
}
