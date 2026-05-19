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
 * 支付实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("payment")
public class Payment {

    /**
     * 支付ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * 支付金额
     */
    private BigDecimal payAmount;

    /**
     * 支付类型（1微信 2支付宝 3银行卡）
     */
    private String payType;

    /**
     * 支付状态（0待支付 1已支付 2支付失败 3退款中 4已退款）
     */
    private String payStatus;

    /**
     * 支付时间
     */
    private Date payTime;

    /**
     * 交易号
     */
    private String transactionId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}