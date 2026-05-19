package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zsc.module.domain.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 评价 Mapper 接口
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

}