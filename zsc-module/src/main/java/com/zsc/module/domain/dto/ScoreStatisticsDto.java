package com.zsc.module.domain.dto;

import lombok.Data;

/**
 * 评分统计查询DTO
 *
 * @author zsc
 */
@Data
public class ScoreStatisticsDto {

    /** 酒店ID */
    private Long hotelId;

    /** 房型ID */
    private Long roomId;

    /** 开始时间 */
    private String beginTime;

    /** 结束时间 */
    private String endTime;
}
