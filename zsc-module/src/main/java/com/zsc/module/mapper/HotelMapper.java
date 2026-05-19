package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.Hotel;
import org.apache.ibatis.annotations.Mapper;

/**
 * 酒店 Mapper 接口
 */
@Mapper
public interface HotelMapper extends BaseMapper<Hotel> {

}