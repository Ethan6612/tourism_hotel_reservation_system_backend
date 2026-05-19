package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.RoomDto;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.mapper.RoomMapper;
import com.zsc.module.service.RoomService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 房源服务实现类
 */
@Service
@Transactional
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements RoomService {

    @Override
    public void addRoom(RoomDto roomDto) {
        Room room = new Room();
        BeanUtils.copyProperties(roomDto, room);
        room.setCreateTime(new Date());
        room.setUpdateTime(new Date());
        if (StringUtils.isBlank(room.getStatus())) {
            room.setStatus("0");
        }
        if (!this.save(room)) {
            throw new ServiceException("系统错误，房源添加失败！");
        }
    }

    @Override
    public void updateRoom(RoomDto roomDto) {
        Room room = new Room();
        BeanUtils.copyProperties(roomDto, room);
        room.setUpdateTime(new Date());
        if (!this.updateById(room)) {
            throw new ServiceException("系统错误，房源更新失败！");
        }
    }

    @Override
    public PageResult queryRooms(Integer pageNum, Integer pageSize, Long hotelId, String status) {
        Page<Room> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Room> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(hotelId != null, Room::getHotelId, hotelId)
                .eq(StringUtils.isNotBlank(status), Room::getStatus, status)
                .orderByDesc(Room::getCreateTime);
        Page<Room> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }
}