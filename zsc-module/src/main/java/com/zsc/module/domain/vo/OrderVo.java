package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单展示 VO
 *
 * @author zsc
 */
@Data
public class OrderVo {

    private Long id;
    private String orderNo;
    private Long userId;
    private Long hotelId;
    private Long roomId;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    private BigDecimal totalPrice;
    private String status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    // === 关联字段 ===

    /** 用户名（关联 sys_user） */
    private String userName;

    /** 酒店名称（关联 hotel） */
    private String hotelName;

    /** 房型名称（关联 room） */
    private String roomType;

    // === 支付关联字段 ===

    /** 支付类型名称 */
    private String payTypeName;

    /** 交易号 */
    private String transactionId;

    /** 支付金额 */
    private BigDecimal payAmount;

    // === 计算属性 ===

    public String getStatusName() {
        if (status == null) return "未知";
        switch (status) {
            case "0": return "待支付";
            case "1": return "已支付";
            case "2": return "已取消";
            case "3": return "已完成";
            case "4": return "退款中";
            case "5": return "已退款";
            case "6": return "退款驳回";
            default: return "未知";
        }
    }
}
