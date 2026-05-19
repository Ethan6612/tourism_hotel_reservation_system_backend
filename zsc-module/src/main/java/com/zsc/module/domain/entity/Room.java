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
 * 房源/房型实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("room")
public class Room {

    /**
     * 房源ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 酒店ID
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
     * 价格
     */
    private BigDecimal price;

    /**
     * 库存数量
     */
    private Integer stock;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

    /**
     * 图片URL
     */
    private String imgUrl;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}