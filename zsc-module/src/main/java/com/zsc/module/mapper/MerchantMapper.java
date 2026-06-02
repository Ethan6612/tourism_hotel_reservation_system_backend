package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.Merchant;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
}
