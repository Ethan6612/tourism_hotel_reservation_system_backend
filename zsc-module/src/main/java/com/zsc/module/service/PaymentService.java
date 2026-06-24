package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.PaymentVo;

import java.util.Map;

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

    /**
     * 发起微信支付
     * @return 支付参数（二维码URL、订单信息等）
     */
    Map<String, Object> initiateWechatPay(Long orderId, Long userId);

    /**
     * 确认支付（模拟回调）
     */
    void confirmPay(Long orderId, Long userId);
}
