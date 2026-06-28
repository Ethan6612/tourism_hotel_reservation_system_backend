package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 支付记录展示 VO
 *
 * @author zsc
 */
@Data
public class PaymentVo {

    private Long id;
    private Long orderId;
    private BigDecimal payAmount;
    private String payType;
    private String payStatus;
    private String transactionId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    // === 关联字段 ===

    /** 订单号（关联 orders） */
    private String orderNo;

    /** 用户名（关联 sys_user，通过 orders） */
    private String userName;

    /** 酒店名称（关联 hotel，通过 orders） */
    private String hotelName;

    // === 计算属性 ===

    public String getPayStatusName() {
        if (payStatus == null) return "未知";
        switch (payStatus) {
            case "0": return "待支付";
            case "1": return "已支付";
            case "2": return "支付失败";
            case "3": return "退款中";
            case "4": return "已退款";
            default: return "未知";
        }
    }

    public String getPayTypeName() {
        if (payType == null) return "未知";
        switch (payType) {
            case "1": return "微信支付";
            default: return "其它";
        }
    }
}
