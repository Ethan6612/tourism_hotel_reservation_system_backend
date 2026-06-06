package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.MerchantDto;
import com.zsc.module.domain.dto.query.MerchantQueryDto;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.vo.MerchantVo;
import com.zsc.module.mapper.MerchantMapper;
import com.zsc.module.service.MerchantService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商户管理服务实现类
 */
@Service
@Transactional
public class MerchantServiceImpl extends ServiceImpl<MerchantMapper, Merchant> implements MerchantService {

    /**
     * 注册/新增商户
     */
    @Override
    public void addMerchant(MerchantDto merchantDto) {
        // 检查营业执照号是否已存在
        if (existsByLicenseNo(merchantDto.getLicenseNo())) {
            throw new ServiceException("该营业执照号已存在，请勿重复注册！");
        }

        Merchant merchant = new Merchant();
        BeanUtils.copyProperties(merchantDto, merchant);

        // 设置默认字段
        merchant.setStatus("0"); // 默认正常状态
        merchant.setCreateTime(new Date());
        merchant.setUpdateTime(new Date());

        if (!this.save(merchant)) {
            throw new ServiceException("系统错误，商户注册失败！");
        }
    }

    /**
     * 更新商户信息
     */
    @Override
    public void updateMerchant(MerchantDto merchantDto) {
        if (merchantDto.getId() == null) {
            throw new ServiceException("商户ID不能为空！");
        }

        // 检查商户是否存在
        Merchant existing = this.getById(merchantDto.getId());
        if (existing == null) {
            throw new ServiceException("商户不存在，更新失败！");
        }

        // 若营业执照号变更，检查是否与其他商户冲突
        if (StringUtils.isNotBlank(merchantDto.getLicenseNo())
                && !merchantDto.getLicenseNo().equals(existing.getLicenseNo())
                && existsByLicenseNo(merchantDto.getLicenseNo())) {
            throw new ServiceException("该营业执照号已被其他商户使用！");
        }

        Merchant merchant = new Merchant();
        BeanUtils.copyProperties(merchantDto, merchant);
        merchant.setUpdateTime(new Date());

        if (!this.updateById(merchant)) {
            throw new ServiceException("系统错误，商户信息更新失败！");
        }
    }

    /**
     * 获取商户详情（含关联酒店数量）
     */
    @Override
    public MerchantVo getMerchantDetail(Long id) {
        Merchant merchant = this.getById(id);
        if (merchant == null) {
            throw new ServiceException("商户不存在！");
        }

        MerchantVo vo = new MerchantVo();
        BeanUtils.copyProperties(merchant, vo);

        // 查询关联酒店数量
        Integer hotelCount = baseMapper.countHotelsByMerchantId(id);
        vo.setHotelCount(hotelCount != null ? hotelCount : 0);

        return vo;
    }

    /**
     * 分页查询商户列表
     */
    @Override
    public PageResult<MerchantVo> queryMerchants(MerchantQueryDto queryDto) {
        Page<Merchant> page = this.lambdaQuery()
                .like(StringUtils.isNotBlank(queryDto.getMerchantName()),
                        Merchant::getMerchantName, queryDto.getMerchantName())
                .eq(StringUtils.isNotBlank(queryDto.getLicenseNo()),
                        Merchant::getLicenseNo, queryDto.getLicenseNo())
                .like(StringUtils.isNotBlank(queryDto.getLegalPerson()),
                        Merchant::getLegalPerson, queryDto.getLegalPerson())
                .eq(StringUtils.isNotBlank(queryDto.getPhone()),
                        Merchant::getPhone, queryDto.getPhone())
                .eq(StringUtils.isNotBlank(queryDto.getStatus()),
                        Merchant::getStatus, queryDto.getStatus())
                .orderByDesc(Merchant::getCreateTime)
                .page(queryDto.convetToPage());

        // 转换为VO列表
        List<MerchantVo> voList = page.getRecords().stream()
                .map(merchant -> {
                    MerchantVo vo = new MerchantVo();
                    BeanUtils.copyProperties(merchant, vo);
                    // 可选：填充关联酒店数量（批量查询优化避免N+1问题）
                    Integer hotelCount = baseMapper.countHotelsByMerchantId(merchant.getId());
                    vo.setHotelCount(hotelCount != null ? hotelCount : 0);
                    return vo;
                })
                .collect(Collectors.toList());

        // 构建分页结果
        PageResult<MerchantVo> result = new PageResult<>();
        result.setTotal(page.getTotal());
        result.setPageSize(page.getSize());
        result.setCurrentPage(page.getCurrent());
        result.setRows(voList);
        return result;
    }

    /**
     * 冻结商户
     */
    @Override
    public void freezeMerchant(Long id) {
        updateMerchantStatus(id, "1", "商户不存在，冻结失败！");
    }

    /**
     * 注销商户
     */
    @Override
    public void deregisterMerchant(Long id) {
        updateMerchantStatus(id, "2", "商户不存在，注销失败！");
    }

    /**
     * 恢复商户（解除冻结）
     */
    @Override
    public void unfreezeMerchant(Long id) {
        updateMerchantStatus(id, "0", "商户不存在，恢复失败！");
    }

    /**
     * 根据营业执照号检查是否已存在
     */
    @Override
    public boolean existsByLicenseNo(String licenseNo) {
        if (StringUtils.isBlank(licenseNo)) {
            return false;
        }
        return this.lambdaQuery()
                .eq(Merchant::getLicenseNo, licenseNo)
                .exists();
    }

    // ===== 私有辅助方法 =====

    /**
     * 更新商户状态的通用方法
     *
     * @param id            商户ID
     * @param targetStatus  目标状态
     * @param errorMsg      商户不存在时的错误提示
     */
    private void updateMerchantStatus(Long id, String targetStatus, String errorMsg) {
        Merchant merchant = this.getById(id);
        if (merchant == null) {
            throw new ServiceException(errorMsg);
        }

        merchant.setStatus(targetStatus);
        merchant.setUpdateTime(new Date());

        if (!this.updateById(merchant)) {
            throw new ServiceException("系统错误，状态更新失败！");
        }
    }
}
