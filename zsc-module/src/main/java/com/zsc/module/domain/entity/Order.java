package com.zsc.module.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * 订单实体类
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("orders")
public class Order {

    /** 订单状态：待支付 */
    public static final String STATUS_PENDING = "0";
    /** 订单状态：已支付 */
    public static final String STATUS_PAID = "1";
    /** 订单状态：已取消 */
    public static final String STATUS_CANCELLED = "2";
    /** 订单状态：已完成 */
    public static final String STATUS_COMPLETED = "3";
    /** 订单状态：退款中 */
    public static final String STATUS_REFUNDING = "4";
    /** 订单状态：已退款 */
    public static final String STATUS_REFUNDED = "5";
    /** 订单状态：退款驳回 */
    public static final String STATUS_REFUND_REJECTED = "6";
    /** 订单状态：已入住 */
    public static final String STATUS_CHECKED_IN = "7";

    /** 订单ID */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 订单号 */
    private String orderNo;

    /** 用户ID */
    private Long userId;

    /** 酒店ID */
    private Long hotelId;

    /** 房型ID */
    private Long roomId;

    /** 入住日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    /** 离店日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    /** 总价格 */
    private BigDecimal totalPrice;

    /** 订单状态（0待支付 1已支付 2已取消 3已完成 4退款中 5已退款 6退款驳回 7已入住） */
    private String status;

    /** 订单备注 */
    private String remark;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
}
