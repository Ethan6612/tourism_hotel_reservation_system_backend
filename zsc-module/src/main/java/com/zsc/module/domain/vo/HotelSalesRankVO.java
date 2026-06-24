package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 酒店热销排行 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HotelSalesRankVO {

    /** 酒店ID */
    private Long id;

    /** 酒店名称 */
    private String name;

    /** 酒店星级 */
    private Integer star;

    /** 酒店评分 */
    private BigDecimal score;

    /** 酒店图片 */
    private String imgUrl;

    /** 销量（订单数） */
    private Long salesCount;

    /** 最低房价 */
    private BigDecimal minPrice;
}
