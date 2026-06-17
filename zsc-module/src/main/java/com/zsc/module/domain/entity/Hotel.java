package com.zsc.module.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 酒店表
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("hotel")
public class Hotel {

    /** 酒店状态：营业中 */
    public static final String STATUS_OPEN = "0";
    /** 酒店状态：草稿 */
    public static final String STATUS_DRAFT = "1";
    /** 酒店状态：待审核 */
    public static final String STATUS_PENDING_AUDIT = "2";
    /** 酒店状态：已下架 */
    public static final String STATUS_OFFLINE = "3";
    /** 酒店状态：已冻结 */
    public static final String STATUS_FROZEN = "4";

    /**
     * 酒店ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 酒店名称
     */
    private String name;

    /**
     * 酒店地址
     */
    private String address;

    /**
     * 酒店星级(1-5)
     */
    private Integer star;

    /**
     * 酒店评分(0-5)
     */
    private BigDecimal score;

    /**
     * 酒店图片URL
     */
    private String imgUrl;

    /**
     * 酒店设施（逗号分隔）
     */
    private String facility;

    /**
     * 关联商户ID
     */
    private Long businessId;

    /**
     * 酒店状态（0营业中 1草稿 2待审核 3已下架 4已冻结）
     */
    private String status;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 酒店联系电话（不在数据库中，用于扩展）
     */
    @TableField(exist = false)
    private String phone;

    /**
     * 酒店简介（不在数据库中，用于扩展）
     */
    @TableField(exist = false)
    private String intro;

    /**
     * 经度（不在数据库中，用于扩展）
     */
    @TableField(exist = false)
    private BigDecimal longitude;

    /**
     * 纬度（不在数据库中，用于扩展）
     */
    @TableField(exist = false)
    private BigDecimal latitude;
}
