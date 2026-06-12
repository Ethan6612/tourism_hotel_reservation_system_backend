package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.BizCategoryQueryDto;
import com.zsc.module.domain.entity.BizCategory;
import com.zsc.module.domain.vo.BizCategoryVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 业务类别表 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface BizCategoryMapper extends BaseMapper<BizCategory> {

    /**
     * 分页查询类别列表
     */
    Page<BizCategoryVo> selectCategoryVoPage(Page<BizCategoryVo> page, @Param("query") BizCategoryQueryDto query);

    /**
     * 查询类别详情
     */
    BizCategoryVo selectCategoryVoById(@Param("categoryId") Long categoryId);

    /**
     * 统计关联酒店数量
     */
    Long countHotelsByCategoryId(@Param("categoryId") Long categoryId);
}
