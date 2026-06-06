package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantDto;
import com.zsc.module.domain.dto.query.MerchantQueryDto;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.vo.MerchantVo;

/**
 * 商户管理服务接口
 */
public interface MerchantService extends IService<Merchant> {

    /**
     * 注册/新增商户
     *
     * @param merchantDto 商户信息DTO
     */
    void addMerchant(MerchantDto merchantDto);

    /**
     * 更新商户信息
     *
     * @param merchantDto 商户信息DTO
     */
    void updateMerchant(MerchantDto merchantDto);

    /**
     * 获取商户详情（含关联酒店数量）
     *
     * @param id 商户ID
     * @return 商户详情VO
     */
    MerchantVo getMerchantDetail(Long id);

    /**
     * 分页查询商户列表
     *
     * @param queryDto 查询条件DTO
     * @return 分页结果
     */
    PageResult<MerchantVo> queryMerchants(MerchantQueryDto queryDto);

    /**
     * 冻结商户
     *
     * @param id 商户ID
     */
    void freezeMerchant(Long id);

    /**
     * 注销商户
     *
     * @param id 商户ID
     */
    void deregisterMerchant(Long id);

    /**
     * 恢复商户（解除冻结）
     *
     * @param id 商户ID
     */
    void unfreezeMerchant(Long id);

    /**
     * 根据营业执照号检查是否已存在
     *
     * @param licenseNo 营业执照号
     * @return 是否已存在
     */
    boolean existsByLicenseNo(String licenseNo);
}
