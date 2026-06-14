package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

/**
 * 商户查询DTO（分页查询商户列表）
 */
@Data
public class MerchantQueryDto extends BasePageReq {

    /**
     * 商户名称（模糊查询）
     */
    private String merchantName;

    /**
     * 营业执照号（精确查询）
     */
    private String licenseNo;

    /**
     * 法人姓名（模糊查询）
     */
    private String legalPerson;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 商户状态（0正常 1冻结 2注销）
     */
    private String status;

    /**
     * 审核状态（0待审核 1审核通过 2审核驳回）- 用于筛选商户
     */
    private String auditStatus;
}
