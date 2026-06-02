package com.zsc.module.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商户实体类
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("merchant")
public class Merchant {

    /**
     * 商户ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 商户名称（店铺名）
     */
    private String merchantName;

    /**
     * 营业执照号
     */
    private String licenseNo;

    /**
     * 法人姓名
     */
    private String legalPerson;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 商户地址
     */
    private String address;

    /**
     * 经营范围
     */
    private String businessScope;

    /**
     * 商户LOGO图片URL
     */
    private String logoUrl;

    /**
     * 商户简介
     */
    private String description;

    /**
     * 商户状态（0正常 1冻结 2注销）
     */
    private String status;

    /**
     * 关联系统用户ID
     */
    private Long userId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}
