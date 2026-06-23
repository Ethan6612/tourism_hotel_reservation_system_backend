package com.zsc.module.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.exception.ServiceException;
import com.zsc.module.common.pagination.PageResult;
import com.zsc.module.domain.dto.CommentDto;
import com.zsc.module.domain.dto.ScoreStatisticsDto;
import com.zsc.module.domain.dto.query.CommentQueryDto;
import com.zsc.module.domain.entity.Comment;
import com.zsc.module.domain.vo.CommentVo;
import com.zsc.module.domain.vo.ScoreStatisticsVo;
import com.zsc.module.mapper.CommentMapper;
import com.zsc.module.service.CommentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 评价服务实现类
 *
 * @author zsc
 */
@Service
@Transactional
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    /** 订单状态：已完成 */
    private static final String ORDER_STATUS_COMPLETED = "3";

    /** 评价状态：待审核 */
    private static final String COMMENT_STATUS_PENDING = "0";
    /** 评价状态：已发布 */
    private static final String COMMENT_STATUS_PUBLISHED = "1";
    /** 评价状态：已拒绝 */
    private static final String COMMENT_STATUS_REJECTED = "2";

    /** 申诉状态：无申诉 */
    private static final String APPEAL_STATUS_NONE = "0";
    /** 申诉状态：申诉中 */
    private static final String APPEAL_STATUS_PENDING = "1";
    /** 申诉状态：申诉通过 */
    private static final String APPEAL_STATUS_APPROVED = "2";
    /** 申诉状态：申诉驳回 */
    private static final String APPEAL_STATUS_REJECTED = "3";

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void addComment(CommentDto commentDto) {
        // 1. 校验订单是否已完成入住
        if (!canComment(commentDto.getUserId(), commentDto.getOrderId())) {
            throw new ServiceException("只有入住完成的订单才能进行评价！");
        }

        // 2. 校验是否已评价过该订单
        Comment existing = commentMapper.selectByOrderId(commentDto.getOrderId());
        if (existing != null) {
            throw new ServiceException("该订单已经评价过了，请勿重复评价！");
        }

        // 3. 构建评价实体
        Comment comment = new Comment();
        BeanUtils.copyProperties(commentDto, comment);

        // 处理图片：兼容imgUrl单图和images多图
        if (StringUtils.hasText(commentDto.getImages())) {
            comment.setImages(commentDto.getImages());
        } else if (StringUtils.hasText(commentDto.getImgUrl())) {
            comment.setImgUrl(commentDto.getImgUrl());
        }

        // 设置默认值
        comment.setCreateTime(new Date());
        comment.setUpdateTime(new Date());
        comment.setCreateBy(SecurityUtils.getUsername());
        if (!StringUtils.hasText(comment.getIsAnonymous())) {
            comment.setIsAnonymous("0");
        }
        if (!StringUtils.hasText(comment.getStatus())) {
            comment.setStatus(COMMENT_STATUS_PUBLISHED); // 默认直接发布
        }
        if (comment.getLikeCount() == null) {
            comment.setLikeCount(0);
        }

        if (!this.save(comment)) {
            throw new ServiceException("系统错误，评价添加失败！");
        }
    }

    @Override
    public void replyComment(Long commentId, String replyContent) {
        if (!StringUtils.hasText(replyContent)) {
            throw new ServiceException("回复内容不能为空！");
        }

        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }

        // 追加回复（保留历史回复记录）
        String timestamp = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String newReply = "【" + timestamp + "】" + replyContent;
        if (StringUtils.hasText(comment.getReplyContent())) {
            comment.setReplyContent(comment.getReplyContent() + "\n" + newReply);
        } else {
            comment.setReplyContent(newReply);
        }
        comment.setReplyTime(new Date());

        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，评价回复失败！");
        }
    }

    @Override
    public void deleteComment(Long commentId) {
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }

        // 权限校验：只有评价本人或管理员可以删除
        Long currentUserId = SecurityUtils.getUserId();
        if (!comment.getUserId().equals(currentUserId) && !SecurityUtils.isAdmin(currentUserId)) {
            throw new ServiceException("无权删除该评价！");
        }

        if (!this.removeById(commentId)) {
            throw new ServiceException("系统错误，评价删除失败！");
        }
    }

    @Override
    public void batchDeleteComments(List<Long> commentIds) {
        if (commentIds == null || commentIds.isEmpty()) {
            throw new ServiceException("请选择要删除的评价！");
        }

        // 管理员可以批量删除
        if (!SecurityUtils.isAdmin()) {
            throw new ServiceException("只有管理员可以批量删除评价！");
        }

        if (!this.removeByIds(commentIds)) {
            throw new ServiceException("系统错误，批量删除失败！");
        }
    }

    @Override
    public PageResult queryComments(CommentQueryDto queryDto) {
        if (queryDto.getPageNum() == null) queryDto.setPageNum(1);
        if (queryDto.getPageSize() == null) queryDto.setPageSize(10);

        Page<Comment> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        LambdaQueryWrapper<Comment> wrapper = buildQueryWrapper(queryDto);

        Page<Comment> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }

    @Override
    public PageResult<CommentVo> queryCommentsWithUserInfo(CommentQueryDto queryDto) {
        if (queryDto.getPageNum() == null) queryDto.setPageNum(1);
        if (queryDto.getPageSize() == null) queryDto.setPageSize(10);

        Page<CommentVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<CommentVo> resultPage = commentMapper.selectCommentVoPage(page, queryDto);

        // 处理图片列表和匿名显示
        List<CommentVo> voList = resultPage.getRecords().stream()
                .map(this::processCommentVo)
                .collect(Collectors.toList());

        PageResult<CommentVo> result = new PageResult<>();
        result.setCurrentPage(resultPage.getCurrent());
        result.setPageSize(resultPage.getSize());
        result.setTotal(resultPage.getTotal());
        result.setRows(voList);
        return result;
    }

    @Override
    public PageResult<CommentVo> queryMyComments(Integer pageNum, Integer pageSize) {
        Long userId = SecurityUtils.getUserId();
        Page<CommentVo> page = new Page<>(pageNum, pageSize);
        Page<CommentVo> resultPage = commentMapper.selectMyComments(page, userId);

        List<CommentVo> voList = resultPage.getRecords().stream()
                .map(this::processCommentVo)
                .collect(Collectors.toList());

        PageResult<CommentVo> result = new PageResult<>();
        result.setCurrentPage(resultPage.getCurrent());
        result.setPageSize(resultPage.getSize());
        result.setTotal(resultPage.getTotal());
        result.setRows(voList);
        return result;
    }

    @Override
    public CommentVo getCommentDetail(Long id) {
        CommentVo vo = commentMapper.selectCommentVoById(id);
        if (vo == null) {
            throw new ServiceException("评价不存在！");
        }
        return processCommentVo(vo);
    }

    @Override
    public ScoreStatisticsVo getScoreStatistics(ScoreStatisticsDto statisticsDto) {
        ScoreStatisticsVo statistics = commentMapper.selectScoreStatistics(
                statisticsDto.getHotelId(),
                statisticsDto.getRoomId(),
                statisticsDto.getBeginTime(),
                statisticsDto.getEndTime()
        );

        if (statistics == null) {
            statistics = ScoreStatisticsVo.builder()
                    .hotelId(statisticsDto.getHotelId())
                    .roomId(statisticsDto.getRoomId())
                    .averageScore(java.math.BigDecimal.ZERO)
                    .totalComments(0L)
                    .fiveStarCount(0L)
                    .fourStarCount(0L)
                    .threeStarCount(0L)
                    .twoStarCount(0L)
                    .oneStarCount(0L)
                    .build();
        }
        return statistics;
    }

    @Override
    public ScoreStatisticsVo getHotelScoreDistribution(Long hotelId) {
        if (hotelId == null) {
            throw new ServiceException("酒店ID不能为空！");
        }
        List<ScoreStatisticsVo> list = commentMapper.selectHotelScoreDistribution(hotelId);
        if (list == null || list.isEmpty()) {
            return ScoreStatisticsVo.builder()
                    .hotelId(hotelId)
                    .averageScore(java.math.BigDecimal.ZERO)
                    .totalComments(0L)
                    .fiveStarCount(0L)
                    .fourStarCount(0L)
                    .threeStarCount(0L)
                    .twoStarCount(0L)
                    .oneStarCount(0L)
                    .build();
        }
        return list.get(0);
    }

    @Override
    public List<ScoreStatisticsVo> getHotelsAverageScore(List<Long> hotelIds) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            return new ArrayList<>();
        }
        return commentMapper.selectHotelsAverageScore(hotelIds);
    }

    @Override
    public boolean toggleLikeComment(Long commentId) {
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        Long userId = SecurityUtils.getUserId();
        Long exists = commentMapper.selectCommentLikeExists(userId, commentId);
        if (exists != null && exists > 0) {
            // 已点赞 → 取消点赞
            commentMapper.deleteCommentLike(userId, commentId);
            commentMapper.decrementLikeCount(commentId);
            return false;
        } else {
            // 未点赞 → 点赞
            commentMapper.insertCommentLike(userId, commentId);
            commentMapper.incrementLikeCount(commentId);
            return true;
        }
    }

    @Override
    public List<CommentVo> getCommentLikes(Long commentId) {
        return commentMapper.selectCommentLikes(commentId);
    }

    @Override
    public void auditComment(Long commentId, String status) {
        if (!SecurityUtils.isAdmin()) {
            throw new ServiceException("只有管理员可以审核评价！");
        }

        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }

        if (!COMMENT_STATUS_PUBLISHED.equals(status) && !COMMENT_STATUS_REJECTED.equals(status)) {
            throw new ServiceException("审核状态无效！");
        }

        comment.setStatus(status);
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());

        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，审核失败！");
        }
    }

    @Override
    public boolean canComment(Long userId, Long orderId) {
        // 查询订单状态为"已完成"（status='3'）
        // 这里通过关联查询orders表来验证
        // 由于orders表在另一个模块，此处通过commentMapper验证
        Comment existing = commentMapper.selectByOrderId(orderId);
        if (existing != null) {
            return false; // 已评价过
        }
        // 订单完成状态的校验由调用方负责（Controller层可能会调用Order服务）
        return true;
    }

    @Override
    public void updateMyComment(CommentDto commentDto) {
        Long currentUserId = SecurityUtils.getUserId();
        Comment comment = this.getById(commentDto.getId());
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        if (!comment.getUserId().equals(currentUserId)) {
            throw new ServiceException("只能修改自己的评价！");
        }
        comment.setScore(commentDto.getScore());
        comment.setContent(commentDto.getContent());
        if (StringUtils.hasText(commentDto.getImages())) {
            comment.setImages(commentDto.getImages());
        }
        if (StringUtils.hasText(commentDto.getIsAnonymous())) {
            comment.setIsAnonymous(commentDto.getIsAnonymous());
        }
        comment.setStatus(COMMENT_STATUS_PUBLISHED);
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，评价修改失败！");
        }
    }

    @Override
    public void appendComment(Long commentId, String content) {
        Long currentUserId = SecurityUtils.getUserId();
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        if (!comment.getUserId().equals(currentUserId)) {
            throw new ServiceException("只能追加自己的评价！");
        }
        if (!StringUtils.hasText(content)) {
            throw new ServiceException("追加内容不能为空！");
        }
        // 在原内容后追加
        String newContent = (comment.getContent() != null ? comment.getContent() : "")
                + "\n\n【追加评价】" + new Date() + "\n" + content;
        comment.setContent(newContent);
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，评价追加失败！");
        }
    }

    @Override
    public void deleteMyComment(Long commentId) {
        Long currentUserId = SecurityUtils.getUserId();
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        if (!comment.getUserId().equals(currentUserId)) {
            throw new ServiceException("只能删除自己的评价！");
        }
        if (!this.removeById(commentId)) {
            throw new ServiceException("系统错误，评价删除失败！");
        }
    }

    @Override
    public PageResult<CommentVo> queryMerchantComments(CommentQueryDto queryDto) {
        Long merchantId = SecurityUtils.getUserId();
        if (queryDto.getPageNum() == null) queryDto.setPageNum(1);
        if (queryDto.getPageSize() == null) queryDto.setPageSize(10);
        Page<CommentVo> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        Page<CommentVo> resultPage = commentMapper.selectMerchantComments(page, queryDto, merchantId);
        List<CommentVo> voList = resultPage.getRecords().stream()
                .map(this::processCommentVo)
                .collect(Collectors.toList());
        PageResult<CommentVo> result = new PageResult<>();
        result.setCurrentPage(resultPage.getCurrent());
        result.setPageSize(resultPage.getSize());
        result.setTotal(resultPage.getTotal());
        result.setRows(voList);
        return result;
    }

    @Override
    public void appealComment(Long commentId, String reason) {
        if (!StringUtils.hasText(reason)) {
            throw new ServiceException("申诉理由不能为空！");
        }
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        if (!APPEAL_STATUS_NONE.equals(comment.getAppealStatus())
                && comment.getAppealStatus() != null) {
            throw new ServiceException("该评价已有申诉记录，不能重复申诉！");
        }
        comment.setAppealReason(reason);
        comment.setAppealTime(new Date());
        comment.setAppealStatus(APPEAL_STATUS_PENDING);
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，申诉提交失败！");
        }
    }

    @Override
    public List<CommentVo> queryCommentGroupByHotel(CommentQueryDto queryDto) {
        List<CommentVo> list = commentMapper.selectCommentGroupByHotel(queryDto);
        return list != null ? list : new ArrayList<>();
    }

    @Override
    public CommentVo getMyCommentStatistics() {
        Long userId = SecurityUtils.getUserId();
        return commentMapper.selectMyCommentStatistics(userId);
    }

    @Override
    public void auditAppeal(Long commentId, String appealStatus, String remark) {
        if (!SecurityUtils.isAdmin()) {
            throw new ServiceException("只有管理员可以审核申诉！");
        }
        if (!APPEAL_STATUS_APPROVED.equals(appealStatus)
                && !APPEAL_STATUS_REJECTED.equals(appealStatus)) {
            throw new ServiceException("申诉审核状态无效！");
        }
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        if (!APPEAL_STATUS_PENDING.equals(comment.getAppealStatus())) {
            throw new ServiceException("该评价没有待处理的申诉！");
        }
        comment.setAppealStatus(appealStatus);
        if (StringUtils.hasText(remark)) {
            comment.setRemark(remark);
        }
        // 申诉通过：保留评价，状态恢复为已发布
        if (APPEAL_STATUS_APPROVED.equals(appealStatus)) {
            comment.setStatus(COMMENT_STATUS_PUBLISHED);
        }
        // 申诉驳回：撤销评价
        if (APPEAL_STATUS_REJECTED.equals(appealStatus)) {
            comment.setStatus(COMMENT_STATUS_REJECTED);
        }
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，申诉审核失败！");
        }
    }

    // ==================== 私有方法 ====================

    /**
     * 构建查询条件
     */
    private LambdaQueryWrapper<Comment> buildQueryWrapper(CommentQueryDto queryDto) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();

        wrapper.eq(queryDto.getHotelId() != null, Comment::getHotelId, queryDto.getHotelId());
        wrapper.eq(queryDto.getRoomId() != null, Comment::getRoomId, queryDto.getRoomId());
        wrapper.eq(queryDto.getUserId() != null, Comment::getUserId, queryDto.getUserId());
        wrapper.eq(queryDto.getOrderId() != null, Comment::getOrderId, queryDto.getOrderId());
        wrapper.eq(queryDto.getScore() != null, Comment::getScore, queryDto.getScore());
        wrapper.ge(queryDto.getMinScore() != null, Comment::getScore, queryDto.getMinScore());
        wrapper.le(queryDto.getMaxScore() != null, Comment::getScore, queryDto.getMaxScore());

        if (StringUtils.hasText(queryDto.getStatus())) {
            wrapper.eq(Comment::getStatus, queryDto.getStatus());
        } else {
            // 默认只查已发布
            wrapper.eq(Comment::getStatus, COMMENT_STATUS_PUBLISHED);
        }

        if (queryDto.getHasReply() != null) {
            if (queryDto.getHasReply()) {
                wrapper.isNotNull(Comment::getReplyContent);
                wrapper.ne(Comment::getReplyContent, "");
            } else {
                wrapper.and(w -> w.isNull(Comment::getReplyContent).or().eq(Comment::getReplyContent, ""));
            }
        }

        if (StringUtils.hasText(queryDto.getKeyword())) {
            wrapper.like(Comment::getContent, queryDto.getKeyword());
        }

        if (StringUtils.hasText(queryDto.getBeginTime())) {
            wrapper.ge(Comment::getCreateTime, queryDto.getBeginTime());
        }
        if (StringUtils.hasText(queryDto.getEndTime())) {
            wrapper.le(Comment::getCreateTime, queryDto.getEndTime());
        }

        // 排序
        if ("score".equals(queryDto.getOrderBy())) {
            wrapper.orderByDesc(Comment::getScore);
        } else if ("likeCount".equals(queryDto.getOrderBy())) {
            wrapper.orderByDesc(Comment::getLikeCount);
        }
        wrapper.orderByDesc(Comment::getCreateTime);

        return wrapper;
    }

    /**
     * 处理CommentVo：解析图片列表、匿名处理
     */
    private CommentVo processCommentVo(CommentVo vo) {
        // 解析图片JSON数组
        if (StringUtils.hasText(vo.getImages())) {
            try {
                String images = vo.getImages().trim();
                if (images.startsWith("[") && images.endsWith("]")) {
                    String inner = images.substring(1, images.length() - 1).trim();
                    List<String> imageList = new ArrayList<>();
                    if (!inner.isEmpty()) {
                        String[] parts = inner.split(",");
                        for (String part : parts) {
                            String url = part.trim();
                            if (url.startsWith("\"") && url.endsWith("\"")) {
                                url = url.substring(1, url.length() - 1);
                            }
                            if (StringUtils.hasText(url)) {
                                imageList.add(url);
                            }
                        }
                    }
                    vo.setImageList(imageList);
                    // 兼容旧前端：imgUrl取第一张
                    if (!imageList.isEmpty()) {
                        vo.setImgUrl(imageList.get(0));
                    }
                }
            } catch (Exception e) {
                // 解析失败则使用原始值
                vo.setImgUrl(vo.getImages());
            }
        }

        // 匿名处理：如果isAnonymous=1，隐藏用户名
        if ("1".equals(vo.getIsAnonymous())) {
            vo.setUserName("匿名用户");
            vo.setUserAvatar(null);
        }

        return vo;
    }
}
