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

    /**
     * 提交评价：校验订单完成状态和重复评价，构建评价实体，默认直接发布
     */
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
        comment.setIsAnonymous("0"); // 实名评价
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

    /**
     * 回复评价（商家/管理员）：在原回复内容后追加，用【时间戳】保留历史记录
     */
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

    /**
     * 删除评价（本人或管理员可操作）：物理删除数据库记录
     */
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

    /**
     * 批量删除评价（仅管理员）：根据ID列表物理删除
     */
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

    /**
     * 基础分页查询评价列表（使用MyBatis-Plus Lambda查询，不含关联信息）
     */
    @Override
    public PageResult queryComments(CommentQueryDto queryDto) {
        if (queryDto.getPageNum() == null) queryDto.setPageNum(1);
        if (queryDto.getPageSize() == null) queryDto.setPageSize(10);

        Page<Comment> page = new Page<>(queryDto.getPageNum(), queryDto.getPageSize());
        LambdaQueryWrapper<Comment> wrapper = buildQueryWrapper(queryDto);

        Page<Comment> result = this.page(page, wrapper);
        return PageResult.fromPage(result);
    }

    /**
     * 分页查询评价列表（带用户、酒店、房型关联信息，用于管理员/商家端展示）
     * 使用自定义Mapper XML查询，默认只查已发布(status='1')的评价
     */
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

    /**
     * 查询我的评价（用户端）：根据登录用户ID查询该用户所有评价，包含关联信息
     */
    @Override
    public PageResult<CommentVo> queryMyComments(Integer pageNum, Integer pageSize) {
        Long userId = SecurityUtils.getUserId();
        //构建器
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

    /**
     * 获取评价详情：根据ID查询单条评价（含用户、酒店、房型、回复等关联信息）
     */
    @Override
    public CommentVo getCommentDetail(Long id) {
        CommentVo vo = commentMapper.selectCommentVoById(id);
        if (vo == null) {
            throw new ServiceException("评价不存在！");
        }
        return processCommentVo(vo);
    }

    /**
     * 获取评分统计：按酒店/房型维度统计各星级数量、平均分、总评论数
     */
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

    /**
     * 获取指定酒店的评分分布（各星级数量统计）
     */
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

    /**
     * 批量查询多个酒店的平均评分和总评论数
     */
    @Override
    public List<ScoreStatisticsVo> getHotelsAverageScore(List<Long> hotelIds) {
        if (hotelIds == null || hotelIds.isEmpty()) {
            return new ArrayList<>();
        }
        return commentMapper.selectHotelsAverageScore(hotelIds);
    }

    /**
     * 点赞/取消点赞（切换式）：已点赞则取消，未点赞则点赞
     * 同时更新 comment_like 表和 comment 表的 like_count 冗余字段
     * 返回 true=已点赞，false=已取消
     */
    @Override
    public boolean toggleLikeComment(Long commentId) {
        Comment comment = this.getById(commentId);
        if (comment == null) {
            throw new ServiceException("评价不存在！");
        }
        Long userId = SecurityUtils.getUserId();
        //是否已点赞
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

    /**
     * 查询某条评价的点赞用户列表（含用户名、头像、点赞时间）
     */
    @Override
    public List<CommentVo> getCommentLikes(Long commentId) {
        return commentMapper.selectCommentLikes(commentId);
    }

    /**
     * 审核评价（管理员）：设置评价状态为通过('1')或拒绝('2')
     */
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

    /**
     * 检查是否可评价：查询该订单是否已经有过评价记录
     * （注：订单完成状态由调用方在Controller层校验）
     */
    @Override
    public boolean canComment(Long userId, Long orderId) {
        Comment existing = commentMapper.selectByOrderId(orderId);
        if (existing != null) {
            return false; // 已评价过
        }
        return true;
    }

    /**
     * 修改自己的评价：校验权限后更新评分、内容、图片，状态重置为已发布
     */
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

    /**
     * 追加评价：在原评价内容后追加新内容，保留历史记录
     * 格式：原内容 + 【追加评价】yyyy年MM月dd日HH时mm分ss秒 + 新内容
     */
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
        String timestamp = new java.text.SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒").format(new Date());
        String newContent = (comment.getContent() != null ? comment.getContent() : "")
                + "\n\n【追加评价】" + timestamp + "\n" + content;
        comment.setContent(newContent);
        comment.setUpdateTime(new Date());
        comment.setUpdateBy(SecurityUtils.getUsername());
        if (!this.updateById(comment)) {
            throw new ServiceException("系统错误，评价追加失败！");
        }
    }

    /**
     * 删除自己的评价：校验评价归属权后物理删除
     */
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
    /**
     * 查询商户旗下酒店的评价：通过 merchant 表关联筛选，只能看到自己酒店的评价
     * 默认只查已发布(status='1')的评价
     */
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

    /**
     * 商家申诉评价：提交申诉理由，设置申诉状态为'申诉中'，每个评价只能申诉一次
     */
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

    /**
     * 按酒店分组查询评价统计（管理端左侧酒店列表用）：计算每家酒店的平均分和评论总数
     */
    @Override
    public List<CommentVo> queryCommentGroupByHotel(CommentQueryDto queryDto) {
        List<CommentVo> list = commentMapper.selectCommentGroupByHotel(queryDto);
        return list != null ? list : new ArrayList<>();
    }

    /**
     * 获取当前用户的评价统计：总评价数、平均评分、总获赞数
     */
    @Override
    public CommentVo getMyCommentStatistics() {
        Long userId = SecurityUtils.getUserId();
        return commentMapper.selectMyCommentStatistics(userId);
    }

    /**
     * 审核商家申诉（管理员）：
     * - 申诉通过(appealStatus='2')：评价下架(status='2')
     * - 申诉驳回(appealStatus='3')：评价保留(status='1')
     */
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
        // 申诉通过（认可商家）：隐藏该评价
        if (APPEAL_STATUS_APPROVED.equals(appealStatus)) {
            comment.setStatus(COMMENT_STATUS_REJECTED);
        }
        // 申诉驳回（不认可商家）：保留评价
        if (APPEAL_STATUS_REJECTED.equals(appealStatus)) {
            comment.setStatus(COMMENT_STATUS_PUBLISHED);
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
     * 处理CommentVo：查询当前用户是否已点赞该评价，并解析图片JSON数组为列表
     */
    private CommentVo processCommentVo(CommentVo vo) {
        // 检查当前用户是否已点赞
        try {
            Long currentUserId = SecurityUtils.getUserId();
            if (currentUserId != null && vo.getId() != null) {
                Long exists = commentMapper.selectCommentLikeExists(currentUserId, vo.getId());
                vo.setLiked(exists != null && exists > 0);
            }
        } catch (Exception e) {
            vo.setLiked(false);
        }

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

        return vo;
    }
}
