package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 房型新增/编辑/价格库存操作DTO
 *
 * @author zsc
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoomDTO {

    /**
     * 房型ID（编辑时必填）
     */
    private Long id;

    /**
     * 关联酒店ID
     */
    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    /**
     * 房型名称
     */
    @NotBlank(message = "房型名称不能为空")
    @Size(max = 50, message = "房型名称不能超过50个字符")
    private String roomType;

    /**
     * 房间面积
     */
    @Size(max = 50, message = "房间面积不能超过50个字符")
    private String area;

    /**
     * 床型
     */
    @Size(max = 50, message = "床型不能超过50个字符")
    private String bedType;

    /**
     * 价格（元/晚）
     */
    @NotNull(message = "价格不能为空")
    @Positive(message = "价格必须大于0")
    private BigDecimal price;

    /**
     * 库存数量
     */
    @NotNull(message = "库存数量不能为空")
    private Integer stock;

    /**
     * 房型状态（0上架 1下架）
     */
    private String status;

    /**
     * 房型图片URL
     */
    private String imgUrl;

    /**
     * 可入住人数
     */
    private Integer guestNum;

    /**
     * 是否含早餐（0无早餐 1含早餐）
     */
    private String hasBreakfast;
}
