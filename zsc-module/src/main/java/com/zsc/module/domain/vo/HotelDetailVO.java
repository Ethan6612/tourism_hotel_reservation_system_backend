package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 酒店详情完整对象（关联分类、房型数据）
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HotelDetailVO {

    /**
     * 酒店ID
     */
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
     * 酒店设施列表
     */
    private List<String> facilityList;

    /**
     * 关联商户ID
     */
    private Long businessId;

    /**
     * 商户名称
     */
    private String merchantName;

    /**
     * 酒店状态（0营业中 1草稿 2待审核 3已下架 4已冻结）
     */
    private String status;

    /**
     * 状态名称
     */
    private String statusName;

    /**
     * 酒店联系电话
     */
    private String phone;

    /**
     * 酒店简介
     */
    private String intro;

    /**
     * 经度
     */
    private BigDecimal longitude;

    /**
     * 纬度
     */
    private BigDecimal latitude;

    /**
     * 房型列表
     */
    private List<RoomVo> roomList;

    /**
     * 最低房型价格
     */
    private BigDecimal minPrice;

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
}
