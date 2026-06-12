package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.BizCategoryDto;
import com.zsc.module.domain.dto.query.BizCategoryQueryDto;
import com.zsc.module.domain.entity.BizCategory;
import com.zsc.module.domain.vo.BizCategoryVo;

import java.util.List;

/**
 * 业务类别表 服务类
 *
 * @author zsc
 */
public interface BizCategoryService extends IService<BizCategory> {

    /**
     * 添加业务类别
     */
    void addCategory(BizCategoryDto addDto);

    /**
     * 更新业务类别
     */
    void updateCategory(BizCategoryDto updateDto);

    /**
     * 删除业务类别（逻辑删除，校验是否关联酒店）
     */
    void deleteCategory(Long categoryId);

    /**
     * 修改分类状态（启用/停用）
     */
    void updateStatus(Long categoryId, String status);

    /**
     * 后台分页查询分类列表
     */
    PageResult<BizCategoryVo> queryCategories(BizCategoryQueryDto queryDto);

    /**
     * 查询分类详情
     */
    BizCategoryVo getCategoryDetail(Long categoryId);

    /**
     * 前端下拉数据源查询（只返回启用状态）
     */
    List<BizCategoryVo> listForSelect();
}
