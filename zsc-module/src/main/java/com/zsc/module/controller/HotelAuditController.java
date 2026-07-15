package com.zsc.module.controller;

import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.HotelAuditDto;
import com.zsc.module.domain.dto.query.HotelAuditQueryDto;
import com.zsc.module.domain.vo.HotelAuditVo;
import com.zsc.module.service.HotelAuditService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 酒店审核管理控制器
 *
 * @author zsc
 */
@Tag(name = "酒店审核管理")
@Validated
@RestController
@RequestMapping("/api/hotelAudit")
public class HotelAuditController {

    @Autowired
    private HotelAuditService hotelAuditService;

    /**
     * 分页查询审核列表
     */
    @Operation(summary = "查询审核列表")
    @PreAuthorize("@ss.hasPermi('biz:hotelAudit:list')")
    @PostMapping("/query")
    public ResultVo<PageResult<HotelAuditVo>> query(@RequestBody HotelAuditQueryDto queryDto) {
        PageResult<HotelAuditVo> result = hotelAuditService.queryAudits(queryDto);
        return ResultVo.ok(result);
    }

    /**
     * 获取审核详情
     */
    @Operation(summary = "获取审核详情")
    @PreAuthorize("@ss.hasPermi('biz:hotelAudit:query')")
    @GetMapping("/{id}")
    public ResultVo<HotelAuditVo> getDetail(@PathVariable Long id) {
        HotelAuditVo vo = hotelAuditService.getAuditDetail(id);
        return ResultVo.ok(vo);
    }

    /**
     * 审核通过
     */
    @Operation(summary = "审核通过")
    @PreAuthorize("@ss.hasPermi('biz:hotelAudit:edit')")
    @Log(title = "酒店审核管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{hotelId}/approve")
    public ResultVo<String> approve(@PathVariable Long hotelId,
                                    @RequestBody(required = false) HotelAuditDto auditDto) {
        String opinion = auditDto != null ? auditDto.getAuditOpinion() : null;
        hotelAuditService.approve(hotelId, opinion);
        return ResultVo.ok("审核通过");
    }
    /**
     * 审核驳回
     */
    @Operation(summary = "审核驳回")
    @PreAuthorize("@ss.hasPermi('biz:hotelAudit:edit')")
    @Log(title = "酒店审核管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{hotelId}/reject")
    public ResultVo<String> reject(@PathVariable Long hotelId,
                                   @RequestBody(required = false) HotelAuditDto auditDto) {
        String opinion = auditDto != null ? auditDto.getAuditOpinion() : null;
        hotelAuditService.reject(hotelId, opinion);
        return ResultVo.ok("审核驳回");
    }

    /**
     * 查询待审核数量
     */
    @Operation(summary = "待审核数量")
    @PreAuthorize("@ss.hasPermi('biz:hotelAudit:list')")
    @GetMapping("/pendingCount")
    public ResultVo<Integer> pendingCount() {
        int count = hotelAuditService.countPending();
        return ResultVo.ok(count);
    }
}
