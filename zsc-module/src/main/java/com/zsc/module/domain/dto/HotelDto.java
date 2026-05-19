package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import java.math.BigDecimal;

/**
 * 酒店DTO
 */
@Data
public class HotelDto {

    private Long id;

    @NotBlank(message = "酒店名称不能为空")
    private String name;

    @NotBlank(message = "酒店地址不能为空")
    private String address;

    private Integer star;

    private BigDecimal score;

    private String imgUrl;

    private String facility;

    private Long businessId;

    private String status;
}