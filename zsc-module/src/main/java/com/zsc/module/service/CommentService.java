package com.zsc.module.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.dto.ScoreStatisticsDto;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;

import java.util.List;

/**
 * 评价服务接口
 *
 * @author zsc
 */
public interface CommentService extends IService<Comment> {

    /**
     * 添加评价（校验订单是否已完成入住）
     */
    void addComment(CommentDto commentDto);

    /**
     * 回复评价（商家/管理员）
     */
    void replyComment(Long commentId, String replyContent);

    /**
     * 删除评价（用户本人或管理员）
     */
    void deleteComment(Long commentId);

    /**
     * 批量删除评价（管理员）
     */
    void batchDeleteComments(List<Long> commentIds);

    /**
     * 分页查询评价列表（多条件筛选）
     */
    PageResult queryComments(CommentQueryDto queryDto);

    /**
     * 分页查询评价列表（带用户、酒店、房型信息）
     */
    PageResult<CommentVo> queryCommentsWithUserInfo(CommentQueryDto queryDto);

    /**
     * 查询我的评价列表
     */
    PageResult<CommentVo> queryMyComments(Integer pageNum, Integer pageSize);

    /**
     * 获取评价详情
     */
    CommentVo getCommentDetail(Long id);

    /**
     * 获取评分统计
     */
    ScoreStatisticsVo getScoreStatistics(ScoreStatisticsDto statisticsDto);

    /**
     * 获取酒店评分分布（按星级统计）
     */
    ScoreStatisticsVo getHotelScoreDistribution(Long hotelId);

    /**
     * 批量获取酒店平均评分
     */
    List<ScoreStatisticsVo> getHotelsAverageScore(List<Long> hotelIds);

    /**
     * 点赞评价
     */
    void likeComment(Long commentId);

    /**
     * 取消点赞
     */
    void unlikeComment(Long commentId);

    /**
     * 审核评价（管理员：通过/拒绝）
     */
    void auditComment(Long commentId, String status);

    /**
     * 检查用户是否可以对订单进行评价
     * @return true=可以评价, false=不可以
     */
    boolean canComment(Long userId, Long orderId);

    /**
     * 修改评价（用户本人）
     */
    void updateMyComment(CommentDto commentDto);

    /**
     * 追加评价（用户本人）
     */
    void appendComment(Long commentId, String content);

    /**
     * 删除我的评价（用户本人）
     */
    void deleteMyComment(Long commentId);

    /**
     * 商户查看自己酒店的评价列表
     */
    PageResult<CommentVo> queryMerchantComments(CommentQueryDto queryDto);

    /**
     * 商户申诉评价
     */
    void appealComment(Long commentId, String reason);

    /**
     * 按酒店分组查询评价列表（管理端用）
     */
    List<CommentVo> queryCommentGroupByHotel(CommentQueryDto queryDto);

    /**
     * 我的评价统计
     */
    CommentVo getMyCommentStatistics();

    /**
     * 审核申诉（管理员）
     * @param appealStatus 2=申诉通过 3=申诉驳回
     */
    void auditAppeal(Long commentId, String appealStatus, String remark);
}
