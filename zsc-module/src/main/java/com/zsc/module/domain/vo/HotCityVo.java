package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 热门城市 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HotCityVo {

    /** 城市名称 */
    private String cityName;

    /** 酒店数量 */
    private Long hotelCount;
}
