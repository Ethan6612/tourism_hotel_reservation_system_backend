package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 支付 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface PaymentMapper extends BaseMapper<Payment> {

    /**
     * 分页查询支付记录列表（关联订单、用户、酒店信息）
     */
    Page<PaymentVo> selectPaymentVoPage(Page<PaymentVo> page, @Param("query") PaymentQueryDto query);

    /**
     * 查询支付记录详情
     */
    PaymentVo selectPaymentVoById(@Param("id") Long id);

    /**
     * 根据订单ID查询支付记录
     */
    Payment selectByOrderId(@Param("orderId") Long orderId);
}
