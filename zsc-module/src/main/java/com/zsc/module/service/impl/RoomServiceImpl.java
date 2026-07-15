package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.RoomDTO;
import com.zsc.module.domain.dto.query.RoomQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.entity.Room;
import com.zsc.module.domain.enums.RoomStatusEnum;
import com.zsc.module.domain.vo.RoomVo;
import com.zsc.module.mapper.RoomMapper;
import com.zsc.module.service.HotelService;
import com.zsc.module.service.OrderService;
import com.zsc.module.service.RoomService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 房型表 服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements RoomService {

    /** 默认库存预警阈值 */
    private static final int DEFAULT_LOW_STOCK_THRESHOLD = 5;

    @Lazy
    @Autowired
    private HotelService hotelService;

    @Lazy
    @Autowired
    private OrderService orderService;

    /**
     * 新增房型
     */
    @Override
    public Long addRoom(RoomDTO dto) {
        // 参数校验
        validateRoomDTO(dto);

        // 校验酒店是否存在
        Hotel hotel = hotelService.getById(dto.getHotelId());
        if (hotel == null) {
            throw new ServiceException("关联的酒店不存在");
        }

        Room room = new Room();
        BeanUtils.copyProperties(dto, room);

        // 设置默认状态为上架
        if (StringUtils.isBlank(room.getStatus())) {
            room.setStatus(RoomStatusEnum.ONLINE.getValue());
        }
        room.setCreateTime(new Date());
        room.setUpdateTime(new Date());

        if (!this.save(room)) {
            throw new ServiceException("新增房型失败");
        }
        return room.getId();
    }

    /**
     * 编辑房型
     */
    @Override
    public void updateRoom(RoomDTO dto) {
        if (dto.getId() == null) {
            throw new ServiceException("房型ID不能为空");
        }

        // 参数校验
        validateRoomDTO(dto);

        // 检查房型是否存在
        Room existing = this.getById(dto.getId());
        if (existing == null) {
            throw new ServiceException("房型不存在");
        }

        // 校验酒店是否存在
        if (dto.getHotelId() != null) {
            Hotel hotel = hotelService.getById(dto.getHotelId());
            if (hotel == null) {
                throw new ServiceException("关联的酒店不存在");
            }
        }

        Room room = new Room();
        BeanUtils.copyProperties(dto, room);
        room.setUpdateTime(new Date());

        if (!this.updateById(room)) {
            throw new ServiceException("更新房型失败");
        }
    }

    /**
     * 删除房型（物理删除，校验是否有未完成订单）
     */
    @Override
    public void deleteRoom(Long id) {
        if (id == null) {
            throw new ServiceException("房型ID不能为空");
        }

        Room room = this.getById(id);
        if (room == null) {
            throw new ServiceException("房型不存在");
        }

        // 校验是否有未完成订单
        if (orderService.hasUnfinishedOrder(id)) {
            throw new ServiceException("该房型存在未完成订单，无法删除");
        }

        if (!this.removeById(id)) {
            throw new ServiceException("删除房型失败");
        }
    }

    /**
     * 修改房型状态（上下架）
     */
    @Override
    public void updateStatus(Long id, String status) {
        if (id == null) {
            throw new ServiceException("房型ID不能为空");
        }

        // 校验状态值
        RoomStatusEnum statusEnum = RoomStatusEnum.getByValue(status);
        if (statusEnum == null) {
            throw new ServiceException("无效的状态值");
        }

        Room room = this.getById(id);
        if (room == null) {
            throw new ServiceException("房型不存在");
        }

        room.setStatus(status);
        room.setUpdateTime(new Date());
        if (!this.updateById(room)) {
            throw new ServiceException("修改状态失败");
        }
    }

    /**
     * 分页查询房型列表
     */
    @Override
    public PageResult<RoomVo> queryRooms(RoomQueryDto queryDto) {
        Page<RoomVo> page = queryDto.convetToPage();
        Page<RoomVo> result = baseMapper.selectRoomVoPage(page, queryDto);

        // 设置状态名称
        if (result.getRecords() != null) {
            result.getRecords().forEach(this::fillStatusName);
        }

        return PageResult.fromPage(result);
    }

    /**
     * 查询房型详情
     */
    @Override
    public RoomVo getRoomDetail(Long id) {
        if (id == null) {
            throw new ServiceException("房型ID不能为空");
        }

        RoomVo roomVo = baseMapper.selectRoomVoById(id);
        if (roomVo == null) {
            throw new ServiceException("房型不存在");
        }
        fillStatusName(roomVo);
        return roomVo;
    }

    /**
     * 按酒店ID查询房型列表（前台展示，只展示上架状态）
     */
    @Override
    public List<RoomVo> getRoomsByHotelId(Long hotelId) {
        if (hotelId == null) {
            return List.of();
        }
        Page<RoomVo> page = new Page<>(1, Integer.MAX_VALUE);
        Page<RoomVo> result = baseMapper.selectRoomVoByHotelId(page, hotelId);
        List<RoomVo> list = result.getRecords();
        list.forEach(this::fillStatusName);
        return list;
    }

    /**
     * 统计房型数量
     */
    @Override
    public Long countRooms(RoomQueryDto queryDto) {
        return baseMapper.countRooms(queryDto);
    }

    /**
     * 检查酒店下是否有未删除的房型
     */
    @Override
    public boolean hasActiveRooms(Long hotelId) {
        if (hotelId == null) {
            return false;
        }
        Long count = baseMapper.countActiveRoomsByHotelId(hotelId);
        return count != null && count > 0;
    }

    // ==================== 价格管理 ====================

    /**
     * 修改房型价格
     */
    @Override
    public void updatePrice(Long roomId, BigDecimal price) {
        if (roomId == null) {
            throw new ServiceException("房型ID不能为空");
        }
        if (price == null) {
            throw new ServiceException("价格不能为空");
        }
        if (price.signum() <= 0) {
            throw new ServiceException("价格必须大于0");
        }

        Room room = this.getById(roomId);
        if (room == null) {
            throw new ServiceException("房型不存在");
        }

        room.setPrice(price);
        room.setUpdateTime(new Date());
        if (!this.updateById(room)) {
            throw new ServiceException("修改价格失败");
        }
    }

    // ==================== 库存管理 ====================

    /**
     * 修改房型库存
     */
    @Override
    public void updateStock(Long roomId, Integer stock) {
        if (roomId == null) {
            throw new ServiceException("房型ID不能为空");
        }
        if (stock == null) {
            throw new ServiceException("库存不能为空");
        }
        if (stock < 0) {
            throw new ServiceException("库存不能小于0");
        }

        Room room = this.getById(roomId);
        if (room == null) {
            throw new ServiceException("房型不存在");
        }

        room.setStock(stock);
        room.setUpdateTime(new Date());
        if (!this.updateById(room)) {
            throw new ServiceException("修改库存失败");
        }
    }

    /**
     * 批量修改房型库存
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchUpdateStock(List<Long> roomIdList, Integer stock) {
        if (roomIdList == null || roomIdList.isEmpty()) {
            throw new ServiceException("房型ID列表不能为空");
        }
        if (stock == null) {
            throw new ServiceException("库存不能为空");
        }
        if (stock < 0) {
            throw new ServiceException("库存不能小于0");
        }

        for (Long roomId : roomIdList) {
            Room room = this.getById(roomId);
            if (room == null) {
                throw new ServiceException("房型不存在，ID: " + roomId);
            }
            room.setStock(stock);
            room.setUpdateTime(new Date());
            if (!this.updateById(room)) {
                throw new ServiceException("批量修改库存失败，房型ID: " + roomId);
            }
        }
    }

    /**
     * 库存预警查询（筛选低库存房型）
     */
    @Override
    public List<RoomVo> getLowStockRooms(Integer threshold, Long hotelId) {
        if (threshold == null || threshold <= 0) {
            threshold = DEFAULT_LOW_STOCK_THRESHOLD;
        }
        LambdaQueryWrapper<Room> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Room::getStatus, RoomStatusEnum.ONLINE.getValue())
                .le(Room::getStock, threshold)
                .orderByAsc(Room::getStock);
        if (hotelId != null) {
            wrapper.eq(Room::getHotelId, hotelId);
        }
        List<Room> roomList = this.list(wrapper);
        return roomList.stream().map(room -> {
            RoomVo vo = RoomVo.builder()
                    .id(room.getId())
                    .hotelId(room.getHotelId())
                    .roomType(room.getRoomType())
                    .area(room.getArea())
                    .bedType(room.getBedType())
                    .price(room.getPrice())
                    .stock(room.getStock())
                    .status(room.getStatus())
                    .imgUrl(room.getImgUrl())
                    .guestNum(room.getGuestNum())
                    .hasBreakfast(room.getHasBreakfast())
                    .createTime(room.getCreateTime())
                    .updateTime(room.getUpdateTime())
                    .build();
            // 填充酒店名称
            if (room.getHotelId() != null) {
                Hotel hotel = hotelService.getById(room.getHotelId());
                if (hotel != null) {
                    vo.setHotelName(hotel.getName());
                }
            }
            fillStatusName(vo);
            return vo;
        }).collect(java.util.stream.Collectors.toList());
    }

    // ==================== 库存操作接口（对接订单模块） ====================

    /**
     * 锁定库存（下单时调用）
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean lockStock(Long roomId, Integer num) {
        if (roomId == null || num == null || num <= 0) {
            return false;
        }

        Room room = this.getById(roomId);
        if (room == null) {
            return false;
        }

        // 检查库存是否充足
        if (room.getStock() < num) {
            return false;
        }

        // 扣减库存
        room.setStock(room.getStock() - num);
        room.setUpdateTime(new Date());
        return this.updateById(room);
    }

    /**
     * 扣减库存（支付成功后调用，实际已锁定，此处可做确认记录）
     */
    @Override
    public boolean deductStock(Long roomId, Integer num) {
        // 库存在锁定时已扣减，此处可做业务确认
        if (roomId == null || num == null || num <= 0) {
            return false;
        }

        Room room = this.getById(roomId);
        if (room == null) {
            return false;
        }

        // 可在此处添加库存流水记录
        return true;
    }

    /**
     * 释放库存（取消订单或退款时调用）
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean releaseStock(Long roomId, Integer num) {
        if (roomId == null || num == null || num <= 0) {
            return false;
        }

        Room room = this.getById(roomId);
        if (room == null) {
            return false;
        }

        // 恢复库存
        room.setStock(room.getStock() + num);
        room.setUpdateTime(new Date());
        return this.updateById(room);
    }

    /**
     * 商户端分页查询自己酒店下的房型列表
     */
    @Override
    public PageResult<RoomVo> queryMerchantRooms(RoomQueryDto queryDto, List<Long> hotelIds) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            PageResult<RoomVo> emptyResult = new PageResult<>();
            emptyResult.setTotal(0L);
            emptyResult.setPageSize((long) queryDto.getPageSize());
            emptyResult.setCurrentPage((long) queryDto.getCurrent());
            emptyResult.setRows(List.of());
            return emptyResult;
        }
        Page<RoomVo> page = new Page<>(queryDto.getCurrent(), queryDto.getPageSize());
        Page<RoomVo> result = baseMapper.selectRoomVoPageByHotelIds(page, queryDto, hotelIds);
        List<RoomVo> records = result.getRecords();
        if (records != null) {
            records.forEach(this::fillStatusName);
        }
        return PageResult.fromPage(result);
    }

    /**
     * 商户端统计自己酒店下的房型总数
     */
    @Override
    public Long countMerchantRooms(List<Long> hotelIds) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            return 0L;
        }
        Long count = baseMapper.countRoomsByHotelIds(hotelIds);
        return count != null ? count : 0L;
    }

    // ==================== 私有方法 ====================

    /**
     * 校验房型DTO参数
     */
    private void validateRoomDTO(RoomDTO dto) {
        if (dto == null) {
            throw new ServiceException("参数不能为空");
        }

        // 酒店ID校验
        if (dto.getHotelId() == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        // 房型名称校验
        if (StringUtils.isBlank(dto.getRoomType())) {
            throw new ServiceException("房型名称不能为空");
        }
        if (dto.getRoomType().length() > 50) {
            throw new ServiceException("房型名称不能超过50个字符");
        }

        // 价格校验
        if (dto.getPrice() == null) {
            throw new ServiceException("价格不能为空");
        }
        if (dto.getPrice().signum() <= 0) {
            throw new ServiceException("价格必须大于0");
        }

        // 库存校验
        if (dto.getStock() == null) {
            throw new ServiceException("库存不能为空");
        }
        if (dto.getStock() < 0) {
            throw new ServiceException("库存不能小于0");
        }

        // 面积校验
        if (StringUtils.isNotBlank(dto.getArea()) && dto.getArea().length() > 50) {
            throw new ServiceException("房间面积不能超过50个字符");
        }

        // 床型校验
        if (StringUtils.isNotBlank(dto.getBedType()) && dto.getBedType().length() > 50) {
            throw new ServiceException("床型不能超过50个字符");
        }

        // 可入住人数校验
        if (dto.getGuestNum() != null && dto.getGuestNum() <= 0) {
            throw new ServiceException("可入住人数必须大于0");
        }
    }

    /**
     * 填充状态名称和早餐名称
     */
    private void fillStatusName(RoomVo roomVo) {
        if (roomVo == null) {
            return;
        }
        // 状态名称
        RoomStatusEnum statusEnum = RoomStatusEnum.getByValue(roomVo.getStatus());
        if (statusEnum != null) {
            roomVo.setStatusName(statusEnum.getLabel());
        }
        // 早餐名称
        if ("1".equals(roomVo.getHasBreakfast())) {
            roomVo.setHasBreakfastName("含早餐");
        } else {
            roomVo.setHasBreakfastName("不含早餐");
        }
    }
}
