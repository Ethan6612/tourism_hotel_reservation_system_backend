package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.entity.Comment;

/**
 * 评价服务接口
 */
public interface CommentService extends IService<Comment> {

    /**
     * 添加评价
     */
    void addComment(CommentDto commentDto);

    /**
     * 回复评价
     */
    void replyComment(Long commentId, String replyContent);

    /**
     * 分页查询评价列表
     */
    PageResult queryComments(Integer pageNum, Integer pageSize, Long hotelId, Long roomId);
}