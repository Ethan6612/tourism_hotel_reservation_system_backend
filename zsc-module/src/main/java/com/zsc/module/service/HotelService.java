package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDTO;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;

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
}
