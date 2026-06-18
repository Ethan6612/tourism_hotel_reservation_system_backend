package com.zsc.module.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商户通知 VO
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MerchantNoticeVo {

    /** 通知ID */
    private Long noticeId;

    /** 通知标题 */
    private String noticeTitle;

    /** 通知类型（1通知 2公告） */
    private String noticeType;

    /** 通知内容 */
    private String noticeContent;

    /** 通知状态（0正常 1关闭） */
    private String status;

    /** 创建者 */
    private String createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /** 备注 */
    private String remark;
}
