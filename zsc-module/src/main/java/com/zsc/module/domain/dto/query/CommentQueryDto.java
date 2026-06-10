package com.zsc.module.domain.dto.query;

import lombok.Data;

/**
 * 评价查询DTO
 *
 * @author zsc
 */
@Data
public class CommentQueryDto {

    /** 酒店ID */
    private Long hotelId;

    /** 房型ID */
    private Long roomId;

    /** 用户ID */
    private Long userId;

    /** 订单ID */
    private Long orderId;

    /** 评分（精确匹配） */
    private Integer score;

    /** 最低评分 */
    private Integer minScore;

    /** 最高评分 */
    private Integer maxScore;

    /** 评价状态（0=待审核 1=已发布 2=已拒绝） */
    private String status;

    /** 是否已回复 */
    private Boolean hasReply;

    /** 搜索关键词（评价内容模糊匹配） */
    private String keyword;

    /** 开始时间 */
    private String beginTime;

    /** 结束时间 */
    private String endTime;

    /** 申诉状态（0=无申诉 1=申诉中 2=申诉通过 3=申诉驳回） */
    private String appealStatus;

    /** 酒店名称（模糊搜索） */
    private String hotelName;

    /** 入住开始日期 */
    private String checkInDate;

    /** 入住结束日期 */
    private String checkOutDate;

    /** 排序方式：createTime=按时间 score=按评分 likeCount=按点赞数 */
    private String orderBy;

    /** 页码 */
    private Integer pageNum;

    /** 每页数量 */
    private Integer pageSize;
}
