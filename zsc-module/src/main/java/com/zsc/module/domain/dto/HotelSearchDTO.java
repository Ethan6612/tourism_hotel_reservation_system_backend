package com.zsc.module.domain.dto;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
     * 酒店星级(1-5)，单个值
     */
    private Integer star;

    /**
     * 酒店星级列表（逗号分隔，如 "4,5" 表示4星和5星）
     */
    private String starList;

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
     * 酒店设施（逗号分隔的字符串，如 "WiFi,停车场"）
     */
    private String facility;

    /**
     * 酒店设施列表（由setFacility自动解析）
     */
    private List<String> facilityList;

    /**
     * 酒店类别ID
     */
    private Long categoryId;

    /**
     * 入住人数（筛选有足够可住人数且有库存的房型的酒店）
     */
    private Integer guests;

    /**
     * 设置设施字符串并自动解析为列表
     */
    public void setFacility(String facility) {
        this.facility = facility;
        if (facility != null && !facility.trim().isEmpty()) {
            this.facilityList = Arrays.stream(facility.split(","))
                    .map(String::trim)
                    .filter(f -> !f.isEmpty())
                    .collect(Collectors.toList());
        } else {
            this.facilityList = Collections.emptyList();
        }
    }

    /**
     * 获取星级列表（将逗号分隔的字符串转换为List）
     */
    public List<Integer> getStarValues() {
        if (starList != null && !starList.trim().isEmpty()) {
            return Arrays.stream(starList.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());
        }
        if (star != null) {
            return Collections.singletonList(star);
        }
        return Collections.emptyList();
    }

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
