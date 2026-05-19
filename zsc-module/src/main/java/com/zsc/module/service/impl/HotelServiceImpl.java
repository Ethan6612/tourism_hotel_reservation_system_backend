package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.service.HotelService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 酒店服务实现类
 */
@Service
@Transactional
public class HotelServiceImpl extends ServiceImpl<HotelMapper, Hotel> implements HotelService {

    @Override
    public void addHotel(HotelDto hotelDto) {
        Hotel hotel = new Hotel();
        BeanUtils.copyProperties(hotelDto, hotel);
        hotel.setCreateTime(new Date());
        hotel.setUpdateTime(new Date());
        if (StringUtils.isBlank(hotel.getStatus())) {
            hotel.setStatus("0");
        }
        if (!this.save(hotel)) {
            throw new ServiceException("系统错误，酒店添加失败！");
        }
    }

    @Override
    public void updateHotel(HotelDto hotelDto) {
        Hotel hotel = new Hotel();
        BeanUtils.copyProperties(hotelDto, hotel);
        hotel.setUpdateTime(new Date());
        if (!this.updateById(hotel)) {
            throw new ServiceException("系统错误，酒店更新失败！");
        }
    }

    @Override
    public PageResult queryHotels(Integer pageNum, Integer pageSize, String name, Integer star, String status) {
        Page<Hotel> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Hotel> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(name), Hotel::getName, name)
                .eq(star != null, Hotel::getStar, star)
                .eq(StringUtils.isNotBlank(status), Hotel::getStatus, status)
                .orderByDesc(Hotel::getCreateTime);
        Page<Hotel> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }
}