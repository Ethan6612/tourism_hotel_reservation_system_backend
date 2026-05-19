package com.zsc.module.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 酒店实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("hotel")
public class Hotel {

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
     * 酒店星级
     */
    private Integer star;

    /**
     * 酒店评分
     */
    private BigDecimal score;

    /**
     * 酒店图片URL
     */
    private String imgUrl;

    /**
     * 酒店设施
     */
    private String facility;

    /**
     * 商家ID
     */
    private Long businessId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 状态（0正常 1停用）
     */
    private String status;
}