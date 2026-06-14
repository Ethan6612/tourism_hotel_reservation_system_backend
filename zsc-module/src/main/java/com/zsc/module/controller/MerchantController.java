package com.zsc.module.controller;

import com.zsc.common.annotation.Anonymous;
import com.zsc.common.annotation.Log;
import com.zsc.common.enums.BusinessType;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.dto.MerchantAuditDto;
import com.zsc.module.domain.dto.MerchantDto;
import com.zsc.module.domain.dto.query.MerchantAuditQueryDto;
import com.zsc.module.domain.dto.query.MerchantQueryDto;
import com.zsc.module.domain.vo.MerchantAuditVo;
import com.zsc.module.domain.vo.MerchantVo;
import com.zsc.module.service.MerchantAuditService;
import com.zsc.module.service.MerchantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 商户管理控制器
 */
@Tag(name = "商户管理")
@Validated
@RestController
@RequestMapping("/api/merchant")
public class MerchantController {

    @Autowired
    private MerchantService merchantService;

    @Autowired
    private MerchantAuditService merchantAuditService;

    // ===== 商户基本信息管理 =====

    /**
     * 查询当前登录用户的商户信息（含审核状态）
     */
    @Operation(summary = "查询我的商户信息")
    @GetMapping("/my")
    public ResultVo<MerchantVo> getMyMerchant() {
        // ✅ 添加日志
        System.out.println("=== MerchantController.getMyMerchant 被调用 ===");
        
        // 获取当前登录用户ID
        Long userId = com.zsc.common.utils.SecurityUtils.getUserId();
        System.out.println("SecurityContext中的userId: " + userId);
        
        // ✅ 获取用户角色信息
        org.springframework.security.core.Authentication authentication = 
            org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getAuthorities() != null) {
            System.out.println("用户权限/角色: " + authentication.getAuthorities());
        }
        
        MerchantVo merchant = merchantService.getMyMerchant(userId);
        
        System.out.println("返回的商户信息: " + (merchant != null ? 
            "id=" + merchant.getId() + ", name=" + merchant.getMerchantName() + ", auditStatus=" + merchant.getAuditStatus() : "null"));
        System.out.println("===========================================");
        
        return ResultVo.ok(merchant);
    }

    /**
     * 分页查询商户列表
     */
    @Operation(summary = "查询商户列表")
    // ✅ 移除权限校验，允许所有已登录用户查询商户列表
    // 商户用户可以查询自己的商户，管理员可以查询所有商户
    @PostMapping("/query")
    public ResultVo<PageResult<MerchantVo>> query(@RequestBody MerchantQueryDto queryDto) {
        return ResultVo.ok(merchantService.queryMerchants(queryDto));
    }

    /**
     * 查询审核记录列表
     */
    @Operation(summary = "查询审核记录列表")
    @PreAuthorize("@ss.hasPermi('merchant:audit:list')")
    @PostMapping("/audit/query")
    public ResultVo<PageResult<MerchantAuditVo>> queryAudits(@RequestBody MerchantAuditQueryDto queryDto) {
        return ResultVo.ok(merchantAuditService.queryAudits(queryDto));
    }

    /**
     * 获取指定ID的商户详情
     */
    @Operation(summary = "获取商户详情")
    @PreAuthorize("@ss.hasPermi('merchant:query')")
    @GetMapping("/{id}")
    public ResultVo<MerchantVo> get(@PathVariable @Min(value = 1, message = "商户ID不能小于1") long id) {
        return ResultVo.ok(merchantService.getMerchantDetail(id));
    }

    /**
     * 获取审核记录详情
     */
    @Operation(summary = "获取审核记录详情")
    @PreAuthorize("@ss.hasPermi('merchant:audit:query')")
    @GetMapping("/audit/{id}")
    public ResultVo<MerchantAuditVo> getAuditDetail(@PathVariable @Min(value = 1, message = "审核ID不能小于1") long id) {
        return ResultVo.ok(merchantAuditService.getAuditDetail(id));
    }

    /**
     * 注册/新增商户（需要登录后才能注册）
     */
    @Operation(summary = "新增商户")
    // ✅ 移除权限校验，允许所有已登录用户注册商户
    // 通过Token验证确保用户已登录，SecurityUtils.getUserId()会获取当前用户ID
    @Log(title = "商户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public ResultVo add(@Valid @RequestBody MerchantDto merchantDto) {
        merchantService.addMerchant(merchantDto);
        return ResultVo.ok();
    }

    /**
     * 提交审核申请
     */
    @Operation(summary = "提交审核申请")
    @PreAuthorize("@ss.hasPermi('merchant:audit:add')")
    @Log(title = "商户审核管理", businessType = BusinessType.INSERT)
    @PostMapping("/audit")
    public ResultVo submitAudit(@Valid @RequestBody MerchantAuditDto auditDto) {
        merchantAuditService.submitAudit(auditDto);
        return ResultVo.ok();
    }

    /**
     * 更新商户信息
     */
    @Operation(summary = "修改商户信息")
    @PreAuthorize("@ss.hasPermi('merchant:edit')")
    @Log(title = "商户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public ResultVo update(@Valid @RequestBody MerchantDto merchantDto) {
        merchantService.updateMerchant(merchantDto);
        return ResultVo.ok();
    }

    /**
     * 执行审核操作（通过/驳回）
     */
    @Operation(summary = "执行审核操作")
    @PreAuthorize("@ss.hasPermi('merchant:audit:edit')")
    @Log(title = "商户审核管理", businessType = BusinessType.UPDATE)
    @PutMapping("/audit")
    public ResultVo processAudit(@Valid @RequestBody MerchantAuditDto auditDto) {
        merchantAuditService.processAudit(auditDto);
        return ResultVo.ok();
    }

    /**
     * 冻结商户
     */
    @Operation(summary = "冻结商户")
    @PreAuthorize("@ss.hasPermi('merchant:edit')")
    @Log(title = "商户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/freeze")
    public ResultVo freeze(@PathVariable @Min(value = 1, message = "商户ID不能小于1") long id) {
        merchantService.freezeMerchant(id);
        return ResultVo.ok("冻结成功");
    }

    /**
     * 恢复商户（解除冻结）
     */
    @Operation(summary = "恢复商户")
    @PreAuthorize("@ss.hasPermi('merchant:edit')")
    @Log(title = "商户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/unfreeze")
    public ResultVo unfreeze(@PathVariable @Min(value = 1, message = "商户ID不能小于1") long id) {
        merchantService.unfreezeMerchant(id);
        return ResultVo.ok("恢复成功");
    }

    /**
     * 注销商户
     */
    @Operation(summary = "注销商户")
    @PreAuthorize("@ss.hasPermi('merchant:remove')")
    @Log(title = "商户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/{id}/deregister")
    public ResultVo deregister(@PathVariable @Min(value = 1, message = "商户ID不能小于1") long id) {
        merchantService.deregisterMerchant(id);
        return ResultVo.ok("注销成功");
    }

    /**
     * 删除商户（逻辑删除，实质为注销状态变更）
     */
    @Operation(summary = "删除商户")
    @PreAuthorize("@ss.hasPermi('merchant:remove')")
    @Log(title = "商户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public ResultVo delete(@PathVariable @Min(value = 1, message = "商户ID不能小于1") long id) {
        return merchantService.removeById(id)
                ? ResultVo.ok("删除成功")
                : ResultVo.fail("商户不存在，删除失败");
    }

    /**
     * 检查营业执照号是否已存在
     */
    @Operation(summary = "检查营业执照号是否已存在")
    @PreAuthorize("@ss.hasPermi('merchant:query')")
    @GetMapping("/checkLicense/{licenseNo}")
    public ResultVo<Boolean> checkLicenseNo(@PathVariable String licenseNo) {
        return ResultVo.ok(merchantService.existsByLicenseNo(licenseNo));
    }
}
