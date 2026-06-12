package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 房型查询DTO
 *
 * @author zsc
 */
@Data
public class RoomQueryDto extends BasePageReq {

    /**
     * 关联酒店ID
     */
    private Long hotelId;

    /**
     * 房型名称
     */
    private String roomType;

    /**
     * 房型状态（0上架 1下架）
     */
    private String status;

    /**
     * 最低价格
     */
    private BigDecimal minPrice;

    /**
     * 最高价格
     */
    private BigDecimal maxPrice;

    /**
     * 关键词搜索（房型名称）
     */
    private String keyword;

    /**
     * 排序字段
     */
    private String orderBy;
}
