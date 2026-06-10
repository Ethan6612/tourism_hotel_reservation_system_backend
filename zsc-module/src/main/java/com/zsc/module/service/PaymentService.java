package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.PaymentVo;

/**
 * 支付服务接口
 *
 * @author zsc
 */
public interface PaymentService extends IService<Payment> {

    /**
     * 分页查询支付记录列表
     */
    PageResult<PaymentVo> queryPayments(PaymentQueryDto queryDto);

    /**
     * 获取支付记录详情
     */
    PaymentVo getPaymentDetail(Long id);

    /**
     * 根据订单ID获取支付记录
     */
    PaymentVo getPaymentByOrderId(Long orderId);
}
