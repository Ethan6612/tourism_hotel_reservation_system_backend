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
 * 房型表
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("room")
public class Room {

    /** 房型状态：上架 */
    public static final String STATUS_ONLINE = "0";
    /** 房型状态：下架 */
    public static final String STATUS_OFFLINE = "1";

    /**
     * 房型ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 关联酒店ID
     */
    private Long hotelId;

    /**
     * 房型名称
     */
    private String roomType;

    /**
     * 房间面积
     */
    private String area;

    /**
     * 床型
     */
    private String bedType;

    /**
     * 价格（元/晚）
     */
    private BigDecimal price;

    /**
     * 库存数量
     */
    private Integer stock;

    /**
     * 房型状态（0上架 1下架）
     */
    private String status;

    /**
     * 房型图片URL
     */
    private String imgUrl;

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
     * 可入住人数
     */
    private Integer guestNum;

    /**
     * 是否含早餐（不在数据库中，用于扩展）
     */
    @TableField(exist = false)
    private String hasBreakfast;
}
