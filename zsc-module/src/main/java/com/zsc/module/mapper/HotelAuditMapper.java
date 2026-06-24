package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.HotelAuditQueryDto;
import com.zsc.module.domain.entity.HotelAudit;
import com.zsc.module.domain.vo.HotelAuditVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 酒店审核记录 Mapper 接口
 */
@Mapper
public interface HotelAuditMapper extends BaseMapper<HotelAudit> {

    /**
     * 分页查询酒店审核记录（联查酒店表）
     *
     * @param page     分页对象
     * @param queryDto 查询条件
     * @return 审核记录VO列表
     */
    Page<HotelAuditVo> selectHotelAuditPage(Page<HotelAuditVo> page, @Param("query") HotelAuditQueryDto queryDto);

    /**
     * 查询待审核数量
     *
     * @return 待审核数量
     */
    int selectPendingCount();
}
