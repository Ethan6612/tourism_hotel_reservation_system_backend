package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.vo.HotCityVo;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;
import com.zsc.module.domain.vo.HotelSalesRankVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 查询热门城市（按酒店数量排序）
     */
    List<HotCityVo> selectHotCities(@Param("limit") int limit);

    /**
     * 查询推荐酒店（按类型：recommend / hot / luxury / budget）
     */
    List<HotelListVO> selectRecommendHotels(@Param("limit") int limit, @Param("type") String type);

    /**
     * 查询个性化推荐酒店（根据用户历史订单的偏好）
     */
    List<HotelListVO> selectPersonalRecommend(@Param("userId") Long userId, @Param("limit") int limit);

    /**
     * 查询热销排行榜（按订单数排序）
     */
    List<HotelSalesRankVO> selectHotSalesRank(@Param("limit") int limit);
}
