package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.RoomQueryDto;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.domain.vo.RoomVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 房型表 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface RoomMapper extends BaseMapper<Room> {

    /**
     * 分页查询房型列表
     */
    Page<RoomVo> selectRoomVoPage(Page<RoomVo> page, @Param("query") RoomQueryDto query);

    /**
     * 查询房型详情
     */
    RoomVo selectRoomVoById(@Param("id") Long id);

    /**
     * 按酒店ID查询房型列表
     */
    Page<RoomVo> selectRoomVoByHotelId(Page<RoomVo> page, @Param("hotelId") Long hotelId);

    /**
     * 统计房型数量
     */
    Long countRooms(@Param("query") RoomQueryDto query);

    /**
     * 检查酒店下是否有未删除的房型
     */
    Long countActiveRoomsByHotelId(@Param("hotelId") Long hotelId);
}
