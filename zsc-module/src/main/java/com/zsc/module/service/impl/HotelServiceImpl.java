package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.HotelDTO;
import com.zsc.module.domain.dto.HotelSearchDTO;
import com.zsc.module.domain.dto.query.HotelQueryDto;
import com.zsc.module.domain.entity.Hotel;
import com.zsc.module.domain.enums.HotelStatusEnum;
import com.zsc.module.domain.vo.HotelDetailVO;
import com.zsc.module.domain.vo.HotelListVO;
import com.zsc.module.domain.vo.RoomVo;
import com.zsc.module.mapper.HotelMapper;
import com.zsc.module.service.HotelService;
import com.zsc.module.service.RoomService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 酒店表 服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class HotelServiceImpl extends ServiceImpl<HotelMapper, Hotel> implements HotelService {

    @Lazy
    @Autowired
    private RoomService roomService;

    /**
     * 新增酒店
     */
    @Override
    public Long addHotel(HotelDTO dto) {
        // 参数校验
        validateHotelDTO(dto);

        Hotel hotel = new Hotel();
        BeanUtils.copyProperties(dto, hotel);

        // 设置默认状态为草稿
        if (StringUtils.isBlank(hotel.getStatus())) {
            hotel.setStatus(HotelStatusEnum.DRAFT.getValue());
        }
        hotel.setCreateTime(new Date());
        hotel.setUpdateTime(new Date());
        hotel.setDelFlag("0");

        if (!this.save(hotel)) {
            throw new ServiceException("新增酒店失败");
        }
        return hotel.getId();
    }

    /**
     * 编辑酒店
     */
    @Override
    public void updateHotel(HotelDTO dto) {
        if (dto.getId() == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        // 参数校验
        validateHotelDTO(dto);

        // 检查酒店是否存在
        Hotel existing = this.getById(dto.getId());
        if (existing == null) {
            throw new ServiceException("酒店不存在");
        }

        Hotel hotel = new Hotel();
        BeanUtils.copyProperties(dto, hotel);
        hotel.setUpdateTime(new Date());

        if (!this.updateById(hotel)) {
            throw new ServiceException("更新酒店失败");
        }
    }

    /**
     * 删除酒店（逻辑删除）
     */
    @Override
    public void deleteHotel(Long id) {
        if (id == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        Hotel hotel = this.getById(id);
        if (hotel == null) {
            throw new ServiceException("酒店不存在");
        }

        // 检查是否有未删除的房型
        if (roomService.hasActiveRooms(id)) {
            throw new ServiceException("该酒店下存在房型，请先删除房型");
        }

        hotel.setDelFlag("2");
        hotel.setUpdateTime(new Date());
        if (!this.updateById(hotel)) {
            throw new ServiceException("删除酒店失败");
        }
    }

    /**
     * 修改酒店状态（带状态流转校验）
     */
    @Override
    public void updateStatus(Long id, String status) {
        if (id == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        // 校验状态值
        HotelStatusEnum targetStatus = HotelStatusEnum.getByValue(status);
        if (targetStatus == null) {
            throw new ServiceException("无效的状态值");
        }

        Hotel hotel = this.getById(id);
        if (hotel == null) {
            throw new ServiceException("酒店不存在");
        }

        // 状态流转校验
        validateStatusTransition(hotel.getStatus(), status);

        hotel.setStatus(status);
        hotel.setUpdateTime(new Date());
        if (!this.updateById(hotel)) {
            throw new ServiceException("修改状态失败");
        }
    }

    /**
     * 提交上架申请（草稿 → 待审核）
     */
    @Override
    public void submitAudit(Long id) {
        if (id == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        Hotel hotel = this.getById(id);
        if (hotel == null) {
            throw new ServiceException("酒店不存在");
        }

        // 只有草稿状态才能提交审核
        if (!HotelStatusEnum.DRAFT.getValue().equals(hotel.getStatus())) {
            throw new ServiceException("只有草稿状态的酒店才能提交上架申请");
        }

        // 校验必填字段是否完整
        if (StringUtils.isBlank(hotel.getName())) {
            throw new ServiceException("酒店名称未填写，无法提交审核");
        }
        if (StringUtils.isBlank(hotel.getAddress())) {
            throw new ServiceException("酒店地址未填写，无法提交审核");
        }
        if (hotel.getStar() == null) {
            throw new ServiceException("酒店星级未填写，无法提交审核");
        }

        hotel.setStatus(HotelStatusEnum.PENDING_AUDIT.getValue());
        hotel.setUpdateTime(new Date());
        if (!this.updateById(hotel)) {
            throw new ServiceException("提交审核失败");
        }
    }

    /**
     * 后台分页查询酒店列表（全状态）
     */
    @Override
    public PageResult<HotelListVO> queryHotels(HotelQueryDto queryDto) {
        Page<HotelListVO> page = queryDto.convetToPage();
        Page<HotelListVO> result = baseMapper.selectHotelListPage(page, queryDto);

        // 填充状态名称
        if (result.getRecords() != null) {
            result.getRecords().forEach(this::fillStatusName);
        }

        return PageResult.fromPage(result);
    }

    /**
     * 查询酒店详情（联查分类、房型、价格、评分，组装HotelDetailVO）
     */
    @Override
    public HotelDetailVO getHotelDetail(Long id) {
        if (id == null) {
            throw new ServiceException("酒店ID不能为空");
        }

        // 查询酒店基本信息
        HotelDetailVO detail = baseMapper.selectHotelDetailById(id);
        if (detail == null) {
            throw new ServiceException("酒店不存在");
        }

        // 查询该酒店的房型列表
        List<RoomVo> roomList = roomService.getRoomsByHotelId(id);
        detail.setRoomList(roomList);

        // 计算最低价格
        if (roomList != null && !roomList.isEmpty()) {
            BigDecimal minPrice = roomList.stream()
                    .map(RoomVo::getPrice)
                    .filter(price -> price != null)
                    .min(BigDecimal::compareTo)
                    .orElse(null);
            detail.setMinPrice(minPrice);
        }

        // 处理设施列表
        if (StringUtils.isNotBlank(detail.getFacility())) {
            detail.setFacilityList(Arrays.asList(detail.getFacility().split(",")));
        }

        // 设置状态名称
        HotelStatusEnum statusEnum = HotelStatusEnum.getByValue(detail.getStatus());
        if (statusEnum != null) {
            detail.setStatusName(statusEnum.getLabel());
        }

        return detail;
    }

    /**
     * 多维度搜索酒店（前台用户，只展示营业中酒店）
     */
    @Override
    public PageResult<HotelListVO> searchHotels(HotelSearchDTO searchDTO) {
        // 参数合法性校验
        validateSearchDTO(searchDTO);

        Page<HotelListVO> page = searchDTO.convetToPage();
        Page<HotelListVO> result = baseMapper.selectHotelSearchPage(page, searchDTO);

        // 填充状态名称
        if (result.getRecords() != null) {
            result.getRecords().forEach(this::fillStatusName);
        }

        return PageResult.fromPage(result);
    }

    /**
     * 统计酒店数量
     */
    @Override
    public Long countHotels(HotelQueryDto queryDto) {
        return baseMapper.countHotels(queryDto);
    }

    // ==================== 私有方法 ====================

    /**
     * 校验酒店DTO参数
     */
    private void validateHotelDTO(HotelDTO dto) {
        if (dto == null) {
            throw new ServiceException("参数不能为空");
        }

        // 酒店名称校验
        if (StringUtils.isBlank(dto.getName())) {
            throw new ServiceException("酒店名称不能为空");
        }
        if (dto.getName().length() > 100) {
            throw new ServiceException("酒店名称不能超过100个字符");
        }

        // 酒店地址校验
        if (StringUtils.isBlank(dto.getAddress())) {
            throw new ServiceException("酒店地址不能为空");
        }
        if (dto.getAddress().length() > 255) {
            throw new ServiceException("酒店地址不能超过255个字符");
        }

        // 星级范围校验
        if (dto.getStar() == null) {
            throw new ServiceException("酒店星级不能为空");
        }
        if (dto.getStar() < 1 || dto.getStar() > 5) {
            throw new ServiceException("酒店星级必须在1-5之间");
        }

        // 联系电话校验
        if (StringUtils.isNotBlank(dto.getPhone()) && dto.getPhone().length() > 20) {
            throw new ServiceException("联系电话不能超过20个字符");
        }

        // 经纬度校验
        if (dto.getLongitude() != null) {
            if (dto.getLongitude().compareTo(new BigDecimal("-180")) < 0
                    || dto.getLongitude().compareTo(new BigDecimal("180")) > 0) {
                throw new ServiceException("经度必须在-180到180之间");
            }
        }
        if (dto.getLatitude() != null) {
            if (dto.getLatitude().compareTo(new BigDecimal("-90")) < 0
                    || dto.getLatitude().compareTo(new BigDecimal("90")) > 0) {
                throw new ServiceException("纬度必须在-90到90之间");
            }
        }
    }

    /**
     * 校验搜索DTO参数
     */
    private void validateSearchDTO(HotelSearchDTO searchDTO) {
        if (searchDTO == null) {
            throw new ServiceException("搜索参数不能为空");
        }

        // 星级范围校验
        if (searchDTO.getStar() != null && (searchDTO.getStar() < 1 || searchDTO.getStar() > 5)) {
            throw new ServiceException("酒店星级必须在1-5之间");
        }

        // 价格区间校验
        if (searchDTO.getMinPrice() != null && searchDTO.getMaxPrice() != null) {
            if (searchDTO.getMinPrice().compareTo(searchDTO.getMaxPrice()) > 0) {
                throw new ServiceException("最低价格不能大于最高价格");
            }
        }
        if (searchDTO.getMinPrice() != null && searchDTO.getMinPrice().signum() < 0) {
            throw new ServiceException("最低价格不能为负数");
        }
        if (searchDTO.getMaxPrice() != null && searchDTO.getMaxPrice().signum() < 0) {
            throw new ServiceException("最高价格不能为负数");
        }

        // 评分范围校验
        if (searchDTO.getMinScore() != null) {
            if (searchDTO.getMinScore().signum() < 0 || searchDTO.getMinScore().compareTo(new BigDecimal("5")) > 0) {
                throw new ServiceException("最低评分必须在0-5之间");
            }
        }

        // 关键词长度校验
        if (StringUtils.isNotBlank(searchDTO.getKeyword()) && searchDTO.getKeyword().length() > 100) {
            throw new ServiceException("关键词长度不能超过100个字符");
        }
    }

    /**
     * 校验状态流转是否合法
     * 状态流转规则：
     * - 草稿(1) → 待审核(2)
     * - 待审核(2) → 营业中(0) / 已下架(3)
     * - 营业中(0) → 已下架(3) / 已冻结(4)
     * - 已下架(3) → 草稿(1) / 待审核(2)
     * - 已冻结(4) → 已下架(3)
     */
    private void validateStatusTransition(String currentStatus, String targetStatus) {
        // 相同状态不允许切换
        if (currentStatus.equals(targetStatus)) {
            throw new ServiceException("目标状态与当前状态相同");
        }

        boolean isValid = false;
        String errorMsg = "";

        switch (currentStatus) {
            case "0": // 营业中
                if ("3".equals(targetStatus) || "4".equals(targetStatus)) {
                    isValid = true;
                } else {
                    errorMsg = "营业中状态只能切换到已下架或已冻结";
                }
                break;
            case "1": // 草稿
                if ("2".equals(targetStatus)) {
                    isValid = true;
                } else {
                    errorMsg = "草稿状态只能切换到待审核";
                }
                break;
            case "2": // 待审核
                if ("0".equals(targetStatus) || "3".equals(targetStatus)) {
                    isValid = true;
                } else {
                    errorMsg = "待审核状态只能切换到营业中或已下架";
                }
                break;
            case "3": // 已下架
                if ("1".equals(targetStatus) || "2".equals(targetStatus)) {
                    isValid = true;
                } else {
                    errorMsg = "已下架状态只能切换到草稿或待审核";
                }
                break;
            case "4": // 已冻结
                if ("3".equals(targetStatus)) {
                    isValid = true;
                } else {
                    errorMsg = "已冻结状态只能切换到已下架";
                }
                break;
            default:
                errorMsg = "未知的当前状态";
        }

        if (!isValid) {
            throw new ServiceException("状态流转不合法：" + errorMsg);
        }
    }

    /**
     * 填充状态名称
     */
    private void fillStatusName(HotelListVO vo) {
        if (vo == null) {
            return;
        }
        HotelStatusEnum statusEnum = HotelStatusEnum.getByValue(vo.getStatus());
        if (statusEnum != null) {
            vo.setStatusName(statusEnum.getLabel());
        }
    }
}
