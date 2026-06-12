package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 酒店表 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface HotelMapper extends BaseMapper<Hotel> {

    /**
     * 后台分页查询酒店列表
     */
    Page<HotelListVO> selectHotelListPage(Page<HotelListVO> page, @Param("query") HotelQueryDto query);

    /**
     * 查询酒店详情
     */
    HotelDetailVO selectHotelDetailById(@Param("id") Long id);

    /**
     * 多维度搜索酒店（前台用户）
     */
    Page<HotelListVO> selectHotelSearchPage(Page<HotelListVO> page, @Param("query") HotelSearchDTO query);

    /**
     * 统计酒店数量
     */
    Long countHotels(@Param("query") HotelQueryDto query);
}
