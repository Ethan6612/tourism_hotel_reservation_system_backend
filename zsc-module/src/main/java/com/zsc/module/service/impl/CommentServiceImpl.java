package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.mapper.CommentMapper;
import com.zsc.module.service.CommentService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 评价服务实现类
 */
@Service
@Transactional
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Override
    public void addComment(CommentDto commentDto) {
        Comment comment = new Comment();
        BeanUtils.copyProperties(commentDto, comment);
        comment.setCreateTime(new Date());
        if (!this.save(comment)) {
            throw new ServiceException("系统错误，评价添加失败！");
        }
    }

    @Override
    public void replyComment(Long commentId, String replyContent) {
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        comment.setReplyContent(replyContent);
        comment.setReplyTime(new Date());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，评价回复失败！");
        }
    }

    @Override
    public PageResult queryComments(Integer pageNum, Integer pageSize, Long hotelId, Long roomId) {
        Page<Comment> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(hotelId != null, Comment::getHotelId, hotelId)
                .eq(roomId != null, Comment::getRoomId, roomId)
                .orderByDesc(Comment::getCreateTime);
        Page<Comment> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }
}