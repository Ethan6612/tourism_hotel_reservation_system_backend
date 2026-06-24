package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.HotelAuditQueryDto;
import com.zsc.module.domain.entity.HotelAudit;
import com.zsc.module.domain.vo.HotelAuditVo;

/**
 * 酒店审核服务接口
 */
public interface HotelAuditService extends IService<HotelAudit> {

    /**
     * 分页查询审核记录
     *
     * @param queryDto 查询条件
     * @return 分页结果
     */
    PageResult<HotelAuditVo> queryAudits(HotelAuditQueryDto queryDto);

    /**
     * 获取审核详情
     *
     * @param id 审核记录ID
     * @return 审核详情VO
     */
    HotelAuditVo getAuditDetail(Long id);

    /**
     * 审核通过
     *
     * @param hotelId      酒店ID
     * @param auditOpinion 审核意见
     */
    void approve(Long hotelId, String auditOpinion);

    /**
     * 审核驳回
     *
     * @param hotelId      酒店ID
     * @param auditOpinion 审核意见
     */
    void reject(Long hotelId, String auditOpinion);

    /**
     * 查询待审核数量
     *
     * @return 待审核数量
     */
    int countPending();
}
