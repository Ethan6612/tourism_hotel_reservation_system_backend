package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商户信息VO（用于列表展示和详情）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MerchantVo {

    /**
     * 商户ID
     */
    private Long id;

    /**
     * 商户名称
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
     * 审核状态（0待审核 1审核通过 2审核驳回）
     */
    private String auditStatus;

    /**
     * 驳回原因（仅当auditStatus=2时有值）
     */
    private String rejectReason;

    /**
     * 提交审核时间
     */
    private Date submitTime;

    /**
     * 审核时间
     */
    private Date auditTime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 关联酒店数量（可扩展查询）
     */
    private Integer hotelCount;
}
