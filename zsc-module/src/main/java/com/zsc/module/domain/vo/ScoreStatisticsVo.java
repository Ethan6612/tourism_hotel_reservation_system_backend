package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 评分统计VO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ScoreStatisticsVo {

    private Long hotelId;

    private String hotelName;

    private Long roomId;

    private BigDecimal averageScore;

    private Long totalComments;

    private Long fiveStarCount;

    private Long fourStarCount;

    private Long threeStarCount;

    private Long twoStarCount;

    private Long oneStarCount;
}