package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.RoomDto;
import com.zsc.module.domain.entity.Room;

/**
 * 房源服务接口
 */
public interface RoomService extends IService<Room> {

    /**
     * 添加房源
     */
    void addRoom(RoomDto roomDto);

    /**
     * 更新房源
     */
    void updateRoom(RoomDto roomDto);

    /**
     * 分页查询房源列表
     */
    PageResult queryRooms(Integer pageNum, Integer pageSize, Long hotelId, String status);
}