package com.zsc.module.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 图书信息DTO
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BizBookDto {

    /**
     * 图书的唯一标识符
     */
    private Long bookId;

    /**
     * 书名
     */
    @NotBlank(message = "书名不能为空")
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
    @NotNull(message = "图书分类不能为空")
    private Long categoryId;

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

}
