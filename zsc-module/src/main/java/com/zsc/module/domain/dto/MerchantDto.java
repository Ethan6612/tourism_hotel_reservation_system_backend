package com.zsc.module.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 商户信息DTO（用于新增/修改商户）
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MerchantDto {

    /**
     * 商户ID（修改时必传）
     */
    private Long id;

    /**
     * 商户名称（店铺名）
     */
    @NotBlank(message = "商户名称不能为空")
    private String merchantName;

    /**
     * 营业执照号
     */
    @NotBlank(message = "营业执照号不能为空")
    private String licenseNo;

    /**
     * 法人姓名
     */
    @NotBlank(message = "法人姓名不能为空")
    private String legalPerson;

    /**
     * 联系电话
     */
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    private String phone;

    /**
     * 邮箱
     */
    @Email(message = "邮箱格式不正确")
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
}
