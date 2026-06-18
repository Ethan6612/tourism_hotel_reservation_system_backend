package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.RoomDTO;
import com.zsc.module.domain.dto.query.RoomQueryDto;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.domain.vo.RoomVo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 房型表 服务类
 *
 * @author zsc
 */
public interface RoomService extends IService<Room> {

    /**
     * 新增房型
     */
    Long addRoom(RoomDTO dto);

    /**
     * 编辑房型
     */
    void updateRoom(RoomDTO dto);

    /**
     * 删除房型（逻辑删除，需校验是否有未完成订单）
     */
    void deleteRoom(Long id);

    /**
     * 修改房型状态（上下架）
     */
    void updateStatus(Long id, String status);

    /**
     * 分页查询房型列表
     */
    PageResult<RoomVo> queryRooms(RoomQueryDto queryDto);

    /**
     * 查询房型详情
     */
    RoomVo getRoomDetail(Long id);

    /**
     * 按酒店ID查询房型列表（前台展示）
     */
    List<RoomVo> getRoomsByHotelId(Long hotelId);

    /**
     * 统计房型数量
     */
    Long countRooms(RoomQueryDto queryDto);

    /**
     * 检查酒店下是否有未删除的房型
     */
    boolean hasActiveRooms(Long hotelId);

    // ==================== 价格管理 ====================

    /**
     * 修改房型价格
     *
     * @param roomId 房型ID
     * @param price  新价格
     */
    void updatePrice(Long roomId, BigDecimal price);

    // ==================== 库存管理 ====================

    /**
     * 修改房型库存
     *
     * @param roomId 房型ID
     * @param stock  新库存数量
     */
    void updateStock(Long roomId, Integer stock);

    /**
     * 批量修改房型库存
     *
     * @param roomIdList 房型ID列表
     * @param stock      新库存数量
     */
    void batchUpdateStock(List<Long> roomIdList, Integer stock);

    /**
     * 库存预警查询（筛选低库存房型）
     *
     * @param threshold 库存阈值（默认为5）
     * @param hotelId   酒店ID（可选）
     * @return 低库存房型列表
     */
    List<RoomVo> getLowStockRooms(Integer threshold, Long hotelId);

    // ==================== 库存操作接口（对接订单模块） ====================

    /**
     * 锁定库存（下单时调用）
     *
     * @param roomId 房型ID
     * @param num    锁定数量
     * @return 是否锁定成功
     */
    boolean lockStock(Long roomId, Integer num);

    /**
     * 扣减库存（支付成功后调用）
     *
     * @param roomId 房型ID
     * @param num    扣减数量
     * @return 是否扣减成功
     */
    boolean deductStock(Long roomId, Integer num);

    /**
     * 释放库存（取消订单或退款时调用）
     *
     * @param roomId 房型ID
     * @param num    释放数量
     * @return 是否释放成功
     */
    boolean releaseStock(Long roomId, Integer num);

    /**
     * 商户端分页查询自己酒店下的房型列表
     *
     * @param queryDto 查询条件
     * @param hotelIds 商户拥有的酒店ID列表
     */
    PageResult<RoomVo> queryMerchantRooms(RoomQueryDto queryDto, List<Long> hotelIds);

    /**
     * 商户端统计自己酒店下的房型总数
     *
     * @param hotelIds 商户拥有的酒店ID列表
     */
    Long countMerchantRooms(List<Long> hotelIds);
}
