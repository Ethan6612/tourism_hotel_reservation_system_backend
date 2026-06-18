package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantDto;
import com.zsc.module.domain.dto.query.MerchantQueryDto;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.vo.MerchantVo;

import java.util.List;

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

    /**
     * 查询当前登录用户的商户信息（含审核状态）
     *
     * @param userId 用户ID
     * @return 商户信息VO，如果用户没有关联商户则返回null
     */
    MerchantVo getMyMerchant(Long userId);

    /**
     * 获取当前登录用户的商户ID
     *
     * @return 商户ID
     * @throws com.zsc.module.common.exception.ServiceException 如果用户未关联商户
     */
    Long getCurrentMerchantId();

    /**
     * 获取当前商户的所有酒店ID列表
     *
     * @return 酒店ID列表
     */
    List<Long> getCurrentMerchantHotelIds();

    /**
     * 校验酒店是否属于当前商户
     *
     * @param hotelId 酒店ID
     */
    void checkHotelOwnership(Long hotelId);

    /**
     * 校验房型是否属于当前商户（通过酒店关联链）
     *
     * @param roomId 房型ID
     */
    void checkRoomOwnership(Long roomId);
}

