package com.zsc.module.domain.dto.query;

import lombok.Data;

/**
 * 订单查询 DTO
 *
 * @author zsc
 */
@Data
public class OrderQueryDto {

    private Integer pageNum = 1;
    private Integer pageSize = 10;

    /** 订单号 */
    private String orderNo;

    /** 用户ID */
    private Long userId;

    /** 酒店ID */
    private Long hotelId;

    /** 房型ID */
    private Long roomId;

    /** 订单状态 */
    private String status;

    /** 开始时间 */
    private String beginTime;

    /** 结束时间 */
    private String endTime;

    /** 关键词搜索 */
    private String keyword;

    /** 排序 */
    private String orderBy;
}
