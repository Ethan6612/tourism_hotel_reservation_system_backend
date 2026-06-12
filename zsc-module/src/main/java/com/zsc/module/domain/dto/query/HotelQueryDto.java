package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

/**
 * 酒店查询DTO
 *
 * @author zsc
 */
@Data
public class HotelQueryDto extends BasePageReq {

    /**
     * 酒店名称
     */
    private String name;

    /**
     * 酒店状态（0营业中 1草稿 2待审核 3已下架 4已冻结）
     */
    private String status;

    /**
     * 酒店星级
     */
    private Integer star;

    /**
     * 关联商户ID
     */
    private Long businessId;

    /**
     * 关键词搜索（名称/地址）
     */
    private String keyword;

    /**
     * 排序字段
     */
    private String orderBy;
}
