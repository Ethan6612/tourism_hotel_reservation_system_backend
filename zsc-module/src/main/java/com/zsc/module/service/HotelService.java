package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDto;
import com.zsc.module.domain.entity.Hotel;

/**
 * 酒店服务接口
 */
public interface HotelService extends IService<Hotel> {

    /**
     * 添加酒店
     */
    void addHotel(HotelDto hotelDto);

    /**
     * 更新酒店
     */
    void updateHotel(HotelDto hotelDto);

    /**
     * 分页查询酒店列表
     */
    PageResult queryHotels(Integer pageNum, Integer pageSize, String name, Integer star, String status);
}