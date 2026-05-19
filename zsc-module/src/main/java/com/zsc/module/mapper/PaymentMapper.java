package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.Payment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 支付 Mapper 接口
 */
@Mapper
public interface PaymentMapper extends BaseMapper<Payment> {

}