package com.zsc.module.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 评价实体类
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("biz_comment")
public class Comment {

    /**
     * 评价ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 酒店ID
     */
    private Long hotelId;

    /**
     * 房型ID（可选，针对具体房型的评价）
     */
    private Long roomId;

    /**
     * 订单ID（关联预订记录，用于校验入住完成）
     */
    private Long orderId;

    /**
     * 评分（1-5星）
     */
    private Integer score;

    /**
     * 评价内容
     */
    private String content;

    /**
     * 评价图片，JSON数组格式存储多个图片URL
     * 例如：["url1","url2"]
     */
    private String images;

    /**
     * 是否匿名评价（0=否 1=是）
     */
    private String isAnonymous;

    /**
     * 评价状态（0=待审核 1=已发布 2=已拒绝）
     */
    private String status;

    /**
     * 点赞数
     */
    private Integer likeCount;

    /**
     * 商家回复内容
     */
    private String replyContent;

    /**
     * 回复时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date replyTime;

    /**
     * 回复人ID
     */
    private Long replyBy;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 兼容旧前端：imgUrl getter 返回 images 中的第一张图片
     */
    public String getImgUrl() {
        if (images != null && !images.isEmpty() && !"[]".equals(images)) {
            try {
                // 简单解析JSON数组，取第一张
                String trimmed = images.trim();
                if (trimmed.startsWith("[") && trimmed.endsWith("]")) {
                    String inner = trimmed.substring(1, trimmed.length() - 1).trim();
                    if (!inner.isEmpty()) {
                        // 取第一个URL，去掉引号
                        String first = inner.split(",")[0].trim();
                        if (first.startsWith("\"") && first.endsWith("\"")) {
                            return first.substring(1, first.length() - 1);
                        }
                        return first;
                    }
                }
            } catch (Exception e) {
                return images;
            }
        }
        return images;
    }

    /**
     * 兼容旧前端：imgUrl setter
     */
    public void setImgUrl(String imgUrl) {
        if (imgUrl != null && !imgUrl.isEmpty()) {
            this.images = "[\"" + imgUrl + "\"]";
        }
    }
}
