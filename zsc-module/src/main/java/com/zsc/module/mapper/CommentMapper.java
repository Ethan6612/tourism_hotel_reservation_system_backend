package com.zsc.module.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 评价 Mapper 接口
 *
 * @author zsc
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

    /**
     * 分页查询评价列表（关联用户、酒店、房型信息）
     */
    Page<CommentVo> selectCommentVoPage(Page<CommentVo> page, @Param("query") CommentQueryDto query);

    /**
     * 查询评价详情（关联用户、酒店、房型信息）
     */
    CommentVo selectCommentVoById(@Param("id") Long id);

    /**
     * 查询我的评价列表
     */
    Page<CommentVo> selectMyComments(Page<CommentVo> page, @Param("userId") Long userId);

    /**
     * 根据订单ID查询评价（校验是否已评价）
     */
    Comment selectByOrderId(@Param("orderId") Long orderId);

    /**
     * 获取评分统计（使用SQL聚合查询）
     */
    ScoreStatisticsVo selectScoreStatistics(@Param("hotelId") Long hotelId,
                                             @Param("roomId") Long roomId,
                                             @Param("beginTime") String beginTime,
                                             @Param("endTime") String endTime);

    /**
     * 获取酒店评分分布统计
     */
    List<ScoreStatisticsVo> selectHotelScoreDistribution(@Param("hotelId") Long hotelId);

    /**
     * 批量查询酒店的平均评分
     */
    List<ScoreStatisticsVo> selectHotelsAverageScore(@Param("hotelIds") List<Long> hotelIds);

    /**
     * 点赞数+1
     */
    int incrementLikeCount(@Param("id") Long id);

    /**
     * 点赞数-1
     */
    int decrementLikeCount(@Param("id") Long id);

    /**
     * 统计评价总数
     */
    Long countComments(@Param("query") CommentQueryDto query);

    /**
     * 查询商户下酒店的评价列表
     */
    Page<CommentVo> selectMerchantComments(Page<CommentVo> page, @Param("query") CommentQueryDto query, @Param("merchantId") Long merchantId);

    /**
     * 按酒店分组查询评价（酒店列表 + 评分统计）
     */
    List<CommentVo> selectCommentGroupByHotel(@Param("query") CommentQueryDto query);

    /**
     * 查询用户评价统计
     */
    CommentVo selectMyCommentStatistics(@Param("userId") Long userId);
}
