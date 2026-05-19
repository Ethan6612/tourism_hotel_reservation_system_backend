package com.zsc.module.domain.dto;

import lombok.Data;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * 房源DTO
 */
@Data
public class RoomDto {

    private Long id;

    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    @NotBlank(message = "房型名称不能为空")
    private String roomType;

    private String area;

    private String bedType;

    @NotNull(message = "价格不能为空")
    private BigDecimal price;

    @NotNull(message = "库存不能为空")
    private Integer stock;

    private String status;

    private String imgUrl;
}