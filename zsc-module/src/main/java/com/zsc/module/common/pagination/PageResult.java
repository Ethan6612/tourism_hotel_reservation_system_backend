package com.zsc.module.common.pagination;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

/**
 * 分页返回结果
 */
@Data
public class PageResult<T> {
    /** 当前页码*/
    @JsonProperty("currentPage")
    private Long currentPage;
    /*** 每页数量*/
    @JsonProperty("pageSize")
    private Long pageSize;
    /*** 记录总数*/
    @JsonProperty("total")
    private Long total;
    /*** 分页数据*/
    @JsonProperty("rows")
    private List<T> rows;

    /**
     * 兼容方法，返回rows字段
     * 若依框架前端期望的字段名是rows，但也支持list
     */
    public List<T> getList() {
        return this.rows;
    }

    /**
     * 兼容方法，设置list字段
     */
    public void setList(List<T> list) {
        this.rows = list;
    }


    /**将mybatis-plus的分页结果Page转换为PageResult类型,减少传给前端不必要的数据*/
    public static <T> PageResult<T> fromPage(Page<T> page) {
        PageResult<T> result = new PageResult<>();
        result.total = page.getTotal();
        result.pageSize = page.getSize();
        result.currentPage = page.getCurrent();
        result.rows = page.getRecords();
        return result;
    }
}