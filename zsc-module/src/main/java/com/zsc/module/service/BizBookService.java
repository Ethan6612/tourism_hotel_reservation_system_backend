package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.BizBookDto;
import com.zsc.module.domain.dto.query.BizBookQueryDto;
import com.zsc.module.domain.entity.BizBook;

/**
 * <p>
 * 图书信息表 服务类
 * </p>
 *
 * @author author
 * @since 2026-05-23
 */
public interface BizBookService extends IService<BizBook> {

    /**
     * 添加图书信息
     */
    void addBook(BizBookDto addDto);

    /**
     * 更新图书信息
     */
    void updateBook(BizBookDto updateDto);

    /**
     * 复杂条件查询，包含分页信息
     * 任务1：关联查询分类名称
     * 任务2：支持时间范围查询
     */
    PageResult queryBooks(BizBookQueryDto queryDto);

}
