package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.entity.Merchant;
import com.zsc.module.domain.entity.MerchantAudit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 商户表 Mapper 接口
 */
@Mapper
public interface MerchantMapper extends BaseMapper<Merchant> {

    /**
     * 统计指定商户关联的酒店数量
     *
     * @param merchantId 商户ID
     * @return 酒店数量
     */
    @Select("SELECT COUNT(*) FROM hotel WHERE business_id = #{merchantId}")
    Integer countHotelsByMerchantId(@Param("merchantId") Long merchantId);

    /**
     * 分页查询商户列表（根据审核状态过滤）
     *
     * @param page          分页对象
     * @param merchantName  商户名称（模糊查询）
     * @param licenseNo     营业执照号（精确查询）
     * @param legalPerson   法人姓名（模糊查询）
     * @param phone         联系电话
     * @param status        商户状态
     * @param auditStatus   审核状态（0待审核 1审核通过 2审核驳回）
     * @return 商户列表
     */
    List<Merchant> selectMerchantsWithAuditFilter(
            Page<Merchant> page,
            @Param("merchantName") String merchantName,
            @Param("licenseNo") String licenseNo,
            @Param("legalPerson") String legalPerson,
            @Param("phone") String phone,
            @Param("status") String status,
            @Param("auditStatus") String auditStatus
    );

    /**
     * 查询商户的最新审核记录
     *
     * @param merchantId 商户ID
     * @return 最新审核记录，如果没有则返回null
     */
    @Select("SELECT * FROM merchant_audit WHERE merchant_id = #{merchantId} ORDER BY id DESC LIMIT 1")
    MerchantAudit selectLatestAuditByMerchantId(@Param("merchantId") Long merchantId);
}
