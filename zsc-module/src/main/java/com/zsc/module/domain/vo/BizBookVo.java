package com.zsc.module.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 图书信息VO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BizBookVo {

    /**
     * 图书的唯一标识符
     */
    private Long bookId;

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
     * 出版年份
     */
    private Integer publicationYear;

    /**
     * 封面图片
     */
    private String coverUrl;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 图书分类号
     */
    private Long categoryId;

    /**
     * 分类名称（任务1：关联查询）
     */
    private String categoryName;

    /**
     * 图书语言
     */
    private String language;

    /**
     * 总副本数
     */
    private Integer totalCopies;

    /**
     * 可用副本数
     */
    private Integer availableCopies;

    /**
     * 馆藏地址
     */
    private String location;

    /**
     * 状态:0-未上架;1-上架
     */
    private Integer status;

    /**
     * 图书介绍
     */
    private String description;

    /**
     * 附件 URL
     */
    private String attachmentUrl;

    /**
     * 备注
     */
    private String remark;

    /**
     * 更新时间
     */
    private Date updatedTime;

    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     * 创建人
     */
    private String createdBy;

    /**
     * 更新人
     */
    private String updatedBy;

}
