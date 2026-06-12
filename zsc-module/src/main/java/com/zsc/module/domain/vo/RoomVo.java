package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 房型VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomVo {

    /**
     * 房型ID
     */
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
     * 状态名称
     */
    private String statusName;

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
     * 是否含早餐（0无早餐 1含早餐）
     */
    private String hasBreakfast;

    /**
     * 是否含早餐名称
     */
    private String hasBreakfastName;

    /**
     * 酒店名称
     */
    private String hotelName;
}
