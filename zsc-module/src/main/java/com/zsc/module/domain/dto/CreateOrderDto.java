package com.zsc.module.domain.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 创建订单DTO
 *
 * @author zsc
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateOrderDto {

    /**
     * 酒店ID
     */
    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    /**
     * 房型ID
     */
    @NotNull(message = "房型ID不能为空")
    private Long roomId;

    /**
     * 入住日期
     */
    @NotNull(message = "入住日期不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    /**
     * 退房日期
     */
    @NotNull(message = "退房日期不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
}
