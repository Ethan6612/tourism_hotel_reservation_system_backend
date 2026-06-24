package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 酒店审核VO（用于列表展示）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HotelAuditVo {

    /**
     * 审核ID
     */
    private Long id;

    /**
     * 酒店ID
     */
    private Long hotelId;

    /**
     * 酒店名称
     */
    private String hotelName;

    /**
     * 酒店地址
     */
    private String hotelAddress;

    /**
     * 酒店星级
     */
    private Integer hotelStar;

    /**
     * 商家ID
     */
    private Long businessId;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）
     */
    private String auditStatus;

    /**
     * 审核状态名称
     */
    private String auditStatusName;

    /**
     * 审核意见
     */
    private String auditOpinion;

    /**
     * 审核人ID
     */
    private Long auditorId;

    /**
     * 审核人姓名
     */
    private String auditorName;

    /**
     * 提交时间
     */
    private Date submitTime;

    /**
     * 审核时间
     */
    private Date auditTime;

    /**
     * 创建时间
     */
    private Date createTime;
}
