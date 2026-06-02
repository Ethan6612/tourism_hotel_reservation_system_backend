package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.MerchantAudit;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商户审核表 Mapper 接口
 */
@Mapper
public interface MerchantAuditMapper extends BaseMapper<MerchantAudit> {

}
