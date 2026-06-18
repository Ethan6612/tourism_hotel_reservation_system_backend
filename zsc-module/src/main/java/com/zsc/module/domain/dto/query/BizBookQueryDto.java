package com.zsc.module.domain.dto.query;

import com.zsc.module.common.pagination.BasePageReq;
import lombok.Data;

import java.util.Date;

/**
 * 图书信息查询DTO
 */
@Data
public class BizBookQueryDto extends BasePageReq {

    /**
     * 书名
     */
    private String title;

    /**
     * 作者
     */
    private String author;

    /**
     * ISBN 编号
     */
    private String isbn;

    /**
     * 出版社
     */
    private String publisher;

    /**
     * 图书分类号
     */
    private Long categoryId;

    /**
     * 状态:0-未上架;1-上架
     */
    private Integer status;

    /**
     * 创建时间-开始
     */
    private Date beginTime;

    /**
     * 创建时间-结束
     */
    private Date endTime;

}
