package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 评价展示VO
 *
 * @author zsc
 */
@Data
public class CommentVo {

    /** 评价ID */
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String userName;

    /** 用户头像 */
    private String userAvatar;

    /** 酒店ID */
    private Long hotelId;

    /** 酒店名称 */
    private String hotelName;

    /** 酒店星级 */
    private Integer hotelStar;

    /** 房型ID */
    private Long roomId;

    /** 房型名称 */
    private String roomType;

    /** 订单ID */
    private Long orderId;

    /** 订单编号 */
    private String orderNo;

    /** 评分（1-5星） */
    private Integer score;

    /** 评价内容 */
    private String content;

    /** 评价图片列表 */
    private List<String> imageList;

    /** 原始图片JSON（兼容） */
    private String images;

    /** 单张图片URL（兼容旧前端） */
    private String imgUrl;

    /** 是否匿名（0=否 1=是） */
    private String isAnonymous;

    /** 评价状态（0=待审核 1=已发布 2=已拒绝） */
    private String status;

    /** 点赞数 */
    private Integer likeCount;

    /** 回复内容 */
    private String replyContent;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date replyTime;

    /** 回复人ID */
    private Long replyBy;

    /** 回复人名称 */
    private String replyByName;

    /** 创建者 */
    private String createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /** 备注 */
    private String remark;

    /** 申诉理由 */
    private String appealReason;

    /** 申诉时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date appealTime;

    /** 申诉状态（0=无申诉 1=申诉中 2=申诉通过 3=申诉驳回） */
    private String appealStatus;

    /**
     * 获取平均分（用于统计展示，保留一位小数）
     */
    private BigDecimal averageScore;

    /**
     * 评价总数（用于统计展示）
     */
    private Long totalComments;
}
