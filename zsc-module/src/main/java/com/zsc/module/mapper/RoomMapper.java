package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.Room;
import org.apache.ibatis.annotations.Mapper;

/**
 * 房源 Mapper 接口
 */
@Mapper
public interface RoomMapper extends BaseMapper<Room> {

}