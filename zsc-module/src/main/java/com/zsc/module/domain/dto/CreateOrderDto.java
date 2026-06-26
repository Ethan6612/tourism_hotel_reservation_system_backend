package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 创建订单请求 DTO
 */
@Data
public class CreateOrderDto {

    @NotNull(message = "酒店ID不能为空")
    private Long hotelId;

    @NotNull(message = "房型ID不能为空")
    private Long roomId;

    @NotNull(message = "入住日期不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    @NotNull(message = "离店日期不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    /** 入住人数 */
    private Integer guests;
}
