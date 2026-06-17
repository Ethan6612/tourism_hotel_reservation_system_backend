package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.BizCategoryDto;
import com.zsc.module.domain.dto.query.BizCategoryQueryDto;
import com.zsc.module.domain.entity.BizCategory;
import com.zsc.module.domain.enums.CategoryStatusEnum;
import com.zsc.module.domain.vo.BizCategoryVo;
import com.zsc.module.mapper.BizCategoryMapper;
import com.zsc.module.service.BizCategoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 业务类别表 服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class BizCategoryServiceImpl extends ServiceImpl<BizCategoryMapper, BizCategory> implements BizCategoryService {

    /**
     * 添加业务类别
     */
    @Override
    public void addCategory(BizCategoryDto addDto) {
        // 参数校验
        if (addDto == null) {
            throw new ServiceException("参数不能为空");
        }
        if (StringUtils.isBlank(addDto.getCategoryName())) {
            throw new ServiceException("分类名称不能为空");
        }

        // 分类名称唯一性校验
        checkCategoryNameUnique(addDto.getCategoryName(), null);

        BizCategory category = new BizCategory();
        BeanUtils.copyProperties(addDto, category);

        // 设置默认字段
        category.setCreateTime(new Date());
        category.setUpdateTime(new Date());

        if (!this.save(category)) {
            throw new ServiceException("新增分类失败");
        }
    }

    /**
     * 更新业务类别
     */
    @Override
    public void updateCategory(BizCategoryDto updateDto) {
        // 参数校验
        if (updateDto == null || updateDto.getCategoryId() == null) {
            throw new ServiceException("分类ID不能为空");
        }

        // 检查分类是否存在
        BizCategory existing = this.getById(updateDto.getCategoryId());
        if (existing == null) {
            throw new ServiceException("分类不存在");
        }

        // 分类名称唯一性校验（排除自身）
        if (StringUtils.isNotBlank(updateDto.getCategoryName())) {
            checkCategoryNameUnique(updateDto.getCategoryName(), updateDto.getCategoryId());
        }

        BizCategory category = new BizCategory();
        BeanUtils.copyProperties(updateDto, category);
        category.setUpdateTime(new Date());

        if (!this.updateById(category)) {
            throw new ServiceException("更新分类失败");
        }
    }

    /**
     * 删除业务类别（物理删除）
     */
    @Override
    public void deleteCategory(Long categoryId) {
        if (categoryId == null) {
            throw new ServiceException("分类ID不能为空");
        }

        BizCategory category = this.getById(categoryId);
        if (category == null) {
            throw new ServiceException("分类不存在");
        }

        // 统计关联酒店数量
        Long count = baseMapper.countHotelsByCategoryId(categoryId);
        if (count != null && count > 0) {
            throw new ServiceException("该分类下存在" + count + "个关联酒店，无法删除");
        }

        if (!this.removeById(categoryId)) {
            throw new ServiceException("删除分类失败");
        }
    }

    /**
     * 修改分类状态（启用/停用）
     */
    @Override
    public void updateStatus(Long categoryId, String status) {
        if (categoryId == null) {
            throw new ServiceException("分类ID不能为空");
        }

        // 校验状态值
        CategoryStatusEnum statusEnum = CategoryStatusEnum.getByValue(status);
        if (statusEnum == null) {
            throw new ServiceException("无效的状态值");
        }

        BizCategory category = this.getById(categoryId);
        if (category == null) {
            throw new ServiceException("分类不存在");
        }

        // 如果要停用，检查是否有启用中的酒店关联
        if (CategoryStatusEnum.DISABLED.getValue().equals(status)) {
            Long count = baseMapper.countHotelsByCategoryId(categoryId);
            if (count != null && count > 0) {
                throw new ServiceException("该分类下存在" + count + "个关联酒店，无法停用");
            }
        }

        category.setStatus(status);
        category.setUpdateTime(new Date());
        if (!this.updateById(category)) {
            throw new ServiceException("修改状态失败");
        }
    }

    /**
     * 后台分页查询分类列表
     */
    @Override
    public PageResult<BizCategoryVo> queryCategories(BizCategoryQueryDto queryDto) {
        Page<BizCategory> page = queryDto.convetToPage();

        LambdaQueryWrapper<BizCategory> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(queryDto.getCategoryName()),
                BizCategory::getCategoryName, queryDto.getCategoryName())
                .eq(StringUtils.isNotBlank(queryDto.getStatus()),
                        BizCategory::getStatus, queryDto.getStatus())
                .orderByAsc(BizCategory::getSortOrder)
                .orderByDesc(BizCategory::getCreateTime);

        Page<BizCategory> result = this.page(page, wrapper);

        // 转换为VO
        Page<BizCategoryVo> voPage = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        List<BizCategoryVo> voList = result.getRecords().stream()
                .map(this::convertToVo)
                .collect(Collectors.toList());
        voPage.setRecords(voList);

        return PageResult.fromPage(voPage);
    }

    /**
     * 查询分类详情
     */
    @Override
    public BizCategoryVo getCategoryDetail(Long categoryId) {
        if (categoryId == null) {
            throw new ServiceException("分类ID不能为空");
        }

        BizCategory category = this.getById(categoryId);
        if (category == null) {
            throw new ServiceException("分类不存在");
        }

        return convertToVo(category);
    }

    /**
     * 前端下拉数据源查询（只返回启用状态）
     */
    @Override
    public List<BizCategoryVo> listForSelect() {
        LambdaQueryWrapper<BizCategory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BizCategory::getStatus, CategoryStatusEnum.NORMAL.getValue())
                .orderByAsc(BizCategory::getSortOrder)
                .select(BizCategory::getCategoryId, BizCategory::getCategoryName);

        List<BizCategory> list = this.list(wrapper);

        return list.stream()
                .map(item -> BizCategoryVo.builder()
                        .categoryId(item.getCategoryId())
                        .categoryName(item.getCategoryName())
                        .build())
                .collect(Collectors.toList());
    }

    /**
     * 校验分类名称唯一性
     *
     * @param categoryName 分类名称
     * @param excludeId    排除的ID（编辑时排除自身）
     */
    private void checkCategoryNameUnique(String categoryName, Long excludeId) {
        LambdaQueryWrapper<BizCategory> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(BizCategory::getCategoryName, categoryName);

        if (excludeId != null) {
            wrapper.ne(BizCategory::getCategoryId, excludeId);
        }

        if (this.count(wrapper) > 0) {
            throw new ServiceException("分类名称'" + categoryName + "'已存在");
        }
    }

    /**
     * 实体转VO
     */
    private BizCategoryVo convertToVo(BizCategory entity) {
        if (entity == null) {
            return null;
        }

        BizCategoryVo vo = BizCategoryVo.builder()
                .categoryId(entity.getCategoryId())
                .categoryName(entity.getCategoryName())
                .sortOrder(entity.getSortOrder())
                .status(entity.getStatus())
                .createTime(entity.getCreateTime())
                .updateTime(entity.getUpdateTime())
                .build();

        // 设置状态名称
        CategoryStatusEnum statusEnum = CategoryStatusEnum.getByValue(entity.getStatus());
        if (statusEnum != null) {
            vo.setStatusName(statusEnum.getLabel());
        }

        return vo;
    }
}
