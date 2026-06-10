package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.query.PaymentQueryDto;
import com.zsc.module.domain.entity.Payment;
import com.zsc.module.domain.vo.PaymentVo;
import com.zsc.module.mapper.PaymentMapper;
import com.zsc.module.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 支付服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements PaymentService {

    @Autowired
    private PaymentMapper paymentMapper;

    @Override
    public PageResult<PaymentVo> queryPayments(PaymentQueryDto queryDto) {
        Page<PaymentVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<PaymentVo> result = paymentMapper.selectPaymentVoPage(page, queryDto);
        return PageResult.fromPage(result);
    }

    @Override
    public PaymentVo getPaymentDetail(Long id) {
        PaymentVo vo = paymentMapper.selectPaymentVoById(id);
        if (vo == null) {
            throw new ServiceException("支付记录不存在");
        }
        return vo;
    }

    @Override
    public PaymentVo getPaymentByOrderId(Long orderId) {
        Page<PaymentVo> page = new Page<>(1, 1);
        PaymentQueryDto query = new PaymentQueryDto();
        query.setOrderId(orderId);
        Page<PaymentVo> result = paymentMapper.selectPaymentVoPage(page, query);
        if (result.getRecords().isEmpty()) {
            return null;
        }
        return result.getRecords().get(0);
    }
}
