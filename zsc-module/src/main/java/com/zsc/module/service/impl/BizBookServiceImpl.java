package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.domain.dto.BizBookDto;
import com.zsc.module.domain.dto.query.BizBookQueryDto;
import com.zsc.module.domain.entity.BizBook;
import com.zsc.module.domain.entity.BizCategory;
import com.zsc.module.domain.vo.BizBookVo;
import com.zsc.module.mapper.BizBookMapper;
import com.zsc.module.service.BizBookService;
import com.zsc.module.service.BizCategoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 图书信息表 服务实现类
 * </p>
 *
 * @author author
 * @since 2026-05-23
 */
@Service
@Transactional
public class BizBookServiceImpl extends ServiceImpl<BizBookMapper, BizBook> implements BizBookService {

    private final BizCategoryService bizCategoryService;

    public BizBookServiceImpl(BizCategoryService bizCategoryService) {
        this.bizCategoryService = bizCategoryService;
    }

    /**
     * 添加图书信息
     */
    @Override
    public void addBook(BizBookDto addDto) {
        BizBook book = new BizBook();

        // 将DTO数据复制到实体类
        BeanUtils.copyProperties(addDto, book);

        // 设置默认字段
        book.setCreatedTime(new Date());
        book.setUpdatedTime(new Date());

        // 保存对象
        if (!this.save(book)) {
            throw new ServiceException("系统错误，图书信息添加失败！");
        }
    }

    /**
     * 更新图书信息
     */
    @Override
    public void updateBook(BizBookDto updateDto) {
        BizBook book = new BizBook();

        // 将DTO转换为实体类
        BeanUtils.copyProperties(updateDto, book);

        // 设置更新时间
        book.setUpdatedTime(new Date());

        // 进行增量更新
        if (!this.updateById(book)) {
            throw new ServiceException("系统错误，图书信息更新失败！");
        }
    }

    /**
     * 复杂条件查询，包含分页信息
     * 任务1：关联查询分类名称
     * 任务2：支持时间范围查询
     */
    @Override
    public PageResult queryBooks(BizBookQueryDto queryDto) {
        // 1. 使用 MyBatis-Plus 条件构造器查询图书列表
        Page<BizBook> result = this.lambdaQuery()
                // 任务2：时间范围查询 - 使用 .ge() 和 .le() 条件构造器
                .ge(queryDto.getBeginTime() != null, BizBook::getCreatedTime, queryDto.getBeginTime())
                .le(queryDto.getEndTime() != null, BizBook::getCreatedTime, queryDto.getEndTime())
                // 其他查询条件
                .like(StringUtils.isNotBlank(queryDto.getTitle()), BizBook::getTitle, queryDto.getTitle())
                .like(StringUtils.isNotBlank(queryDto.getAuthor()), BizBook::getAuthor, queryDto.getAuthor())
                .like(StringUtils.isNotBlank(queryDto.getIsbn()), BizBook::getIsbn, queryDto.getIsbn())
                .like(StringUtils.isNotBlank(queryDto.getPublisher()), BizBook::getPublisher, queryDto.getPublisher())
                .eq(queryDto.getCategoryId() != null, BizBook::getCategoryId, queryDto.getCategoryId())
                .eq(queryDto.getStatus() != null, BizBook::getStatus, queryDto.getStatus())
                .orderByDesc(BizBook::getCreatedTime)
                .page(queryDto.convetToPage());

        // 2. 任务1：关联查询分类名称
        List<BizBook> books = result.getRecords();
        if (books.isEmpty()) {
            return PageResult.fromPage(result);
        }

        // 提取所有的分类ID
        List<Long> categoryIds = books.stream()
                .map(BizBook::getCategoryId)
                .filter(id -> id != null)
                .distinct()
                .collect(Collectors.toList());

        // 批量查询分类信息
        Map<Long, String> categoryMap = categoryIds.isEmpty() ? Map.of() :
                bizCategoryService.listByIds(categoryIds).stream()
                        .collect(Collectors.toMap(
                                BizCategory::getCategoryId,
                                BizCategory::getCategoryName
                        ));

        // 3. 转换为 VO 并填充分类名称
        List<BizBookVo> voList = books.stream().map(book -> {
            BizBookVo vo = new BizBookVo();
            BeanUtils.copyProperties(book, vo);
            // 设置分类名称
            if (book.getCategoryId() != null) {
                vo.setCategoryName(categoryMap.get(book.getCategoryId()));
            }
            return vo;
        }).collect(Collectors.toList());

        // 4. 构建返回结果
        Page<BizBookVo> voPage = new Page<>(result.getCurrent(), result.getSize(), result.getTotal());
        voPage.setRecords(voList);

        return PageResult.fromPage(voPage);
    }

}
