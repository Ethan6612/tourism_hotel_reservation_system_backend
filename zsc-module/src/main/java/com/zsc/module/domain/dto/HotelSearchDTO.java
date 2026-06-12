package com.zsc.module.domain.dto;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 酒店多维度搜索专用DTO
 *
 * @author zsc
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class HotelSearchDTO extends BasePageReq {

    /**
     * 关键词搜索（酒店名称/地址）
     */
    private String keyword;

    /**
     * 地区/城市
     */
    private String region;

    /**
     * 酒店星级(1-5)
     */
    private Integer star;

    /**
     * 最低评分
     */
    private BigDecimal minScore;

    /**
     * 最低价格
     */
    private BigDecimal minPrice;

    /**
     * 最高价格
     */
    private BigDecimal maxPrice;

    /**
     * 酒店设施（模糊匹配）
     */
    private String facility;

    /**
     * 排序字段（score/price/star/create_time）
     */
    private String orderBy;

    /**
     * 排序方式（asc/desc）
     */
    private String orderDirection;

    /**
     * 获取完整排序SQL
     */
    public String getOrderByClause() {
        if (orderBy == null || orderBy.isEmpty()) {
            return "h.create_time DESC";
        }
        // 防止SQL注入，只允许白名单字段
        String safeColumn;
        switch (orderBy) {
            case "score":
                safeColumn = "h.score";
                break;
            case "price":
                safeColumn = "min_price";
                break;
            case "star":
                safeColumn = "h.star";
                break;
            case "createTime":
                safeColumn = "h.create_time";
                break;
            default:
                safeColumn = "h.create_time";
        }
        String direction = "asc".equalsIgnoreCase(orderDirection) ? "ASC" : "DESC";
        return safeColumn + " " + direction;
    }
}
