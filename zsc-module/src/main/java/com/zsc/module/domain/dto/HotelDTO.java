package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 酒店新增/编辑DTO
 *
 * @author zsc
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HotelDTO {

    /**
     * 酒店ID（编辑时必填）
     */
    private Long id;

    /**
     * 酒店名称
     */
    @NotBlank(message = "酒店名称不能为空")
    @Size(max = 100, message = "酒店名称不能超过100个字符")
    private String name;

    /**
     * 酒店地址
     */
    @NotBlank(message = "酒店地址不能为空")
    @Size(max = 255, message = "酒店地址不能超过255个字符")
    private String address;

    /**
     * 酒店星级(1-5)
     */
    @NotNull(message = "酒店星级不能为空")
    private Integer star;

    /**
     * 酒店图片URL
     */
    private String imgUrl;

    /**
     * 酒店设施（逗号分隔）
     */
    private String facility;

    /**
     * 关联商户ID
     */
    private Long businessId;

    /**
     * 酒店状态（0营业中 1草稿 2待审核 3已下架 4已冻结）
     */
    private String status;

    /**
     * 酒店联系电话
     */
    @Size(max = 20, message = "联系电话不能超过20个字符")
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
}
