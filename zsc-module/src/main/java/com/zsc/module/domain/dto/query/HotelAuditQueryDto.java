package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

/**
 * 酒店审核查询DTO（分页查询审核记录）
 */
@Data
public class HotelAuditQueryDto extends BasePageReq {

    /**
     * 酒店ID
     */
    private Long hotelId;

    /**
     * 酒店名称（模糊查询）
     */
    private String hotelName;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）
     */
    private String auditStatus;
}
