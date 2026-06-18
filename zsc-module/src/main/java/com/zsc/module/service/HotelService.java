package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDTO;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.vo.HotCityVo;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;

import java.util.List;

/**
 * 酒店表 服务类
 *
 * @author zsc
 */
public interface HotelService extends IService<Hotel> {

    /**
     * 新增酒店
     */
    Long addHotel(HotelDTO dto);

    /**
     * 编辑酒店
     */
    void updateHotel(HotelDTO dto);

    /**
     * 删除酒店（逻辑删除）
     */
    void deleteHotel(Long id);

    /**
     * 修改酒店状态
     */
    void updateStatus(Long id, String status);

    /**
     * 提交上架申请
     */
    void submitAudit(Long id);

    /**
     * 后台分页查询酒店列表
     */
    PageResult<HotelListVO> queryHotels(HotelQueryDto queryDto);

    /**
     * 查询酒店详情
     */
    HotelDetailVO getHotelDetail(Long id);

    /**
     * 多维度搜索酒店（前台用户）
     */
    PageResult<HotelListVO> searchHotels(HotelSearchDTO searchDTO);

    /**
     * 统计酒店数量
     */
    Long countHotels(HotelQueryDto queryDto);

    /**
     * 商户端分页查询自己的酒店列表
     *
     * @param queryDto 查询条件
     * @param businessId 商户ID（business_id）
     */
    PageResult<HotelListVO> queryMerchantHotels(HotelQueryDto queryDto, Long businessId);

    /**
     * 商户端新增酒店（自动绑定商户）
     *
     * @param dto 酒店信息
     * @param businessId 商户ID
     */
    Long addMerchantHotel(HotelDTO dto, Long businessId);

    /**
     * 商户端编辑酒店（校验所有权）
     *
     * @param dto 酒店信息
     * @param businessId 商户ID
     */
    void updateMerchantHotel(HotelDTO dto, Long businessId);

    /**
     * 获取热门城市列表
     *
     * @param limit 返回数量
     */
    List<HotCityVo> getHotCities(int limit);

    /**
     * 获取推荐酒店（高分高星）
     *
     * @param limit 返回数量
     */
    List<HotelListVO> getRecommendHotels(int limit);

    /**
     * 获取个性化推荐酒店（根据用户历史偏好）
     *
     * @param userId 用户ID
     * @param limit 返回数量
     */
    List<HotelListVO> getPersonalRecommend(Long userId, int limit);
}
