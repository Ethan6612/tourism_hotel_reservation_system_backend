/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80404 (8.4.4)
 Source Host           : localhost:3306
 Source Schema         : zsc

 Target Server Type    : MySQL
 Target Server Version : 80404 (8.4.4)
 File Encoding         : 65001

 Date: 26/06/2026 20:58:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_category
-- ----------------------------
DROP TABLE IF EXISTS `biz_category`;
CREATE TABLE `biz_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `uk_category_name`(`category_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务类别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_category
-- ----------------------------
INSERT INTO `biz_category` VALUES (1, '商务酒店', 1, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (2, '度假酒店', 2, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (3, '民宿客栈', 3, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (4, '精品酒店', 4, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (5, '主题酒店', 5, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (6, '温泉酒店', 6, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (7, '青年旅舍', 7, '1', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (8, '公寓式酒店', 8, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (9, '电竞酒店', 9, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');
INSERT INTO `biz_category` VALUES (10, '亲子酒店', 10, '0', '2026-06-24 20:18:27', '2026-06-24 20:18:27');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `hotel_id` bigint NOT NULL COMMENT '酒店ID',
  `room_id` bigint NULL DEFAULT NULL COMMENT '房型ID',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单ID',
  `score` int NOT NULL COMMENT '评分（1-5星）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价内容',
  `images` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价图片JSON数组',
  `img_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片URL',
  `is_anonymous` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否匿名（0=否 1=是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0=待审核 1=已发布 2=已拒绝）',
  `like_count` int NULL DEFAULT 0 COMMENT '点赞数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `appeal_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申诉理由',
  `appeal_time` datetime NULL DEFAULT NULL COMMENT '申诉时间',
  `appeal_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申诉状态（0=无申诉 1=申诉中 2=通过 3=驳回）',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `reply_by` bigint NULL DEFAULT NULL COMMENT '回复人ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_room_id`(`room_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2485, 86, 131, NULL, 3, '景观很棒，视野开阔。', '[\"https://example.com/comment1.jpg\"]', 'https://example.com/comment1.jpg', '0', '1', 0, '2026-04-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2, 2025, 20, 286, NULL, 4, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-05-31 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-31 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (3, 2257, 34, 50, NULL, 5, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-04-08 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (4, 2023, 67, 60, NULL, 5, '泳池干净，健身房设备好。', NULL, NULL, '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-21 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (5, 2263, 35, 42, NULL, 4, '隔音效果不错，很安静。', '[\"https://example.com/comment5.jpg\"]', 'https://example.com/comment5.jpg', '0', '1', 0, '2026-05-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (6, 2184, 60, 304, NULL, 4, '性价比高，下次还会来。', NULL, NULL, '0', '1', 0, '2026-04-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-24 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (7, 2482, 83, 80, NULL, 5, '酒店很新，装修时尚。', NULL, NULL, '0', '1', 0, '2026-05-06 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-11 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (8, 2151, 28, 158, NULL, 4, '泳池干净，健身房设备好。', '[\"https://example.com/comment8.jpg\"]', 'https://example.com/comment8.jpg', '0', '1', 0, '2026-05-05 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-15 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (9, 2428, 43, 195, NULL, 4, '泳池干净，健身房设备好。', '[\"https://example.com/comment9.jpg\"]', 'https://example.com/comment9.jpg', '0', '1', 0, '2026-05-30 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (10, 2320, 76, 305, NULL, 3, '儿童设施齐全，适合亲子。', NULL, NULL, '0', '1', 0, '2026-04-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-30 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (11, 2364, 33, 158, NULL, 3, '还会再来的！', NULL, NULL, '0', '1', 0, '2026-05-12 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (12, 2056, 91, 64, NULL, 3, '卫生间干净，热水充足。', NULL, NULL, '0', '1', 0, '2026-04-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (13, 2055, 48, 19, NULL, 5, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (14, 2399, 8, 335, NULL, 4, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-05-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (15, 2407, 85, 273, NULL, 4, '隔音效果不错，很安静。', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (16, 2090, 72, 4, NULL, 5, '空调给力，温度适宜。', '[\"https://example.com/comment16.jpg\"]', 'https://example.com/comment16.jpg', '0', '1', 0, '2026-05-20 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-05 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (17, 2036, 56, 199, NULL, 3, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (18, 2271, 92, 330, NULL, 5, '还会再来的！', '[\"https://example.com/comment18.jpg\"]', 'https://example.com/comment18.jpg', '0', '1', 0, '2026-04-08 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (19, 2394, 90, 44, NULL, 5, '设施齐全，环境优雅。', NULL, NULL, '0', '1', 0, '2026-05-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (20, 2244, 86, 291, NULL, 4, '景观很棒，视野开阔。', NULL, NULL, '0', '1', 0, '2026-04-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-24 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (21, 2085, 90, 333, NULL, 3, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-05-03 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (22, 2360, 93, 161, NULL, 4, '设施齐全，环境优雅。', NULL, NULL, '0', '1', 0, '2026-04-07 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (23, 2005, 71, 170, NULL, 3, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-05-31 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (24, 2497, 66, 101, NULL, 4, '隔音效果不错，很安静。', NULL, NULL, '0', '1', 0, '2026-04-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-04 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (25, 2002, 8, 135, NULL, 5, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-06-01 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (26, 2092, 75, 64, NULL, 4, '儿童设施齐全，适合亲子。', '[\"https://example.com/comment26.jpg\"]', 'https://example.com/comment26.jpg', '0', '1', 0, '2026-05-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-10 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (27, 2113, 84, 165, NULL, 5, '早餐种类多，味道不错。', '[\"https://example.com/comment27.jpg\"]', 'https://example.com/comment27.jpg', '0', '1', 0, '2026-05-07 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (28, 2084, 39, 144, NULL, 5, '前台服务热情，停车方便。', '[\"https://example.com/comment28.jpg\"]', 'https://example.com/comment28.jpg', '0', '1', 0, '2026-04-22 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (29, 2268, 21, 148, NULL, 4, '性价比高，下次还会来。', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-14 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (30, 2294, 4, 138, NULL, 5, '性价比高，下次还会来。', NULL, NULL, '0', '1', 0, '2026-04-26 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (31, 2264, 53, 6, NULL, 4, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-06-01 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-16 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (32, 2302, 26, 158, NULL, 4, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-05-17 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-31 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (33, 2230, 5, 291, NULL, 3, '周边购物吃饭都很方便。', NULL, NULL, '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (34, 2180, 14, 207, NULL, 4, '还会再来的！', NULL, NULL, '0', '1', 0, '2026-05-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (35, 2204, 1, 272, NULL, 5, '位置便利，干净卫生，值得推荐。', '[\"https://example.com/comment35.jpg\"]', 'https://example.com/comment35.jpg', '0', '1', 0, '2026-05-03 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-10 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (36, 2033, 3, 318, NULL, 4, '酒店很新，装修时尚。', '[\"https://example.com/comment36.jpg\"]', 'https://example.com/comment36.jpg', '0', '1', 0, '2026-05-12 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-06 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (37, 2409, 40, 174, NULL, 3, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-04-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (38, 2264, 40, 135, NULL, 5, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-05-24 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (39, 2221, 56, 153, NULL, 4, '前台服务热情，停车方便。', '[\"https://example.com/comment39.jpg\"]', 'https://example.com/comment39.jpg', '0', '1', 0, '2026-05-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-14 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (40, 2127, 35, 330, NULL, 5, '周边购物吃饭都很方便。', '[\"https://example.com/comment40.jpg\"]', 'https://example.com/comment40.jpg', '0', '1', 0, '2026-06-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (41, 2183, 24, 32, NULL, 5, '卫生间干净，热水充足。', '[\"https://example.com/comment41.jpg\"]', 'https://example.com/comment41.jpg', '0', '1', 0, '2026-05-15 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (42, 2191, 27, 61, NULL, 3, '早餐种类多，味道不错。', NULL, NULL, '0', '1', 0, '2026-04-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (43, 2418, 12, 31, NULL, 3, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-05-14 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (44, 2295, 1, 94, NULL, 3, '儿童设施齐全，适合亲子。', '[\"https://example.com/comment44.jpg\"]', 'https://example.com/comment44.jpg', '0', '1', 0, '2026-05-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-21 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (45, 2352, 24, 27, NULL, 5, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-05-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (46, 2387, 67, 347, NULL, 5, '泳池干净，健身房设备好。', NULL, NULL, '0', '1', 0, '2026-05-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (47, 2353, 100, 297, NULL, 3, '服务态度很好，有求必应。', '[\"https://example.com/comment47.jpg\"]', 'https://example.com/comment47.jpg', '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (48, 2447, 11, 299, NULL, 5, '性价比高，下次还会来。', '[\"https://example.com/comment48.jpg\"]', 'https://example.com/comment48.jpg', '0', '1', 0, '2026-05-08 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-30 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (49, 2186, 49, 109, NULL, 3, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-05-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (50, 2241, 13, 60, NULL, 4, '早餐种类多，味道不错。', '[\"https://example.com/comment50.jpg\"]', 'https://example.com/comment50.jpg', '0', '1', 0, '2026-04-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-21 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (51, 2201, 78, 236, NULL, 3, '性价比高，下次还会来。', '[\"https://example.com/comment51.jpg\"]', 'https://example.com/comment51.jpg', '0', '1', 0, '2026-05-31 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (52, 2452, 17, 45, NULL, 3, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-05-12 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (53, 2234, 44, 276, NULL, 4, '儿童设施齐全，适合亲子。', '[\"https://example.com/comment53.jpg\"]', 'https://example.com/comment53.jpg', '0', '1', 0, '2026-05-08 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (54, 2238, 23, 250, NULL, 5, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-22 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-29 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (55, 2449, 1, 123, NULL, 5, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-05-14 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (56, 2456, 38, 47, NULL, 4, '床很舒服，睡得很好。', '[\"https://example.com/comment56.jpg\"]', 'https://example.com/comment56.jpg', '0', '1', 0, '2026-04-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (57, 2057, 51, 68, NULL, 4, '周边购物吃饭都很方便。', '[\"https://example.com/comment57.jpg\"]', 'https://example.com/comment57.jpg', '0', '1', 0, '2026-05-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-26 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (58, 2306, 30, 217, NULL, 3, '设施齐全，环境优雅。', NULL, NULL, '0', '1', 0, '2026-05-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-17 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (59, 2006, 46, 90, NULL, 5, '儿童设施齐全，适合亲子。', NULL, NULL, '0', '1', 0, '2026-05-22 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-06 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (60, 2112, 38, 66, NULL, 5, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (61, 2413, 11, 17, NULL, 5, '卫生间干净，热水充足。', NULL, NULL, '0', '1', 0, '2026-04-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-23 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (62, 2434, 33, 16, NULL, 3, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-04-24 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (63, 2286, 40, 88, NULL, 3, 'WiFi信号稳定，速度快。', '[\"https://example.com/comment63.jpg\"]', 'https://example.com/comment63.jpg', '0', '1', 0, '2026-05-29 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-16 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (64, 2058, 84, 289, NULL, 4, '周边购物吃饭都很方便。', NULL, NULL, '0', '1', 0, '2026-05-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (65, 2467, 38, 29, NULL, 3, '房间宽敞舒适，早餐丰富。', '[\"https://example.com/comment65.jpg\"]', 'https://example.com/comment65.jpg', '0', '1', 0, '2026-04-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (66, 2226, 71, 63, NULL, 5, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-05 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-04 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (67, 2261, 66, 253, NULL, 4, '还会再来的！', NULL, NULL, '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-20 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (68, 2495, 62, 35, NULL, 4, '还会再来的！', '[\"https://example.com/comment68.jpg\"]', 'https://example.com/comment68.jpg', '0', '1', 0, '2026-04-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-24 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (69, 2177, 86, 76, NULL, 4, '早餐种类多，味道不错。', '[\"https://example.com/comment69.jpg\"]', 'https://example.com/comment69.jpg', '0', '1', 0, '2026-05-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (70, 2228, 98, 172, NULL, 4, '性价比高，下次还会来。', NULL, NULL, '0', '1', 0, '2026-05-20 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-11 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (71, 2490, 67, 143, NULL, 3, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-05-05 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-15 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (72, 2114, 26, 205, NULL, 3, '位置便利，干净卫生，值得推荐。', '[\"https://example.com/comment72.jpg\"]', 'https://example.com/comment72.jpg', '0', '1', 0, '2026-04-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (73, 2364, 39, 265, NULL, 4, '儿童设施齐全，适合亲子。', NULL, NULL, '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (74, 2060, 16, 142, NULL, 4, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-05-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (75, 2038, 28, 51, NULL, 5, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-05-01 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-28 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (76, 2084, 34, 53, NULL, 5, '床很舒服，睡得很好。', NULL, NULL, '0', '1', 0, '2026-04-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (77, 2393, 75, 136, NULL, 5, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-05-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (78, 2012, 70, 143, NULL, 5, '空调给力，温度适宜。', '[\"https://example.com/comment78.jpg\"]', 'https://example.com/comment78.jpg', '0', '1', 0, '2026-06-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (79, 2249, 1, 182, NULL, 4, '景观很棒，视野开阔。', NULL, NULL, '0', '1', 0, '2026-05-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-28 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (80, 2408, 56, 106, NULL, 5, '床很舒服，睡得很好。', NULL, NULL, '0', '1', 0, '2026-04-14 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-06-02 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (81, 2211, 4, 315, NULL, 4, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (82, 2343, 96, 257, NULL, 5, '儿童设施齐全，适合亲子。', NULL, NULL, '0', '1', 0, '2026-04-17 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-04 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (83, 2334, 37, 279, NULL, 5, '房间宽敞舒适，早餐丰富。', '[\"https://example.com/comment83.jpg\"]', 'https://example.com/comment83.jpg', '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-11 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (84, 2271, 42, 165, NULL, 3, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-04-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (85, 2266, 41, 153, NULL, 5, '隔音效果不错，很安静。', NULL, NULL, '0', '1', 0, '2026-05-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (86, 2072, 63, 238, NULL, 4, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (87, 2285, 54, 333, NULL, 3, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (88, 2330, 34, 234, NULL, 4, '服务态度很好，有求必应。', NULL, NULL, '0', '1', 0, '2026-05-30 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (89, 2082, 55, 89, NULL, 4, '床很舒服，睡得很好。', '[\"https://example.com/comment89.jpg\"]', 'https://example.com/comment89.jpg', '0', '1', 0, '2026-05-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-16 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (90, 2383, 5, 321, NULL, 4, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-04-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-20 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (91, 2138, 3, 97, NULL, 3, '服务态度很好，有求必应。', '[\"https://example.com/comment91.jpg\"]', 'https://example.com/comment91.jpg', '0', '1', 0, '2026-04-22 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (92, 2335, 92, 190, NULL, 5, '设施齐全，环境优雅。', NULL, NULL, '0', '1', 0, '2026-04-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (93, 2189, 53, 173, NULL, 5, '还会再来的！', NULL, NULL, '0', '1', 0, '2026-05-31 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (94, 2117, 11, 286, NULL, 5, '景观很棒，视野开阔。', NULL, NULL, '0', '1', 0, '2026-04-14 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (95, 2204, 17, 207, NULL, 4, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-05-07 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (96, 2322, 65, 105, NULL, 4, '早餐种类多，味道不错。', '[\"https://example.com/comment96.jpg\"]', 'https://example.com/comment96.jpg', '0', '1', 0, '2026-05-30 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (97, 2201, 68, 51, NULL, 5, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-05-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-10 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (98, 2165, 33, 213, NULL, 3, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-05-20 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (99, 2248, 16, 94, NULL, 5, '周边购物吃饭都很方便。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-05 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (100, 2103, 15, 45, NULL, 3, '空调给力，温度适宜。', NULL, NULL, '0', '1', 0, '2026-04-18 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (101, 2156, 15, 272, NULL, 4, '早餐种类多，味道不错。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (102, 2494, 54, 252, NULL, 5, '服务态度很好，有求必应。', NULL, NULL, '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (103, 2483, 57, 317, NULL, 5, '隔音效果不错，很安静。', '[\"https://example.com/comment103.jpg\"]', 'https://example.com/comment103.jpg', '0', '1', 0, '2026-05-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (104, 2124, 7, 194, NULL, 4, '设施齐全，环境优雅。', NULL, NULL, '0', '1', 0, '2026-04-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (105, 2124, 62, 117, NULL, 5, '位置便利，干净卫生，值得推荐。', '[\"https://example.com/comment105.jpg\"]', 'https://example.com/comment105.jpg', '0', '1', 0, '2026-05-22 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (106, 2046, 45, 329, NULL, 4, '还会再来的！', '[\"https://example.com/comment106.jpg\"]', 'https://example.com/comment106.jpg', '0', '1', 0, '2026-05-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (107, 2218, 77, 174, NULL, 3, '隔音效果不错，很安静。', '[\"https://example.com/comment107.jpg\"]', 'https://example.com/comment107.jpg', '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-25 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (108, 2163, 77, 291, NULL, 5, '泳池干净，健身房设备好。', NULL, NULL, '0', '1', 0, '2026-04-27 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (109, 2376, 59, 242, NULL, 5, '床很舒服，睡得很好。', NULL, NULL, '0', '1', 0, '2026-04-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (110, 2323, 2, 42, NULL, 4, '隔音效果不错，很安静。', NULL, NULL, '0', '1', 0, '2026-05-01 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (111, 2384, 48, 33, NULL, 3, '泳池干净，健身房设备好。', NULL, NULL, '0', '1', 0, '2026-04-07 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (112, 2382, 56, 168, NULL, 5, '设施齐全，环境优雅。', '[\"https://example.com/comment112.jpg\"]', 'https://example.com/comment112.jpg', '0', '1', 0, '2026-04-19 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (113, 2100, 79, 112, NULL, 3, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-05-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (114, 2086, 31, 6, NULL, 3, '服务态度很好，有求必应。', NULL, NULL, '0', '1', 0, '2026-04-23 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (115, 2445, 57, 50, NULL, 3, '酒店很新，装修时尚。', NULL, NULL, '0', '1', 0, '2026-04-17 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-15 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (116, 2139, 56, 331, NULL, 3, '卫生间干净，热水充足。', '[\"https://example.com/comment116.jpg\"]', 'https://example.com/comment116.jpg', '0', '1', 0, '2026-04-25 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (117, 2395, 4, 286, NULL, 5, '景观很棒，视野开阔。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (118, 2112, 3, 162, NULL, 3, '儿童设施齐全，适合亲子。', NULL, NULL, '0', '1', 0, '2026-05-12 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (119, 2272, 32, 332, NULL, 5, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-05-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (120, 2052, 97, 179, NULL, 4, '儿童设施齐全，适合亲子。', '[\"https://example.com/comment120.jpg\"]', 'https://example.com/comment120.jpg', '0', '1', 0, '2026-04-20 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-06-02 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (121, 2112, 12, 312, NULL, 3, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-05-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (122, 2478, 21, 48, NULL, 3, '还会再来的！', '[\"https://example.com/comment122.jpg\"]', 'https://example.com/comment122.jpg', '0', '1', 0, '2026-04-26 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-21 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (123, 2246, 26, 271, NULL, 3, '设施齐全，环境优雅。', '[\"https://example.com/comment123.jpg\"]', 'https://example.com/comment123.jpg', '0', '1', 0, '2026-05-13 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (124, 2262, 17, 84, NULL, 5, '泳池干净，健身房设备好。', '[\"https://example.com/comment124.jpg\"]', 'https://example.com/comment124.jpg', '0', '1', 0, '2026-05-17 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (125, 2231, 20, 208, NULL, 4, '房间宽敞舒适，早餐丰富。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (126, 2227, 85, 297, NULL, 5, '还会再来的！', '[\"https://example.com/comment126.jpg\"]', 'https://example.com/comment126.jpg', '0', '1', 0, '2026-06-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (127, 2286, 92, 307, NULL, 4, '隔音效果不错，很安静。', NULL, NULL, '0', '1', 0, '2026-04-30 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (128, 2206, 23, 308, NULL, 5, '还会再来的！', '[\"https://example.com/comment128.jpg\"]', 'https://example.com/comment128.jpg', '0', '1', 0, '2026-04-09 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (129, 2425, 39, 130, NULL, 5, '景观很棒，视野开阔。', NULL, NULL, '0', '1', 0, '2026-05-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (130, 2256, 16, 84, NULL, 5, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-06-02 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (131, 2070, 30, 24, NULL, 4, '非常满意，服务很好！', '[\"https://example.com/comment131.jpg\"]', 'https://example.com/comment131.jpg', '0', '1', 0, '2026-04-24 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (132, 2190, 98, 263, NULL, 5, '泳池干净，健身房设备好。', NULL, NULL, '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (133, 2408, 58, 149, NULL, 4, '酒店很新，装修时尚。', NULL, NULL, '0', '1', 0, '2026-05-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (134, 2245, 64, 240, NULL, 4, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-04-04 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (135, 2260, 32, 1, NULL, 3, '床很舒服，睡得很好。', NULL, NULL, '0', '1', 0, '2026-06-01 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (136, 2238, 90, 14, NULL, 4, '卫生间干净，热水充足。', NULL, NULL, '0', '1', 0, '2026-04-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (137, 2110, 59, 87, NULL, 4, '服务态度很好，有求必应。', NULL, NULL, '0', '1', 0, '2026-05-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-07 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (138, 2164, 95, 258, NULL, 5, '非常满意，服务很好！', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (139, 2135, 10, 230, NULL, 5, '还会再来的！', NULL, NULL, '0', '1', 0, '2026-05-28 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (140, 2412, 55, 83, NULL, 4, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-05-24 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (141, 2077, 38, 138, NULL, 5, '位置便利，干净卫生，值得推荐。', '[\"https://example.com/comment141.jpg\"]', 'https://example.com/comment141.jpg', '0', '1', 0, '2026-05-05 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-04 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (142, 2215, 18, 206, NULL, 4, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-16 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-07 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (143, 2432, 67, 253, NULL, 4, '性价比很高，超出预期。', '[\"https://example.com/comment143.jpg\"]', 'https://example.com/comment143.jpg', '0', '1', 0, '2026-05-10 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (144, 2346, 47, 89, NULL, 5, 'WiFi信号稳定，速度快。', NULL, NULL, '0', '1', 0, '2026-05-12 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, '2026-05-04 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (145, 2064, 72, 64, NULL, 5, '前台服务热情，停车方便。', NULL, NULL, '0', '1', 0, '2026-04-11 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (146, 2286, 63, 138, NULL, 3, '床很舒服，睡得很好。', NULL, NULL, '0', '1', 0, '2026-04-29 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (147, 2416, 71, 9, NULL, 3, '性价比很高，超出预期。', NULL, NULL, '0', '1', 0, '2026-04-30 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (148, 2175, 39, 300, NULL, 3, '位置便利，干净卫生，值得推荐。', NULL, NULL, '0', '1', 0, '2026-04-14 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (149, 2418, 10, 335, NULL, 4, '酒店很新，装修时尚。', '[\"https://example.com/comment149.jpg\"]', 'https://example.com/comment149.jpg', '0', '1', 0, '2026-04-15 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', '2026-05-20 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (150, 2292, 54, 331, NULL, 3, '酒店很新，装修时尚。', NULL, NULL, '0', '1', 0, '2026-05-21 00:30:58', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的评价，我们会继续努力！', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (151, 305, 1, 1, 1, 5, '北京希尔顿非常棒！房间宽敞明亮，前台服务专业，早餐种类丰富。特别感谢礼宾部帮我规划了故宫的游玩路线，下次出差还住这里！', '[\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop\"]', NULL, '0', '1', 9, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的好评！我们会继续努力为每一位宾客提供优质服务，期待您的再次光临！', '2026-06-23 08:57:53', 301, NULL);
INSERT INTO `comment` VALUES (152, 305, 2, 3, 2, 4, '上海华尔道夫的外滩景观名不虚传，视野无敌。房间装修奢华有质感，就是价格确实高了些。整体体验很不错，推荐给来上海旅游的朋友。', '[\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', NULL, '0', '1', 6, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的认可！外滩全景客房确实是我们的招牌，期待下次为您提供更完美的入住体验。', '2026-06-23 08:57:53', 302, NULL);
INSERT INTO `comment` VALUES (153, 306, 3, 5, 3, 3, '广州丽思卡尔顿整体中规中矩，房间设施略显老旧。但是服务人员态度很好，有求必应。早餐的广式点心很正宗，算是加分项。性价比一般。', '[]', NULL, '0', '1', 2, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的宝贵意见！关于房间设施的问题我们已经安排逐步翻新，期待您下次来感受全新的入住体验。', '2026-06-23 08:57:53', 303, NULL);
INSERT INTO `comment` VALUES (154, 306, 5, 8, 4, 5, '杭州西湖国宾馆真的是人间仙境！在湖边吃早餐太享受了，园林设计非常精致。房间古色古香但不失舒适。这次出差特意选了这里，值了！', '[\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&h=300&fit=crop\"]', NULL, '0', '1', 12, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '西湖四季皆美，很高兴您能感受到国宾馆的诗意。欢迎您随时回来！', '2026-06-23 08:57:53', 304, NULL);
INSERT INTO `comment` VALUES (155, 307, 4, 6, 5, 4, '深圳香格里拉位置很好，福田中心区出差很方便。酒店设施齐全，游泳池很干净。就是办理入住时等待时间有点长，希望改善。', '[]', NULL, '0', '1', 3, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '非常抱歉给您带来了等待的不便！我们已经优化了入住流程，期待您再次光临！', '2026-06-23 08:57:53', NULL, NULL);
INSERT INTO `comment` VALUES (156, 307, 6, 10, 6, 5, '成都太古里尼依格罗太棒了！位置就在太古里旁边，逛街吃饭超方便。酒店设计很有格调，年轻时尚。前台小帅哥推荐的火锅店绝了，下次来成都必住！', '[\"https://images.unsplash.com/photo-1523961131990-5ea7c61b2107?w=400&h=300&fit=crop\",\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', NULL, '0', '1', 18, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '成都的美食和美景都让人流连忘返，很高兴您选择了我们！期待您的再次光临！', '2026-06-23 08:57:53', NULL, NULL);
INSERT INTO `comment` VALUES (157, 308, 1, 2, 7, 5, '北京希尔顿的行政套房太宽敞了！行政酒廊的下午茶和晚间鸡尾酒都很精致。服务人员专业热情，还帮我免费打印了会议资料。五星推荐！', '[\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop\"]', NULL, '0', '1', 10, '2026-06-23 08:57:53', NULL, NULL, NULL, NULL, NULL, '0', '很高兴您对行政酒廊的服务感到满意！我们一直致力于为商务旅客提供最便捷的服务，欢迎再次光临！', '2026-06-23 08:57:53', 301, NULL);
INSERT INTO `comment` VALUES (158, 310, 4, 13, 163, 5, '深圳香格里拉位置超棒！行政双床房空间很大，服务人员热情周到。顶楼游泳池view很棒，能看到整个福田CBD的天际线。性价比很高，强烈推荐！', '[]', NULL, '0', '1', 6, '2026-06-18 14:00:00', NULL, NULL, NULL, NULL, NULL, '0', '感谢您对香格里拉的认可！顶楼泳池确实是我们的招牌设施，欢迎再次入住！', '2026-06-18 16:00:00', NULL, NULL);
INSERT INTO `comment` VALUES (159, 310, 6, 19, 166, 4, '成都锦城大酒店位置方便，就在太古里旁边。房间装修风格现代简约，设施齐全。早餐种类丰富，担担面很正宗！唯一不足是空调声音稍大。', '[]', NULL, '0', '1', 3, '2026-06-13 10:00:00', NULL, NULL, NULL, NULL, NULL, '0', '感谢您的反馈！关于空调噪音问题我们已安排工程部检修。期待您再次光临！', '2026-06-13 14:00:00', NULL, NULL);
INSERT INTO `comment` VALUES (160, 310, 3, 8, 162, 5, '广州丽思卡尔顿果然名不虚传！豪华大床房的床品超级舒服，行政酒廊的甜品精致到不忍心吃。窗外就是珠江夜景，太美了！已经推荐给身边的朋友了。', '[\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', NULL, '0', '1', 9, '2026-06-25 12:00:00', NULL, NULL, NULL, NULL, NULL, '0', '感谢onz的五星好评！很高兴您喜欢我们的行政酒廊和珠江夜景，期待您的再次光临！', '2026-06-25 15:00:00', 302, NULL);
INSERT INTO `comment` VALUES (161, 2, 4, 12, 171, 5, '非常棒的入住体验！酒店大堂豪华气派，前台服务热情周到。房间宽敞明亮，床品舒适，窗外能看到深圳CBD的夜景，非常壮观。早餐种类丰富，中西合璧。下次来深圳还会选择这里！', NULL, NULL, '0', '1', 3, '2026-06-15 14:30:00', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'customer01');
INSERT INTO `comment` VALUES (162, 2, 2, 4, 169, 5, '华尔道夫不愧是顶级奢华酒店，位置绝佳，步行就能到外滩。房间古典优雅，设施一流。管家服务非常贴心，到达时已经准备好了欢迎水果和手写卡片。浴室的备品是菲拉格慕的，细节满分。强烈推荐！', NULL, NULL, '0', '1', 5, '2026-07-09 10:15:00', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'customer01');
INSERT INTO `comment` VALUES (163, 2, 3, 8, 170, 4, '房间很不错，设施齐全，服务态度也很好。唯一的小遗憾是入住时等了一会儿，不过总体来说是一次愉快的体验。酒店位置很好，交通便利，周边吃的也多。', NULL, NULL, '0', '1', 1, '2026-07-21 09:00:00', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'customer01');

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '点赞用户ID',
  `comment_id` bigint NOT NULL COMMENT '评价ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_comment`(`user_id` ASC, `comment_id` ASC) USING BTREE,
  INDEX `idx_comment_id`(`comment_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评价点赞表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES (6, 305, 152, '2026-06-23 17:33:09');
INSERT INTO `comment_like` VALUES (7, 305, 151, '2026-06-23 17:33:17');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '酒店ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '酒店地址',
  `star` int NULL DEFAULT NULL COMMENT '酒店星级',
  `score` decimal(3, 2) NULL DEFAULT NULL COMMENT '酒店评分',
  `img_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店图片URL',
  `facility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店设施',
  `business_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1051 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '麦新格精品酒店(上海浦东国际机场店)', '上海市浦东新区世纪大道100号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/001_麦新格精品酒店(上海浦东国际机场店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (2, '上海金普顿前滩酒店', '上海市浦东新区世纪大道100号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/002_上海金普顿前滩酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (3, '上海静安寺南京西路CitiGO欢阁酒店', '上海市浦东新区世纪大道100号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/003_上海静安寺南京西路CitiGO欢阁酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (4, '上海浦东香格里拉大酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/004_上海浦东香格里拉大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (5, '船长五号青年酒店（上海中山公园江苏路地铁站店）', '上海市浦东新区世纪大道100号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/005_船长五号青年酒店（上海中山公园江苏路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (6, '上海美逸濠酒店（奉贤金汇龙湖天街店）', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/006_上海美逸濠酒店（奉贤金汇龙湖天街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (7, '上海外滩南京东路亚朵酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/007_上海外滩南京东路亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (8, '唯庭世纪酒店(上海静安寺淮海中路店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/008_唯庭世纪酒店(上海静安寺淮海中路店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (9, '上海东方滨江大酒店(国际会议中心)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/009_上海东方滨江大酒店(国际会议中心).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (10, '如家YUNIK酒店(上海杨浦大学城武东路店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/010_如家YUNIK酒店(上海杨浦大学城武东路店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (11, '上海绿发JW万豪侯爵酒店', '上海市浦东新区世纪大道100号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/011_上海绿发JW万豪侯爵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (12, '维也纳国际酒店(上海浦东机场店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/012_维也纳国际酒店(上海浦东机场店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (13, '上海中庚聚龙酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/013_上海中庚聚龙酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (14, '上海徐家汇中心虹桥路地铁站曼禾酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/014_上海徐家汇中心虹桥路地铁站曼禾酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (15, '上海南京东路铂金万澳酒店', '上海市浦东新区世纪大道100号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/015_上海南京东路铂金万澳酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (16, '上海浦东嘉里大酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/016_上海浦东嘉里大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (17, '丽呈睿轩酒店(上海国际旅游度假区川沙地铁站店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/017_丽呈睿轩酒店(上海国际旅游度假区川沙地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (18, '上海凯宾斯基大酒店', '上海市浦东新区世纪大道100号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/018_上海凯宾斯基大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (19, 'Star星阁酒店（上海浦东国际机场核心区川南奉公路店）', '上海市浦东新区世纪大道100号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/019_Star星阁酒店（上海浦东国际机场核心区川南奉公路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (20, '全季酒店(上海外滩金陵东路店)', '上海市浦东新区世纪大道100号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/020_全季酒店(上海外滩金陵东路店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (21, '丽呈睿轩酒店(上海曹路民雷路地铁站店)', '上海市浦东新区世纪大道100号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/021_丽呈睿轩酒店(上海曹路民雷路地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (22, '全季酒店(上海外滩山东中路店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/022_全季酒店(上海外滩山东中路店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (23, '上海南京路步行街锦江都城南京饭店', '上海市浦东新区世纪大道100号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/023_上海南京路步行街锦江都城南京饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (24, '全季酒店(上海人民广场南京路店)', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/024_全季酒店(上海人民广场南京路店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (25, '上海虹桥温德姆酒店', '上海市浦东新区世纪大道100号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/025_上海虹桥温德姆酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (26, '上海宝格丽酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/026_上海宝格丽酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (27, '怀梦Dream Harbor酒店（上海国际旅游度假区店）', '上海市浦东新区世纪大道100号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/027_怀梦Dream Harbor酒店（上海国际旅游度假区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (28, '上海静安洲际酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/028_上海静安洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (29, '上海天益宾馆(五角场店）', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/029_上海天益宾馆(五角场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (30, '上海外滩滨江珍宝酒店', '上海市浦东新区世纪大道100号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/030_上海外滩滨江珍宝酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (31, '速8酒店(北京顺义石门地铁站店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/031_速8酒店(北京顺义石门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (32, '汉庭酒店(北京朝阳八里桥地铁站店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/032_汉庭酒店(北京朝阳八里桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (33, '汉庭酒店(北京三元桥燕莎使馆区店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/033_汉庭酒店(北京三元桥燕莎使馆区店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (34, '速8精选酒店(北京西站六里桥地铁站店)', '北京市朝阳区建国路93号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/034_速8精选酒店(北京西站六里桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (35, '北京贵宾楼饭店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/035_北京贵宾楼饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (36, '莫泰168(北京立水桥地铁站店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/036_莫泰168(北京立水桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (37, '北京通州皇冠假日酒店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/037_北京通州皇冠假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (38, '北京丽晶酒店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/038_北京丽晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (39, '飘HOME酒店(北京天安门广场前门店)', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/039_飘HOME酒店(北京天安门广场前门店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (40, '北京远航花园酒店（北京大兴国际机场店）', '北京市朝阳区建国路93号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/040_北京远航花园酒店（北京大兴国际机场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (41, '喆啡酒店(北京朝阳高铁站东广场东坝南地铁站店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/041_喆啡酒店(北京朝阳高铁站东广场东坝南地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (42, '北京南京大饭店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/042_北京南京大饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (43, '北京励骏酒店', '北京市朝阳区建国路93号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/043_北京励骏酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (44, '北京索菲特大酒店', '北京市朝阳区建国路93号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/044_北京索菲特大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (45, '北京金融街威斯汀大酒店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/045_北京金融街威斯汀大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (46, '优选酒店(北京东坝南地铁站朝阳高铁站东广场店)', '北京市朝阳区建国路93号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/046_优选酒店(北京东坝南地铁站朝阳高铁站东广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (47, '北京首都宾馆', '北京市朝阳区建国路93号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/047_北京首都宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (48, '北京南站右安门桥亚朵酒店', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/048_北京南站右安门桥亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (49, '秋果酒店(北京望京798艺术区店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/049_秋果酒店(北京望京798艺术区店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (50, '美宸酒店(北京大兴国际机场航站楼店)', '北京市朝阳区建国路93号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/050_美宸酒店(北京大兴国际机场航站楼店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (51, '麗枫酒店(北京房山长阳地铁站店)', '北京市朝阳区建国路93号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/051_麗枫酒店(北京房山长阳地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (52, '北京燕莎中心凯宾斯基饭店', '北京市朝阳区建国路93号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/052_北京燕莎中心凯宾斯基饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (53, '北京新侨饭店', '北京市朝阳区建国路93号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/053_北京新侨饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (54, '大方瑞廷西郊酒店(北京西站丽泽商务区店)', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/054_大方瑞廷西郊酒店(北京西站丽泽商务区店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (55, '卓雅花园酒店(北京总部基地大葆台地铁站店)', '北京市朝阳区建国路93号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/055_卓雅花园酒店(北京总部基地大葆台地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (56, '北京JW万豪酒店', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/056_北京JW万豪酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (57, '朗丽兹酒店（北京传媒大学双桥地铁站店）', '北京市朝阳区建国路93号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/057_朗丽兹酒店（北京传媒大学双桥地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (58, '北京天坛漫心酒店', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/058_北京天坛漫心酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (59, '宜必思酒店(北京天安门广场店）', '北京市朝阳区建国路93号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/059_宜必思酒店(北京天安门广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (60, '北京前门万达颐华酒店', '北京市朝阳区建国路93号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/060_北京前门万达颐华酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (61, '亦枫(广州新白云国际机场T2T3航站楼店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/061_亦枫(广州新白云国际机场T2T3航站楼店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (62, '云季轻居HOTEL(广州海珠万达逸景路地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/062_云季轻居HOTEL(广州海珠万达逸景路地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (63, '囍·啡酒店(琶洲会展广州塔店)', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/063_囍·啡酒店(琶洲会展广州塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (64, '壹加壹精品(广州新白云国际机场T2T3航站楼店)', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/064_壹加壹精品(广州新白云国际机场T2T3航站楼店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (65, '波恩(广州新白云国际机场T2T3航站楼店)', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/065_波恩(广州新白云国际机场T2T3航站楼店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (66, '广州粤海喜来登酒店', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/066_广州粤海喜来登酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (67, '雅致酒店(珠江新城店)', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/067_雅致酒店(珠江新城店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (68, '宜尚PLUS酒店（广州北京路步行街大佛古寺店）', '广州市天河区珠江新城花城大道66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/068_宜尚PLUS酒店（广州北京路步行街大佛古寺店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (69, '如家酒店(广州塔海珠万达广场店)', '广州市天河区珠江新城花城大道66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/069_如家酒店(广州塔海珠万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (70, '广州富力丽思卡尔顿酒店', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/070_广州富力丽思卡尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (71, '广州白云国际机场希尔顿惠庭酒店', '广州市天河区珠江新城花城大道66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/071_广州白云国际机场希尔顿惠庭酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (72, '广州塔琶洲会展宏阳·麗悦酒店', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/072_广州塔琶洲会展宏阳·麗悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (73, '广州W酒店', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/073_广州W酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (74, '柏曼（广州北京路步行街东湖地铁站店）', '广州市天河区珠江新城花城大道66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/074_柏曼（广州北京路步行街东湖地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (75, '栢里酒店（广州北京路上下九步行街店）', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/075_栢里酒店（广州北京路上下九步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (76, '桔子酒店(广州淘金区庄地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/076_桔子酒店(广州淘金区庄地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (77, 'From·K欢凯酒店（广州正佳广场体育西路地铁站店）', '广州市天河区珠江新城花城大道66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/077_From·K欢凯酒店（广州正佳广场体育西路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (78, '漫豪思酒店(广州北京路步行街纪念堂地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/078_漫豪思酒店(广州北京路步行街纪念堂地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (79, '广州雅诗阁琶洲服务公寓', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/079_广州雅诗阁琶洲服务公寓.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (80, '广州柏悦酒店', '广州市天河区珠江新城花城大道66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/080_广州柏悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (81, '宜致酒店（广州番禺长隆南村万博地铁站店）', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/081_宜致酒店（广州番禺长隆南村万博地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (82, '广州文华东方酒店', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/082_广州文华东方酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (83, 'Wilton威来登公寓(广州太古汇岗顶地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/083_Wilton威来登公寓(广州太古汇岗顶地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (84, '创时代酒店(广州天河智慧城地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/084_创时代酒店(广州天河智慧城地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (85, '广州北京路步行街中华广场格芮酒店', '广州市天河区珠江新城花城大道66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/085_广州北京路步行街中华广场格芮酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (86, '泊隐云舍酒店（广州高铁南站洛溪地铁站店）', '广州市天河区珠江新城花城大道66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/086_泊隐云舍酒店（广州高铁南站洛溪地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (87, 'CityNote希诺酒店(广州北京路纪念堂地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/087_CityNote希诺酒店(广州北京路纪念堂地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (88, '麗枫酒店(广州太古汇广场石牌桥地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/088_麗枫酒店(广州太古汇广场石牌桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (89, '中青·秋果酒店(广州北京路步行街纪念堂地铁站店)', '广州市天河区珠江新城花城大道66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/089_中青·秋果酒店(广州北京路步行街纪念堂地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (90, '维斯汀公寓(广州南站店)', '广州市天河区珠江新城花城大道66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/090_维斯汀公寓(广州南站店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (91, '维也纳酒店(深圳北站龙华人民南路店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/091_维也纳酒店(深圳北站龙华人民南路店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (92, '青木·影音｜AESTHETIC·DESIGNER拾光轻奢逸居(深圳万象城店)', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/092_青木·影音｜AESTHETIC·DESIGNER拾光轻奢逸居(深圳万象城店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (93, '朗华影音·高空云端城景｜City·View逸居（深圳福田会展中心店）', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/093_朗华影音·高空云端城景｜City·View逸居（深圳福田会展中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (94, '深圳罗湖口岸万象城亚朵酒店', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/094_深圳罗湖口岸万象城亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (95, '橙果酒店(深圳罗湖东门老街店)', '深圳市福田区深南大道6013号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/095_橙果酒店(深圳罗湖东门老街店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (96, '深圳福田香格里拉大酒店', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/096_深圳福田香格里拉大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (97, '深圳福田中洲湾城际酒店', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/097_深圳福田中洲湾城际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (98, '深圳夏日酒店(福田口岸沙尾地铁站店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/098_深圳夏日酒店(福田口岸沙尾地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (99, '米漾酒店（福田会展中心岗厦地铁站店）', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/099_米漾酒店（福田会展中心岗厦地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (100, '深圳深铁雅高铂尔曼酒店', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1000_真美度假客栈(大理洱海悬崖海景店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (101, '丽呈朗誉酒店(深圳龙岗中心大运新城店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1010_大理洱海天域英迪格酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (102, '悦巢HOTEL(深圳北站6979商业中心店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1020_熙宿·Calm Manor设计师美学民宿（大理古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (103, '格姆顿·fashion悦居(深圳北站汇徳公寓店)', '深圳市福田区深南大道6013号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1030_泊悦欢廷度假酒店（丽江古城南门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (104, '深圳华侨城洲际大酒店', '深圳市福田区深南大道6013号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1040_晚柠丨慢时光·Villa 雪山观景度假庭院（丽江束河古镇店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (105, '深圳南山威尼斯英迪格酒店', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1050_古井•侘寂风日照金山美学设计师360度古城雪山屋顶咖啡美宿.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (106, '麗枫酒店(深圳国际会展中心店)', '深圳市福田区深南大道6013号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/106_麗枫酒店(深圳国际会展中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (107, '东枫山海·高空云端城景｜City·View逸居（福田华强北地铁站店）', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/107_东枫山海·高空云端城景｜City·View逸居（福田华强北地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (108, '卡罗酒店(深圳东门步行街晒布地铁站店)', '深圳市福田区深南大道6013号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/108_卡罗酒店(深圳东门步行街晒布地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (109, '深圳华怡HOTEL（体育中心八卦岭地铁站店）', '深圳市福田区深南大道6013号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/109_深圳华怡HOTEL（体育中心八卦岭地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (110, '深圳福田皇岗城际酒店', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/110_深圳福田皇岗城际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (111, '古树里酒店式公寓(甘坑古镇店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/111_古树里酒店式公寓(甘坑古镇店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (112, '陌上雅居酒店（深圳罗湖东门老街店）', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/112_陌上雅居酒店（深圳罗湖东门老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (113, '深圳山海朗华酒店(前海购物中心山姆会员超市前海店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/113_深圳山海朗华酒店(前海购物中心山姆会员超市前海店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (114, '瑞澜•庭院|AESTHETIC•DESIGNER城景府邸(深圳龙华茜坑地铁站店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/114_瑞澜•庭院_AESTHETIC•DESIGNER城景府邸(深圳龙华茜坑地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (115, '雅朵轻居公寓(深圳北站店)', '深圳市福田区深南大道6013号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/115_雅朵轻居公寓(深圳北站店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (116, '深圳瑞吉酒店', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/116_深圳瑞吉酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (117, '锦森酒店(深圳宝安国际会展中心店)', '深圳市福田区深南大道6013号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/117_锦森酒店(深圳宝安国际会展中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (118, '卓邦酒店（深圳罗湖口岸万象城店）', '深圳市福田区深南大道6013号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/118_卓邦酒店（深圳罗湖口岸万象城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (119, '深圳滨河时代萨和酒店', '深圳市福田区深南大道6013号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/119_深圳滨河时代萨和酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (120, '菲酒店(深圳北站壹城中心店)', '深圳市福田区深南大道6013号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/120_菲酒店(深圳北站壹城中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (121, '杭州西湖湖滨金苑宾馆', '杭州市上城区西湖大道333号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/121_杭州西湖湖滨金苑宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (122, '杭州西湖湖滨南宋御街雷迪森怿曼酒店', '杭州市上城区西湖大道333号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/122_杭州西湖湖滨南宋御街雷迪森怿曼酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (123, '五星湾酒店（杭州西湖湖滨涌金广场店）', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/123_五星湾酒店（杭州西湖湖滨涌金广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (124, '杭州君悦酒店', '杭州市上城区西湖大道333号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/124_杭州君悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (125, '画舍酒店（西湖湖滨河坊街店）', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/125_画舍酒店（西湖湖滨河坊街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (126, '全季酒店(杭州西湖湖滨步行街店)', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/126_全季酒店(杭州西湖湖滨步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (127, '静湖居酒店(杭州东站西湖文化广场店)', '杭州市上城区西湖大道333号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/127_静湖居酒店(杭州东站西湖文化广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (128, '杭州西湖区 Orchid Retreat 兰栖畔度假酒店(下宁桥地铁站店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/128_杭州西湖区 Orchid Retreat 兰栖畔度假酒店(下宁桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (129, '杭州索菲特西湖大酒店', '杭州市上城区西湖大道333号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/129_杭州索菲特西湖大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (130, '全季酒店(杭州西湖湖滨解放路店)', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/130_全季酒店(杭州西湖湖滨解放路店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (131, '杭州忆晶轻居酒店（东方茂店）', '杭州市上城区西湖大道333号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/131_杭州忆晶轻居酒店（东方茂店）.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (132, '如家酒店(杭州四季青服装市场庆春东路店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/132_如家酒店(杭州四季青服装市场庆春东路店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (133, '桔子水晶杭州西湖武林广场酒店', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/133_桔子水晶杭州西湖武林广场酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (134, '杭州西湖大华饭店', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/134_杭州西湖大华饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (135, '杭州吉湖雅朵酒店（西湖湖滨in77店）', '杭州市上城区西湖大道333号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/135_杭州吉湖雅朵酒店（西湖湖滨in77店）.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (136, '如家酒店·neo(杭州西湖湖滨银泰解放路店)', '杭州市上城区西湖大道333号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/136_如家酒店·neo(杭州西湖湖滨银泰解放路店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (137, '至悦酒店（西湖湖滨浙江大学医学院附属第二医院解放路院区店）', '杭州市上城区西湖大道333号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/137_至悦酒店（西湖湖滨浙江大学医学院附属第二医院解放路院区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (138, '杭州亚兰酒店(湖滨武林广场沈塘桥地铁站店)', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/138_杭州亚兰酒店(湖滨武林广场沈塘桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (139, '汉庭酒店(杭州西湖河坊街店)', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/139_汉庭酒店(杭州西湖河坊街店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (140, '杭州中山西子湖酒店', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/140_杭州中山西子湖酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (141, '桔子水晶杭州西湖湖滨银泰酒店', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/141_桔子水晶杭州西湖湖滨银泰酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (142, '唐庭酒店(杭州火车东站西广场店)', '杭州市上城区西湖大道333号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/142_唐庭酒店(杭州火车东站西广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (143, '玛莉艾蒂酒店（杭州西湖区文一路店)', '杭州市上城区西湖大道333号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/143_玛莉艾蒂酒店（杭州西湖区文一路店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (144, '龙云悦酒店(杭州西湖武林门地铁站店)', '杭州市上城区西湖大道333号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/144_龙云悦酒店(杭州西湖武林门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (145, '杭州马可波罗滨湖酒店(西湖湖滨店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/145_杭州马可波罗滨湖酒店(西湖湖滨店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (146, '全季酒店(杭州西湖龙翔桥地铁站店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/146_全季酒店(杭州西湖龙翔桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (147, '浙江饭店', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/147_浙江饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (148, '杭州翠憬民宿(西湖景区青芝坞店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/148_杭州翠憬民宿(西湖景区青芝坞店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (149, '杭州半亩方塘民宿(西湖风景区灵隐寺店)', '杭州市上城区西湖大道333号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/149_杭州半亩方塘民宿(西湖风景区灵隐寺店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (150, '杭州西湖黄龙新雅图酒店', '杭州市上城区西湖大道333号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/150_杭州西湖黄龙新雅图酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (151, '梓悠酒店（青白江万达广场店）', '成都市锦江区春熙路88号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/151_梓悠酒店（青白江万达广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (152, '成都悦惠美酒店（宽窄巷子店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/152_成都悦惠美酒店（宽窄巷子店）.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (153, '来住星辰S酒店（成都宽窄巷子西大街店）', '成都市锦江区春熙路88号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/153_来住星辰S酒店（成都宽窄巷子西大街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (154, '成都轻途酒店式公寓(天府广场春熙路店)', '成都市锦江区春熙路88号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/154_成都轻途酒店式公寓(天府广场春熙路店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (155, '如家酒店·neo(成都春熙路太古里店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/155_如家酒店·neo(成都春熙路太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (156, '汉庭酒店(成都天府广场太古里店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/156_汉庭酒店(成都天府广场太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (157, '成都锦里遇上酒店（东郊记忆店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/157_成都锦里遇上酒店（东郊记忆店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (158, '雅朵精选套房公寓(339天府熊猫塔春熙路店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/158_雅朵精选套房公寓(339天府熊猫塔春熙路店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (159, '云岸318酒店（成都宽窄巷子文殊院地铁站店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/159_云岸318酒店（成都宽窄巷子文殊院地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (160, '全季酒店(成都太古里春熙路店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/160_全季酒店(成都太古里春熙路店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (161, '成都ONE酒店（环球中心金融城店）', '成都市锦江区春熙路88号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/161_成都ONE酒店（环球中心金融城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (162, '成都七宜酒店公寓（宽窄巷子花牌坊街店）', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/162_成都七宜酒店公寓（宽窄巷子花牌坊街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (163, '南倾世界时酒店(成都春熙路地铁站太古里店)', '成都市锦江区春熙路88号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/163_南倾世界时酒店(成都春熙路地铁站太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (164, '桔子酒店(成都宽窄巷子店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/164_桔子酒店(成都宽窄巷子店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (165, '枣院酒店（成都宽窄巷子枣子巷店）', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/165_枣院酒店（成都宽窄巷子枣子巷店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (166, '桔子酒店(成都天府广场宽窄巷子店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/166_桔子酒店(成都天府广场宽窄巷子店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (167, '汉庭酒店（成都天府广场春熙路店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/167_汉庭酒店（成都天府广场春熙路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (168, 'FPS·王者之梦赛事电竞酒店（成都太古里店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/168_FPS·王者之梦赛事电竞酒店（成都太古里店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (169, '全季酒店(成都太古里339天府熊猫塔店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/169_全季酒店(成都太古里339天府熊猫塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (170, 'YUNXI·云曦天际S设计师酒店(成都天府广场春熙路店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/170_YUNXI·云曦天际S设计师酒店(成都天府广场春熙路店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (171, '凯宾酒店（电子科大建设路店）', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/171_凯宾酒店（电子科大建设路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (172, '悦蓝里S酒店(成都宽窄巷子抚琴地铁站店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/172_悦蓝里S酒店(成都宽窄巷子抚琴地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (173, '成都托尼洛·兰博基尼酒店(春熙路店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/173_成都托尼洛·兰博基尼酒店(春熙路店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (174, '汉庭酒店（成都春熙路天府广场地铁站店）', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/174_汉庭酒店（成都春熙路天府广场地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (175, '锦城民宿（春熙路太古里店）', '成都市锦江区春熙路88号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/175_锦城民宿（春熙路太古里店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (176, '成都香格里拉大酒店(太古里店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/176_成都香格里拉大酒店(太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (177, '成都春熙路voco酒店', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/177_成都春熙路voco酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (178, '月牙酒店(成都春熙路天府广场地铁站店)', '成都市锦江区春熙路88号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/178_月牙酒店(成都春熙路天府广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (179, '成都茂业JW万豪酒店(春熙路太古里店)', '成都市锦江区春熙路88号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/179_成都茂业JW万豪酒店(春熙路太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (180, '盈嘉·YUNXITIANJI·云曦天际S(成都春熙路太古里店)', '成都市锦江区春熙路88号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/180_盈嘉·YUNXITIANJI·云曦天际S(成都春熙路太古里店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (181, '云涉酒店(观音桥步行街黄泥磅地铁站店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/181_云涉酒店(观音桥步行街黄泥磅地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (182, '重庆景慕心悦江景酒店（解放碑洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/182_重庆景慕心悦江景酒店（解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (183, 'Asiam亚美丽晶江景酒店（重庆观音桥店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/183_Asiam亚美丽晶江景酒店（重庆观音桥店）.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (184, 'Mcsrh麦嘉·拾趣酒店（重庆解放碑洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/184_Mcsrh麦嘉·拾趣酒店（重庆解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (185, '煊煊安丞江景民宿(重庆解放碑步行街洪崖洞店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/185_煊煊安丞江景民宿(重庆解放碑步行街洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (186, '桔子酒店(重庆观音桥店)', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/186_桔子酒店(重庆观音桥店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (187, 'Cloud·沐雲江景酒店（重庆解放碑洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/187_Cloud·沐雲江景酒店（重庆解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (188, '重庆嘉玺江景酒店(解放碑洪崖洞店)', '重庆市渝中区民族路188号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/188_重庆嘉玺江景酒店(解放碑洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (189, '重庆穿渝里高空江景酒店（解放碑步行街洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/189_重庆穿渝里高空江景酒店（解放碑步行街洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (190, '重庆艾维希酒店公寓(解放碑洪崖洞店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/190_重庆艾维希酒店公寓(解放碑洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (191, '重庆北站南广场亚朵酒店', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/191_重庆北站南广场亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (192, '山丘酒店(重庆解放碑洪崖洞店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/192_山丘酒店(重庆解放碑洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (193, '重庆明月朋酒店(洪崖洞解放碑店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/193_重庆明月朋酒店(洪崖洞解放碑店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (194, '榕树下有间酒店（重庆解放碑店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/194_榕树下有间酒店（重庆解放碑店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (195, '北宸江景酒店（解放碑洪崖洞店）', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/195_北宸江景酒店（解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (196, '全季酒店（重庆观音桥洋河路店）', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/196_全季酒店（重庆观音桥洋河路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (197, 'E.S尔宿高空江景酒店(重庆解放碑洪崖洞店)', '重庆市渝中区民族路188号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/197_E.S尔宿高空江景酒店(重庆解放碑洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (198, '云幕国际酒店(重庆解放碑步行街店)', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/198_云幕国际酒店(重庆解放碑步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (199, 'MOUNTWELL·山栖行政套房酒店(解放碑洪崖洞店)', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/199_MOUNTWELL·山栖行政套房酒店(解放碑洪崖洞店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (200, '维尔斯酒店（重庆解放碑七星岗地铁站店）', '重庆市渝中区民族路188号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/200_维尔斯酒店（重庆解放碑七星岗地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (201, '重庆两江新区丽呈君顿酒店', '重庆市渝中区民族路188号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/201_重庆两江新区丽呈君顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (202, '喜番世嘉酒店(解放碑店)', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/202_喜番世嘉酒店(解放碑店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (203, 'Harmony·希雅达江景酒店（重庆观音桥北滨一路店）', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/203_Harmony·希雅达江景酒店（重庆观音桥北滨一路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (204, '悦惠美S酒店（重庆解放碑朝天门店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/204_悦惠美S酒店（重庆解放碑朝天门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (205, '重庆•云栖yunqi｜MIX智能轻奢影院酒店(重庆解放碑步行街洪崖洞）', '重庆市渝中区民族路188号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/205_重庆•云栖yunqi｜MIX智能轻奢影院酒店(重庆解放碑步行街洪崖洞）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (206, '重庆南岸万豪万枫酒店', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/206_重庆南岸万豪万枫酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (207, '止禾·行酒店(解放碑步行街店)', '重庆市渝中区民族路188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/207_止禾·行酒店(解放碑步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (208, 'Foliage·观叶套房酒店（重庆解放碑洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/208_Foliage·观叶套房酒店（重庆解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (209, '洪崖观澜全智能江景民宿（解放碑洪崖洞店）', '重庆市渝中区民族路188号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/209_洪崖观澜全智能江景民宿（解放碑洪崖洞店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (210, '重庆解放碑洪崖洞Mc麦悦·空中酒店', '重庆市渝中区民族路188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/210_重庆解放碑洪崖洞Mc麦悦·空中酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (211, '艺龙瑞云酒店(南京葛塘地铁站店)', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/211_艺龙瑞云酒店(南京葛塘地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (212, '沐雅铂金酒店（南京新街口常府街地铁站店）', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/212_沐雅铂金酒店（南京新街口常府街地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (213, '全季酒店(南京夫子庙老门东店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/213_全季酒店(南京夫子庙老门东店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (214, '南京苏宁索菲特银河大酒店', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/214_南京苏宁索菲特银河大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (215, '汉庭酒店(南京鼓楼广场店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/215_汉庭酒店(南京鼓楼广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (216, '汉庭酒店(南京新街口汉中门地铁站店)', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/216_汉庭酒店(南京新街口汉中门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (217, '南京金鹰国际酒店(新街口店)', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/217_南京金鹰国际酒店(新街口店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (218, '格林豪泰智选酒店(南京新街口王府大街店)', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/218_格林豪泰智选酒店(南京新街口王府大街店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (219, '南京东方珍珠voco酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/219_南京东方珍珠voco酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (220, '全季酒店(南京夫子庙地铁站店)', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/220_全季酒店(南京夫子庙地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (221, '泊金全季酒店(南京玄武湖公园店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/221_泊金全季酒店(南京玄武湖公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (222, '花筑奢·梧桐公馆(南京中山陵景区店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/222_花筑奢·梧桐公馆(南京中山陵景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (223, '和颐至尚酒店(南京夫子庙景区秦淮河店)', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/223_和颐至尚酒店(南京夫子庙景区秦淮河店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (224, '城市轻氧酒店（南京新街口珠江路地铁站店）', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/224_城市轻氧酒店（南京新街口珠江路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (225, '南京新街口总统府大地君悦酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/225_南京新街口总统府大地君悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (226, '汉庭酒店(南京新街口大行宫地铁站店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/226_汉庭酒店(南京新街口大行宫地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (227, '南京博物院航空航天大学亚朵酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/227_南京博物院航空航天大学亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (228, '页帆河畔民宿（南京夫子庙秦淮河畔店）', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/228_页帆河畔民宿（南京夫子庙秦淮河畔店）.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (229, '水月秦淮-天青色影院民宿(南京南站喜玛拉雅中心店)', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/229_水月秦淮-天青色影院民宿(南京南站喜玛拉雅中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (230, '南京奥体博览中心优逸酒店', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/230_南京奥体博览中心优逸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (231, '汉庭优佳酒店(南京新街口浮桥地铁站店)', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/231_汉庭优佳酒店(南京新街口浮桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (232, '南京洲际酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/232_南京洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (233, '云曦精品公寓(南京南站地铁站店)', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/233_云曦精品公寓(南京南站地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (234, '南京维景国际酒店', '南京市鼓楼区中山北路200号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/234_南京维景国际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (235, '南京东郊国宾馆', '南京市鼓楼区中山北路200号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/235_南京东郊国宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (236, '清风酒店（夫子庙步行街秦淮河店）', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/236_清风酒店（夫子庙步行街秦淮河店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (237, '南京金鹰世界G酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/237_南京金鹰世界G酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (238, '南京新街口桔子水晶酒店', '南京市鼓楼区中山北路200号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/238_南京新街口桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (239, '知棠·悦酒店（南京新街口店）', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/239_知棠·悦酒店（南京新街口店）.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (240, '城南旧事酒店(南京夫子庙景区瞻园店)', '南京市鼓楼区中山北路200号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/240_城南旧事酒店(南京夫子庙景区瞻园店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (241, '锦江之星品尚(西安钟楼北大街地铁站店)', '西安市碑林区南大街1号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/241_锦江之星品尚(西安钟楼北大街地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (242, '西安吾悦酒店（大雁塔大唐不夜城店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/242_西安吾悦酒店（大雁塔大唐不夜城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (243, 'Y Hotels 西安大雁塔大唐不夜城酒店', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/243_Y Hotels 西安大雁塔大唐不夜城酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (244, '悦昇酒店（西安钟鼓楼回民街店）', '西安市碑林区南大街1号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/244_悦昇酒店（西安钟鼓楼回民街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (245, '轻住·荔枝雅筑酒店（西安钟鼓楼回民街店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/245_轻住·荔枝雅筑酒店（西安钟鼓楼回民街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (246, '桔子酒店(西安钟鼓楼南门店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/246_桔子酒店(西安钟鼓楼南门店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (247, '都市花园酒店（西安钟楼北大街地铁站店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/247_都市花园酒店（西安钟楼北大街地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (248, '艾度云畔酒店（西安钟鼓楼西安站地铁站店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/248_艾度云畔酒店（西安钟鼓楼西安站地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (249, '巷里设计师酒店(西安钟鼓楼洒金桥地铁站店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/249_巷里设计师酒店(西安钟鼓楼洒金桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (250, '金季酒店(西安钟楼地铁站回民街店)', '西安市碑林区南大街1号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/250_金季酒店(西安钟楼地铁站回民街店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (251, '全季酒店（西安西部大道宜家荟聚店）', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/251_全季酒店（西安西部大道宜家荟聚店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (252, '加雅酒店(西安钟鼓楼五路口地铁站店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/252_加雅酒店(西安钟鼓楼五路口地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (253, '西安豪享来温德姆至尊酒店(大唐不夜城大雁塔店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/253_西安豪享来温德姆至尊酒店(大唐不夜城大雁塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (254, '西安唐枫韵酒店(大唐不夜城店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/254_西安唐枫韵酒店(大唐不夜城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (255, '如遇精品酒店(西安钟鼓楼洒金桥地铁站店)', '西安市碑林区南大街1号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/255_如遇精品酒店(西安钟鼓楼洒金桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (256, '全季酒店(西安钟鼓楼五路口地铁站店)', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/256_全季酒店(西安钟鼓楼五路口地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (257, '美豪怡致酒店（西安西京医院交通大学兴庆宫地铁站店）', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/257_美豪怡致酒店（西安西京医院交通大学兴庆宫地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (258, 'Mcsrh麦嘉·拾趣酒店（西安钟鼓楼店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/258_Mcsrh麦嘉·拾趣酒店（西安钟鼓楼店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (259, '如家睿柏·云酒店(西安大唐不夜城大雁塔地铁站店)', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/259_如家睿柏·云酒店(西安大唐不夜城大雁塔地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (260, '艺龙安悦酒店(西安钟楼地铁站回民街店)', '西安市碑林区南大街1号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/260_艺龙安悦酒店(西安钟楼地铁站回民街店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (261, '如家酒店·neo(西安钟楼永宁门地铁站店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/261_如家酒店·neo(西安钟楼永宁门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (262, '西安钟鼓楼和平门Mc麦悦·城市别院', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/262_西安钟鼓楼和平门Mc麦悦·城市别院.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (263, '西安回槿·民宿（钟鼓楼回民街店）', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/263_西安回槿·民宿（钟鼓楼回民街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (264, '安家酒店(西安古城墙火车站北广场店)', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/264_安家酒店(西安古城墙火车站北广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (265, '美丽豪酒店(西安大唐不夜城观赏点万象城店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/265_美丽豪酒店(西安大唐不夜城观赏点万象城店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (266, '全季酒店(西安钟楼省政府店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/266_全季酒店(西安钟楼省政府店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (267, '如家华驿精选酒店(西安高铁北站店)', '西安市碑林区南大街1号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/267_如家华驿精选酒店(西安高铁北站店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (268, '西安壹号公寓(钟楼地铁站店)', '西安市碑林区南大街1号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/268_西安壹号公寓(钟楼地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (269, '艾豪森Awake酒店（西安钟鼓楼回民街店）', '西安市碑林区南大街1号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/269_艾豪森Awake酒店（西安钟鼓楼回民街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (270, '橙羽橙皓酒店(西安钟鼓楼永宁门地铁站店)', '西安市碑林区南大街1号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/270_橙羽橙皓酒店(西安钟鼓楼永宁门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (271, '苏州阁雅居（通园路南地铁站店）', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/271_苏州阁雅居（通园路南地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (272, '安渡│ANDU·HOTEL酒店（苏州观前街七里山塘店）', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/272_安渡│ANDU·HOTEL酒店（苏州观前街七里山塘店）.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (273, '所选酒店（苏州观前街七里山塘店）', '苏州市姑苏区观前街188号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/273_所选酒店（苏州观前街七里山塘店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (274, '苏州金普顿竹辉酒店', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/274_苏州金普顿竹辉酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (275, '苏州洲际酒店', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/275_苏州洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (276, '全季酒店(苏州观前街中心酒店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/276_全季酒店(苏州观前街中心酒店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (277, '苏州城市假期酒店(十全街网师园店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/277_苏州城市假期酒店(十全街网师园店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (278, '苏州拙政别苑酒店(观前街拙政园店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/278_苏州拙政别苑酒店(观前街拙政园店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (279, '虎丘·幸福居｜Warmth·Sweethomedays酒店(姑苏区长泾地铁站店)', '苏州市姑苏区观前街188号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/279_虎丘·幸福居｜Warmth·Sweethomedays酒店(姑苏区长泾地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (280, 'HOMG酒店(苏州观前街七里山塘店)', '苏州市姑苏区观前街188号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/280_HOMG酒店(苏州观前街七里山塘店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (281, '汉庭酒店(苏州观前街察院场地铁站店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/281_汉庭酒店(苏州观前街察院场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (282, '苏州金鸡湖英迪格酒店', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/282_苏州金鸡湖英迪格酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (283, '艺龙安悦酒店（苏州寒山寺山塘街店）', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/283_艺龙安悦酒店（苏州寒山寺山塘街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (284, '松之屿3民宿(苏州平江路观前街店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/284_松之屿3民宿(苏州平江路观前街店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (285, 'LBED NEON酒店(苏州观前街平江路店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/285_LBED NEON酒店(苏州观前街平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (286, '全季酒店(苏州观前街平江路店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/286_全季酒店(苏州观前街平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (287, '丽呈别院(苏州山塘街园林文化店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/287_丽呈别院(苏州山塘街园林文化店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (288, '奇遇派空中庭院度假酒店(苏州山塘街万象天地店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/288_奇遇派空中庭院度假酒店(苏州山塘街万象天地店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (289, '长风归隐酒店(苏州拙政园平江路店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/289_长风归隐酒店(苏州拙政园平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (290, '苏州金鸡湖托尼洛·兰博基尼书苑酒店', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/290_苏州金鸡湖托尼洛·兰博基尼书苑酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (291, '汉庭酒店(苏州吴中万达广场店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/291_汉庭酒店(苏州吴中万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (292, 'Whisper姑苏私语·露台雅舍(苏州火车站山塘街地铁站店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/292_Whisper姑苏私语·露台雅舍(苏州火车站山塘街地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (293, '苏州希尔顿酒店', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/293_苏州希尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (294, '安米·Anmi·Hotel·酒店(苏州十全街南门地铁站店)', '苏州市姑苏区观前街188号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/294_安米·Anmi·Hotel·酒店(苏州十全街南门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (295, '平江云宿•SU STYLE庭院（苏州观前街拙政园店）', '苏州市姑苏区观前街188号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/295_平江云宿•SU STYLE庭院（苏州观前街拙政园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (296, '汉庭优佳酒店(苏州观前街乐桥地铁站店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/296_汉庭优佳酒店(苏州观前街乐桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (297, '漫点艺术酒店(苏州观前街平江路店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/297_漫点艺术酒店(苏州观前街平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (298, '苏州未知酒店(观前街平江路店)', '苏州市姑苏区观前街188号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/298_苏州未知酒店(观前街平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (299, '泽一居精舍(苏州观前街平江路店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/299_泽一居精舍(苏州观前街平江路店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (300, '苏州苏忆时光酒店(观前街察院场地铁站店)', '苏州市姑苏区观前街188号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/300_苏州苏忆时光酒店(观前街察院场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (301, '7天优品酒店(三亚湾海月广场外贸路美食街店)', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/301_7天优品酒店(三亚湾海月广场外贸路美食街店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (302, '三亚亚特兰蒂斯酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/302_三亚亚特兰蒂斯酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (303, '三亚亚龙湾美高梅度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/303_三亚亚龙湾美高梅度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (304, '三亚艾迪逊酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/304_三亚艾迪逊酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (305, '寄居蟹海景美宿(三亚湾椰梦长廊店)', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/305_寄居蟹海景美宿(三亚湾椰梦长廊店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (306, '素说·海景美宿(天涯海角店)', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/306_素说·海景美宿(天涯海角店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (307, '三亚亚龙湾希尔顿酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/307_三亚亚龙湾希尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (308, '三亚京海国际假日酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/308_三亚京海国际假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (309, '三亚珊瑚湾文华东方酒店', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/309_三亚珊瑚湾文华东方酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (310, '嘉宁·东海｜SEAVIEW·STAYCATION 临海臻境酒店(大东海沙滩店)', '三亚市天涯区三亚湾路168号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/310_嘉宁·东海｜SEAVIEW·STAYCATION 临海臻境酒店(大东海沙滩店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (311, '维也纳酒店(三亚湾壹号店）', '三亚市天涯区三亚湾路168号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/311_维也纳酒店(三亚湾壹号店）.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (312, '三亚泰康臻品之选度假酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/312_三亚泰康臻品之选度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (313, '金茂三亚亚龙湾丽思卡尔顿酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/313_金茂三亚亚龙湾丽思卡尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (314, '三亚亚龙湾万豪度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/314_三亚亚龙湾万豪度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (315, '三亚亚龙湾喜来登度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/315_三亚亚龙湾喜来登度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (316, '麗枫酒店(三亚三亚湾解放路黄金道店)', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/316_麗枫酒店(三亚三亚湾解放路黄金道店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (317, '三亚亚龙湾雅高铂尔曼别墅度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/317_三亚亚龙湾雅高铂尔曼别墅度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (318, '三亚海棠湾民生威斯汀度假酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/318_三亚海棠湾民生威斯汀度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (319, '三亚凤凰岛海洋之星度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/319_三亚凤凰岛海洋之星度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (320, '三亚天成中央海岸海景酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/320_三亚天成中央海岸海景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (321, '三亚海棠湾君悦酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/321_三亚海棠湾君悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (322, '三亚保利瑰丽酒店', '三亚市天涯区三亚湾路168号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/322_三亚保利瑰丽酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (323, '三亚亚龙湾天域度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/323_三亚亚龙湾天域度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (324, '三亚金凤凰海景酒店', '三亚市天涯区三亚湾路168号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/324_三亚金凤凰海景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (325, '三亚海棠湾仁恒皇冠假日度假酒店', '三亚市天涯区三亚湾路168号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/325_三亚海棠湾仁恒皇冠假日度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (326, '三亚亚龙湾瑞吉度假酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/326_三亚亚龙湾瑞吉度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (327, '三亚鹿岭海湾维景国际大酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/327_三亚鹿岭海湾维景国际大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (328, '三亚海棠湾阳光壹酒店', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/328_三亚海棠湾阳光壹酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (329, '三亚山海名苑度假别墅', '三亚市天涯区三亚湾路168号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/329_三亚山海名苑度假别墅.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (330, '三亚湾红树林度假世界(菩提酒店)', '三亚市天涯区三亚湾路168号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/330_三亚湾红树林度假世界(菩提酒店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (331, '青岛五四广场海景美仑美奂酒店', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/331_青岛五四广场海景美仑美奂酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (332, '斯维登精品公寓(青岛会展中心石老人海水浴场)', '青岛市市南区香港中路66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/332_斯维登精品公寓(青岛会展中心石老人海水浴场).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (333, '青岛美高梅酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/333_青岛美高梅酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (334, '汉庭酒店(青岛北站金水路店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/334_汉庭酒店(青岛北站金水路店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (335, '美桔·风尚酒店(青岛北站李村步行街地铁站店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/335_美桔·风尚酒店(青岛北站李村步行街地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (336, '望海公寓(石老人海水浴场店)', '青岛市市南区香港中路66号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/336_望海公寓(石老人海水浴场店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (337, '青岛海天金融中心酒店(石老人海水浴场店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/337_青岛海天金融中心酒店(石老人海水浴场店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (338, '青岛五四广场海景桔子水晶酒店', '青岛市市南区香港中路66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/338_青岛五四广场海景桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (339, '枫悦酒店(金沙滩青岛理工大学店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/339_枫悦酒店(金沙滩青岛理工大学店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (340, '美豪丽致酒店(青岛中央商务区店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/340_美豪丽致酒店(青岛中央商务区店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (341, '漫月时光公寓(青岛五四广场海信桥地铁站店)', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/341_漫月时光公寓(青岛五四广场海信桥地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (342, '青岛香格里拉大酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/342_青岛香格里拉大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (343, '意墅湾酒店(高新区世茂52+购物中心店)', '青岛市市南区香港中路66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/343_意墅湾酒店(高新区世茂52+购物中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (344, '青岛威斯汀酒店', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/344_青岛威斯汀酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (345, '青岛四方大酒店·东楼(台东步行街小村庄地铁站店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/345_青岛四方大酒店·东楼(台东步行街小村庄地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (346, '希顾酒店(青岛正阳中路万象汇店)', '青岛市市南区香港中路66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/346_希顾酒店(青岛正阳中路万象汇店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (347, '青岛府新大厦', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/347_青岛府新大厦.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (348, '城之南海之角·种花小筑里院民宿（中山路栈桥店）', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/348_城之南海之角·种花小筑里院民宿（中山路栈桥店）.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (349, '青岛五四广场万象城桔子水晶酒店', '青岛市市南区香港中路66号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/349_青岛五四广场万象城桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (350, '青岛五四广场小麦岛海景亚朵酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/350_青岛五四广场小麦岛海景亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (351, '白玉兰酒店(青岛市技师学院店)', '青岛市市南区香港中路66号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/351_白玉兰酒店(青岛市技师学院店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (352, '琴屿湾海景民宿(青岛火车站栈桥店)', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/352_琴屿湾海景民宿(青岛火车站栈桥店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (353, '青岛奥帆中心五四广场亚朵酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/353_青岛奥帆中心五四广场亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (354, '兰欧国际酒店（青岛金沙滩石油大学店）', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/354_兰欧国际酒店（青岛金沙滩石油大学店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (355, '青岛银丰玥美酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/355_青岛银丰玥美酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (356, '桔子酒店(青岛五四广场店)', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/356_桔子酒店(青岛五四广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (357, '青岛五四广场万象城亚朵酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/357_青岛五四广场万象城亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (358, '壹心酒店(青岛栈桥火车站地铁口店)', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/358_壹心酒店(青岛栈桥火车站地铁口店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (359, '海逸国际酒店公寓(青岛五四广场店)', '青岛市市南区香港中路66号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/359_海逸国际酒店公寓(青岛五四广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (360, '山东健康丽呈睿轩栈桥海景酒店', '青岛市市南区香港中路66号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/360_山东健康丽呈睿轩栈桥海景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (361, 'Lethe Retreat 栖迟尘外酒店(大连星海广场店)', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/361_Lethe Retreat 栖迟尘外酒店(大连星海广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (362, 'VANS梵石云境海景酒店（中山广场富丽华国际店）', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/362_VANS梵石云境海景酒店（中山广场富丽华国际店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (363, '大连星海广场海之星酒店公寓', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/363_大连星海广场海之星酒店公寓.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (364, '大连中山希尔顿欢朋酒店', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/364_大连中山希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (365, '大连一方城堡豪华精选酒店', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/365_大连一方城堡豪华精选酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (366, '如家精选酒店（大连旅顺大商新玛特店）', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/366_如家精选酒店（大连旅顺大商新玛特店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (367, 'The Once·那片海海景民宿（大连星海广场圣亚海洋世界店）', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/367_The Once·那片海海景民宿（大连星海广场圣亚海洋世界店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (368, '汉庭优佳酒店(大连人民路港湾广场地铁站店)', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/368_汉庭优佳酒店(大连人民路港湾广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (369, '大连中山广场亚朵酒店', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/369_大连中山广场亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (370, '海之梦海景酒店(中山广场威尼斯水城店)', '大连市中山区人民路50号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/370_海之梦海景酒店(中山广场威尼斯水城店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (371, '如家精选酒店(大连机场万达广场店)', '大连市中山区人民路50号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/371_如家精选酒店(大连机场万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (372, '禧合酒店(大连东港商务区中山广场地铁站店)', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/372_禧合酒店(大连东港商务区中山广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (373, '大连君悦酒店', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/373_大连君悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (374, '大连日航饭店', '大连市中山区人民路50号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/374_大连日航饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (375, '蜗牛酒店（中升梭鱼湾足球场店）', '大连市中山区人民路50号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/375_蜗牛酒店（中升梭鱼湾足球场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (376, '汉庭酒店(大连中山广场地铁站店)', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/376_汉庭酒店(大连中山广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (377, '天禧酒店(大连火车站中山广场店)', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/377_天禧酒店(大连火车站中山广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (378, '大连星海广场会展中心地铁站亚朵酒店', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/378_大连星海广场会展中心地铁站亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (379, '大连东关街人民广场开元名庭酒店', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/379_大连东关街人民广场开元名庭酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (380, '璞瑅酒店（中山广场/人民路东港商务区）', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/380_璞瑅酒店（中山广场_人民路东港商务区）.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (381, '莱客U酒店(大连高新万达广场店)', '大连市中山区人民路50号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/381_莱客U酒店(大连高新万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (382, '大连星海假日酒店', '大连市中山区人民路50号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/382_大连星海假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (383, '维也纳酒店(大连高新万达广场店)', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/383_维也纳酒店(大连高新万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (384, '如家商旅酒店(大连星海广场会展中心店)', '大连市中山区人民路50号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/384_如家商旅酒店(大连星海广场会展中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (385, '大连中远海运洲际酒店', '大连市中山区人民路50号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/385_大连中远海运洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (386, '维也纳国际酒店(大连市政府东关街店)', '大连市中山区人民路50号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/386_维也纳国际酒店(大连市政府东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (387, '大连东港商务区桔子水晶酒店', '大连市中山区人民路50号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/387_大连东港商务区桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (388, '大连新世界酒店', '大连市中山区人民路50号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/388_大连新世界酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (389, '大连星海广场海景城际酒店', '大连市中山区人民路50号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/389_大连星海广场海景城际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (390, '好时光酒店式公寓(大连星海广场店)', '大连市中山区人民路50号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/390_好时光酒店式公寓(大连星海广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (391, '麗枫酒店(长沙高铁南站喜盈门范城店)', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/391_麗枫酒店(长沙高铁南站喜盈门范城店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (392, '樂一·溪悦酒店（长沙五一广场IFS国金中心店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/392_樂一·溪悦酒店（长沙五一广场IFS国金中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (393, '橙子酒店(长沙IFS国金中心五一广场店)', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/393_橙子酒店(长沙IFS国金中心五一广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (394, 'Mcsrh麦嘉·拾趣酒店（长沙五一广场贺龙体育场店）', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/394_Mcsrh麦嘉·拾趣酒店（长沙五一广场贺龙体育场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (395, '兰曼酒店(长沙五一广场IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/395_兰曼酒店(长沙五一广场IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (396, '汉庭酒店(长沙五一广场芙蓉中路店)', '长沙市岳麓区橘子洲头2号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/396_汉庭酒店(长沙五一广场芙蓉中路店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (397, '郡曼·耐斯酒店(长沙五一广场IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/397_郡曼·耐斯酒店(长沙五一广场IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (398, '樂一·澜悦酒店(长沙五一广场IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/398_樂一·澜悦酒店(长沙五一广场IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (399, '长沙万达文华酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/399_长沙万达文华酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (400, '壹禾酒店(长沙五一广场湘雅附一店)', '长沙市岳麓区橘子洲头2号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/400_壹禾酒店(长沙五一广场湘雅附一店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (401, '长沙岳麓华美达酒店（洋湖湿地地铁站店）', '长沙市岳麓区橘子洲头2号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/401_长沙岳麓华美达酒店（洋湖湿地地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (402, 'SINGLE·单一酒店（五一广场IFS国金中心店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/402_SINGLE·单一酒店（五一广场IFS国金中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (403, '沐言酒店（长沙高铁南站国际会展中心店）', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/403_沐言酒店（长沙高铁南站国际会展中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (404, '长沙北辰洲际酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/404_长沙北辰洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (405, '长沙运达喜来登酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/405_长沙运达喜来登酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (406, '桔子酒店(长沙五一广场IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/406_桔子酒店(长沙五一广场IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (407, '华信酒店（长沙高铁南站国际会展中心店）', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/407_华信酒店（长沙高铁南站国际会展中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (408, 'XHotel酒店(长沙五一广场IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/408_XHotel酒店(长沙五一广场IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (409, '长沙临里·铂悦独栋酒店（五一广场IFS国金中心店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/409_长沙临里·铂悦独栋酒店（五一广场IFS国金中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (410, '长沙玛珂酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/410_长沙玛珂酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (411, '凯里亚德酒店(长沙梅溪湖东地铁站麓谷高新区店)', '长沙市岳麓区橘子洲头2号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/411_凯里亚德酒店(长沙梅溪湖东地铁站麓谷高新区店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (412, '长沙冰溪酒店（五一广场培元桥地铁站店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/412_长沙冰溪酒店（五一广场培元桥地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (413, '长沙方麓酒店（五一广场IFS国金中心店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/413_长沙方麓酒店（五一广场IFS国金中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (414, '长沙国金中心戴斯精选温德姆酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/414_长沙国金中心戴斯精选温德姆酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (415, '长沙世茂希尔顿酒店', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/415_长沙世茂希尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (416, '汉庭酒店(长沙五一广场迎宾路口地铁站店)', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/416_汉庭酒店(长沙五一广场迎宾路口地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (417, '金桔酒店（长沙五一广场IFS国金中心店）', '长沙市岳麓区橘子洲头2号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/417_金桔酒店（长沙五一广场IFS国金中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (418, '朵兰达V酒店（长沙五一广场火车站店）', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/418_朵兰达V酒店（长沙五一广场火车站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (419, '长沙•屿汐｜Cinema•AdesAdesigners设计酒店(五一广场湘雅附一店)', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/419_长沙•屿汐｜Cinema•AdesAdesigners设计酒店(五一广场湘雅附一店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (420, '英尚酒店(五一广场/IFS国金中心店)', '长沙市岳麓区橘子洲头2号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/420_英尚酒店(五一广场_IFS国金中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (421, '香港黄金海岸酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/421_香港黄金海岸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (422, '香港都会海逸酒店', '香港中环金融街8号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/422_香港都会海逸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (423, '香港旺角帝盛酒店', '香港中环金融街8号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/423_香港旺角帝盛酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (424, '香港悦品海景酒店', '香港中环金融街8号', 3, 4.10, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/424_香港悦品海景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (425, '香港8度海逸酒店', '香港中环金融街8号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/425_香港8度海逸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (426, '香港丽思卡尔顿酒店', '香港中环金融街8号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/426_香港丽思卡尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (427, '香港康得思酒店(朗廷酒店集团旗下)', '香港中环金融街8号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/427_香港康得思酒店(朗廷酒店集团旗下).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (428, '九龙香格里拉', '香港中环金融街8号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/428_九龙香格里拉.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (429, '香港喜来登酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/429_香港喜来登酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (430, '香港尖沙咀金普顿酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/430_香港尖沙咀金普顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (431, '香港W酒店', '香港中环金融街8号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/431_香港W酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (432, '香港丽豪酒店', '香港中环金融街8号', 3, 4.10, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/432_香港丽豪酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (433, '香港荃湾丝丽酒店', '香港中环金融街8号', 3, 3.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/433_香港荃湾丝丽酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (434, '香港帝景酒店', '香港中环金融街8号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/434_香港帝景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (435, '南寓', '香港中环金融街8号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/435_南寓.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (436, '米易商务宾馆', '香港中环金融街8号', 3, 4.00, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/436_米易商务宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (437, '香港九龙海逸君绰酒店', '香港中环金融街8号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/437_香港九龙海逸君绰酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (438, '香港皇家太平洋酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/438_香港皇家太平洋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (439, '荃湾西如心酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/439_荃湾西如心酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (440, '香港太子酒店-马哥孛罗', '香港中环金融街8号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/440_香港太子酒店-马哥孛罗.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (441, '香港海洋公园万豪酒店', '香港中环金融街8号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/441_香港海洋公园万豪酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (442, '香港海景嘉福洲际酒店', '香港中环金融街8号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/442_香港海景嘉福洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (443, '香港嘉里酒店(香格里拉集团)', '香港中环金融街8号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/443_香港嘉里酒店(香格里拉集团).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (444, '香港龙堡国际', '香港中环金融街8号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/444_香港龙堡国际.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (445, '千禧新世界香港酒店', '香港中环金融街8号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/445_千禧新世界香港酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (446, '香港港威酒店-马哥孛罗', '香港中环金融街8号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/446_香港港威酒店-马哥孛罗.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (447, '香港逸东酒店(朗廷酒店集团旗下)', '香港中环金融街8号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/447_香港逸东酒店(朗廷酒店集团旗下).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (448, '香港荃湾帝盛酒店', '香港中环金融街8号', 3, 4.10, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/448_香港荃湾帝盛酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (449, '香港丽晶酒店', '香港中环金融街8号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/449_香港丽晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (450, '香港合意宾馆', '香港中环金融街8号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/450_香港合意宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (451, '厦门美仑皓晖酒店(中山路步行街店)', '厦门市思明区鹭江道18号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/451_厦门美仑皓晖酒店(中山路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (452, '格林东方酒店(厦门中山路步行街店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/452_格林东方酒店(厦门中山路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (453, '厦门世茂双子塔地标海景公寓（厦门大学店）', '厦门市思明区鹭江道18号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/453_厦门世茂双子塔地标海景公寓（厦门大学店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (454, '亿源阳光酒店(SM城市广场厦门火车站店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/454_亿源阳光酒店(SM城市广场厦门火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (455, '厦门蓝鲨海景酒店公寓（世茂双子塔店）', '厦门市思明区鹭江道18号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/455_厦门蓝鲨海景酒店公寓（世茂双子塔店）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (456, '全季酒店(厦门中山路轮渡码头店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/456_全季酒店(厦门中山路轮渡码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (457, '简约公寓(厦门北站店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/457_简约公寓(厦门北站店).jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (458, '如家素柏•云酒店(厦门中山路步行街轮渡码头店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/458_如家素柏•云酒店(厦门中山路步行街轮渡码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (459, '厦门海港英迪格酒店(中山路店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/459_厦门海港英迪格酒店(中山路店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (460, '汉庭酒店(厦门大学店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/460_汉庭酒店(厦门大学店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (461, '麗枫酒店（厦门翔安马巷店）', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/461_麗枫酒店（厦门翔安马巷店）.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (462, '厦门鹭尚伴海墅酒店（环岛路黄厝沙滩店）', '厦门市思明区鹭江道18号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/462_厦门鹭尚伴海墅酒店（环岛路黄厝沙滩店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (463, '厦门臻玥·美宿（厦门中山路轮渡码头店）', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/463_厦门臻玥·美宿（厦门中山路轮渡码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (464, '厦门佳逸希尔顿格芮精选酒店(环岛路曾厝垵店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/464_厦门佳逸希尔顿格芮精选酒店(环岛路曾厝垵店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (465, '桔子酒店(厦门市政府店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/465_桔子酒店(厦门市政府店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (466, '如家商旅酒店(厦门大学中山路店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/466_如家商旅酒店(厦门大学中山路店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (467, '厦门康莱德酒店', '厦门市思明区鹭江道18号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/467_厦门康莱德酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (468, '格菲酒店(厦门大学世茂双子塔店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/468_格菲酒店(厦门大学世茂双子塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (469, '厦门海沧融信海景华邑酒店', '厦门市思明区鹭江道18号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/469_厦门海沧融信海景华邑酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (470, '厦门山寻·与海海景酒店(杏林湾店)', '厦门市思明区鹭江道18号', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/470_厦门山寻·与海海景酒店(杏林湾店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (471, '厦门鹭海湾海景酒店（嵩屿码头店）', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/471_厦门鹭海湾海景酒店（嵩屿码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (472, '云上观海公寓(厦门大学世茂双子塔店)', '厦门市思明区鹭江道18号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/472_云上观海公寓(厦门大学世茂双子塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (473, '美豪丽致酒店(厦门中山路步行街店)', '厦门市思明区鹭江道18号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/473_美豪丽致酒店(厦门中山路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (474, '呈境LIFE HOTEL酒店(厦门中山路步行街万石植物园店)', '厦门市思明区鹭江道18号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/474_呈境LIFE HOTEL酒店(厦门中山路步行街万石植物园店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (475, '汉庭酒店(厦门中山路第一码头海景店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/475_汉庭酒店(厦门中山路第一码头海景店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (476, '厦门W酒店', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/476_厦门W酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (477, '厦门禹洲温德姆至尊豪廷大酒店 (五缘湾店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/477_厦门禹洲温德姆至尊豪廷大酒店 (五缘湾店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (478, '云上.山海一线海景设计师公寓(厦门大学世茂双子塔店)', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/478_云上.山海一线海景设计师公寓(厦门大学世茂双子塔店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (479, 'TAHITI塔希提酒店（厦门大学曾厝垵店）', '厦门市思明区鹭江道18号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/479_TAHITI塔希提酒店（厦门大学曾厝垵店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (480, '3w·house2号院', '厦门市思明区鹭江道18号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/480_3w·house2号院.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (481, '维也纳国际酒店(武汉杨泗港长江大桥店)', '武汉市武昌区中南路99号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/481_维也纳国际酒店(武汉杨泗港长江大桥店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (482, '武汉云栖憬悦酒店（汉口江滩江汉路步行街店）', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/482_武汉云栖憬悦酒店（汉口江滩江汉路步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (483, '艾美迪酒店(江汉路步行街店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/483_艾美迪酒店(江汉路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (484, '辛德拉酒店（武汉市江汉路武胜路地铁站店）', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/484_辛德拉酒店（武汉市江汉路武胜路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (485, '菲想酒店（武汉江汉路步行街六渡桥地铁站店）', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/485_菲想酒店（武汉江汉路步行街六渡桥地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (486, '全季酒店(武汉新荣天街后湖大道店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/486_全季酒店(武汉新荣天街后湖大道店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (487, '栖酒店（黄鹤楼长江大桥店）', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/487_栖酒店（黄鹤楼长江大桥店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (488, '澜·云季酒店(武汉江汉路步行街店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/488_澜·云季酒店(武汉江汉路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (489, '武汉MOG江景酒店(汉口江滩江汉路步行街店)', '武汉市武昌区中南路99号', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/489_武汉MOG江景酒店(汉口江滩江汉路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (490, '云栖憬程酒店（民众乐园江汉路步行街店）', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/490_云栖憬程酒店（民众乐园江汉路步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (491, '全季酒店(武汉汉阳王家湾店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/491_全季酒店(武汉汉阳王家湾店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (492, '米朵轻奢酒店(楚河汉街地铁站省博物馆店）', '武汉市武昌区中南路99号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/492_米朵轻奢酒店(楚河汉街地铁站省博物馆店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (493, '海格瑞湖景公寓(武汉万象城取水楼地铁站店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/493_海格瑞湖景公寓(武汉万象城取水楼地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (494, '戴丁连锁酒店(武汉江汉路吉庆街店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/494_戴丁连锁酒店(武汉江汉路吉庆街店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (495, 'ELONG R.YUN丨艺龙瑞云酒店(武汉大学街道口地铁站店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/495_ELONG R.YUN丨艺龙瑞云酒店(武汉大学街道口地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (496, '格雷斯精选酒店(武汉白沙洲杨泗港长江大桥店)', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/496_格雷斯精选酒店(武汉白沙洲杨泗港长江大桥店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (497, '速8酒店(武汉汉口火车站泛海CBD店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/497_速8酒店(武汉汉口火车站泛海CBD店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (498, '武汉万达瑞华酒店', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/498_武汉万达瑞华酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (499, '星空酒店(武汉市第一医院江汉路步行街店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/499_星空酒店(武汉市第一医院江汉路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (500, '武汉华悦酒店（黄鹤楼武汉长江大桥店）', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/500_武汉华悦酒店（黄鹤楼武汉长江大桥店）.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (501, '静叶庭酒店(武汉体育中心沌阳大道地铁站店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/501_静叶庭酒店(武汉体育中心沌阳大道地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (502, '武汉江汉路步行街水云岚酒店', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/502_武汉江汉路步行街水云岚酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (503, '武汉广场汉口金融中心亚朵酒店', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/503_武汉广场汉口金融中心亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (504, '武汉秘境美学酒店(江汉路汉正街店)', '武汉市武昌区中南路99号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/504_武汉秘境美学酒店(江汉路汉正街店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (505, '武汉大学八一路亚朵酒店', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/505_武汉大学八一路亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (506, '全季酒店(武汉客厅极地海洋世界店)', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/506_全季酒店(武汉客厅极地海洋世界店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (507, '枫桦酒店（武汉江汉路步行街汉口江滩店）', '武汉市武昌区中南路99号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/507_枫桦酒店（武汉江汉路步行街汉口江滩店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (508, '武汉东湖宾馆', '武汉市武昌区中南路99号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/508_武汉东湖宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (509, '尚驿花园酒店（江汉路步行街店）', '武汉市武昌区中南路99号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/509_尚驿花园酒店（江汉路步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (510, '武汉马哥孛罗酒店', '武汉市武昌区中南路99号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/510_武汉马哥孛罗酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (511, '麗枫酒店(天津华苑店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/511_麗枫酒店(天津华苑店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (512, '白玉兰酒店(天津五大道民园广场景区店)', '天津市和平区南京路108号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/512_白玉兰酒店(天津五大道民园广场景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (513, '雅尚商务酒店(天津之眼天津站店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/513_雅尚商务酒店(天津之眼天津站店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (514, '喆啡酒店（天津意式风情区天津之眼店）', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/514_喆啡酒店（天津意式风情区天津之眼店）.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (515, '万嘉精品酒店（天津站滨江道步行街店）', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/515_万嘉精品酒店（天津站滨江道步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (516, '汉庭酒店(天津五大道风景区友谊路店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/516_汉庭酒店(天津五大道风景区友谊路店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (517, '美嘉·精选酒店公寓(小白楼五大道店)', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/517_美嘉·精选酒店公寓(小白楼五大道店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (518, '天津滨江道步行街桔子水晶酒店', '天津市和平区南京路108号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/518_天津滨江道步行街桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (519, '天津龙禧盛精品酒店(天津西站店)', '天津市和平区南京路108号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/519_天津龙禧盛精品酒店(天津西站店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (520, '天津海河悦榕庄', '天津市和平区南京路108号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/520_天津海河悦榕庄.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (521, '汉庭酒店（天津中北新城市中心店）', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/521_汉庭酒店（天津中北新城市中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (522, '天津四季酒店', '天津市和平区南京路108号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/522_天津四季酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (523, '麗枫酒店(天津友谊路小白楼五大道店)', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/523_麗枫酒店(天津友谊路小白楼五大道店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (524, '维也纳酒店（天津南京路海光寺地铁站店）', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/524_维也纳酒店（天津南京路海光寺地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (525, '天津康莱德酒店', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/525_天津康莱德酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (526, '桔子酒店(天津五大道解放南路店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/526_桔子酒店(天津五大道解放南路店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (527, '鼓楼海逸精品公寓(天津之眼天津火车站店)', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/527_鼓楼海逸精品公寓(天津之眼天津火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (528, '天津渤海大楼酒店（天津站滨江道步行街店）', '天津市和平区南京路108号', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/528_天津渤海大楼酒店（天津站滨江道步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (529, '天津艺龙酒店', '天津市和平区南京路108号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/529_天津艺龙酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (530, '凯里亚德酒店(天津站五大道店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/530_凯里亚德酒店(天津站五大道店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (531, '天津丽思卡尔顿酒店', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/531_天津丽思卡尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (532, '天津泛太平洋大酒店', '天津市和平区南京路108号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/532_天津泛太平洋大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (533, '天津富力万达文华酒店', '天津市和平区南京路108号', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/533_天津富力万达文华酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (534, '缤朋海棠花语酒店(天津火车站津湾广场店)', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/534_缤朋海棠花语酒店(天津火车站津湾广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (535, '格林豪泰智选酒店(天津西站西北角美食街店)', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/535_格林豪泰智选酒店(天津西站西北角美食街店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (536, '全季酒店（天津中北新城市中心店）', '天津市和平区南京路108号', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/536_全季酒店（天津中北新城市中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (537, '欢朋雅岸酒店（奥体中心南翠屏公园店）', '天津市和平区南京路108号', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/537_欢朋雅岸酒店（奥体中心南翠屏公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (538, '丽柏酒店（天津站津湾广场店）', '天津市和平区南京路108号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/538_丽柏酒店（天津站津湾广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (539, '如家睿柏·云酒店(天津之眼北宁公园地铁站店)', '天津市和平区南京路108号', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/539_如家睿柏·云酒店(天津之眼北宁公园地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (540, '天津优客美宿loft公寓(天津火车站津湾广场店)', '天津市和平区南京路108号', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/540_天津优客美宿loft公寓(天津火车站津湾广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (541, '敦煌新泰·大酒店', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/541_敦煌新泰·大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (542, '敦煌·漠蓝|Club·野奢民宿(鸣沙山月牙泉店)', '敦煌市中心', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/542_敦煌·漠蓝_Club·野奢民宿(鸣沙山月牙泉店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (543, '敦煌云天国际酒店(沙州夜市店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/543_敦煌云天国际酒店(沙州夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (544, '敦煌艾斯汀酒店(市政府敦煌书局店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/544_敦煌艾斯汀酒店(市政府敦煌书局店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (545, '敦煌绿洲主题酒店(沙州夜市店)', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/545_敦煌绿洲主题酒店(沙州夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (546, '敦煌夜市绿洲岛隐庭院酒店(市政府店)', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/546_敦煌夜市绿洲岛隐庭院酒店(市政府店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (547, '广源大酒店(沙州夜市街敦煌博物馆店)', '敦煌市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/547_广源大酒店(沙州夜市街敦煌博物馆店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (548, '敦煌国际大酒店(敦煌夜市店)', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/548_敦煌国际大酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (549, '敦煌星如雨酒店(敦煌夜市店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/549_敦煌星如雨酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (550, '敦煌维景酒店(敦煌夜市店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/550_敦煌维景酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (551, '敦煌漠阳驿客栈(敦煌汽车站店)', '敦煌市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/551_敦煌漠阳驿客栈(敦煌汽车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (552, '敦煌戈樾庭院酒店(沙洲夜市店)', '敦煌市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/552_敦煌戈樾庭院酒店(沙洲夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (553, '敦煌云亦酒店', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/553_敦煌云亦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (554, '青瓴酒店（敦煌市政府店）', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/554_青瓴酒店（敦煌市政府店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (555, '敦煌梵汀•家庭度假星空名宿', '敦煌市中心', 5, 5.00, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/555_敦煌梵汀•家庭度假星空名宿.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (556, '敦煌蓝宝石酒店', '敦煌市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/556_敦煌蓝宝石酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (557, '丽呈尚品酒店(敦煌夜市店)', '敦煌市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/557_丽呈尚品酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (558, '敦煌煌家大酒店（沙州夜市店）', '敦煌市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/558_敦煌煌家大酒店（沙州夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (559, '敦煌九色鹿酒店(敦煌夜市店)', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/559_敦煌九色鹿酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (560, '敦煌山月间酒店(鸣沙山月牙泉中门景区店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/560_敦煌山月间酒店(鸣沙山月牙泉中门景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (561, '锦江之星品尚(敦煌书局沙州夜市店)', '敦煌市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/561_锦江之星品尚(敦煌书局沙州夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (562, '敦煌开泰精品酒店', '敦煌市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/562_敦煌开泰精品酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (563, '敦煌鸣沙野宿星空民宿（鸣沙山月牙泉景区店）', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/563_敦煌鸣沙野宿星空民宿（鸣沙山月牙泉景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (564, '敦煌鹿野酒店（沙州夜市店）', '敦煌市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/564_敦煌鹿野酒店（沙州夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (565, '栖屿半舍民宿(敦煌月牙泉景区店)', '敦煌市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/565_栖屿半舍民宿(敦煌月牙泉景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (566, '敦煌·懿合相庄园民宿', '敦煌市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/566_敦煌·懿合相庄园民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (567, '敦煌中洲国际酒店(敦煌夜市店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/567_敦煌中洲国际酒店(敦煌夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (568, '博汇文华酒店(敦煌夜市市政府店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/568_博汇文华酒店(敦煌夜市市政府店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (569, '敦煌大漠之野度假酒店(鸣沙山月牙泉景区店)', '敦煌市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/569_敦煌大漠之野度假酒店(鸣沙山月牙泉景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (570, '敦煌漠玥民宿（鸣沙山月牙泉店）', '敦煌市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/570_敦煌漠玥民宿（鸣沙山月牙泉店）.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (571, '木子臻选酒店（无锡市南长街人民医院店）', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/571_木子臻选酒店（无锡市南长街人民医院店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (572, '锦江之星品尚酒店(无锡南长街步行街东林书院店)', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/572_锦江之星品尚酒店(无锡南长街步行街东林书院店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (573, '宿适轻奢酒店(三阳广场地铁站市中心店)', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/573_宿适轻奢酒店(三阳广场地铁站市中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (574, '无锡•宜尚丨DESIGNERCINEMANIGHTVIEW高空酒店(三阳广场无锡站店)', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/574_无锡•宜尚丨DESIGNERCINEMANIGHTVIEW高空酒店(三阳广场无锡站店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (575, '格林豪泰商务酒店（无锡火车站学前东路店）', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/575_格林豪泰商务酒店（无锡火车站学前东路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (576, '桔子酒店(无锡三阳广场店)', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/576_桔子酒店(无锡三阳广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (577, '汉庭酒店（无锡三阳广场地铁站店）', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/577_汉庭酒店（无锡三阳广场地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (578, '无锡柏喜悦丽酒店(鼋头渚风景区万象汇店)', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/578_无锡柏喜悦丽酒店(鼋头渚风景区万象汇店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (579, '锦江之星(无锡南长街南禅寺地铁站店)', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/579_锦江之星(无锡南长街南禅寺地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (580, '无锡太湖饭店', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/580_无锡太湖饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (581, '环湖假日花园酒店(无锡梅园开原寺地铁站店)', '无锡市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/581_环湖假日花园酒店(无锡梅园开原寺地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (582, '雅逅酒店(无锡三阳广场火车站店)', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/582_雅逅酒店(无锡三阳广场火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (583, '无锡君来湖滨饭店', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/583_无锡君来湖滨饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (584, '布丁酒店(无锡南长街太湖广场地铁站店)', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/584_布丁酒店(无锡南长街太湖广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (585, '无锡南长街太湖大道亚朵X酒店', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/585_无锡南长街太湖大道亚朵X酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (586, '汉庭酒店(无锡南长街中山路店)', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/586_汉庭酒店(无锡南长街中山路店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (587, '全季酒店(无锡南长街店)', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/587_全季酒店(无锡南长街店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (588, '无锡苏宁银河国际酒店', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/588_无锡苏宁银河国际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (589, '无锡南长街塘南路亚朵酒店', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/589_无锡南长街塘南路亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (590, '无锡鼋头渚风景区梅园太湖新光亚朵酒店', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/590_无锡鼋头渚风景区梅园太湖新光亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (591, '如家华驿精选酒店(无锡火车站春申路店)', '无锡市中心', 3, 4.00, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/591_如家华驿精选酒店(无锡火车站春申路店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (592, '格林豪泰(无锡崇安寺三阳广场地铁站店)', '无锡市中心', 3, 4.00, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/592_格林豪泰(无锡崇安寺三阳广场地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (593, '无锡花园大酒店', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/593_无锡花园大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (594, '格徕仕酒店(无锡五爱广场店)', '无锡市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/594_格徕仕酒店(无锡五爱广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (595, '无锡丽笙精选酒店', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/595_无锡丽笙精选酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (596, '无锡三阳广场南长街桔子水晶酒店', '无锡市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/596_无锡三阳广场南长街桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (597, '无锡拈花湾拈花客栈(拈花湾景区店)', '无锡市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/597_无锡拈花湾拈花客栈(拈花湾景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (598, '美丽豪酒店(无锡三阳广场南长街店)', '无锡市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/598_美丽豪酒店(无锡三阳广场南长街店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (599, '全季酒店（无锡三阳广场胜利门店）', '无锡市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/599_全季酒店（无锡三阳广场胜利门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (600, '一只柠檬(无锡三阳广场胜利门地铁站店)', '无锡市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/600_一只柠檬(无锡三阳广场胜利门地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (601, '汉庭酒店(扬州瘦西湖西门店)', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/601_汉庭酒店(扬州瘦西湖西门店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (602, '枫美酒店(扬州东关街皮市街店)', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/602_枫美酒店(扬州东关街皮市街店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (603, '万季酒店（扬州东关街瘦西湖店）', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/603_万季酒店（扬州东关街瘦西湖店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (604, '文昌轻奢酒店（扬州瘦西湖东关街店）', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/604_文昌轻奢酒店（扬州瘦西湖东关街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (605, '全季酒店(扬州东关街店)', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/605_全季酒店(扬州东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (606, '桔子酒店(扬州大运河博物馆店)', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/606_桔子酒店(扬州大运河博物馆店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (607, '全季酒店（扬州瘦西湖店）', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/607_全季酒店（扬州瘦西湖店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (608, '瑶澜酒店(扬州东关街古运河码头店)', '扬州市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/608_瑶澜酒店(扬州东关街古运河码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (609, '如家酒店(扬州中国大运河博物馆奥邦广场店)', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/609_如家酒店(扬州中国大运河博物馆奥邦广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (610, '花居酒店（扬州东关街皮市街店）', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/610_花居酒店（扬州东关街皮市街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (611, '维也纳国际酒店(扬州万达广场力宝店)', '扬州市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/611_维也纳国际酒店(扬州万达广场力宝店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (612, '如家派柏·云酒店(扬州万达广场店)', '扬州市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/612_如家派柏·云酒店(扬州万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (613, '扬州瘦西湖万象汇亚朵X酒店', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/613_扬州瘦西湖万象汇亚朵X酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (614, '扬州瘦西湖Intercity城际酒店', '扬州市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/614_扬州瘦西湖Intercity城际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (615, 'LAN·古巷设计酒店 (扬州东关街店)', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/615_LAN·古巷设计酒店 (扬州东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (616, '桔子酒店（扬州瘦西湖东关街店）', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/616_桔子酒店（扬州瘦西湖东关街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (617, '扬州瘦西湖温泉度假村', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/617_扬州瘦西湖温泉度假村.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (618, '寄园旅社精品民宿(扬州东关街店)', '扬州市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/618_寄园旅社精品民宿(扬州东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (619, '和颐酒店·体验店(扬州琼花大厦古运河东关街店)', '扬州市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/619_和颐酒店·体验店(扬州琼花大厦古运河东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (620, '扬州瘦西湖君亭酒店', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/620_扬州瘦西湖君亭酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (621, '汉庭酒店(扬州瘦西湖文昌阁店)', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/621_汉庭酒店(扬州瘦西湖文昌阁店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (622, '扬州东关街美居酒店', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/622_扬州东关街美居酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (623, '扬州瘦西湖希尔顿欢朋酒店', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/623_扬州瘦西湖希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (624, '如家酒店·neo(扬州文昌阁维扬路店)', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/624_如家酒店·neo(扬州文昌阁维扬路店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (625, '艺龙安悦酒店(扬州瘦西湖东关街店)', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/625_艺龙安悦酒店(扬州瘦西湖东关街店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (626, '城市便捷酒店(扬州瘦西湖吾悦广场店)', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/626_城市便捷酒店(扬州瘦西湖吾悦广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (627, '扬州东关街个园亚朵酒店', '扬州市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/627_扬州东关街个园亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (628, '扬州文昌路希尔顿欢朋酒店', '扬州市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/628_扬州文昌路希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (629, '寻见·曾经来过丨Dream for Painters民宿（东关街景区店）', '扬州市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/629_寻见·曾经来过丨Dream for Painters民宿（东关街景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (630, '扬州迎宾馆', '扬州市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/630_扬州迎宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (631, '舟山云漫阁酒店（普陀半升洞码头店）', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/631_舟山云漫阁酒店（普陀半升洞码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (632, '朱家尖心屿海景度假酒店（蜈蚣峙码头普陀山机场店）', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/632_朱家尖心屿海景度假酒店（蜈蚣峙码头普陀山机场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (633, '舟山普陀希尔顿欢朋酒店', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/633_舟山普陀希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (634, '舟山W轻奢海景度假酒店(朱家尖普陀山机场店)', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/634_舟山W轻奢海景度假酒店(朱家尖普陀山机场店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (635, '舟山普陀洲际voco酒店', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/635_舟山普陀洲际voco酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (636, '全季酒店(舟山普陀东港店)', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/636_全季酒店(舟山普陀东港店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (637, '朱家尖南沙风情智能海景度假酒店', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/637_朱家尖南沙风情智能海景度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (638, '舟山普陀开元名庭酒店', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/638_舟山普陀开元名庭酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (639, '舟山希尔顿酒店', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/639_舟山希尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (640, '舟山橙子酒店(普陀山机场半升洞码头店)', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/640_舟山橙子酒店(普陀山机场半升洞码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (641, '舟山沈家门开元颐居酒店（半升洞码头店）', '舟山市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/641_舟山沈家门开元颐居酒店（半升洞码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (642, '普陀山舢岛·隐修行舍(普济寺店)', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/642_普陀山舢岛·隐修行舍(普济寺店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (643, '普陀半升洞码头希尔顿欢朋酒店', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/643_普陀半升洞码头希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (644, '禾合智能酒店（新城宝龙广场店）', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/644_禾合智能酒店（新城宝龙广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (645, '舟山悦庐· Elegant.Cozy.S海滨度假酒店（蜈蚣峙码头机场店）', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/645_舟山悦庐· Elegant.Cozy.S海滨度假酒店（蜈蚣峙码头机场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (646, '朱家尖微澜时光·loft套房度假民宿（普陀山机场蜈蚣峙码头店）', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/646_朱家尖微澜时光·loft套房度假民宿（普陀山机场蜈蚣峙码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (647, '普陀山息耒小庄', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/647_普陀山息耒小庄.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (648, '舟山净心·智能海景酒店(普陀半升洞码头店)', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/648_舟山净心·智能海景酒店(普陀半升洞码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (649, '舟山沈家门大酒店', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/649_舟山沈家门大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (650, '舟山绿城直营朱家尖东沙度假酒店', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/650_舟山绿城直营朱家尖东沙度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (651, '舟山娅莱酒店(普陀山机场半升洞码头店)', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/651_舟山娅莱酒店(普陀山机场半升洞码头店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (652, '舟山悦来度假酒店', '舟山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/652_舟山悦来度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (653, '普陀山大酒店', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/653_普陀山大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (654, '舟山寻梦海景酒店（普陀山机场店）', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/654_舟山寻梦海景酒店（普陀山机场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (655, '舟山心屿·岩客度假庄园（蜈蚣峙码头普陀山机场店）', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/655_舟山心屿·岩客度假庄园（蜈蚣峙码头普陀山机场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (656, 'AIXIA爱夏·渔港海景民宿（半升洞客运码头店）', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/656_AIXIA爱夏·渔港海景民宿（半升洞客运码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (657, '舟山朱家尖禅露·澜庭海景别墅酒店', '舟山市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/657_舟山朱家尖禅露·澜庭海景别墅酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (658, '普陀山息耒宝陀行舍', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/658_普陀山息耒宝陀行舍.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (659, '普陀山花筑奢·竹香居', '舟山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/659_普陀山花筑奢·竹香居.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (660, '普陀山观堂酒店', '舟山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/660_普陀山观堂酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (661, '千岛湖假日酒店', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/661_千岛湖假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (662, '千岛湖绿城度假酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/662_千岛湖绿城度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (663, '千岛湖鼎和湖景度假酒店(中心湖区店)', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/663_千岛湖鼎和湖景度假酒店(中心湖区店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (664, '千岛湖自由洲际殿', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/664_千岛湖自由洲际殿.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (665, '千岛湖观岛湖景度假公寓(新城银泰店)', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/665_千岛湖观岛湖景度假公寓(新城银泰店).jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (666, '绿城千岛湖喜来登度假酒店', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/666_绿城千岛湖喜来登度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (667, '千岛湖绿城蓝湾度假酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/667_千岛湖绿城蓝湾度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (668, '千岛湖阳光水岸度假酒店', '淳安市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/668_千岛湖阳光水岸度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (669, '千岛湖福朋喜来登酒店', '淳安市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/669_千岛湖福朋喜来登酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (670, '杭州千岛湖龙庭大酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/670_杭州千岛湖龙庭大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (671, '千岛湖望湖开元颐居酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/671_千岛湖望湖开元颐居酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (672, '千岛湖明豪国际度假酒店', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/672_千岛湖明豪国际度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (673, '千岛湖狄安娜湖景度假公寓（欢乐水世界店）', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/673_千岛湖狄安娜湖景度假公寓（欢乐水世界店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (674, '千岛湖丽景度假酒店(中心湖区店)', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/674_千岛湖丽景度假酒店(中心湖区店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (675, '千岛湖碧湖居·270°湖景度假Villa别墅(千岛湖中心湖区店）', '淳安市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/675_千岛湖碧湖居·270°湖景度假Villa别墅(千岛湖中心湖区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (676, '汉庭酒店(千岛湖景区店)', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/676_汉庭酒店(千岛湖景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (677, '千岛湖中心湖区亚朵酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/677_千岛湖中心湖区亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (678, '千岛湖伯瑞特度假酒店', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/678_千岛湖伯瑞特度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (679, '千岛湖开元度假村', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/679_千岛湖开元度假村.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (680, '柏曼酒店（杭州千岛湖景区银泰店）', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/680_柏曼酒店（杭州千岛湖景区银泰店）.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (681, '千岛湖怡景湖景度假公寓', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/681_千岛湖怡景湖景度假公寓.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (682, '千岛湖滨江希尔顿度假酒店', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/682_千岛湖滨江希尔顿度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (683, '方小义Junx家庭影院LOFT湖景公寓(千岛湖中心湖区天屿景区店)', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/683_方小义Junx家庭影院LOFT湖景公寓(千岛湖中心湖区天屿景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (684, '千岛湖君澜度假酒店(中心湖景区店)', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/684_千岛湖君澜度假酒店(中心湖景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (685, '千岛湖雅莱度假酒店', '淳安市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/685_千岛湖雅莱度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (686, '千岛湖奈斯湖景度假公寓', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/686_千岛湖奈斯湖景度假公寓.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (687, '千岛湖温馨岛蝶来湖景度假酒店', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/687_千岛湖温馨岛蝶来湖景度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (688, '如家酒店(杭州千岛湖银泰广场店)', '淳安市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/688_如家酒店(杭州千岛湖银泰广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (689, '千岛湖丽中·LiZhong·度假公寓（中心湖景区店）', '淳安市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/689_千岛湖丽中·LiZhong·度假公寓（中心湖景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (690, '千岛湖玖伴loft湖景公寓', '淳安市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/690_千岛湖玖伴loft湖景公寓.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (691, '镜湖之星酒店（绍兴奥体中心后墅路地铁站店）', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/691_镜湖之星酒店（绍兴奥体中心后墅路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (692, '梧品·遇见百草园·树下奇遇时光简奢酒店（绍兴鲁迅故里景区店）', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/692_梧品·遇见百草园·树下奇遇时光简奢酒店（绍兴鲁迅故里景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (693, '云朵酒店(绍兴鲁迅故里景区店)', '绍兴市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/693_云朵酒店(绍兴鲁迅故里景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (694, '乌篷船庭院酒店（绍兴鲁迅故里店）', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/694_乌篷船庭院酒店（绍兴鲁迅故里店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (695, '汉庭酒店（绍兴鲁迅故里店）', '绍兴市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/695_汉庭酒店（绍兴鲁迅故里店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (696, '绍兴四季阳光风情酒店(鲁迅东路店)', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/696_绍兴四季阳光风情酒店(鲁迅东路店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (697, '绍兴鲁迅故里亚朵酒店', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/697_绍兴鲁迅故里亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (698, '曼居酒店(绍兴仓桥直街迎恩门水街店)', '绍兴市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/698_曼居酒店(绍兴仓桥直街迎恩门水街店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (699, '云境泊悦酒店（绍兴鲁迅故里世茂广场店）', '绍兴市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/699_云境泊悦酒店（绍兴鲁迅故里世茂广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (700, '绍兴鲁迅故里奇遇•陶然酒店（仓桥直街店）', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/700_绍兴鲁迅故里奇遇•陶然酒店（仓桥直街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (701, '美娱·星峰电竞酒店(绍兴鲁迅故里店)', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/701_美娱·星峰电竞酒店(绍兴鲁迅故里店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (702, '初柒别院｜栖居古城·花园度假酒店（鲁迅故里仓桥直街店）', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/702_初柒别院｜栖居古城·花园度假酒店（鲁迅故里仓桥直街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (703, '汇8名仕酒店(柯桥银泰店)', '绍兴市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/703_汇8名仕酒店(柯桥银泰店).jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (704, '绍兴大禹开元观堂', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/704_绍兴大禹开元观堂.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (705, '开元曼居酒店(绍兴鲁迅故里仓桥直街店)', '绍兴市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/705_开元曼居酒店(绍兴鲁迅故里仓桥直街店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (706, '汉庭酒店(绍兴柯桥会展中心店)', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/706_汉庭酒店(绍兴柯桥会展中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (707, '宜居影院酒店（鲁迅故里景区店）', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/707_宜居影院酒店（鲁迅故里景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (708, '绍兴心缘酒店(鲁迅故里仓桥直街店)', '绍兴市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/708_绍兴心缘酒店(鲁迅故里仓桥直街店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (709, '绍兴鲁迅故里大悦城亚朵酒店', '绍兴市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/709_绍兴鲁迅故里大悦城亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (710, '景汐酒店(绍兴鲁迅故里店)', '绍兴市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/710_景汐酒店(绍兴鲁迅故里店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (711, '千喆酒店(绍兴奥体中心凤林路地铁站店)', '绍兴市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/711_千喆酒店(绍兴奥体中心凤林路地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (712, '栖溪民宿（鲁迅故里度假区仓桥直街店）', '绍兴市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/712_栖溪民宿（鲁迅故里度假区仓桥直街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (713, '有巢·云境酒店（绍兴城市广场地铁站鲁迅故里店)', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/713_有巢·云境酒店（绍兴城市广场地铁站鲁迅故里店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (714, '绍兴鲁迅故居雷迪森怿曼酒店（仓桥直街店）', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/714_绍兴鲁迅故居雷迪森怿曼酒店（仓桥直街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (715, '绍兴蕺山文苑酒店（鲁迅故里书圣故里店）', '绍兴市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/715_绍兴蕺山文苑酒店（鲁迅故里书圣故里店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (716, '一千零一夜庭院酒店（绍兴书圣故里仓桥老街店）', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/716_一千零一夜庭院酒店（绍兴书圣故里仓桥老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (717, '圣麓·庭院美宿(绍兴城市广场地铁站鲁迅故里店)', '绍兴市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/717_圣麓·庭院美宿(绍兴城市广场地铁站鲁迅故里店).jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (718, '温度源酒店（绍兴奥体中心市政府店）', '绍兴市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/718_温度源酒店（绍兴奥体中心市政府店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (719, '云朵君会酒店(鲁迅故里银泰城店)', '绍兴市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/719_云朵君会酒店(鲁迅故里银泰城店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (720, '汇8连锁酒店(柯桥万达轻纺城体育中心店)', '绍兴市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/720_汇8连锁酒店(柯桥万达轻纺城体育中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (721, '松岳酒店 （黄山风景区汤口南大门店）', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/721_松岳酒店 （黄山风景区汤口南大门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (722, '瑞居酒店(黄山屯溪新安江畔店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/722_瑞居酒店(黄山屯溪新安江畔店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (723, 'MisooHi隐秘之境酒店（黄山屯溪老街店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/723_MisooHi隐秘之境酒店（黄山屯溪老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (724, '猕猴桃·ME HOTEL (黄山屯溪老街店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/724_猕猴桃·ME HOTEL (黄山屯溪老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (725, '天宇酒店(黄山屯溪老街店)', '黄山市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/725_天宇酒店(黄山屯溪老街店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (726, '桔子酒店(黄山风景区南大门汤口店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/726_桔子酒店(黄山风景区南大门汤口店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (727, '听溪酒店（黄山屯溪老街店）', '黄山市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/727_听溪酒店（黄山屯溪老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (728, '悦居酒店(黄山屯溪老街店)', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/728_悦居酒店(黄山屯溪老街店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (729, '维也纳国际酒店(黄山风景区南大门店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/729_维也纳国际酒店(黄山风景区南大门店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (730, '云竹·小筑空间艺术花园HOTEL(屯溪老街黎阳老街店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/730_云竹·小筑空间艺术花园HOTEL(屯溪老街黎阳老街店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (731, '全季酒店(黄山风景区南大门换乘中心店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/731_全季酒店(黄山风景区南大门换乘中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (732, '黄山国际大酒店(屯溪老街/黎阳老街店)', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/732_黄山国际大酒店(屯溪老街_黎阳老街店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (733, '黄山昱城皇冠假日酒店', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/733_黄山昱城皇冠假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (734, '祥悦国际酒店（黄山火车站黄山茶城店）', '黄山市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/734_祥悦国际酒店（黄山火车站黄山茶城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (735, '麗枫酒店(黄山风景区南大门换乘中心店)', '黄山市市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/735_麗枫酒店(黄山风景区南大门换乘中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (736, '全季酒店(黄山风景区店)', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/736_全季酒店(黄山风景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (737, '朵兰达V酒店（黄山屯溪老街店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/737_朵兰达V酒店（黄山屯溪老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (738, '黄山伴山民宿（高铁北站西溪南古村落店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/738_黄山伴山民宿（高铁北站西溪南古村落店）.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (739, '青柠花民宿（黄山南大门换乘中心店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/739_青柠花民宿（黄山南大门换乘中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (740, '夜泊未来酒店（黄山屯溪老街黎阳老街店）', '黄山市市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/740_夜泊未来酒店（黄山屯溪老街黎阳老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (741, '黄山老街口酒店(屯溪老街黎阳老街景区店)', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/741_黄山老街口酒店(屯溪老街黎阳老街景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (742, '丽斯未来酒店（黄山风景区南大门换乘中心店）', '黄山市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/742_丽斯未来酒店（黄山风景区南大门换乘中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (743, '丽斯未来酒店（黄山屯溪老街店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/743_丽斯未来酒店（黄山屯溪老街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (744, '锦江之星酒店(黄山风景区南大门逍遥溪换乘中心店）', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/744_锦江之星酒店(黄山风景区南大门逍遥溪换乘中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (745, '全季酒店(黄山风景区南大门换乘中心汤口店)', '黄山市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/745_全季酒店(黄山风景区南大门换乘中心汤口店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (746, '全季酒店（黄山屯溪老街中心店）', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/746_全季酒店（黄山屯溪老街中心店）.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (747, '黄山屯溪新安江畔亚朵酒店', '黄山市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/747_黄山屯溪新安江畔亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (748, '黄山风景区南大门换乘中心亚朵酒店', '黄山市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/748_黄山风景区南大门换乘中心亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (749, '见山别院(黄山风景区南大门换乘中心汤口店)', '黄山市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/749_见山别院(黄山风景区南大门换乘中心汤口店).jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (750, '格林东方酒店(黄山风景区店)', '黄山市市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/750_格林东方酒店(黄山风景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (751, '你好•九江｜欢悦MAX影院酒店（九江站九江学院店）', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/751_你好•九江｜欢悦MAX影院酒店（九江站九江学院店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (752, '九江LEJNN郦瑾酒店(九江火车站大中路步行街店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/752_九江LEJNN郦瑾酒店(九江火车站大中路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (753, '维也纳酒店(九江火车站店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/753_维也纳酒店(九江火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (754, '九江浔阳麦谷善邸酒店', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/754_九江浔阳麦谷善邸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (755, '晨枫臻品酒店(九江火车站万达广场店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/755_晨枫臻品酒店(九江火车站万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (756, '汉庭酒店(九江浔阳路步行街店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/756_汉庭酒店(九江浔阳路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (757, '云绯国际酒店（九江火车站国际奥特莱斯店）', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/757_云绯国际酒店（九江火车站国际奥特莱斯店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (758, '天海悦居酒店(九江火车站大中路步行街店)', '九江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/758_天海悦居酒店(九江火车站大中路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (759, '浔阳•天海丨WindowScape•MeLLowWave•柏唐酒店（招商花园城店）', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/759_浔阳•天海丨WindowScape•MeLLowWave•柏唐酒店（招商花园城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (760, '桔子酒店(九江火车站店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/760_桔子酒店(九江火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (761, '荣华建国酒店(九江学院十里万达广场店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/761_荣华建国酒店(九江学院十里万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (762, '天海裕园酒店(九江火车站店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/762_天海裕园酒店(九江火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (763, '城市更捷酒店(九江浔阳路步行街店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/763_城市更捷酒店(九江浔阳路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (764, '铂悦水晶酒店(火车站联盛九江快乐城店)', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/764_铂悦水晶酒店(火车站联盛九江快乐城店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (765, '嘻游·loft电竞影音民宿（九江火车站万达广场店）', '九江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/765_嘻游·loft电竞影音民宿（九江火车站万达广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (766, 'CityWalk●柏唐｜浔城美学设计师●慕酒店(九江火车站联盛快乐城店)', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/766_CityWalk●柏唐｜浔城美学设计师●慕酒店(九江火车站联盛快乐城店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (767, '九江信华建国酒店', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/767_九江信华建国酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (768, '九江逸嘉电竞酒店（浔阳楼火车站店）', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/768_九江逸嘉电竞酒店（浔阳楼火车站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (769, '花园大酒店(九江浔阳楼七中店)', '九江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/769_花园大酒店(九江浔阳楼七中店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (770, '九江浔阳希尔顿欢朋酒店', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/770_九江浔阳希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (771, '普瑞思S酒店(九江南山公园店)', '九江市中心', 3, 4.10, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/771_普瑞思S酒店(九江南山公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (772, '泓泰酒店（大中路步行街店）', '九江市中心', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/772_泓泰酒店（大中路步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (773, '九江百嘉洲际酒店(浔阳楼大中路步行街店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/773_九江百嘉洲际酒店(浔阳楼大中路步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (774, '九江红枫宾馆(火车站店)', '九江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/774_九江红枫宾馆(火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (775, '如家精选酒店（九江火车站站前广场店）', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/775_如家精选酒店（九江火车站站前广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (776, '维也纳酒店(九江火车站快乐城店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/776_维也纳酒店(九江火车站快乐城店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (777, '雲上洲际酒店(九江火车站庐山风景区店)', '九江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/777_雲上洲际酒店(九江火车站庐山风景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (778, '怡致酒店（浔阳楼大中路步行街店）', '九江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/778_怡致酒店（浔阳楼大中路步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (779, '盛泰天缘电竞酒店（九江火车站店）', '九江市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/779_盛泰天缘电竞酒店（九江火车站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (780, '凯里业德酒店（九江火车站快乐城店）', '九江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/780_凯里业德酒店（九江火车站快乐城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (781, '武夷山市和祥茶旅酒店（三姑度假区高尔夫店）', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/781_武夷山市和祥茶旅酒店（三姑度假区高尔夫店）.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (782, '武夷山景城·假日酒店（三姑度假区印象大红袍店）', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/782_武夷山景城·假日酒店（三姑度假区印象大红袍店）.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (783, '武夷山通达环球酒店(印象大红袍三姑度假区店)', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/783_武夷山通达环球酒店(印象大红袍三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (784, '武夷·椿泊度假酒店', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/784_武夷·椿泊度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (785, '武夷山维也纳国际酒店(三姑度假区印象大红袍店)', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/785_武夷山维也纳国际酒店(三姑度假区印象大红袍店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (786, '武夷山非凡诚品酒店（三姑度假区店）', '武夷山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/786_武夷山非凡诚品酒店（三姑度假区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (787, '武夷山夷山随喜山舍民宿(三姑度假区印象大红袍店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/787_武夷山夷山随喜山舍民宿(三姑度假区印象大红袍店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (788, '溪畔听雨丨一方茶境SereniTea・禅意庭院美墅(武夷山三姑度假区店)', '武夷山市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/788_溪畔听雨丨一方茶境SereniTea・禅意庭院美墅(武夷山三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (789, '武夷山涵轩堂·HolidayVilla轻奢设计美宿(三姑度假区店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/789_武夷山涵轩堂·HolidayVilla轻奢设计美宿(三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (790, '武夷山三姑度假区天游峰路亚朵酒店', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/790_武夷山三姑度假区天游峰路亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (791, '武夷山酒店', '武夷山市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/791_武夷山酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (792, '梦武夷｜Wuyi Retreat·茶宿山居(武夷山景区南入口店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/792_梦武夷｜Wuyi Retreat·茶宿山居(武夷山景区南入口店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (793, '武夷山万豪酒店(三姑度假区店)', '武夷山市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/793_武夷山万豪酒店(三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (794, '武夷山印象度假大酒店(三姑度假区店)', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/794_武夷山印象度假大酒店(三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (795, '武夷山微宿空间民宿(三姑度假区店)', '武夷山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/795_武夷山微宿空间民宿(三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (796, '武夷山大方居别墅酒店(三姑度假区印象大红袍店)', '武夷山市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/796_武夷山大方居别墅酒店(三姑度假区印象大红袍店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (797, '武夷山凯乐福度假酒店(印象大红袍店)', '武夷山市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/797_武夷山凯乐福度假酒店(印象大红袍店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (798, '武夷山·近水听山Streamside Mountain 度假别墅(三姑度假区店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/798_武夷山·近水听山Streamside Mountain 度假别墅(三姑度假区店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (799, '观蓝舒苑・Mountain·view·Vacation·设计师美墅(三姑度假区店）', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/799_观蓝舒苑・Mountain·view·Vacation·设计师美墅(三姑度假区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (800, '汉庭酒店(武夷山三姑度假区天游峰路店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/800_汉庭酒店(武夷山三姑度假区天游峰路店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (801, '武夷山旧街五号云起时客栈', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/801_武夷山旧街五号云起时客栈.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (802, '武夷山憬居度假酒店', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/802_武夷山憬居度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (803, '武夷山璞悦酒店', '武夷山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/803_武夷山璞悦酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (804, '武夷山温德姆花园酒店(景区南入口店)', '武夷山市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/804_武夷山温德姆花园酒店(景区南入口店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (805, '武夷山暮春山民宿（三姑度假区店）', '武夷山市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/805_武夷山暮春山民宿（三姑度假区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (806, '武夷山花海轻奢度假酒店', '武夷山市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/806_武夷山花海轻奢度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (807, '聚源·茶叙·温泉私汤山景度假雅墅（武夷山三姑度假区店）', '武夷山市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/807_聚源·茶叙·温泉私汤山景度假雅墅（武夷山三姑度假区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (808, '武夷山·Mountain view全景观山丨椿己山居（九曲溪竹筏码头店）', '武夷山市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/808_武夷山·Mountain view全景观山丨椿己山居（九曲溪竹筏码头店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (809, '武夷山柏然居民宿(南源岭店)', '武夷山市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/809_武夷山柏然居民宿(南源岭店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (810, '武夷山印象戴斯酒店(印象大红袍剧场店)', '武夷山市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/810_武夷山印象戴斯酒店(印象大红袍剧场店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (811, '张家界天门山丽呈睿轩酒店(天门山索道店)', '张家界市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/811_张家界天门山丽呈睿轩酒店(天门山索道店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (812, '张家界山岚云涧酒店（天门山索道店）', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/812_张家界山岚云涧酒店（天门山索道店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (813, '维也纳国际酒店（张家界天门山索道站店）', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/813_维也纳国际酒店（张家界天门山索道站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (814, '张家界谷奈酒店（天门山店）', '张家界市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/814_张家界谷奈酒店（天门山店）.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (815, '张家界禾田居度假酒店', '张家界市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/815_张家界禾田居度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (816, '维也纳3好酒店(张家界天门山索道站店)', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/816_维也纳3好酒店(张家界天门山索道站店).jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (817, '张家界天门山索道天门居亚朵酒店', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/817_张家界天门山索道天门居亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (818, '天门山云美别苑', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/818_天门山云美别苑.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (819, '张家界天门山温德姆花园酒店', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/819_张家界天门山温德姆花园酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (820, '麗枫酒店（张家界天门山索道店）', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/820_麗枫酒店（张家界天门山索道店）.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (821, '如家酒店(张家界吉首大学七十二奇楼店)', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/821_如家酒店(张家界吉首大学七十二奇楼店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (822, 'May\'s Home设计师民宿', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/822_May\'s Home设计师民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (823, '沄栖清舍·高空全景度假酒店(天门山国家森林公园索道店)', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/823_沄栖清舍·高空全景度假酒店(天门山国家森林公园索道店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (824, '聚湘源·Family极简轻奢全屋智能山景民宿(天门山索道店)', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/824_聚湘源·Family极简轻奢全屋智能山景民宿(天门山索道店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (825, '心之所巷民宿(张家界天门山索道站店)', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/825_心之所巷民宿(张家界天门山索道站店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (826, '张家界天门山希尔顿花园酒店', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/826_张家界天门山希尔顿花园酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (827, '如家酒店(张家界天门山景区索道站店)', '张家界市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/827_如家酒店(张家界天门山景区索道站店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (828, '张家界永定区天门山索道站亚朵酒店', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/828_张家界永定区天门山索道站亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (829, '天门·洞见WeStay·日落美景·城市夜景民宿', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/829_天门·洞见WeStay·日落美景·城市夜景民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (830, '夏朵•全屋智能城市民宿（天门山索道店）', '张家界市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/830_夏朵•全屋智能城市民宿（天门山索道店）.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (831, '全季酒店(张家界吉首大学店)', '张家界市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/831_全季酒店(张家界吉首大学店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (832, '张家界天门夜语酒店(天门山索道站店)', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/832_张家界天门夜语酒店(天门山索道站店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (833, '天门山仟酒店', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/833_天门山仟酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (834, '由里舒泊·智慧酒店（张家界火车站店）', '张家界市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/834_由里舒泊·智慧酒店（张家界火车站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (835, '清朵空间民宿', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/835_清朵空间民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (836, '桔子酒店(张家界吉首大学店)', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/836_桔子酒店(张家界吉首大学店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (837, '张家界天门山景区索道站锦江都城酒店', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/837_张家界天门山景区索道站锦江都城酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (838, '张家界天门山希尔顿惠庭酒店', '张家界市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/838_张家界天门山希尔顿惠庭酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (839, '张家界天门山希尔顿欢朋酒店', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/839_张家界天门山希尔顿欢朋酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (840, '张家界漫舍客栈(天门山索道站店)', '张家界市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/840_张家界漫舍客栈(天门山索道站店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (841, '全季酒店(珠海香洲区店)', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/841_全季酒店(珠海香洲区店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (842, 'Rollin•如林酒店 (珠海拱北口岸富华里店)', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/842_Rollin•如林酒店 (珠海拱北口岸富华里店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (843, '珠海高廷X酒店(珠海情侣路海滨泳场旗舰店)', '珠海市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/843_珠海高廷X酒店(珠海情侣路海滨泳场旗舰店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (844, '珠海·富米｜FullmeAerialviewCinema江景酒店(拱北口岸珠海站店)', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/844_珠海·富米｜FullmeAerialviewCinema江景酒店(拱北口岸珠海站店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (845, '亿铂酒店(珠海拱北口岸富华里店)', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/845_亿铂酒店(珠海拱北口岸富华里店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (846, '珠海华发喜来登酒店', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/846_珠海华发喜来登酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (847, '珠海大业酒店(拱北口岸富华里店)', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/847_珠海大业酒店(拱北口岸富华里店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (848, '珠海情侣路海滨泳场海景亚朵X酒店', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/848_珠海情侣路海滨泳场海景亚朵X酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (849, 'Palm Music棕樂酒店（珠海情侣路海滨泳场店）', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/849_Palm Music棕樂酒店（珠海情侣路海滨泳场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (850, '小象听海酒店(情侣路海滨泳场店)', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/850_小象听海酒店(情侣路海滨泳场店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (851, '珠海希尔顿酒店', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/851_珠海希尔顿酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (852, '全季酒店（珠海情侣中路日月贝大剧院店）', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/852_全季酒店（珠海情侣中路日月贝大剧院店）.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (853, '珠海·天宸|starryskyrealmdgarden·设计师美宿(万象汇店)', '珠海市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/853_珠海·天宸_starryskyrealmdgarden·设计师美宿(万象汇店).jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (854, 'SKY·半岛假日酒店（珠海情侣中路万象汇店）', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/854_SKY·半岛假日酒店（珠海情侣中路万象汇店）.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (855, '珠海璃上酒店(情侣路海滨泳场店)', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/855_珠海璃上酒店(情侣路海滨泳场店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (856, '7天酒店(珠海城市阳台海滨泳场店)', '珠海市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/856_7天酒店(珠海城市阳台海滨泳场店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (857, '铂琳顿公寓(珠海横琴口岸店)', '珠海市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/857_铂琳顿公寓(珠海横琴口岸店).jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (858, '全季酒店（珠海海滨泳场情侣南路店）', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/858_全季酒店（珠海海滨泳场情侣南路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (859, '珠海·蔚景温德姆丨WYNDHAW酒店（珠海站华发商都店)', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/859_珠海·蔚景温德姆丨WYNDHAW酒店（珠海站华发商都店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (860, '珠海情侣路日月贝大剧院亚朵酒店', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/860_珠海情侣路日月贝大剧院亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (861, '汉庭酒店(珠海拱北口岸店)', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/861_汉庭酒店(珠海拱北口岸店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (862, '珠海新骏景万豪酒店(情侣路香炉湾沙滩店)', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/862_珠海新骏景万豪酒店(情侣路香炉湾沙滩店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (863, '珠海望海楼酒店', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/863_珠海望海楼酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (864, 'De Castle 德堡花园酒店(珠海情侣路海滨泳场店）', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/864_De Castle 德堡花园酒店(珠海情侣路海滨泳场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (865, '珠海果子跳动酒店（拱北口岸情侣南路店）', '珠海市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/865_珠海果子跳动酒店（拱北口岸情侣南路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (866, '珠海·青麦电影Dolby Cinema 酒店（情侣路海滨泳场店）', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/866_珠海·青麦电影Dolby Cinema 酒店（情侣路海滨泳场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (867, '汉庭酒店（珠海湾仔国际会展中心南湾南路店）', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/867_汉庭酒店（珠海湾仔国际会展中心南湾南路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (868, '珠海象往酒店（拱北口岸高铁站店）', '珠海市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/868_珠海象往酒店（拱北口岸高铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (869, '如家派柏·云酒店(珠海情侣路日月贝店)', '珠海市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/869_如家派柏·云酒店(珠海情侣路日月贝店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (870, '曼哈顿国际酒店公寓（拱北口岸珠海站店）', '珠海市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/870_曼哈顿国际酒店公寓（拱北口岸珠海站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (871, '漓江乐途酒店(桂林两江四湖象鼻山景区店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/871_漓江乐途酒店(桂林两江四湖象鼻山景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (872, '天龙湾融悦酒店（桂林两江四湖象鼻山景区店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/872_天龙湾融悦酒店（桂林两江四湖象鼻山景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (873, '贵宾舍LUX CABINS一方山水酒店（象鼻山景区两江四湖店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/873_贵宾舍LUX CABINS一方山水酒店（象鼻山景区两江四湖店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (874, '港舍屋顶观景酒店(桂林两江四湖象鼻山店)', '桂林市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/874_港舍屋顶观景酒店(桂林两江四湖象鼻山店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (875, '漓江望月•Quiet Holiday 湖畔酒店（桂林两江四湖象鼻山景区店）', '桂林市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/875_漓江望月•Quiet Holiday 湖畔酒店（桂林两江四湖象鼻山景区店）.jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (876, '全季酒店（桂林象鼻山日月双塔店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/876_全季酒店（桂林象鼻山日月双塔店）.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (877, '港舍·漫居酒店(桂林两江四湖象鼻山景区店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/877_港舍·漫居酒店(桂林两江四湖象鼻山景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (878, '桂林喜来登饭店(象鼻山两江四湖店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/878_桂林喜来登饭店(象鼻山两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (879, '新球大酒店(桂林火车站店)', '桂林市中心', 3, 4.20, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/879_新球大酒店(桂林火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (880, '地球村美宿', '桂林市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/880_地球村美宿.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (881, '桂林高铁北站恒大广场亚朵酒店', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/881_桂林高铁北站恒大广场亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (882, '桂林象山·凡尔赛酒店(桂林站店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/882_桂林象山·凡尔赛酒店(桂林站店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (883, '雅斯特美途酒店(桂林火车站象山公园店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/883_雅斯特美途酒店(桂林火车站象山公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (884, '米先生的家公寓（桂林象鼻山公园两江四湖店）', '桂林市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/884_米先生的家公寓（桂林象鼻山公园两江四湖店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (885, '桂林两江四湖象鼻山桔子水晶酒店', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/885_桂林两江四湖象鼻山桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (886, '桂林大酒店(象鼻山两江四湖店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/886_桂林大酒店(象鼻山两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (887, '维也纳酒店(桂林站两江四湖店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/887_维也纳酒店(桂林站两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (888, '环球国际酒店(桂林两江四湖象鼻山店)', '桂林市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/888_环球国际酒店(桂林两江四湖象鼻山店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (889, '柏曼酒店(桂林两江四湖象鼻山景区店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/889_柏曼酒店(桂林两江四湖象鼻山景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (890, '桂林漓江云端酒店(桂林两江四湖象鼻山店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/890_桂林漓江云端酒店(桂林两江四湖象鼻山店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (891, '桂林杉湖大酒店(两江四湖象鼻山景区店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/891_桂林杉湖大酒店(两江四湖象鼻山景区店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (892, '桂林悦城山水之镜酒店（桂林站万象城店）', '桂林市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/892_桂林悦城山水之镜酒店（桂林站万象城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (893, '象鼻山港舍City core漫步·城市中心酒店(桂林两江四湖店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/893_象鼻山港舍City core漫步·城市中心酒店(桂林两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (894, '诗与远方SYYF·漓江院子酒店(桂林象鼻山两江四湖店)', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/894_诗与远方SYYF·漓江院子酒店(桂林象鼻山两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (895, '锦尚精品酒店(桂林火车站两江四湖店)', '桂林市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/895_锦尚精品酒店(桂林火车站两江四湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (896, '瑞君苑·Courtyard Holiday·庭院民宿（桂林两江四湖象鼻山店）', '桂林市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/896_瑞君苑·Courtyard Holiday·庭院民宿（桂林两江四湖象鼻山店）.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (897, '中心璞云酒店(桂林两江四湖象鼻山公园店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/897_中心璞云酒店(桂林两江四湖象鼻山公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (898, 'SYYF诗与远方·象山有约酒店（桂林象鼻山两江四湖店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/898_SYYF诗与远方·象山有约酒店（桂林象鼻山两江四湖店）.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (899, '冠宿国际大酒店（桂林两江四湖万象城店）', '桂林市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/899_冠宿国际大酒店（桂林两江四湖万象城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (900, '希尔曼智能酒店(桂林两江四湖东西巷店)', '桂林市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/900_希尔曼智能酒店(桂林两江四湖东西巷店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (901, '昆明彩森酒店(世纪城海乐世界购物中心店)', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/901_昆明彩森酒店(世纪城海乐世界购物中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (902, '七彩云南BETTERDREAM•GARDEN瓣朵海景酒店(呈贡区昆明高铁南站店)', '昆明市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/902_七彩云南BETTERDREAM•GARDEN瓣朵海景酒店(呈贡区昆明高铁南站店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (903, '昆明锦江大酒店', '昆明市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/903_昆明锦江大酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (904, '八骏大酒店(昆明火车站国贸中心店)', '昆明市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/904_八骏大酒店(昆明火车站国贸中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (905, '18度居智慧酒店(昆明万科魅力之城广卫地铁站店)', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/905_18度居智慧酒店(昆明万科魅力之城广卫地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (906, '昆明Mariposa力豪和尊酒店(海乐世界店)', '昆明市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/906_昆明Mariposa力豪和尊酒店(海乐世界店).jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (907, 'Lake·Villa云湖畔别院（昆明滇池海埂大坝店）', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/907_Lake·Villa云湖畔别院（昆明滇池海埂大坝店）.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (908, '龙猫精灵丨YOUNG·IS·DIEFERENT酒店（昆明老街弥勒寺地铁站店）', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/908_龙猫精灵丨YOUNG·IS·DIEFERENT酒店（昆明老街弥勒寺地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (909, '全季酒店(昆明呈贡斗南花市店)', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/909_全季酒店(昆明呈贡斗南花市店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (910, 'SFEEL设计师酒店(昆明老街南屏步行街店)', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/910_SFEEL设计师酒店(昆明老街南屏步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (911, '如家UP华驿国际酒店(昆明长水国际机场店)', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/911_如家UP华驿国际酒店(昆明长水国际机场店).jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (912, '汉庭酒店（昆明北部汽车站地铁站店）', '昆明市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/912_汉庭酒店（昆明北部汽车站地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (913, '昆明•丽柏WAVESWEPT•MISTYSEA•设计酒店(昆明站环城南路地铁站店)', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/913_昆明•丽柏WAVESWEPT•MISTYSEA•设计酒店(昆明站环城南路地铁站店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (914, '麗枫酒店(昆明火车站店)', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/914_麗枫酒店(昆明火车站店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (915, '昆明南屏步行街老街亚朵酒店', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/915_昆明南屏步行街老街亚朵酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (916, '昆明JEN酒店香格里拉集团', '昆明市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/916_昆明JEN酒店香格里拉集团.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (917, '云朵·里美宿（昆明老街翠湖公园店）', '昆明市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/917_云朵·里美宿（昆明老街翠湖公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (918, '随云居loft潮奢精品美宿（万达双塔店）', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/918_随云居loft潮奢精品美宿（万达双塔店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (919, '美悦酒店(昆明南屏步行街金马碧鸡坊店)', '昆明市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/919_美悦酒店(昆明南屏步行街金马碧鸡坊店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (920, '洲致国际酒店(昆明火车站北广场店)', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/920_洲致国际酒店(昆明火车站北广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (921, '桔子酒店(昆明南屏步行街店)', '昆明市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/921_桔子酒店(昆明南屏步行街店).jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (922, '昆明S酒店（昆明老街南屏步行街店）', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/922_昆明S酒店（昆明老街南屏步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (923, '昱凯·云归处民宿（昆明老街南屏步行街店）', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/923_昱凯·云归处民宿（昆明老街南屏步行街店）.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (924, '昆明翠湖丽瑞德酒店', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/924_昆明翠湖丽瑞德酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (925, '田苑・轻居KUNMING・Old STREETCOMFORTSMOOTH酒店(云大医院翠湖店)', '昆明市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/925_田苑・轻居KUNMING・Old STREETCOMFORTSMOOTH酒店(云大医院翠湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (926, '昆明香格里拉酒店', '昆明市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/926_昆明香格里拉酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (927, '昆明中维翠湖宾馆', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/927_昆明中维翠湖宾馆.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (928, '泊兰庭酒店(昆明长水国际机场店)', '昆明市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/928_泊兰庭酒店(昆明长水国际机场店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (929, '朵兰达V酒店（昆明火车站环城南路地铁站店）', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/929_朵兰达V酒店（昆明火车站环城南路地铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (930, '昆明洲际酒店', '昆明市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/930_昆明洲际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (931, '湄江岛一线江景酒店（西双版纳景洪告庄星光夜市店）', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/931_湄江岛一线江景酒店（西双版纳景洪告庄星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (932, 'FANKOO杋髙酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/932_FANKOO杋髙酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (933, '雲至设计师·恒温泳池度假酒店(景洪市告庄西双景星光夜市店)', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/933_雲至设计师·恒温泳池度假酒店(景洪市告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (934, '西双版纳景洪椿山夕上SAND POOL半山度假别苑', '西双版纳市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/934_西双版纳景洪椿山夕上SAND POOL半山度假别苑.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (935, '纳伽·S酒店（西双版纳景洪告庄西双景星光夜市大金塔店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/935_纳伽·S酒店（西双版纳景洪告庄西双景星光夜市大金塔店）.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (936, '三色云河·雨林雾隐度假VILLA民宿（西双版纳景洪勐泐大佛寺店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/936_三色云河·雨林雾隐度假VILLA民宿（西双版纳景洪勐泐大佛寺店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (937, '深浅·金塔临畔 | 智控雅居酒店（景洪告庄西双景星光夜市店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/937_深浅·金塔临畔 _ 智控雅居酒店（景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (938, '晖廷云居高空泳池度假酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/938_晖廷云居高空泳池度假酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (939, '云朵·曼路|圣托里尼江景Villa花园别院(告庄西双景星光夜市店)', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/939_云朵·曼路_圣托里尼江景Villa花园别院(告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (940, '汉庭酒店(西双版纳孔雀湖店)', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/940_汉庭酒店(西双版纳孔雀湖店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (941, '维也纳酒店(西双版纳景洪告庄星光夜市店)', '西双版纳市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/941_维也纳酒店(西双版纳景洪告庄星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (942, '云驻·诺亚江景度假酒店(西双版纳景洪告庄西双景星光夜市店)', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/942_云驻·诺亚江景度假酒店(西双版纳景洪告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (943, '纳鲁汇瑞|云顶观景酒店(西双版纳景洪告庄西双景星光夜市店)', '西双版纳市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/943_纳鲁汇瑞_云顶观景酒店(西双版纳景洪告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (944, '南漫·密境花园酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/944_南漫·密境花园酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (945, '云泊居里酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/945_云泊居里酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (946, '云朵星畔高空泳池度假酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/946_云朵星畔高空泳池度假酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (947, '蒙纳度假酒店（西双版纳景洪告庄星光夜市店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/947_蒙纳度假酒店（西双版纳景洪告庄星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (948, '西双版纳景洪繁花江景民宿（告庄星光夜市店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/948_西双版纳景洪繁花江景民宿（告庄星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (949, '璞境花语艺术酒店（西双版纳景洪告庄西双景星光夜市店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/949_璞境花语艺术酒店（西双版纳景洪告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (950, '何璞·丽玥Desert Style花园度假酒店（西双版纳景洪星光夜市店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/950_何璞·丽玥Desert Style花园度假酒店（西双版纳景洪星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (951, '西双版纳景洪云澜夕上·高空江景设计酒店（告庄西双景星光夜市店）', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/951_西双版纳景洪云澜夕上·高空江景设计酒店（告庄西双景星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (952, '西双版纳景洪雅卡图温泉度假酒店(勐泐大佛寺店)', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/952_西双版纳景洪雅卡图温泉度假酒店(勐泐大佛寺店).jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (953, '秋水梵天·花园全景宿集SKYline（西双版纳景洪告庄星光夜市店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/953_秋水梵天·花园全景宿集SKYline（西双版纳景洪告庄星光夜市店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (954, '雨林秘境丨江畔·庭院度假美墅(景洪告庄西双景星光夜市店)', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/954_雨林秘境丨江畔·庭院度假美墅(景洪告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (955, '西双版纳悦莲庄菠萝度假酒店', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/955_西双版纳悦莲庄菠萝度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (956, '汉庭酒店（西双版纳景洪曼听御花园店）', '西双版纳市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/956_汉庭酒店（西双版纳景洪曼听御花园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (957, '西双版纳稷泽万达文华度假酒店', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/957_西双版纳稷泽万达文华度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (958, '江语江景·一线江景温泉酒店(西双版纳景洪告庄星光夜市店)', '西双版纳市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/958_江语江景·一线江景温泉酒店(西双版纳景洪告庄星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (959, '麗枫酒店(景洪告庄星光夜市店)', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/959_麗枫酒店(景洪告庄星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (960, '沙婉丽·日落江景臻选酒店(西双版纳景洪告庄西双景星光夜市店)', '西双版纳市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/960_沙婉丽·日落江景臻选酒店(西双版纳景洪告庄西双景星光夜市店).jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (961, '元孟艺霖酒店（江苏大学店）', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/961_元孟艺霖酒店（江苏大学店）.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (962, '镇江·宜程｜Modern·CinemaDesigner酒店(大市口苏宁广场店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/962_镇江·宜程｜Modern·CinemaDesigner酒店(大市口苏宁广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (963, '陌上轻居酒店(镇江大市口苏宁广场店)', '镇江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/963_陌上轻居酒店(镇江大市口苏宁广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (964, '亚悦酒店(镇江站北广场西津渡店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/964_亚悦酒店(镇江站北广场西津渡店).jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (965, '镇江金山寺景区长江路亚朵X酒店', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/965_镇江金山寺景区长江路亚朵X酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (966, '如家精选酒店（镇江火车站万达广场店）', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/966_如家精选酒店（镇江火车站万达广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (967, '镇江西津渡泊尔珍珠饭店', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/967_镇江西津渡泊尔珍珠饭店.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (968, '镇江西津渡古街雅阁璞邸酒店', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/968_镇江西津渡古街雅阁璞邸酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (969, '镇江朋克芭蕾INS酒店(镇江站西津渡历史文化街区店)', '镇江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/969_镇江朋克芭蕾INS酒店(镇江站西津渡历史文化街区店).jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (970, '清沐精选酒店(镇江火车站八佰伴店)', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/970_清沐精选酒店(镇江火车站八佰伴店).jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (971, '轻鯊酒店（镇江红豆广场江苏大学店）', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/971_轻鯊酒店（镇江红豆广场江苏大学店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (972, '锦江之星品尚酒店(镇江西津渡万达广场店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/972_锦江之星品尚酒店(镇江西津渡万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (973, '镇江苏宁万豪酒店', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/973_镇江苏宁万豪酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (974, '欣悦宾馆(镇江火车站万达广场店)', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/974_欣悦宾馆(镇江火车站万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (975, '瑞景泰禾酒店(西津渡金山寺店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/975_瑞景泰禾酒店(西津渡金山寺店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (976, '全季酒店(镇江江苏大学学府路店)', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/976_全季酒店(镇江江苏大学学府路店).jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (977, '美铂雲漫酒店', '镇江市中心', 5, 5.00, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/977_美铂雲漫酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (978, '汉庭酒店(镇江苏宁广场永安路店)', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/978_汉庭酒店(镇江苏宁广场永安路店).jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (979, '曦宇美居雁山酒店(镇江火车站万达广场店)', '镇江市中心', 4, 4.40, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/979_曦宇美居雁山酒店(镇江火车站万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (980, '梦享智选酒店(镇江火车站北广场万达广场店)', '镇江市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/980_梦享智选酒店(镇江火车站北广场万达广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (981, '如家酒店·neo(镇江火车站中山桥大润发店)', '镇江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/981_如家酒店·neo(镇江火车站中山桥大润发店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (982, '汉庭酒店(镇江火车站北广场店)', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/982_汉庭酒店(镇江火车站北广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (983, '镇江兆和皇冠假日酒店', '镇江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/983_镇江兆和皇冠假日酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (984, '艺龙安云酒店（镇江苏宁广场店）', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/984_艺龙安云酒店（镇江苏宁广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (985, '曦宇美居酒店(镇江站体育会展中心店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/985_曦宇美居酒店(镇江站体育会展中心店).jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (986, '柏曼酒店（镇江丁卯吾悦广场店）', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/986_柏曼酒店（镇江丁卯吾悦广场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (987, '全季酒店(镇江西津渡店)', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/987_全季酒店(镇江西津渡店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (988, '镇江国际中心桔子水晶酒店', '镇江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/988_镇江国际中心桔子水晶酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (989, '镇江佰润粤海国际酒店', '镇江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/989_镇江佰润粤海国际酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (990, '格林豪泰(镇江江苏科技大学青年广场店)', '镇江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/990_格林豪泰(镇江江苏科技大学青年广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (991, '大观酒店（大理高铁站洱海公园店）', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/991_大观酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (992, '桔朵智能酒店（大理高铁站洱海公园店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/992_桔朵智能酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (993, '大理俊发雅高铂尔曼酒店', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/993_大理俊发雅高铂尔曼酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (994, '理屿·TouristVilla海景度假美宿（大理洱海店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/994_理屿·TouristVilla海景度假美宿（大理洱海店）.jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (995, '瑞都智慧酒店（大理高铁站洱海公园店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/995_瑞都智慧酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (996, '麗枫酒店(大理高铁站洱海公园店)', '大理市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/996_麗枫酒店(大理高铁站洱海公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (997, '大理柏曼尼智能酒店(大理高铁站洱海公园店)', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/997_大理柏曼尼智能酒店(大理高铁站洱海公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (998, '大理市云佰菲精品酒店(大理站洱海公园店)', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/998_大理市云佰菲精品酒店(大理站洱海公园店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (999, '阿凯缇娅海景度假酒店', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/999_阿凯缇娅海景度假酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1000, '真美度假客栈(大理洱海悬崖海景店)', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1000_真美度假客栈(大理洱海悬崖海景店).jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1001, '盛庭智慧酒店（大理高铁站洱海公园店）', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1001_盛庭智慧酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1002, '大理漫悦·M海景酒店', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1002_大理漫悦·M海景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1003, '大理山水境美宿（洱海理想邦店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1003_大理山水境美宿（洱海理想邦店）.jpg', 'WiFi,停车场,餐厅,会议室', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1004, '大理AuroRose日出印像·法式艺术设计师轻奢度假民宿', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1004_大理AuroRose日出印像·法式艺术设计师轻奢度假民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1005, '爱洛法式·Ailuo设计美宿（大理古城店）', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1005_爱洛法式·Ailuo设计美宿（大理古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1006, '全季酒店（大理古城店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1006_全季酒店（大理古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1007, '瀚海阁·Seas cape·海景空中花园客栈(洱海公园滨海大道店)', '大理市市中心', 4, 4.30, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1007_瀚海阁·Seas cape·海景空中花园客栈(洱海公园滨海大道店).jpg', 'WiFi,停车场,餐厅,会议室', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1008, '为理而来·shantran奢野一宅（大理古城玉洱路店）', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1008_为理而来·shantran奢野一宅（大理古城玉洱路店）.jpg', 'WiFi,停车场,餐厅,会议室', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1009, '大理画春堂艺术美宿(大理古城南门店)', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1009_大理画春堂艺术美宿(大理古城南门店).jpg', 'WiFi,停车场,餐厅,会议室', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1010, '大理洱海天域英迪格酒店', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1010_大理洱海天域英迪格酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1011, '维也纳酒店（大理洱海公园高铁站店）', '大理市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1011_维也纳酒店（大理洱海公园高铁站店）.jpg', 'WiFi,停车场,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1012, '广野白舍·Holiday Villa海景度假民宿(大理凤阳邑茶马古道店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1012_广野白舍·Holiday Villa海景度假民宿(大理凤阳邑茶马古道店）.jpg', 'WiFi,停车场,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1013, '拾光映月·ShiGuang中古奢设计师海景度假美宿（大理双廊洱海店）', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1013_拾光映月·ShiGuang中古奢设计师海景度假美宿（大理双廊洱海店）.jpg', 'WiFi,停车场,餐厅,会议室', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1014, '大理双廊半月拖蓝水景雅院', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1014_大理双廊半月拖蓝水景雅院.jpg', 'WiFi,停车场,餐厅,会议室', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1015, '大理古城蒼蘭暮雨臻选美墅（古城南门店）', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1015_大理古城蒼蘭暮雨臻选美墅（古城南门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1016, '大理·梵泊｜enjoy the Sunset·山海｜海景·设计美宿（洱海店）', '大理市市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1016_大理·梵泊｜enjoy the Sunset·山海｜海景·设计美宿（洱海店）.jpg', 'WiFi,停车场,餐厅,会议室', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1017, '亚珑湾酒店（大理高铁站洱海公园店）', '大理市市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1017_亚珑湾酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1018, '朵兰·智能影音酒店（大理高铁站洱海公园店）', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1018_朵兰·智能影音酒店（大理高铁站洱海公园店）.jpg', 'WiFi,停车场,餐厅,会议室', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1019, '三秋庭云溪｜海景私汤森氧私墅', '大理市市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1019_三秋庭云溪｜海景私汤森氧私墅.jpg', 'WiFi,停车场,餐厅,会议室', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1020, '熙宿·Calm Manor设计师美学民宿（大理古城店）', '大理市市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1020_熙宿·Calm Manor设计师美学民宿（大理古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1021, '汉田丨云咖雪语•雪山全景民宿（丽江古城黑龙潭店）', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1021_汉田丨云咖雪语•雪山全景民宿（丽江古城黑龙潭店）.jpg', 'WiFi,停车场,餐厅,会议室', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1022, '云溪海棠·日照金山全景空中花园酒店', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1022_云溪海棠·日照金山全景空中花园酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1023, 'Sunpeak日照金山｜松果度假酒店(丽江古城南门店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1023_Sunpeak日照金山｜松果度假酒店(丽江古城南门店).jpg', 'WiFi,停车场,餐厅,会议室', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1024, 'Scenic花朝月夕｜丽江古城·日照金山·全际度假酒店｜', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1024_Scenic花朝月夕｜丽江古城·日照金山·全际度假酒店｜.jpg', 'WiFi,停车场,餐厅,会议室', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1025, '东方花园·中式美学观雪山咖啡美宿丨静谧花园(丽江古城大水车店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1025_东方花园·中式美学观雪山咖啡美宿丨静谧花园(丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1026, '云景栖谷丨 Luxury・360° 全景日照金山・空中花园・设计师观景美宿', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1026_云景栖谷丨 Luxury・360° 全景日照金山・空中花园・设计师观景美宿.jpg', 'WiFi,停车场,餐厅,会议室', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1027, '宸枫·逸境智能酒店(丽江古城北门店)', '丽江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1027_宸枫·逸境智能酒店(丽江古城北门店).jpg', 'WiFi,停车场,餐厅,会议室', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1028, '新冀云.雪山观景酒店', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1028_新冀云.雪山观景酒店.jpg', 'WiFi,停车场,餐厅,会议室', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1029, '秋池居Qiuchi·观古城全景·设计师度假美宿（大水车店）', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1029_秋池居Qiuchi·观古城全景·设计师度假美宿（大水车店）.jpg', 'WiFi,停车场,餐厅,会议室', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1030, '泊悦欢廷度假酒店（丽江古城南门店）', '丽江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1030_泊悦欢廷度假酒店（丽江古城南门店）.jpg', 'WiFi,停车场,餐厅,会议室', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1031, '慕伦朗格酒店(祥和商业广场店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1031_慕伦朗格酒店(祥和商业广场店).jpg', 'WiFi,停车场,餐厅,会议室', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1032, '米棉山居·Lumière sur neige金山映雪|雪山观景度假民宿', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1032_米棉山居·Lumière sur neige金山映雪_雪山观景度假民宿.jpg', 'WiFi,停车场,餐厅,会议室', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1033, '暖阳里丨Designer丶落日夕阳丨高定设计师度假民宿（古城店）', '丽江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1033_暖阳里丨Designer丶落日夕阳丨高定设计师度假民宿（古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1034, 'XIMAN玺缦·玉龙在望Snow Top丨日照金山观景美宿（丽江古城店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1034_XIMAN玺缦·玉龙在望Snow Top丨日照金山观景美宿（丽江古城店).jpg', 'WiFi,停车场,餐厅,会议室', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1035, '屿见YunXi丨云间花坞丨空中花园智控美宿（丽江古城忠义市场店）', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1035_屿见YunXi丨云间花坞丨空中花园智控美宿（丽江古城忠义市场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1036, '麗枫酒店(丽江古城南门店)', '丽江市中心', 4, 4.70, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1036_麗枫酒店(丽江古城南门店).jpg', 'WiFi,停车场,餐厅,会议室', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1037, '春生居·初见Villa|屋顶花园·雪山观景度假美宿(古城南门店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1037_春生居·初见Villa_屋顶花园·雪山观景度假美宿(古城南门店).jpg', 'WiFi,停车场,餐厅,会议室', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1038, '既见山野丨日照金山空中花园雪山观景隐奢度假酒店(丽江古城店)', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1038_既见山野丨日照金山空中花园雪山观景隐奢度假酒店(丽江古城店).jpg', 'WiFi,停车场,餐厅,会议室', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1039, '春和景明·CHUNHE别院花园度假美宿（丽江古城店）', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1039_春和景明·CHUNHE别院花园度假美宿（丽江古城店）.jpg', 'WiFi,停车场,餐厅,会议室', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1040, '晚柠丨慢时光·Villa 雪山观景度假庭院（丽江束河古镇店）', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1040_晚柠丨慢时光·Villa 雪山观景度假庭院（丽江束河古镇店）.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1041, '锦江之星(丽江古城大水车店)', '丽江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1041_锦江之星(丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1042, '茉奈·Monet｜空中花园·轻奢设计师度假酒店（丽江古城大水车店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1042_茉奈·Monet｜空中花园·轻奢设计师度假酒店（丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1043, '汉庭酒店(丽江古城大水车店)', '丽江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1043_汉庭酒店(丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1044, '岚也・500m²治愈系花园・FUTURE智能・设计师民宿(丽江古城大水车店)', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1044_岚也・500m²治愈系花园・FUTURE智能・设计师民宿(丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1045, '沐山苑·且曼民宿（丽江古城南门忠义市场店）', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1045_沐山苑·且曼民宿（丽江古城南门忠义市场店）.jpg', 'WiFi,停车场,餐厅,会议室', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1046, '全季酒店(丽江古城店)', '丽江市中心', 4, 4.50, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1046_全季酒店(丽江古城店).jpg', 'WiFi,停车场,餐厅,会议室', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1047, '璞雅庭·日照金山雪山观景|空中花园度假民宿(丽江束河古镇店)', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1047_璞雅庭·日照金山雪山观景_空中花园度假民宿(丽江束河古镇店).jpg', 'WiFi,停车场,餐厅,会议室', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1048, '香榭雨林·假日酒店(丽江古城大水车店)', '丽江市中心', 4, 4.60, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1048_香榭雨林·假日酒店(丽江古城大水车店).jpg', 'WiFi,停车场,餐厅,会议室', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1049, '仟漫·Vista观雪山全景云端艺术花园美宿（丽江古城大水车店）', '丽江市中心', 5, 4.90, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1049_仟漫·Vista观雪山全景云端艺术花园美宿（丽江古城大水车店）.jpg', 'WiFi,停车场,餐厅,会议室', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (1050, '古井•侘寂风日照金山美学设计师360度古城雪山屋顶咖啡美宿', '丽江市中心', 5, 4.80, 'https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com/hotel-images/1050_古井•侘寂风日照金山美学设计师360度古城雪山屋顶咖啡美宿.jpg', 'WiFi,停车场,餐厅,会议室', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');

-- ----------------------------
-- Table structure for hotel_audit
-- ----------------------------
DROP TABLE IF EXISTS `hotel_audit`;
CREATE TABLE `hotel_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `hotel_id` bigint NOT NULL COMMENT '酒店ID',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `submit_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_audit_status`(`audit_status` ASC) USING BTREE,
  INDEX `idx_auditor_id`(`auditor_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1051 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店审核表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel_audit
-- ----------------------------
INSERT INTO `hotel_audit` VALUES (1, 1, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (2, 2, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (3, 3, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (4, 4, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (5, 5, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (6, 6, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (7, 7, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (8, 8, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (9, 9, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (10, 10, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (11, 11, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (12, 12, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (13, 13, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (14, 14, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (15, 15, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (16, 16, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (17, 17, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (18, 18, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (19, 19, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (20, 20, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (21, 21, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (22, 22, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (23, 23, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (24, 24, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (25, 25, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (26, 26, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (27, 27, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (28, 28, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (29, 29, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (30, 30, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (31, 31, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (32, 32, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (33, 33, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (34, 34, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (35, 35, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (36, 36, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (37, 37, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (38, 38, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (39, 39, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (40, 40, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (41, 41, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (42, 42, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (43, 43, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (44, 44, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (45, 45, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (46, 46, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (47, 47, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (48, 48, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (49, 49, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (50, 50, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (51, 51, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (52, 52, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (53, 53, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (54, 54, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (55, 55, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (56, 56, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (57, 57, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (58, 58, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (59, 59, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (60, 60, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (61, 61, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (62, 62, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (63, 63, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (64, 64, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (65, 65, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (66, 66, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (67, 67, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (68, 68, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (69, 69, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (70, 70, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (71, 71, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (72, 72, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (73, 73, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (74, 74, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (75, 75, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (76, 76, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (77, 77, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (78, 78, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (79, 79, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (80, 80, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (81, 81, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (82, 82, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (83, 83, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (84, 84, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (85, 85, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (86, 86, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (87, 87, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (88, 88, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (89, 89, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (90, 90, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (91, 91, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (92, 92, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (93, 93, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (94, 94, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (95, 95, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (96, 96, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (97, 97, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (98, 98, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (99, 99, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (100, 100, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (101, 101, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (102, 102, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (103, 103, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (104, 104, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (105, 105, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (106, 106, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (107, 107, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (108, 108, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (109, 109, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (110, 110, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (111, 111, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (112, 112, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (113, 113, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (114, 114, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (115, 115, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (116, 116, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (117, 117, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (118, 118, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (119, 119, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (120, 120, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (121, 121, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (122, 122, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (123, 123, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (124, 124, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (125, 125, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (126, 126, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (127, 127, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (128, 128, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (129, 129, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (130, 130, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (131, 131, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (132, 132, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (133, 133, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (134, 134, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (135, 135, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (136, 136, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (137, 137, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (138, 138, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (139, 139, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (140, 140, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (141, 141, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (142, 142, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (143, 143, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (144, 144, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (145, 145, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (146, 146, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (147, 147, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (148, 148, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (149, 149, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (150, 150, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (151, 151, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (152, 152, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (153, 153, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (154, 154, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (155, 155, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (156, 156, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (157, 157, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (158, 158, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (159, 159, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (160, 160, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (161, 161, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (162, 162, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (163, 163, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (164, 164, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (165, 165, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (166, 166, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (167, 167, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (168, 168, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (169, 169, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (170, 170, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (171, 171, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (172, 172, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (173, 173, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (174, 174, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (175, 175, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (176, 176, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (177, 177, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (178, 178, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (179, 179, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (180, 180, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (181, 181, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (182, 182, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (183, 183, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (184, 184, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (185, 185, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (186, 186, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (187, 187, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (188, 188, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (189, 189, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (190, 190, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (191, 191, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (192, 192, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (193, 193, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (194, 194, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (195, 195, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (196, 196, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (197, 197, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (198, 198, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (199, 199, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (200, 200, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (201, 201, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (202, 202, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (203, 203, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (204, 204, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (205, 205, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (206, 206, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (207, 207, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (208, 208, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (209, 209, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (210, 210, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (211, 211, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (212, 212, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (213, 213, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (214, 214, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (215, 215, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (216, 216, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (217, 217, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (218, 218, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (219, 219, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (220, 220, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (221, 221, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (222, 222, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (223, 223, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (224, 224, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (225, 225, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (226, 226, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (227, 227, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (228, 228, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (229, 229, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (230, 230, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (231, 231, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (232, 232, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (233, 233, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (234, 234, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (235, 235, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (236, 236, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (237, 237, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (238, 238, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (239, 239, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (240, 240, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (241, 241, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (242, 242, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (243, 243, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (244, 244, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (245, 245, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (246, 246, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (247, 247, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (248, 248, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (249, 249, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (250, 250, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (251, 251, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (252, 252, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (253, 253, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (254, 254, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (255, 255, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (256, 256, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (257, 257, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (258, 258, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (259, 259, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (260, 260, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (261, 261, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (262, 262, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (263, 263, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (264, 264, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (265, 265, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (266, 266, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (267, 267, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (268, 268, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (269, 269, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (270, 270, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (271, 271, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (272, 272, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (273, 273, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (274, 274, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (275, 275, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (276, 276, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (277, 277, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (278, 278, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (279, 279, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (280, 280, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (281, 281, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (282, 282, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (283, 283, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (284, 284, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (285, 285, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (286, 286, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (287, 287, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (288, 288, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (289, 289, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (290, 290, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (291, 291, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (292, 292, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (293, 293, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (294, 294, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (295, 295, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (296, 296, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (297, 297, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (298, 298, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (299, 299, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (300, 300, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (301, 301, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (302, 302, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (303, 303, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (304, 304, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (305, 305, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (306, 306, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (307, 307, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (308, 308, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (309, 309, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (310, 310, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (311, 311, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (312, 312, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (313, 313, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (314, 314, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (315, 315, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (316, 316, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (317, 317, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (318, 318, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (319, 319, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (320, 320, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (321, 321, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (322, 322, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (323, 323, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (324, 324, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (325, 325, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (326, 326, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (327, 327, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (328, 328, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (329, 329, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (330, 330, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (331, 331, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (332, 332, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (333, 333, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (334, 334, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (335, 335, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (336, 336, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (337, 337, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (338, 338, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (339, 339, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (340, 340, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (341, 341, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (342, 342, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (343, 343, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (344, 344, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (345, 345, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (346, 346, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (347, 347, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (348, 348, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (349, 349, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (350, 350, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (351, 351, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (352, 352, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (353, 353, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (354, 354, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (355, 355, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (356, 356, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (357, 357, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (358, 358, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (359, 359, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (360, 360, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (361, 361, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (362, 362, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (363, 363, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (364, 364, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (365, 365, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (366, 366, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (367, 367, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (368, 368, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (369, 369, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (370, 370, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (371, 371, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (372, 372, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (373, 373, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (374, 374, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (375, 375, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (376, 376, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (377, 377, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (378, 378, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (379, 379, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (380, 380, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (381, 381, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (382, 382, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (383, 383, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (384, 384, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (385, 385, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (386, 386, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (387, 387, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (388, 388, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (389, 389, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (390, 390, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (391, 391, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (392, 392, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (393, 393, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (394, 394, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (395, 395, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (396, 396, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (397, 397, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (398, 398, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (399, 399, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (400, 400, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (401, 401, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (402, 402, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (403, 403, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (404, 404, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (405, 405, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (406, 406, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (407, 407, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (408, 408, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (409, 409, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (410, 410, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (411, 411, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (412, 412, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (413, 413, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (414, 414, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (415, 415, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (416, 416, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (417, 417, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (418, 418, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (419, 419, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (420, 420, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (421, 421, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (422, 422, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (423, 423, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (424, 424, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (425, 425, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (426, 426, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (427, 427, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (428, 428, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (429, 429, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (430, 430, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (431, 431, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (432, 432, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (433, 433, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (434, 434, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (435, 435, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (436, 436, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (437, 437, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (438, 438, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (439, 439, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (440, 440, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (441, 441, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (442, 442, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (443, 443, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (444, 444, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (445, 445, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (446, 446, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (447, 447, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (448, 448, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (449, 449, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (450, 450, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (451, 451, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (452, 452, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (453, 453, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (454, 454, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (455, 455, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (456, 456, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (457, 457, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (458, 458, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (459, 459, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (460, 460, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (461, 461, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (462, 462, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (463, 463, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (464, 464, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (465, 465, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (466, 466, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (467, 467, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (468, 468, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (469, 469, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (470, 470, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (471, 471, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (472, 472, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (473, 473, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (474, 474, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (475, 475, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (476, 476, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (477, 477, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (478, 478, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (479, 479, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (480, 480, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (481, 481, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (482, 482, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (483, 483, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (484, 484, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (485, 485, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (486, 486, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (487, 487, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (488, 488, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (489, 489, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (490, 490, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (491, 491, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (492, 492, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (493, 493, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (494, 494, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (495, 495, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (496, 496, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (497, 497, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (498, 498, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (499, 499, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (500, 500, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (501, 501, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (502, 502, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (503, 503, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (504, 504, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (505, 505, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (506, 506, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (507, 507, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (508, 508, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (509, 509, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (510, 510, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (511, 511, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (512, 512, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (513, 513, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (514, 514, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (515, 515, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (516, 516, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (517, 517, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (518, 518, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (519, 519, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (520, 520, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (521, 521, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (522, 522, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (523, 523, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (524, 524, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (525, 525, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (526, 526, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (527, 527, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (528, 528, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (529, 529, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (530, 530, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (531, 531, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (532, 532, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (533, 533, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (534, 534, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (535, 535, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (536, 536, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (537, 537, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (538, 538, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (539, 539, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (540, 540, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (541, 541, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (542, 542, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (543, 543, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (544, 544, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (545, 545, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (546, 546, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (547, 547, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (548, 548, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (549, 549, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (550, 550, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (551, 551, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (552, 552, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (553, 553, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (554, 554, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (555, 555, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (556, 556, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (557, 557, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (558, 558, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (559, 559, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (560, 560, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (561, 561, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (562, 562, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (563, 563, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (564, 564, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (565, 565, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (566, 566, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (567, 567, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (568, 568, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (569, 569, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (570, 570, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (571, 571, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (572, 572, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (573, 573, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (574, 574, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (575, 575, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (576, 576, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (577, 577, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (578, 578, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (579, 579, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (580, 580, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (581, 581, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (582, 582, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (583, 583, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (584, 584, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (585, 585, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (586, 586, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (587, 587, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (588, 588, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (589, 589, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (590, 590, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (591, 591, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (592, 592, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (593, 593, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (594, 594, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (595, 595, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (596, 596, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (597, 597, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (598, 598, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (599, 599, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (600, 600, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (601, 601, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (602, 602, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (603, 603, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (604, 604, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (605, 605, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (606, 606, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (607, 607, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (608, 608, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (609, 609, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (610, 610, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (611, 611, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (612, 612, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (613, 613, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (614, 614, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (615, 615, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (616, 616, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (617, 617, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (618, 618, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (619, 619, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (620, 620, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (621, 621, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (622, 622, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (623, 623, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (624, 624, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (625, 625, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (626, 626, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (627, 627, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (628, 628, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (629, 629, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (630, 630, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (631, 631, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (632, 632, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (633, 633, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (634, 634, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (635, 635, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (636, 636, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (637, 637, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (638, 638, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (639, 639, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (640, 640, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (641, 641, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (642, 642, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (643, 643, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (644, 644, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (645, 645, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (646, 646, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (647, 647, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (648, 648, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (649, 649, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (650, 650, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (651, 651, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (652, 652, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (653, 653, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (654, 654, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (655, 655, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (656, 656, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (657, 657, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (658, 658, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (659, 659, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (660, 660, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (661, 661, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (662, 662, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (663, 663, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (664, 664, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (665, 665, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (666, 666, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (667, 667, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (668, 668, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (669, 669, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (670, 670, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (671, 671, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (672, 672, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (673, 673, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (674, 674, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (675, 675, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (676, 676, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (677, 677, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (678, 678, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (679, 679, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (680, 680, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (681, 681, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (682, 682, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (683, 683, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (684, 684, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (685, 685, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (686, 686, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (687, 687, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (688, 688, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (689, 689, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (690, 690, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (691, 691, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (692, 692, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (693, 693, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (694, 694, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (695, 695, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (696, 696, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (697, 697, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (698, 698, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (699, 699, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (700, 700, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (701, 701, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (702, 702, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (703, 703, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (704, 704, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (705, 705, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (706, 706, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (707, 707, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (708, 708, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (709, 709, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (710, 710, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (711, 711, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (712, 712, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (713, 713, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (714, 714, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (715, 715, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (716, 716, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (717, 717, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (718, 718, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (719, 719, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (720, 720, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (721, 721, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (722, 722, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (723, 723, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (724, 724, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (725, 725, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (726, 726, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (727, 727, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (728, 728, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (729, 729, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (730, 730, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (731, 731, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (732, 732, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (733, 733, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (734, 734, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (735, 735, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (736, 736, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (737, 737, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (738, 738, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (739, 739, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (740, 740, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (741, 741, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (742, 742, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (743, 743, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (744, 744, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (745, 745, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (746, 746, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (747, 747, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (748, 748, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (749, 749, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (750, 750, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (751, 751, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (752, 752, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (753, 753, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (754, 754, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (755, 755, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (756, 756, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (757, 757, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (758, 758, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (759, 759, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (760, 760, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (761, 761, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (762, 762, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (763, 763, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (764, 764, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (765, 765, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (766, 766, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (767, 767, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (768, 768, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (769, 769, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (770, 770, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (771, 771, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (772, 772, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (773, 773, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (774, 774, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (775, 775, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (776, 776, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (777, 777, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (778, 778, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (779, 779, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (780, 780, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (781, 781, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (782, 782, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (783, 783, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (784, 784, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (785, 785, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (786, 786, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (787, 787, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (788, 788, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (789, 789, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (790, 790, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (791, 791, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (792, 792, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (793, 793, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (794, 794, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (795, 795, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (796, 796, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (797, 797, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (798, 798, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (799, 799, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (800, 800, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (801, 801, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (802, 802, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (803, 803, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (804, 804, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (805, 805, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (806, 806, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (807, 807, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (808, 808, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (809, 809, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (810, 810, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (811, 811, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (812, 812, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (813, 813, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (814, 814, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (815, 815, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (816, 816, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (817, 817, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (818, 818, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (819, 819, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (820, 820, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (821, 821, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (822, 822, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (823, 823, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (824, 824, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (825, 825, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (826, 826, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (827, 827, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (828, 828, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (829, 829, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (830, 830, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (831, 831, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (832, 832, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (833, 833, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (834, 834, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (835, 835, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (836, 836, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (837, 837, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (838, 838, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (839, 839, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (840, 840, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (841, 841, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (842, 842, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (843, 843, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (844, 844, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (845, 845, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (846, 846, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (847, 847, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (848, 848, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (849, 849, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (850, 850, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (851, 851, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (852, 852, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (853, 853, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (854, 854, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (855, 855, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (856, 856, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (857, 857, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (858, 858, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (859, 859, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (860, 860, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (861, 861, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (862, 862, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (863, 863, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (864, 864, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (865, 865, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (866, 866, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (867, 867, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (868, 868, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (869, 869, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (870, 870, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (871, 871, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (872, 872, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (873, 873, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (874, 874, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (875, 875, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (876, 876, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (877, 877, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (878, 878, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (879, 879, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (880, 880, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (881, 881, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (882, 882, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (883, 883, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (884, 884, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (885, 885, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (886, 886, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (887, 887, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (888, 888, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (889, 889, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (890, 890, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (891, 891, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (892, 892, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (893, 893, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (894, 894, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (895, 895, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (896, 896, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (897, 897, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (898, 898, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (899, 899, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (900, 900, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (901, 901, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (902, 902, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (903, 903, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (904, 904, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (905, 905, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (906, 906, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (907, 907, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (908, 908, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (909, 909, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (910, 910, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (911, 911, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (912, 912, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (913, 913, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (914, 914, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (915, 915, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (916, 916, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (917, 917, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (918, 918, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (919, 919, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (920, 920, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (921, 921, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (922, 922, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (923, 923, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (924, 924, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (925, 925, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (926, 926, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (927, 927, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (928, 928, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (929, 929, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (930, 930, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (931, 931, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (932, 932, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (933, 933, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (934, 934, '2', '酒店名称与营业执照不一致', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (935, 935, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (936, 936, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (937, 937, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (938, 938, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (939, 939, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (940, 940, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (941, 941, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (942, 942, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (943, 943, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (944, 944, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (945, 945, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (946, 946, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (947, 947, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (948, 948, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (949, 949, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (950, 950, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (951, 951, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (952, 952, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (953, 953, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (954, 954, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (955, 955, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (956, 956, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (957, 957, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (958, 958, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (959, 959, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (960, 960, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (961, 961, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (962, 962, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (963, 963, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (964, 964, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (965, 965, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (966, 966, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (967, 967, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (968, 968, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (969, 969, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (970, 970, '2', '图片不清晰，请重新上传', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (971, 971, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (972, 972, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (973, 973, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (974, 974, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (975, 975, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (976, 976, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (977, 977, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (978, 978, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (979, 979, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (980, 980, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (981, 981, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (982, 982, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (983, 983, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (984, 984, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (985, 985, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (986, 986, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (987, 987, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (988, 988, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (989, 989, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (990, 990, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (991, 991, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (992, 992, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (993, 993, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (994, 994, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (995, 995, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (996, 996, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (997, 997, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (998, 998, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (999, 999, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1000, 1000, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1001, 1001, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1002, 1002, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1003, 1003, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1004, 1004, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1005, 1005, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1006, 1006, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1007, 1007, '2', '缺少必要资质证明', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1008, 1008, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1009, 1009, '2', '图片不清晰，请重新上传', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1010, 1010, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1011, 1011, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1012, 1012, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1013, 1013, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1014, 1014, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1015, 1015, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1016, 1016, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1017, 1017, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1018, 1018, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1019, 1019, '1', '资料齐全，准予上线', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1020, 1020, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1021, 1021, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1022, 1022, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1023, 1023, '2', '缺少必要资质证明', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1024, 1024, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1025, 1025, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1026, 1026, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1027, 1027, '1', '资料齐全，准予上线', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1028, 1028, '1', '审核通过，信息完整', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1029, 1029, '2', '酒店名称与营业执照不一致', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1030, 1030, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1031, 1031, '1', '审核通过，信息完整', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1032, 1032, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1033, 1033, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1034, 1034, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1035, 1035, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1036, 1036, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1037, 1037, '0', NULL, NULL, NULL, '2026-06-25 17:53:21', NULL, '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1038, 1038, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1039, 1039, '1', '审核通过', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1040, 1040, '2', '图片不清晰，请重新上传', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1041, 1041, '1', '审核通过', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1042, 1042, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1043, 1043, '1', '资料齐全，准予上线', 3, '审核员B', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1044, 1044, '1', '审核通过，信息完整', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1045, 1045, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1046, 1046, '2', '缺少必要资质证明', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1047, 1047, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1048, 1048, '2', '酒店名称与营业执照不一致', 1, '系统管理员', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1049, 1049, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');
INSERT INTO `hotel_audit` VALUES (1050, 1050, '1', '审核通过', 2, '审核员A', '2026-06-25 17:53:21', '2026-06-25 18:00:00', '2026-06-25 17:53:21', '2026-06-25 17:53:21');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户ID',
  `merchant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称（店铺名）',
  `license_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '营业执照号',
  `legal_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '法人姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户地址',
  `business_scope` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经营范围',
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户LOGO图片URL',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商户简介',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '商户状态（0正常 1冻结 2注销）',
  `audit_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
  `reject_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '驳回原因（仅当auditStatus=2时有值）',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '提交审核时间',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '关联系统用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_license_no`(`license_no` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_audit_status`(`audit_status` ASC) USING BTREE,
  INDEX `idx_user_audit`(`user_id` ASC, `audit_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1075 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1001, '北京希尔顿酒店管理有限公司', '91110000MA001001X1', '张三', '13800138001', 'merchant001@hotel.com', '北京市东城区王府井大街88号', '酒店管理、餐饮服务、住宿服务', 'https://example.com/merchant1001.png', '专注于高端酒店管理运营', '0', '1', '资质齐全，审核通过', '2026-05-07 08:52:15', '2026-05-09 08:52:15', 301, '2026-06-06 08:52:14', '2026-06-23 08:57:53');
INSERT INTO `merchant` VALUES (1002, '上海华尔道夫酒店管理有限公司', '91310000MA001002X2', '李四', '13800138002', 'merchant002@hotel.com', '上海市黄浦区中山东一路2号', '酒店管理、商务服务', 'https://example.com/merchant1002.png', '国际知名酒店管理集团', '0', '1', '资质审核通过', '2026-05-09 08:52:15', '2026-05-11 08:52:15', 302, '2026-06-06 08:52:14', '2026-06-23 08:57:53');
INSERT INTO `merchant` VALUES (1003, '广州丽思卡尔顿酒店有限公司', '91440000MA001003X3', '王五', '13800138003', 'merchant003@hotel.com', '广州市天河区珠江新城兴民路222号', '酒店管理、餐饮、SPA', 'https://example.com/merchant1003.png', '五星级度假酒店管理', '0', '1', '审核通过', '2026-05-12 08:52:15', '2026-05-14 08:52:15', 303, '2026-06-06 08:52:14', '2026-06-23 08:57:53');
INSERT INTO `merchant` VALUES (1004, '深圳香格里拉酒店有限公司', '91440000MA001004X4', '赵六', '13800138004', 'merchant004@hotel.com', '深圳市福田区中心城益田路4088号', '酒店管理、会议服务', 'https://example.com/merchant1004.png', '国际连锁酒店品牌', '0', '1', '资质齐全，通过入驻', '2026-05-15 08:52:15', '2026-05-17 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1005, '杭州西湖国宾馆有限公司', '91330000MA001005X5', '孙七', '13800138005', 'merchant005@hotel.com', '杭州市西湖区杨公堤18号', '酒店住宿、餐饮、旅游服务', 'https://example.com/merchant1005.png', '西湖畔高端度假酒店管理', '0', '1', '审核通过，资质良好', '2026-05-17 08:52:15', '2026-05-19 08:52:15', 304, '2026-06-06 08:52:14', '2026-06-23 08:57:53');
INSERT INTO `merchant` VALUES (1006, '成都尼依格罗酒店有限公司', '91510000MA001006X6', '周八', '13800138006', 'merchant006@hotel.com', '成都市锦江区红星路三段1号', '酒店管理、奢侈品服务', 'https://example.com/merchant1006.png', '高端时尚酒店管理', '0', '0', NULL, '2026-06-04 08:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1007, '西安开元酒店管理有限公司', '91610000MA001007X7', '吴九', '13800138007', 'merchant007@hotel.com', '西安市碑林区南大街30号', '酒店管理、旅游接待', 'https://example.com/merchant1007.png', '西安地区知名酒店管理公司', '0', '0', NULL, '2026-06-05 08:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1008, '三亚瑞吉度假酒店有限公司', '91460000MA001008X8', '郑十', '13800138008', 'merchant008@hotel.com', '三亚市吉阳区亚龙湾国家旅游度假区', '度假酒店、SPA、水上运动', 'https://example.com/merchant1008.png', '亚龙湾顶级度假酒店', '0', '2', '营业执照信息不清晰，请重新上传', '2026-05-22 08:52:15', '2026-05-23 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1009, '厦门鼓浪屿酒店有限公司', '91350000MA001009X9', '陈十一', '13800138009', 'merchant009@hotel.com', '厦门市思明区鼓浪屿康泰路151号', '精品酒店、旅游服务', 'https://example.com/merchant1009.png', '鼓浪屿特色海景酒店管理', '0', '1', '审核通过', '2026-05-25 08:52:15', '2026-05-27 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1010, '青岛洲际酒店管理有限公司', '91370000MA001010X0', '刘十二', '13800138010', 'merchant010@hotel.com', '青岛市市南区香港中路98号', '酒店管理、海景度假', 'https://example.com/merchant1010.png', '青岛沿海高端酒店管理', '0', '1', '资质审核通过', '2026-05-27 08:52:15', '2026-05-29 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1011, '南京金陵饭店有限公司', '91320000MA001011XA', '黄十三', '13800138011', 'merchant011@hotel.com', '南京市鼓楼区汉中路2号', '酒店住宿、餐饮、会议', 'https://example.com/merchant1011.png', '南京标志性酒店管理', '0', '1', '审核通过，资质良好', '2026-05-28 08:52:15', '2026-05-30 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1012, '苏州泛太平洋酒店有限公司', '91320000MA001012XB', '杨十四', '13800138012', 'merchant012@hotel.com', '苏州市姑苏区新市路259号', '酒店管理、园林景观服务', 'https://example.com/merchant1012.png', '苏州古典园林风格酒店', '0', '1', '资质齐全，审核通过', '2026-05-29 08:52:15', '2026-05-31 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1013, '武汉万达瑞华酒店有限公司', '91420000MA001013XC', '朱十五', '13800138013', 'merchant013@hotel.com', '武汉市武昌区水果湖街东湖路138号', '高端酒店管理、餐饮', 'https://example.com/merchant1013.png', '万达集团旗下酒店管理', '0', '1', '审核通过', '2026-05-30 08:52:15', '2026-06-01 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1014, '长沙君悦酒店有限公司', '91430000MA001014XD', '何十六', '13800138014', 'merchant014@hotel.com', '长沙市天心区湘江中路36号', '酒店管理、江景住宿', 'https://example.com/merchant1014.png', '长沙高端江景酒店', '0', '1', '资质审核通过', '2026-05-31 08:52:15', '2026-06-02 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1015, '重庆威斯汀酒店管理有限公司', '91500000MA001015XE', '马十七', '13800138015', 'merchant015@hotel.com', '重庆市渝中区新华路222号', '酒店管理、商务接待', 'https://example.com/merchant1015.png', '重庆解放碑核心商圈酒店', '0', '1', '审核通过，准予入驻', '2026-06-01 08:52:15', '2026-06-03 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1016, '昆明洲际酒店有限公司', '91530000MA001016XF', '林十八', '13800138016', 'merchant016@hotel.com', '昆明市西山区怡景路5号', '酒店管理、度假服务', 'https://example.com/merchant1016.png', '春城高端度假酒店', '0', '1', '资质齐全，通过', '2026-06-02 08:52:15', '2026-06-04 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1017, '贵阳凯宾斯基酒店有限公司', '91520000MA001017XG', '罗十九', '13800138017', 'merchant017@hotel.com', '贵阳市南明区护国路68号', '酒店管理、会议服务', 'https://example.com/merchant1017.png', '贵阳国际品牌酒店', '0', '1', '审核通过', '2026-06-03 08:52:15', '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1018, '南宁万达文华酒店有限公司', '91450000MA001018XH', '谢二十', '13800138018', 'merchant018@hotel.com', '南宁市青秀区东葛路118号', '酒店管理、餐饮服务', 'https://example.com/merchant1018.png', '万达旗下高端酒店品牌', '0', '0', NULL, '2026-06-05 20:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1019, '海口鲁能希尔顿酒店有限公司', '91460000MA001019XI', '韩二一', '13800138019', 'merchant019@hotel.com', '海口市美兰区琼山大道2号', '酒店管理、海景度假', 'https://example.com/merchant1019.png', '海口沿海度假酒店', '0', '0', NULL, '2026-06-06 02:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1020, '大理洱海天域酒店有限公司', '91530000MA001020XJ', '冯二二', '13800138020', 'merchant020@hotel.com', '大理市下关镇洱河南路1号', '精品酒店、旅游服务', 'https://example.com/merchant1020.png', '大理洱海边特色度假酒店', '0', '1', '审核通过', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1021, '天津君悦酒店管理有限公司', '91120000MA001021XK', '褚二三', '13800138021', 'merchant021@hotel.com', '天津市和平区南京路189号', '酒店管理、商务接待', 'https://example.com/merchant1021.png', '天津核心商圈高端酒店', '0', '1', '资质审核通过', '2026-06-03 08:52:15', '2026-06-04 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1022, '哈尔滨万达嘉华酒店有限公司', '91230000MA001022XL', '卫二四', '13800138022', 'merchant022@hotel.com', '哈尔滨市南岗区长江路168号', '酒店管理、会议服务', 'https://example.com/merchant1022.png', '东北地区知名酒店品牌', '0', '2', '营业执照过期，请更新后重新提交', '2026-06-01 08:52:15', '2026-06-02 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1023, '沈阳香格里拉大酒店有限公司', '91210000MA001023XM', '蒋二五', '13800138023', 'merchant023@hotel.com', '沈阳市沈河区青年大街115号', '酒店管理、餐饮服务', 'https://example.com/merchant1023.png', '沈阳国际连锁酒店', '0', '1', '审核通过', '2026-06-02 08:52:15', '2026-06-03 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1024, '大连富丽华酒店有限公司', '91210000MA001024XN', '沈二六', '13800138024', 'merchant024@hotel.com', '大连市中山区人民路60号', '酒店管理、海景住宿', 'https://example.com/merchant1024.png', '大连海滨度假酒店', '0', '1', '资质齐全，通过', '2026-06-03 08:52:15', '2026-06-04 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1025, '济南索菲特银座大饭店有限公司', '91370000MA001025XO', '韩二七', '13800138025', 'merchant025@hotel.com', '济南市泺源大街66号', '酒店管理、商务服务', 'https://example.com/merchant1025.png', '济南市中心高端酒店', '0', '0', NULL, '2026-06-06 00:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1026, '郑州建业艾美酒店有限公司', '91410000MA001026XP', '杨二八', '13800138026', 'merchant026@hotel.com', '郑州市金水区中州大道1120号', '酒店管理、会议接待', 'https://example.com/merchant1026.png', '郑州现代化商务酒店', '0', '1', '审核通过', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1027, '合肥元一希尔顿酒店有限公司', '91340000MA001027XQ', '朱二九', '13800138027', 'merchant027@hotel.com', '合肥市瑶海区胜利路198号', '酒店管理、餐饮娱乐', 'https://example.com/merchant1027.png', '合肥市区豪华酒店', '0', '1', '资质审核通过', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1028, '福州香格里拉大酒店有限公司', '91350000MA001028XR', '秦三十', '13800138028', 'merchant028@hotel.com', '福州市鼓楼区新权南路9号', '酒店管理、温泉服务', 'https://example.com/merchant1028.png', '福州传统与现代结合酒店', '0', '2', '法人身份证信息不匹配，请核实', '2026-06-02 08:52:15', '2026-06-03 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1029, '南昌喜来登酒店有限公司', '91360000MA001029XS', '尤三一', '13800138029', 'merchant029@hotel.com', '南昌市红谷滩新区红谷中大道1669号', '酒店管理、江景住宿', 'https://example.com/merchant1029.png', '南昌赣江畔高端酒店', '0', '1', '审核通过', '2026-06-05 08:52:15', '2026-06-05 20:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1030, '太原万达文华酒店有限公司', '91140000MA001030XT', '许三二', '13800138030', 'merchant030@hotel.com', '太原市杏花岭区北大街177号', '酒店管理、会议服务', 'https://example.com/merchant1030.png', '太原市中心商务酒店', '0', '1', '资质齐全，审核通过', '2026-06-05 08:52:15', '2026-06-05 22:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1031, '石家庄希尔顿酒店有限公司', '91130000MA001031XU', '何三三', '13800138031', 'merchant031@hotel.com', '石家庄市长安区东大街5号', '酒店管理、商务接待', 'https://example.com/merchant1031.png', '石家庄核心区域酒店', '0', '0', NULL, '2026-06-06 03:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1032, '呼和浩特万达文华酒店有限公司', '91150000MA001032XV', '吕三四', '13800138032', 'merchant032@hotel.com', '呼和浩特市赛罕区新华东街26号', '酒店管理、草原文化体验', 'https://example.com/merchant1032.png', '内蒙古特色酒店', '0', '1', '审核通过', '2026-06-05 08:52:15', '2026-06-06 00:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1033, '兰州皇冠假日酒店有限公司', '91620000MA001033XW', '施三五', '13800138033', 'merchant033@hotel.com', '兰州市城关区南滨河东路525号', '酒店管理、黄河景观', 'https://example.com/merchant1033.png', '兰州黄河畔酒店', '0', '1', '资质审核通过', '2026-06-05 14:52:15', '2026-06-06 02:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1034, '银川凯悦臻选酒店有限公司', '91640000MA001034XX', '张三六', '13800138034', 'merchant034@hotel.com', '银川市金凤区正源南街88号', '酒店管理、沙漠旅游', 'https://example.com/merchant1034.png', '宁夏地区高端酒店', '0', '1', '审核通过，准予入驻', '2026-06-05 16:52:15', '2026-06-06 04:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1035, '西宁万达瑞华酒店有限公司', '91630000MA001035XY', '孔三七', '13800138035', 'merchant035@hotel.com', '西宁市城西区五四西路80号', '酒店管理、高原旅游服务', 'https://example.com/merchant1035.png', '青海湖周边度假酒店', '0', '2', '经营范围与申请类型不符，请修改', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1036, '拉萨瑞吉度假酒店有限公司', '91540000MA001036XZ', '曹三八', '13800138036', 'merchant036@hotel.com', '拉萨市城关区江苏路22号', '度假酒店、藏文化体验', 'https://example.com/merchant1036.png', '西藏特色度假酒店', '0', '1', '审核通过', '2026-06-05 18:52:15', '2026-06-06 06:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1037, '乌鲁木齐希尔顿酒店有限公司', '91650000MA001037XA', '严三九', '13800138037', 'merchant037@hotel.com', '乌鲁木齐市天山区解放北路1号', '酒店管理、西域风情', 'https://example.com/merchant1037.png', '新疆首府高端酒店', '0', '1', '资质齐全，通过', '2026-06-05 20:52:15', '2026-06-06 07:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1038, '贵阳花果园万丽酒店有限公司', '91520000MA001038XB', '华四十', '13800138038', 'merchant038@hotel.com', '贵阳市南明区花果园大街1号', '酒店管理、城市综合体', 'https://example.com/merchant1038.png', '贵阳新兴商业区酒店', '0', '0', NULL, '2026-06-06 05:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1039, '珠海长隆横琴湾酒店有限公司', '91440000MA001039XC', '金四一', '13800138039', 'merchant039@hotel.com', '珠海市横琴新区富祥湾', '度假酒店、主题乐园', 'https://example.com/merchant1039.png', '珠海海洋主题度假酒店', '0', '1', '审核通过', '2026-06-05 22:52:15', '2026-06-06 08:22:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1040, '佛山顺德美的万豪酒店有限公司', '91440000MA001040XD', '魏四二', '13800138040', 'merchant040@hotel.com', '佛山市顺德区北滘镇美的大道6号', '酒店管理、商务会议', 'https://example.com/merchant1040.png', '佛山制造业中心酒店', '0', '1', '资质审核通过', '2026-06-06 00:52:15', '2026-06-06 07:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1041, '东莞松山湖凯悦酒店有限公司', '91440000MA001041XE', '陶四三', '13800138041', 'merchant041@hotel.com', '东莞市松山湖科技产业园区', '酒店管理、科技园区服务', 'https://example.com/merchant1041.png', '东莞高科技园区酒店', '0', '1', '审核通过，资质良好', '2026-06-06 02:52:15', '2026-06-06 08:22:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1042, '中山喜来登酒店有限公司', '91440000MA001042XF', '姜四四', '13800138042', 'merchant042@hotel.com', '中山市东区兴政路1号', '酒店管理、商务服务', 'https://example.com/merchant1042.png', '中山中心城市酒店', '0', '2', '联系电话无法接通，请确认后重新提交', '2026-06-05 08:52:15', '2026-06-05 20:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1043, '惠州洲际度假酒店有限公司', '91440000MA001043XG', '戚四五', '13800138043', 'merchant043@hotel.com', '惠州市惠东县巽寮湾金海湾大道', '度假酒店、海滨休闲', 'https://example.com/merchant1043.png', '惠州海滨度假酒店', '0', '1', '审核通过', '2026-06-06 04:52:15', '2026-06-06 07:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1044, '江门万达嘉华酒店有限公司', '91440000MA001044XH', '谢四六', '13800138044', 'merchant044@hotel.com', '江门市蓬江区发展大道77号', '酒店管理、侨乡文化', 'https://example.com/merchant1044.png', '江门五邑地区酒店', '0', '1', '资质齐全，审核通过', '2026-06-06 05:52:15', '2026-06-06 08:22:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1045, '湛江主权酒店有限公司', '91440000MA001045XI', '邹四七', '13800138045', 'merchant045@hotel.com', '湛江市开发区乐山路27号', '酒店管理、港口服务', 'https://example.com/merchant1045.png', '湛江港城商务酒店', '0', '0', NULL, '2026-06-06 06:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1046, '肇庆七星岩温德姆酒店有限公司', '91440000MA001046XJ', '喻四八', '13800138046', 'merchant046@hotel.com', '肇庆市端州区星湖大道1号', '酒店管理、景区度假', 'https://example.com/merchant1046.png', '肇庆风景区度假酒店', '0', '1', '审核通过', '2026-06-06 06:52:15', '2026-06-06 07:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1047, '汕头国际大酒店有限公司', '91440000MA001047XK', '柏四九', '13800138047', 'merchant047@hotel.com', '汕头市金平区金砂路52号', '酒店管理、潮汕文化', 'https://example.com/merchant1047.png', '汕头经济特区酒店', '0', '1', '资质审核通过', '2026-06-06 07:22:15', '2026-06-06 08:22:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1048, '揭阳榕江大酒店有限公司', '91440000MA001048XL', '水五十', '13800138048', 'merchant048@hotel.com', '揭阳市榕城区临江北路', '酒店管理、商务接待', 'https://example.com/merchant1048.png', '揭阳地区商务酒店', '0', '1', '审核通过，准予入驻', '2026-06-06 07:52:15', '2026-06-06 08:37:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1049, '茂名国际大酒店有限公司', '91440000MA001049XM', '窦五一', '13800138049', 'merchant049@hotel.com', '茂名市茂南区油城五路88号', '酒店管理、石化产业服务', 'https://example.com/merchant1049.png', '茂名石油化工城市酒店', '0', '0', NULL, '2026-06-06 08:07:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1050, '阳江保利福朋喜来登酒店有限公司', '91440000MA001050XN', '章五二', '13800138050', 'merchant050@hotel.com', '阳江市江城区海陵岛保利银滩', '度假酒店、海滩休闲', 'https://example.com/merchant1050.png', '阳江海陵岛度假酒店', '0', '1', '审核通过', '2026-06-06 08:22:15', '2026-06-06 08:42:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1051, '清远芊丽酒店有限公司', '91440000MA001051XO', '云五三', '13800138051', 'merchant051@hotel.com', '清远市清新区三坑镇湟川三峡', '度假酒店、温泉SPA', 'https://example.com/merchant1051.png', '清远温泉度假酒店', '0', '1', '资质齐全，通过', '2026-06-06 08:27:15', '2026-06-06 08:47:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1052, '潮州御酒店有限公司', '91440000MA001052XP', '苏五四', '13800138052', 'merchant052@hotel.com', '潮州市湘桥区滨江长廊', '精品酒店、潮州文化', 'https://example.com/merchant1052.png', '潮州古城文化酒店', '0', '2', '邮箱地址格式错误，请修正后重新提交', '2026-06-06 06:52:15', '2026-06-06 07:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1053, '河源客天下水晶温泉酒店有限公司', '91440000MA001053XQ', '潘五六', '13800138053', 'merchant053@hotel.com', '河源市源城区高埔岗龙栖大道', '度假酒店、温泉养生', 'https://example.com/merchant1053.png', '河源温泉养生酒店', '0', '1', '审核通过', '2026-06-06 08:32:15', '2026-06-06 08:47:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1054, '汕尾金海湾大酒店有限公司', '91440000MA001054XR', '葛五七', '13800138054', 'merchant054@hotel.com', '汕尾市城区香洲路777号', '酒店管理、海滨度假', 'https://example.com/merchant1054.png', '汕尾沿海度假酒店', '0', '1', '资质审核通过', '2026-06-06 08:37:15', '2026-06-06 08:49:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1055, '云浮新兴禅泉度假酒店有限公司', '91440000MA001055XS', '奚五八', '13800138055', 'merchant055@hotel.com', '云浮市新兴县六祖镇', '度假酒店、禅修文化', 'https://example.com/merchant1055.png', '云浮禅宗文化酒店', '0', '0', NULL, '2026-06-06 08:42:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1056, '桂林香格里拉大酒店有限公司', '91450000MA001056XT', '范五九', '13800138056', 'merchant056@hotel.com', '桂林市七星区环城北二路111号', '酒店管理、山水景观', 'https://example.com/merchant1056.png', '桂林山水甲天下酒店', '0', '1', '审核通过', '2026-06-06 08:44:15', '2026-06-06 08:50:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1057, '北海银滩皇冠假日酒店有限公司', '91450000MA001057XU', '彭六十', '13800138057', 'merchant057@hotel.com', '北海市银海区银滩中路', '度假酒店、海滩休闲', 'https://example.com/merchant1057.png', '北海银滩度假酒店', '0', '1', '资质齐全，审核通过', '2026-06-06 08:47:15', '2026-06-06 08:51:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1058, '柳州万达嘉华酒店有限公司', '91450000MA001058XV', '鲁六一', '13800138058', 'merchant058@hotel.com', '柳州市城中区文昌大桥东侧', '酒店管理、工业城市服务', 'https://example.com/merchant1058.png', '柳州工业城市酒店', '0', '1', '审核通过，资质良好', '2026-06-06 08:49:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1059, '梧州国龙大酒店有限公司', '91450000MA001059XW', '韦六二', '13800138059', 'merchant059@hotel.com', '梧州市长洲区新兴一路68号', '酒店管理、西江文化', 'https://example.com/merchant1059.png', '梧州西江明珠酒店', '0', '0', NULL, '2026-06-06 08:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1060, '玉林福达国际大酒店有限公司', '91450000MA001060XX', '昌六三', '13800138060', 'merchant060@hotel.com', '玉林市玉州区教育中路', '酒店管理、商贸服务', 'https://example.com/merchant1060.png', '玉林商贸中心城市酒店', '0', '1', '审核通过', '2026-06-06 08:50:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1061, '百色右江民族大酒店有限公司', '91450000MA001061XY', '马六四', '13800138061', 'merchant061@hotel.com', '百色市右江区城东大道', '酒店管理、民族文化', 'https://example.com/merchant1061.png', '百色革命老区酒店', '0', '1', '资质齐全，审核通过', '2026-06-06 08:51:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1062, '贺州姑婆山温泉酒店有限公司', '91450000MA001062XZ', '苗六五', '13800138062', 'merchant062@hotel.com', '贺州市八步区姑婆山旅游区', '度假酒店、温泉养生', 'https://example.com/merchant1062.png', '贺州生态度假酒店', '0', '0', NULL, '2026-06-06 08:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1063, '河池宜州国际大酒店有限公司', '91450000MA001063XA', '凤六六', '13800138063', 'merchant063@hotel.com', '河池市宜州区龙江路', '酒店管理、刘三姐文化', 'https://example.com/merchant1063.png', '河池民族风情酒店', '0', '1', '审核通过', '2026-06-06 08:51:45', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1064, '来宾桂中大酒店有限公司', '91450000MA001064XB', '花六七', '13800138064', 'merchant064@hotel.com', '来宾市兴宾区盘古大道', '酒店管理、壮族文化', 'https://example.com/merchant1064.png', '来宾壮乡酒店', '0', '1', '资质审核通过', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1065, '崇左凭祥友谊关酒店有限公司', '91450000MA001065XC', '方六八', '13800138065', 'merchant065@hotel.com', '崇左市凭祥市南大路', '酒店管理、边贸服务', 'https://example.com/merchant1065.png', '崇左边境口岸酒店', '0', '2', '地址信息不完整，请补充详细地址', '2026-06-06 08:47:15', '2026-06-06 08:51:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1066, '防城港白浪滩度假酒店有限公司', '91450000MA001066XD', '俞六九', '13800138066', 'merchant066@hotel.com', '防城港市港口区江山半岛', '度假酒店、海滨休闲', 'https://example.com/merchant1066.png', '防城港滨海度假酒店', '0', '1', '审核通过', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1067, '钦州白石湖阿尔卡迪亚酒店有限公司', '91450000MA001067XE', '任七十', '13800138067', 'merchant067@hotel.com', '钦州市钦南区永福东大街', '酒店管理、海豚文化', 'https://example.com/merchant1067.png', '钦州白海豚之乡酒店', '0', '1', '资质齐全，通过', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1068, '贵港万达嘉华酒店有限公司', '91450000MA001068XF', '袁七一', '13800138068', 'merchant068@hotel.com', '贵港市港北区中山路', '酒店管理、荷城文化', 'https://example.com/merchant1068.png', '贵港荷花之城酒店', '0', '0', NULL, '2026-06-06 08:52:15', NULL, NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1069, '桂林阳朔悦榕庄度假酒店有限公司', '91450000MA001069XG', '柳七二', '13800138069', 'merchant069@hotel.com', '桂林市阳朔县遇龙河景区', '度假酒店、田园风光', 'https://example.com/merchant1069.png', '阳朔山水田园酒店', '0', '1', '审核通过', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1070, '三亚亚特兰蒂斯酒店有限公司', '91460000MA001070XH', '酆七三', '13800138070', 'merchant070@hotel.com', '三亚市海棠区海棠北路', '度假酒店、水族馆', 'https://example.com/merchant1070.png', '三亚顶级奢华度假酒店', '0', '1', '资质审核通过，准予入驻', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1071, 'AAA皮拽子批发酒店', 'Y9140824CU5EQ5G8EX', '冲击波', '13316366046', '1622633698@qq.com', '石岐区学院路一号', '酒店管理', '', '', '0', '0', NULL, NULL, NULL, NULL, '2026-06-09 16:41:13', '2026-06-09 16:41:13');
INSERT INTO `merchant` VALUES (1073, '111', 'Y13311008N32EEJ712', 'aaa', '13316366046', '1622633698@qq.com', '石岐区学院路一号', '123456', 'https://ts1.tc.mm.bing.net/th/id/R-C.21b6355339bb8739100e5d38b7916b01?rik=mduC0RML8NRHuQ&riu=http%3a%2f%2fblog.logo123.com%2fwp-content%2fuploads%2f2016%2f11%2f1.jpg&ehk=w8tPvXMUPi8cyftJ%2fmQMm2IbjkVi4SzCM%2bp%2bZB1Lc9U%3d&risl=&pid=ImgRaw&r=0', '', '0', '1', NULL, '2026-06-18 21:54:12', NULL, 100, '2026-06-18 21:54:12', '2026-06-18 22:24:47');
INSERT INTO `merchant` VALUES (1074, 'lyx', '91440101MA5B3C4D2E', 'lyx', '17359201669', 'hero2192039831@163.com', 'zsc', '酒店', '欧ku', '123', '0', '1', NULL, '2026-06-25 15:54:27', NULL, 311, '2026-06-25 15:54:27', '2026-06-25 15:55:16');

-- ----------------------------
-- Table structure for merchant_audit
-- ----------------------------
DROP TABLE IF EXISTS `merchant_audit`;
CREATE TABLE `merchant_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `audit_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '审核类型（1入驻申请 2信息变更 3状态变更）',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
  `submit_material` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提交材料（JSON格式，营业执照图片URL等）',
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `submit_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `submit_user_id` int NULL DEFAULT NULL COMMENT '提交用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_merchant_id`(`merchant_id` ASC) USING BTREE,
  INDEX `idx_audit_status`(`audit_status` ASC) USING BTREE,
  INDEX `idx_auditor_id`(`auditor_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户审核表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of merchant_audit
-- ----------------------------
INSERT INTO `merchant_audit` VALUES (1, 1001, '1', '1', '{\"license_img\":\"https://example.com/license1001.jpg\",\"id_card\":\"https://example.com/id1001.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-05-07 08:52:15', '2026-05-09 08:52:15', '2026-05-07 08:52:15', '2026-05-09 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (2, 1002, '1', '1', '{\"license_img\":\"https://example.com/license1002.jpg\",\"id_card\":\"https://example.com/id1002.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-09 08:52:15', '2026-05-11 08:52:15', '2026-05-09 08:52:15', '2026-05-11 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (3, 1003, '1', '1', '{\"license_img\":\"https://example.com/license1003.jpg\",\"id_card\":\"https://example.com/id1003.jpg\"}', '审核通过', 1, 'admin', '2026-05-12 08:52:15', '2026-05-14 08:52:15', '2026-05-12 08:52:15', '2026-05-14 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (4, 1004, '1', '1', '{\"license_img\":\"https://example.com/license1004.jpg\",\"id_card\":\"https://example.com/id1004.jpg\"}', '资质齐全，通过入驻', 1, 'admin', '2026-05-15 08:52:15', '2026-05-17 08:52:15', '2026-05-15 08:52:15', '2026-05-17 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (5, 1005, '1', '1', '{\"license_img\":\"https://example.com/license1005.jpg\",\"id_card\":\"https://example.com/id1005.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-05-17 08:52:15', '2026-05-19 08:52:15', '2026-05-17 08:52:15', '2026-05-19 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (6, 1006, '1', '0', '{\"license_img\":\"https://example.com/license1006.jpg\",\"id_card\":\"https://example.com/id1006.jpg\"}', NULL, NULL, NULL, '2026-06-04 08:52:15', NULL, '2026-06-04 08:52:15', '2026-06-04 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (7, 1007, '1', '0', '{\"license_img\":\"https://example.com/license1007.jpg\",\"id_card\":\"https://example.com/id1007.jpg\"}', NULL, NULL, NULL, '2026-06-05 08:52:15', NULL, '2026-06-05 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (8, 1008, '1', '2', '{\"license_img\":\"https://example.com/license1008.jpg\"}', '营业执照信息不清晰，请重新上传', 1, 'admin', '2026-05-22 08:52:15', '2026-05-23 08:52:15', '2026-05-22 08:52:15', '2026-05-23 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (9, 1009, '1', '1', '{\"license_img\":\"https://example.com/license1009.jpg\",\"id_card\":\"https://example.com/id1009.jpg\"}', '审核通过', 1, 'admin', '2026-05-25 08:52:15', '2026-05-27 08:52:15', '2026-05-25 08:52:15', '2026-05-27 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (10, 1010, '1', '1', '{\"license_img\":\"https://example.com/license1010.jpg\",\"id_card\":\"https://example.com/id1010.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-27 08:52:15', '2026-05-29 08:52:15', '2026-05-27 08:52:15', '2026-05-29 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (11, 1011, '1', '1', '{\"license_img\":\"https://example.com/license1011.jpg\",\"id_card\":\"https://example.com/id1011.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-05-28 08:52:15', '2026-05-30 08:52:15', '2026-05-28 08:52:15', '2026-05-30 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (12, 1012, '1', '1', '{\"license_img\":\"https://example.com/license1012.jpg\",\"id_card\":\"https://example.com/id1012.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-05-29 08:52:15', '2026-05-31 08:52:15', '2026-05-29 08:52:15', '2026-05-31 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (13, 1013, '1', '1', '{\"license_img\":\"https://example.com/license1013.jpg\",\"id_card\":\"https://example.com/id1013.jpg\"}', '审核通过', 1, 'admin', '2026-05-30 08:52:15', '2026-06-01 08:52:15', '2026-05-30 08:52:15', '2026-06-01 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (14, 1014, '1', '1', '{\"license_img\":\"https://example.com/license1014.jpg\",\"id_card\":\"https://example.com/id1014.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-31 08:52:15', '2026-06-02 08:52:15', '2026-05-31 08:52:15', '2026-06-02 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (15, 1015, '1', '1', '{\"license_img\":\"https://example.com/license1015.jpg\",\"id_card\":\"https://example.com/id1015.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-01 08:52:15', '2026-06-03 08:52:15', '2026-06-01 08:52:15', '2026-06-03 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (16, 1016, '1', '1', '{\"license_img\":\"https://example.com/license1016.jpg\",\"id_card\":\"https://example.com/id1016.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-02 08:52:15', '2026-06-04 08:52:15', '2026-06-02 08:52:15', '2026-06-04 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (17, 1017, '1', '1', '{\"license_img\":\"https://example.com/license1017.jpg\",\"id_card\":\"https://example.com/id1017.jpg\"}', '审核通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-05 08:52:15', '2026-06-03 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (18, 1018, '1', '0', '{\"license_img\":\"https://example.com/license1018.jpg\",\"id_card\":\"https://example.com/id1018.jpg\"}', NULL, NULL, NULL, '2026-06-05 20:52:15', NULL, '2026-06-05 20:52:15', '2026-06-05 20:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (19, 1019, '1', '0', '{\"license_img\":\"https://example.com/license1019.jpg\",\"id_card\":\"https://example.com/id1019.jpg\"}', NULL, NULL, NULL, '2026-06-06 02:52:15', NULL, '2026-06-06 02:52:15', '2026-06-06 02:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (20, 1020, '1', '1', '{\"license_img\":\"https://example.com/license1020.jpg\",\"id_card\":\"https://example.com/id1020.jpg\"}', '审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (21, 1021, '1', '1', '{\"license_img\":\"https://example.com/license1021.jpg\",\"id_card\":\"https://example.com/id1021.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-04 08:52:15', '2026-06-03 08:52:15', '2026-06-04 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (22, 1022, '1', '2', '{\"license_img\":\"https://example.com/license1022.jpg\"}', '营业执照过期，请更新后重新提交', 1, 'admin', '2026-06-01 08:52:15', '2026-06-02 08:52:15', '2026-06-01 08:52:15', '2026-06-02 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (23, 1023, '1', '1', '{\"license_img\":\"https://example.com/license1023.jpg\",\"id_card\":\"https://example.com/id1023.jpg\"}', '审核通过', 1, 'admin', '2026-06-02 08:52:15', '2026-06-03 08:52:15', '2026-06-02 08:52:15', '2026-06-03 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (24, 1024, '1', '1', '{\"license_img\":\"https://example.com/license1024.jpg\",\"id_card\":\"https://example.com/id1024.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-04 08:52:15', '2026-06-03 08:52:15', '2026-06-04 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (25, 1025, '1', '0', '{\"license_img\":\"https://example.com/license1025.jpg\",\"id_card\":\"https://example.com/id1025.jpg\"}', NULL, NULL, NULL, '2026-06-06 00:52:15', NULL, '2026-06-06 00:52:15', '2026-06-06 00:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (26, 1026, '1', '1', '{\"license_img\":\"https://example.com/license1026.jpg\",\"id_card\":\"https://example.com/id1026.jpg\"}', '审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (27, 1027, '1', '1', '{\"license_img\":\"https://example.com/license1027.jpg\",\"id_card\":\"https://example.com/id1027.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (28, 1028, '1', '2', '{\"license_img\":\"https://example.com/license1028.jpg\"}', '法人身份证信息不匹配，请核实', 1, 'admin', '2026-06-02 08:52:15', '2026-06-03 08:52:15', '2026-06-02 08:52:15', '2026-06-03 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (29, 1029, '1', '1', '{\"license_img\":\"https://example.com/license1029.jpg\",\"id_card\":\"https://example.com/id1029.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 20:52:15', '2026-06-05 08:52:15', '2026-06-05 20:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (30, 1030, '1', '1', '{\"license_img\":\"https://example.com/license1030.jpg\",\"id_card\":\"https://example.com/id1030.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 22:52:15', '2026-06-05 08:52:15', '2026-06-05 22:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (31, 1031, '1', '0', '{\"license_img\":\"https://example.com/license1031.jpg\",\"id_card\":\"https://example.com/id1031.jpg\"}', NULL, NULL, NULL, '2026-06-06 03:52:15', NULL, '2026-06-06 03:52:15', '2026-06-06 03:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (32, 1032, '1', '1', '{\"license_img\":\"https://example.com/license1032.jpg\",\"id_card\":\"https://example.com/id1032.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-06 00:52:15', '2026-06-05 08:52:15', '2026-06-06 00:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (33, 1033, '1', '1', '{\"license_img\":\"https://example.com/license1033.jpg\",\"id_card\":\"https://example.com/id1033.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-05 14:52:15', '2026-06-06 02:52:15', '2026-06-05 14:52:15', '2026-06-06 02:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (34, 1034, '1', '1', '{\"license_img\":\"https://example.com/license1034.jpg\",\"id_card\":\"https://example.com/id1034.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-05 16:52:15', '2026-06-06 04:52:15', '2026-06-05 16:52:15', '2026-06-06 04:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (35, 1035, '1', '2', '{\"license_img\":\"https://example.com/license1035.jpg\"}', '经营范围与申请类型不符，请修改', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (36, 1036, '1', '1', '{\"license_img\":\"https://example.com/license1036.jpg\",\"id_card\":\"https://example.com/id1036.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 18:52:15', '2026-06-06 06:52:15', '2026-06-05 18:52:15', '2026-06-06 06:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (37, 1037, '1', '1', '{\"license_img\":\"https://example.com/license1037.jpg\",\"id_card\":\"https://example.com/id1037.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-05 20:52:15', '2026-06-06 07:52:15', '2026-06-05 20:52:15', '2026-06-06 07:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (38, 1038, '1', '0', '{\"license_img\":\"https://example.com/license1038.jpg\",\"id_card\":\"https://example.com/id1038.jpg\"}', NULL, NULL, NULL, '2026-06-06 05:52:15', NULL, '2026-06-06 05:52:15', '2026-06-06 05:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (39, 1039, '1', '1', '{\"license_img\":\"https://example.com/license1039.jpg\",\"id_card\":\"https://example.com/id1039.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 22:52:15', '2026-06-06 08:22:15', '2026-06-05 22:52:15', '2026-06-06 08:22:15', NULL);
INSERT INTO `merchant_audit` VALUES (40, 1040, '1', '1', '{\"license_img\":\"https://example.com/license1040.jpg\",\"id_card\":\"https://example.com/id1040.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 00:52:15', '2026-06-06 07:52:15', '2026-06-06 00:52:15', '2026-06-06 07:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (41, 1041, '1', '1', '{\"license_img\":\"https://example.com/license1041.jpg\",\"id_card\":\"https://example.com/id1041.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-06-06 02:52:15', '2026-06-06 08:22:15', '2026-06-06 02:52:15', '2026-06-06 08:22:15', NULL);
INSERT INTO `merchant_audit` VALUES (42, 1042, '1', '2', '{\"license_img\":\"https://example.com/license1042.jpg\"}', '联系电话无法接通，请确认后重新提交', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 20:52:15', '2026-06-05 08:52:15', '2026-06-05 20:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (43, 1043, '1', '1', '{\"license_img\":\"https://example.com/license1043.jpg\",\"id_card\":\"https://example.com/id1043.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 04:52:15', '2026-06-06 07:52:15', '2026-06-06 04:52:15', '2026-06-06 07:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (44, 1044, '1', '1', '{\"license_img\":\"https://example.com/license1044.jpg\",\"id_card\":\"https://example.com/id1044.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 05:52:15', '2026-06-06 08:22:15', '2026-06-06 05:52:15', '2026-06-06 08:22:15', NULL);
INSERT INTO `merchant_audit` VALUES (45, 1045, '1', '0', '{\"license_img\":\"https://example.com/license1045.jpg\",\"id_card\":\"https://example.com/id1045.jpg\"}', NULL, NULL, NULL, '2026-06-06 06:52:15', NULL, '2026-06-06 06:52:15', '2026-06-06 06:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (46, 1046, '1', '1', '{\"license_img\":\"https://example.com/license1046.jpg\",\"id_card\":\"https://example.com/id1046.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 06:52:15', '2026-06-06 07:52:15', '2026-06-06 06:52:15', '2026-06-06 07:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (47, 1047, '1', '1', '{\"license_img\":\"https://example.com/license1047.jpg\",\"id_card\":\"https://example.com/id1047.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 07:22:15', '2026-06-06 08:22:15', '2026-06-06 07:22:15', '2026-06-06 08:22:15', NULL);
INSERT INTO `merchant_audit` VALUES (48, 1048, '1', '1', '{\"license_img\":\"https://example.com/license1048.jpg\",\"id_card\":\"https://example.com/id1048.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-06 07:52:15', '2026-06-06 08:37:15', '2026-06-06 07:52:15', '2026-06-06 08:37:15', NULL);
INSERT INTO `merchant_audit` VALUES (49, 1049, '1', '0', '{\"license_img\":\"https://example.com/license1049.jpg\",\"id_card\":\"https://example.com/id1049.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:07:15', NULL, '2026-06-06 08:07:15', '2026-06-06 08:07:15', NULL);
INSERT INTO `merchant_audit` VALUES (50, 1050, '1', '1', '{\"license_img\":\"https://example.com/license1050.jpg\",\"id_card\":\"https://example.com/id1050.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:22:15', '2026-06-06 08:42:15', '2026-06-06 08:22:15', '2026-06-06 08:42:15', NULL);
INSERT INTO `merchant_audit` VALUES (51, 1051, '1', '1', '{\"license_img\":\"https://example.com/license1051.jpg\",\"id_card\":\"https://example.com/id1051.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-06 08:27:15', '2026-06-06 08:47:15', '2026-06-06 08:27:15', '2026-06-06 08:47:15', NULL);
INSERT INTO `merchant_audit` VALUES (52, 1052, '1', '2', '{\"license_img\":\"https://example.com/license1052.jpg\"}', '邮箱地址格式错误，请修正后重新提交', 1, 'admin', '2026-06-06 06:52:15', '2026-06-06 07:52:15', '2026-06-06 06:52:15', '2026-06-06 07:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (53, 1053, '1', '1', '{\"license_img\":\"https://example.com/license1053.jpg\",\"id_card\":\"https://example.com/id1053.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:32:15', '2026-06-06 08:47:15', '2026-06-06 08:32:15', '2026-06-06 08:47:15', NULL);
INSERT INTO `merchant_audit` VALUES (54, 1054, '1', '1', '{\"license_img\":\"https://example.com/license1054.jpg\",\"id_card\":\"https://example.com/id1054.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 08:37:15', '2026-06-06 08:49:15', '2026-06-06 08:37:15', '2026-06-06 08:49:15', NULL);
INSERT INTO `merchant_audit` VALUES (55, 1055, '1', '0', '{\"license_img\":\"https://example.com/license1055.jpg\",\"id_card\":\"https://example.com/id1055.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:42:15', NULL, '2026-06-06 08:42:15', '2026-06-06 08:42:15', NULL);
INSERT INTO `merchant_audit` VALUES (56, 1056, '1', '1', '{\"license_img\":\"https://example.com/license1056.jpg\",\"id_card\":\"https://example.com/id1056.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:44:15', '2026-06-06 08:50:15', '2026-06-06 08:44:15', '2026-06-06 08:50:15', NULL);
INSERT INTO `merchant_audit` VALUES (57, 1057, '1', '1', '{\"license_img\":\"https://example.com/license1057.jpg\",\"id_card\":\"https://example.com/id1057.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 08:47:15', '2026-06-06 08:51:15', '2026-06-06 08:47:15', '2026-06-06 08:51:15', NULL);
INSERT INTO `merchant_audit` VALUES (58, 1058, '1', '1', '{\"license_img\":\"https://example.com/license1058.jpg\",\"id_card\":\"https://example.com/id1058.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-06-06 08:49:15', '2026-06-06 08:52:15', '2026-06-06 08:49:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (59, 1059, '1', '0', '{\"license_img\":\"https://example.com/license1059.jpg\",\"id_card\":\"https://example.com/id1059.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (60, 1060, '1', '1', '{\"license_img\":\"https://example.com/license1060.jpg\",\"id_card\":\"https://example.com/id1060.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:50:15', '2026-06-06 08:52:15', '2026-06-06 08:50:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (61, 1061, '1', '1', '{\"license_img\":\"https://example.com/license1061.jpg\",\"id_card\":\"https://example.com/id1061.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 08:51:15', '2026-06-06 08:52:15', '2026-06-06 08:51:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (62, 1062, '1', '0', '{\"license_img\":\"https://example.com/license1062.jpg\",\"id_card\":\"https://example.com/id1062.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (63, 1063, '1', '1', '{\"license_img\":\"https://example.com/license1063.jpg\",\"id_card\":\"https://example.com/id1063.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:51:45', '2026-06-06 08:52:15', '2026-06-06 08:51:45', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (64, 1064, '1', '1', '{\"license_img\":\"https://example.com/license1064.jpg\",\"id_card\":\"https://example.com/id1064.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (65, 1065, '1', '2', '{\"license_img\":\"https://example.com/license1065.jpg\"}', '地址信息不完整，请补充详细地址', 1, 'admin', '2026-06-06 08:47:15', '2026-06-06 08:51:15', '2026-06-06 08:47:15', '2026-06-06 08:51:15', NULL);
INSERT INTO `merchant_audit` VALUES (66, 1066, '1', '1', '{\"license_img\":\"https://example.com/license1066.jpg\",\"id_card\":\"https://example.com/id1066.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (67, 1067, '1', '1', '{\"license_img\":\"https://example.com/license1067.jpg\",\"id_card\":\"https://example.com/id1067.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (68, 1068, '1', '0', '{\"license_img\":\"https://example.com/license1068.jpg\",\"id_card\":\"https://example.com/id1068.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (69, 1069, '1', '1', '{\"license_img\":\"https://example.com/license1069.jpg\",\"id_card\":\"https://example.com/id1069.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (70, 1070, '1', '1', '{\"license_img\":\"https://example.com/license1070.jpg\",\"id_card\":\"https://example.com/id1070.jpg\"}', '资质审核通过，准予入驻', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', NULL);
INSERT INTO `merchant_audit` VALUES (71, 1073, '1', '1', NULL, '111', NULL, NULL, '2026-06-18 21:54:12', '2026-06-18 22:24:47', '2026-06-18 21:54:12', '2026-06-18 22:24:47', 100);
INSERT INTO `merchant_audit` VALUES (72, 1074, '1', '1', NULL, '通过', 1, 'admin', '2026-06-25 15:54:27', '2026-06-25 15:55:16', '2026-06-25 15:54:27', '2026-06-25 15:55:16', 311);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `hotel_id` bigint NOT NULL COMMENT '酒店ID',
  `room_id` bigint NOT NULL COMMENT '房型ID',
  `start_date` date NOT NULL COMMENT '入住日期',
  `end_date` date NOT NULL COMMENT '离店日期',
  `total_price` decimal(10, 2) NOT NULL COMMENT '总价格',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '订单状态（0待支付 1已支付 2已取消 3已完成 4退款中 5已退款）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_room_id`(`room_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ORD20260602000001', 2349, 88, 303, '2026-07-21', '2026-07-24', 2398.10, '5', NULL, '2026-05-24 00:30:58', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (2, 'ORD20260602000002', 2022, 16, 106, '2026-05-29', '2026-06-01', 1745.80, '1', NULL, '2026-05-04 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (3, 'ORD20260602000003', 2410, 99, 265, '2026-07-15', '2026-07-19', 1360.42, '5', NULL, '2026-05-13 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (4, 'ORD20260602000004', 2071, 24, 199, '2026-05-01', '2026-05-05', 687.59, '3', NULL, '2026-05-19 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (5, 'ORD20260602000005', 2213, 25, 12, '2026-05-04', '2026-05-09', 2304.59, '2', NULL, NULL, '2026-04-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (6, 'ORD20260602000006', 2087, 58, 203, '2026-05-13', '2026-05-14', 2384.60, '4', NULL, '2026-05-28 00:30:58', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (7, 'ORD20260602000007', 2272, 38, 188, '2026-05-12', '2026-05-17', 2707.33, '3', NULL, '2026-05-15 00:30:58', '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (8, 'ORD20260602000008', 2347, 39, 61, '2026-07-26', '2026-07-30', 3797.54, '3', NULL, '2026-05-19 00:30:58', '2026-04-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (9, 'ORD20260602000009', 2195, 30, 90, '2026-05-17', '2026-05-21', 963.60, '2', NULL, NULL, '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (10, 'ORD20260602000010', 2493, 76, 229, '2026-07-27', '2026-08-01', 2977.69, '0', NULL, NULL, '2026-05-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (11, 'ORD20260602000011', 2355, 96, 181, '2026-05-02', '2026-05-07', 3005.26, '0', NULL, NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (12, 'ORD20260602000012', 2472, 84, 243, '2026-06-27', '2026-06-29', 4831.67, '4', NULL, '2026-05-17 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (13, 'ORD20260602000013', 2348, 61, 37, '2026-05-16', '2026-05-20', 1400.81, '5', NULL, '2026-05-05 00:30:58', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (14, 'ORD20260602000014', 2471, 87, 178, '2026-05-18', '2026-05-19', 439.02, '4', NULL, '2026-05-08 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (15, 'ORD20260602000015', 2420, 98, 54, '2026-07-06', '2026-07-07', 3793.12, '0', NULL, NULL, '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (16, 'ORD20260602000016', 2101, 76, 174, '2026-06-17', '2026-06-18', 2980.45, '4', NULL, '2026-05-31 00:30:58', '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (17, 'ORD20260602000017', 2086, 53, 53, '2026-06-07', '2026-06-10', 3179.89, '2', NULL, NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (18, 'ORD20260602000018', 2219, 35, 33, '2026-07-21', '2026-07-23', 2443.83, '3', NULL, '2026-05-19 00:30:58', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (19, 'ORD20260602000019', 2195, 88, 142, '2026-07-06', '2026-07-09', 2395.49, '3', NULL, '2026-05-09 00:30:58', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (20, 'ORD20260602000020', 2036, 23, 263, '2026-05-11', '2026-05-13', 2254.06, '0', NULL, NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (21, 'ORD20260602000021', 2181, 30, 298, '2026-05-24', '2026-05-26', 2305.06, '2', NULL, NULL, '2026-04-21 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (22, 'ORD20260602000022', 2444, 35, 204, '2026-07-03', '2026-07-08', 769.16, '5', NULL, '2026-05-16 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (23, 'ORD20260602000023', 2251, 9, 195, '2026-07-16', '2026-07-20', 1362.29, '5', NULL, '2026-05-15 00:30:58', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (24, 'ORD20260602000024', 2424, 60, 185, '2026-06-29', '2026-07-03', 3670.47, '2', NULL, NULL, '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (25, 'ORD20260602000025', 2243, 47, 62, '2026-07-21', '2026-07-22', 3373.94, '0', NULL, NULL, '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (26, 'ORD20260602000026', 2243, 16, 346, '2026-06-12', '2026-06-17', 302.93, '2', NULL, NULL, '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (27, 'ORD20260602000027', 2042, 92, 58, '2026-07-23', '2026-07-26', 1436.17, '5', NULL, '2026-05-28 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (28, 'ORD20260602000028', 2016, 63, 344, '2026-05-21', '2026-05-22', 2339.22, '0', NULL, NULL, '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (29, 'ORD20260602000029', 2320, 83, 148, '2026-07-24', '2026-07-28', 607.57, '5', NULL, '2026-05-10 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (30, 'ORD20260602000030', 2164, 40, 36, '2026-06-01', '2026-06-05', 3550.41, '1', NULL, '2026-06-02 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (31, 'ORD20260602000031', 2154, 8, 38, '2026-05-21', '2026-05-22', 1640.72, '5', NULL, '2026-05-21 00:30:58', '2026-05-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (32, 'ORD20260602000032', 2300, 12, 67, '2026-06-09', '2026-06-11', 2942.54, '4', NULL, '2026-05-11 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (33, 'ORD20260602000033', 2032, 37, 221, '2026-06-08', '2026-06-13', 2604.75, '3', NULL, '2026-05-20 00:30:58', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (34, 'ORD20260602000034', 2070, 12, 34, '2026-06-06', '2026-06-10', 4689.89, '4', NULL, '2026-06-01 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (35, 'ORD20260602000035', 2219, 52, 280, '2026-07-11', '2026-07-15', 4383.80, '2', NULL, NULL, '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (36, 'ORD20260602000036', 2148, 68, 93, '2026-07-01', '2026-07-04', 3205.55, '2', NULL, NULL, '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (37, 'ORD20260602000037', 2191, 47, 194, '2026-05-23', '2026-05-24', 4350.51, '5', NULL, '2026-05-31 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (38, 'ORD20260602000038', 2245, 75, 332, '2026-06-25', '2026-06-29', 1098.15, '0', NULL, NULL, '2026-04-22 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (39, 'ORD20260602000039', 2414, 33, 197, '2026-06-11', '2026-06-16', 3467.89, '5', NULL, '2026-05-13 00:30:58', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (40, 'ORD20260602000040', 2053, 75, 25, '2026-05-30', '2026-06-01', 3031.12, '5', NULL, '2026-05-30 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (41, 'ORD20260602000041', 2433, 73, 284, '2026-07-21', '2026-07-26', 4658.03, '5', NULL, '2026-05-19 00:30:58', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (42, 'ORD20260602000042', 2398, 53, 97, '2026-05-15', '2026-05-18', 2890.52, '3', NULL, '2026-06-01 00:30:58', '2026-04-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (43, 'ORD20260602000043', 2098, 77, 35, '2026-07-02', '2026-07-07', 1501.34, '4', NULL, '2026-05-15 00:30:58', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (44, 'ORD20260602000044', 2082, 68, 14, '2026-07-04', '2026-07-05', 1240.82, '4', NULL, '2026-05-22 00:30:58', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (45, 'ORD20260602000045', 2343, 54, 21, '2026-05-24', '2026-05-26', 2246.49, '2', NULL, NULL, '2026-05-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (46, 'ORD20260602000046', 2449, 59, 116, '2026-06-15', '2026-06-20', 3503.89, '5', NULL, '2026-05-22 00:30:58', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (47, 'ORD20260602000047', 2020, 8, 229, '2026-05-22', '2026-05-23', 3583.61, '1', NULL, '2026-05-30 00:30:58', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (48, 'ORD20260602000048', 2182, 65, 302, '2026-05-23', '2026-05-24', 4694.19, '1', NULL, '2026-05-17 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (49, 'ORD20260602000049', 2455, 94, 331, '2026-07-04', '2026-07-09', 867.63, '0', NULL, NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (50, 'ORD20260602000050', 2156, 9, 321, '2026-07-13', '2026-07-14', 1418.11, '4', NULL, '2026-05-28 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (51, 'ORD20260602000051', 2350, 45, 142, '2026-05-26', '2026-05-28', 4171.90, '0', NULL, NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (52, 'ORD20260602000052', 2355, 99, 257, '2026-06-02', '2026-06-06', 1170.18, '5', NULL, '2026-05-24 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (53, 'ORD20260602000053', 2480, 26, 120, '2026-07-09', '2026-07-10', 3530.21, '2', NULL, NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (54, 'ORD20260602000054', 2404, 4, 344, '2026-05-10', '2026-05-11', 650.12, '0', NULL, NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (55, 'ORD20260602000055', 2402, 12, 10, '2026-07-25', '2026-07-27', 3569.92, '3', NULL, '2026-05-12 00:30:58', '2026-04-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (56, 'ORD20260602000056', 2482, 34, 349, '2026-07-15', '2026-07-17', 412.93, '1', NULL, '2026-05-07 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (57, 'ORD20260602000057', 2326, 62, 175, '2026-07-09', '2026-07-14', 944.64, '0', NULL, NULL, '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (58, 'ORD20260602000058', 2324, 36, 261, '2026-05-01', '2026-05-02', 2540.99, '0', NULL, NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (59, 'ORD20260602000059', 2037, 63, 66, '2026-07-12', '2026-07-17', 3557.52, '5', NULL, '2026-05-07 00:30:58', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (60, 'ORD20260602000060', 2172, 55, 138, '2026-06-18', '2026-06-22', 3821.78, '4', NULL, '2026-05-23 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (61, 'ORD20260602000061', 2344, 11, 210, '2026-06-28', '2026-06-29', 4792.59, '1', NULL, '2026-05-24 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (62, 'ORD20260602000062', 2468, 36, 71, '2026-05-08', '2026-05-12', 4136.31, '1', NULL, '2026-05-11 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (63, 'ORD20260602000063', 2192, 69, 171, '2026-06-10', '2026-06-11', 1493.47, '5', NULL, '2026-05-12 00:30:58', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (64, 'ORD20260602000064', 2407, 55, 312, '2026-06-06', '2026-06-09', 3572.14, '4', NULL, '2026-05-16 00:30:58', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (65, 'ORD20260602000065', 2266, 67, 108, '2026-07-06', '2026-07-07', 1504.66, '5', NULL, '2026-05-27 00:30:58', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (66, 'ORD20260602000066', 2234, 98, 168, '2026-07-22', '2026-07-23', 452.85, '4', NULL, '2026-05-21 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (67, 'ORD20260602000067', 2349, 45, 142, '2026-05-26', '2026-05-28', 3603.39, '3', NULL, '2026-05-09 00:30:58', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (68, 'ORD20260602000068', 2353, 38, 269, '2026-05-22', '2026-05-23', 2951.87, '3', NULL, '2026-05-15 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (69, 'ORD20260602000069', 2048, 40, 301, '2026-07-22', '2026-07-24', 3335.80, '2', NULL, NULL, '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (70, 'ORD20260602000070', 2194, 6, 38, '2026-06-25', '2026-06-30', 4280.76, '2', NULL, NULL, '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (71, 'ORD20260602000071', 2471, 25, 257, '2026-06-15', '2026-06-19', 676.53, '1', NULL, '2026-05-05 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (72, 'ORD20260602000072', 2198, 5, 107, '2026-05-07', '2026-05-08', 3184.78, '3', NULL, '2026-06-02 00:30:58', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (73, 'ORD20260602000073', 2151, 82, 333, '2026-06-29', '2026-07-02', 892.91, '2', NULL, NULL, '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (74, 'ORD20260602000074', 2157, 93, 146, '2026-05-30', '2026-06-03', 2168.93, '5', NULL, '2026-05-14 00:30:58', '2026-05-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (75, 'ORD20260602000075', 2362, 72, 201, '2026-07-21', '2026-07-23', 808.84, '2', NULL, NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (76, 'ORD20260602000076', 2208, 8, 255, '2026-07-21', '2026-07-23', 3378.82, '2', NULL, NULL, '2026-05-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (77, 'ORD20260602000077', 2261, 14, 276, '2026-05-23', '2026-05-27', 3625.14, '2', NULL, NULL, '2026-05-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (78, 'ORD20260602000078', 2150, 50, 336, '2026-06-26', '2026-06-28', 1989.41, '0', NULL, NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (79, 'ORD20260602000079', 2249, 63, 237, '2026-06-11', '2026-06-16', 3966.58, '2', NULL, NULL, '2026-04-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (80, 'ORD20260602000080', 2143, 94, 287, '2026-07-27', '2026-08-01', 590.63, '1', NULL, '2026-05-20 00:30:58', '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (81, 'ORD20260602000081', 2045, 80, 103, '2026-06-21', '2026-06-24', 1364.40, '2', NULL, NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (82, 'ORD20260602000082', 2312, 69, 327, '2026-05-30', '2026-06-03', 4255.59, '5', NULL, '2026-06-01 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (83, 'ORD20260602000083', 2437, 7, 5, '2026-05-31', '2026-06-01', 1908.94, '2', NULL, NULL, '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (84, 'ORD20260602000084', 2441, 76, 151, '2026-05-12', '2026-05-17', 2968.01, '5', NULL, '2026-05-15 00:30:58', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (85, 'ORD20260602000085', 2426, 93, 324, '2026-06-14', '2026-06-19', 383.63, '2', NULL, NULL, '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (86, 'ORD20260602000086', 2375, 39, 64, '2026-05-19', '2026-05-24', 2054.03, '2', NULL, NULL, '2026-05-22 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (87, 'ORD20260602000087', 2121, 61, 144, '2026-07-29', '2026-07-31', 904.66, '5', NULL, '2026-05-17 00:30:58', '2026-04-21 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (88, 'ORD20260602000088', 2424, 99, 266, '2026-07-26', '2026-07-28', 2768.82, '4', NULL, '2026-05-25 00:30:58', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (89, 'ORD20260602000089', 2042, 72, 88, '2026-07-01', '2026-07-02', 3677.34, '0', NULL, NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (90, 'ORD20260602000090', 2067, 18, 117, '2026-06-30', '2026-07-05', 4157.97, '1', NULL, '2026-05-18 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (91, 'ORD20260602000091', 2038, 63, 347, '2026-06-08', '2026-06-13', 977.19, '0', NULL, NULL, '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (92, 'ORD20260602000092', 2179, 43, 114, '2026-07-13', '2026-07-14', 3489.62, '1', NULL, '2026-05-18 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (93, 'ORD20260602000093', 2282, 48, 211, '2026-05-02', '2026-05-05', 4972.84, '4', NULL, '2026-05-12 00:30:58', '2026-05-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (94, 'ORD20260602000094', 2474, 39, 7, '2026-07-01', '2026-07-04', 4560.05, '4', NULL, '2026-06-02 00:30:58', '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (95, 'ORD20260602000095', 2076, 34, 12, '2026-06-30', '2026-07-05', 2311.68, '2', NULL, NULL, '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (96, 'ORD20260602000096', 2319, 11, 67, '2026-06-26', '2026-06-28', 1053.45, '1', NULL, '2026-05-21 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (97, 'ORD20260602000097', 2001, 68, 213, '2026-05-18', '2026-05-23', 1833.85, '4', NULL, '2026-05-21 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (98, 'ORD20260602000098', 2355, 81, 10, '2026-06-12', '2026-06-14', 3338.95, '3', NULL, '2026-05-31 00:30:58', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (99, 'ORD20260602000099', 2235, 54, 5, '2026-05-28', '2026-05-29', 3992.03, '2', NULL, NULL, '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (100, 'ORD20260602000100', 2182, 15, 127, '2026-07-06', '2026-07-09', 3519.77, '4', NULL, '2026-05-21 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (101, 'ORD20260602000101', 2026, 62, 64, '2026-07-04', '2026-07-07', 406.55, '4', NULL, '2026-05-05 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (102, 'ORD20260602000102', 2098, 10, 105, '2026-05-08', '2026-05-13', 4977.43, '2', NULL, NULL, '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (103, 'ORD20260602000103', 2025, 31, 69, '2026-06-30', '2026-07-02', 587.57, '3', NULL, '2026-05-31 00:30:58', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (104, 'ORD20260602000104', 2373, 25, 244, '2026-06-28', '2026-06-29', 964.99, '3', NULL, '2026-05-09 00:30:58', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (105, 'ORD20260602000105', 2366, 27, 318, '2026-07-25', '2026-07-28', 4105.04, '2', NULL, NULL, '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (106, 'ORD20260602000106', 2482, 96, 58, '2026-05-30', '2026-06-03', 4087.95, '4', NULL, '2026-05-23 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (107, 'ORD20260602000107', 2178, 13, 122, '2026-07-06', '2026-07-10', 340.97, '0', NULL, NULL, '2026-05-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (108, 'ORD20260602000108', 2222, 8, 326, '2026-06-08', '2026-06-13', 3757.76, '1', NULL, '2026-05-30 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (109, 'ORD20260602000109', 2007, 91, 332, '2026-05-22', '2026-05-23', 387.57, '3', NULL, '2026-05-27 00:30:58', '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (110, 'ORD20260602000110', 2286, 71, 119, '2026-07-16', '2026-07-19', 980.01, '0', NULL, NULL, '2026-05-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (111, 'ORD20260602000111', 2463, 10, 86, '2026-07-21', '2026-07-25', 4941.05, '4', NULL, '2026-05-15 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (112, 'ORD20260602000112', 2040, 94, 272, '2026-05-08', '2026-05-09', 2910.07, '1', NULL, '2026-05-09 00:30:58', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (113, 'ORD20260602000113', 2418, 76, 7, '2026-05-12', '2026-05-13', 1619.04, '0', NULL, NULL, '2026-05-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (114, 'ORD20260602000114', 2044, 85, 255, '2026-05-25', '2026-05-26', 2993.06, '3', NULL, '2026-05-20 00:30:58', '2026-05-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (115, 'ORD20260602000115', 2202, 67, 28, '2026-07-11', '2026-07-15', 1801.61, '2', NULL, NULL, '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (116, 'ORD20260602000116', 2162, 62, 83, '2026-07-22', '2026-07-25', 1342.00, '1', NULL, '2026-05-04 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (117, 'ORD20260602000117', 2001, 90, 188, '2026-06-06', '2026-06-07', 4646.86, '3', NULL, '2026-05-06 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (118, 'ORD20260602000118', 2257, 83, 139, '2026-06-04', '2026-06-06', 4092.05, '5', NULL, '2026-05-08 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (119, 'ORD20260602000119', 2270, 59, 20, '2026-06-17', '2026-06-18', 3037.39, '4', NULL, '2026-05-25 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (120, 'ORD20260602000120', 2293, 17, 286, '2026-06-13', '2026-06-17', 4247.40, '1', NULL, '2026-05-15 00:30:58', '2026-05-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (121, 'ORD20260602000121', 2494, 92, 192, '2026-05-28', '2026-05-31', 4136.36, '2', NULL, NULL, '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (122, 'ORD20260602000122', 2051, 59, 201, '2026-07-11', '2026-07-15', 4863.20, '5', NULL, '2026-05-25 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (123, 'ORD20260602000123', 2456, 72, 284, '2026-05-13', '2026-05-18', 2167.40, '0', NULL, NULL, '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (124, 'ORD20260602000124', 2231, 13, 268, '2026-05-02', '2026-05-06', 2106.50, '5', NULL, '2026-05-28 00:30:58', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (125, 'ORD20260602000125', 2109, 84, 120, '2026-05-06', '2026-05-10', 1041.30, '4', NULL, '2026-05-21 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (126, 'ORD20260602000126', 2058, 42, 305, '2026-07-27', '2026-07-30', 3128.49, '3', NULL, '2026-05-12 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (127, 'ORD20260602000127', 2062, 92, 202, '2026-07-20', '2026-07-21', 4523.46, '0', NULL, NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (128, 'ORD20260602000128', 2190, 51, 203, '2026-05-15', '2026-05-19', 4671.77, '3', NULL, '2026-05-28 00:30:58', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (129, 'ORD20260602000129', 2298, 12, 67, '2026-06-07', '2026-06-09', 1242.33, '0', NULL, NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (130, 'ORD20260602000130', 2472, 91, 116, '2026-07-06', '2026-07-11', 487.22, '3', NULL, '2026-05-30 00:30:58', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (131, 'ORD20260602000131', 2122, 92, 209, '2026-06-09', '2026-06-12', 4775.18, '2', NULL, NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (132, 'ORD20260602000132', 2462, 56, 112, '2026-06-30', '2026-07-03', 4667.28, '5', NULL, '2026-05-16 00:30:58', '2026-05-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (133, 'ORD20260602000133', 2483, 97, 271, '2026-06-16', '2026-06-20', 4606.29, '2', NULL, NULL, '2026-04-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (134, 'ORD20260602000134', 2485, 19, 247, '2026-07-07', '2026-07-12', 4596.29, '0', NULL, NULL, '2026-04-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (135, 'ORD20260602000135', 2147, 90, 209, '2026-07-02', '2026-07-05', 4287.19, '2', NULL, NULL, '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (136, 'ORD20260602000136', 2248, 89, 291, '2026-07-28', '2026-07-31', 1637.66, '0', NULL, NULL, '2026-05-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (137, 'ORD20260602000137', 2229, 38, 112, '2026-06-01', '2026-06-03', 3875.78, '4', NULL, '2026-05-24 00:30:58', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (138, 'ORD20260602000138', 2018, 26, 338, '2026-05-27', '2026-05-29', 4826.84, '4', NULL, '2026-05-15 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (139, 'ORD20260602000139', 2493, 36, 213, '2026-05-10', '2026-05-13', 3245.43, '2', NULL, NULL, '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (140, 'ORD20260602000140', 2459, 49, 236, '2026-06-21', '2026-06-22', 4542.54, '0', NULL, NULL, '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (141, 'ORD20260602000141', 2250, 41, 51, '2026-05-08', '2026-05-13', 1212.44, '1', NULL, '2026-05-04 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (142, 'ORD20260602000142', 2040, 95, 274, '2026-05-06', '2026-05-07', 653.53, '1', NULL, '2026-05-07 00:30:58', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (143, 'ORD20260602000143', 2313, 41, 200, '2026-06-08', '2026-06-10', 4723.91, '5', NULL, '2026-06-01 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (144, 'ORD20260602000144', 2456, 77, 225, '2026-06-27', '2026-06-30', 2380.31, '4', NULL, '2026-05-15 00:30:58', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (145, 'ORD20260602000145', 2197, 95, 158, '2026-06-26', '2026-07-01', 4564.92, '3', NULL, '2026-05-16 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (146, 'ORD20260602000146', 2268, 89, 223, '2026-07-09', '2026-07-11', 4706.35, '5', NULL, '2026-05-08 00:30:58', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (147, 'ORD20260602000147', 2420, 98, 125, '2026-05-13', '2026-05-14', 2094.36, '2', NULL, NULL, '2026-06-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (148, 'ORD20260602000148', 2006, 84, 37, '2026-07-07', '2026-07-11', 1570.28, '1', NULL, '2026-05-22 00:30:58', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (149, 'ORD20260602000149', 2186, 16, 339, '2026-07-26', '2026-07-30', 2988.78, '4', NULL, '2026-05-27 00:30:58', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (150, 'ORD20260602000150', 2475, 78, 301, '2026-05-16', '2026-05-17', 3332.84, '0', NULL, NULL, '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (151, 'ORD202606160001', 305, 1, 1, '2026-06-10', '2026-06-12', 1398.00, '3', NULL, '2026-06-10 10:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (152, 'ORD202606160002', 305, 2, 3, '2026-06-15', '2026-06-17', 2598.00, '3', NULL, '2026-06-15 14:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (153, 'ORD202606160003', 306, 3, 5, '2026-06-08', '2026-06-10', 1298.00, '3', NULL, '2026-06-08 09:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (154, 'ORD202606160004', 306, 5, 8, '2026-06-12', '2026-06-14', 2180.00, '3', NULL, '2026-06-12 11:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (155, 'ORD202606160005', 307, 4, 6, '2026-06-18', '2026-06-20', 1780.00, '3', NULL, '2026-06-18 15:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (156, 'ORD202606160006', 307, 6, 10, '2026-06-20', '2026-06-23', 3840.00, '3', NULL, '2026-06-20 12:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (157, 'ORD202606160007', 308, 1, 2, '2026-06-05', '2026-06-07', 1718.00, '3', NULL, '2026-06-05 08:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (158, 'ORD202606160008', 308, 3, 4, '2026-06-22', '2026-06-24', 1960.00, '1', NULL, '2026-06-22 16:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (159, 'ORD202606160009', 309, 2, 3, '2026-06-25', '2026-06-28', 3897.00, '0', NULL, NULL, '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (160, 'ORD202606160010', 309, 8, 12, '2026-07-01', '2026-07-04', 5940.00, '1', NULL, '2026-06-25 10:00:00', '2026-06-23 08:57:53', '2026-06-23 08:57:53');
INSERT INTO `orders` VALUES (161, 'ORD202606240001', 310, 2, 4, '2026-07-05', '2026-07-07', 1398.00, '0', NULL, NULL, '2026-06-24 14:00:00', '2026-06-24 14:00:00');
INSERT INTO `orders` VALUES (162, 'ORD202606240002', 310, 3, 8, '2026-07-10', '2026-07-13', 2247.00, '1', NULL, '2026-06-24 14:05:00', '2026-06-24 14:00:00', '2026-06-24 14:05:00');
INSERT INTO `orders` VALUES (163, 'ORD202606240003', 310, 4, 13, '2026-06-15', '2026-06-17', 1878.00, '3', NULL, '2026-06-16 10:00:00', '2026-06-15 09:00:00', '2026-06-17 10:00:00');
INSERT INTO `orders` VALUES (164, 'ORD202606240004', 310, 5, 17, '2026-07-20', '2026-07-24', 3996.00, '1', NULL, '2026-06-24 15:00:00', '2026-06-24 14:00:00', '2026-06-24 15:00:00');
INSERT INTO `orders` VALUES (165, 'ORD202606240005', 310, 1, 2, '2026-06-20', '2026-06-21', 759.00, '2', NULL, NULL, '2026-06-19 16:00:00', '2026-06-19 16:00:00');
INSERT INTO `orders` VALUES (166, 'ORD202606240006', 310, 6, 19, '2026-06-10', '2026-06-12', 1798.00, '3', NULL, '2026-06-11 08:00:00', '2026-06-09 10:00:00', '2026-06-12 08:00:00');
INSERT INTO `orders` VALUES (167, 'ORD202606240007', 310, 1, 3, '2026-08-01', '2026-08-04', 3237.00, '0', NULL, NULL, '2026-06-24 16:00:00', '2026-06-24 16:00:00');
INSERT INTO `orders` VALUES (168, 'ORD202606240008', 2, 1, 1, '2026-07-01', '2026-07-03', 1298.00, '3', NULL, '2026-07-01 14:00:00', '2026-06-30 10:00:00', '2026-07-03 10:00:00');
INSERT INTO `orders` VALUES (169, 'ORD202606240009', 2, 2, 4, '2026-07-10', '2026-07-12', 1398.00, '1', NULL, '2026-07-09 16:00:00', '2026-07-08 08:00:00', '2026-07-09 16:00:00');
INSERT INTO `orders` VALUES (170, 'ORD202606240010', 2, 3, 8, '2026-08-05', '2026-08-08', 2247.00, '1', NULL, '2026-06-26 20:10:51', '2026-07-20 12:00:00', '2026-06-26 20:10:51');
INSERT INTO `orders` VALUES (171, 'ORD202606240011', 2, 4, 12, '2026-06-15', '2026-06-16', 799.00, '2', NULL, NULL, '2026-06-14 09:00:00', '2026-06-14 09:00:00');
INSERT INTO `orders` VALUES (172, 'ORD202606240012', 305, 5, 16, '2026-09-01', '2026-09-04', 2547.00, '3', NULL, '2026-09-01 08:00:00', '2026-08-20 10:00:00', '2026-09-04 10:00:00');
INSERT INTO `orders` VALUES (173, 'ORD202606240013', 305, 6, 19, '2026-07-25', '2026-07-27', 1798.00, '1', NULL, '2026-07-24 20:00:00', '2026-07-22 15:00:00', '2026-07-24 20:00:00');
INSERT INTO `orders` VALUES (174, 'ORD202606240014', 305, 7, 24, '2026-08-15', '2026-08-19', 3796.00, '0', NULL, NULL, '2026-07-30 18:00:00', '2026-07-30 18:00:00');
INSERT INTO `orders` VALUES (175, 'ORD202606240015', 306, 1, 2, '2026-06-20', '2026-06-21', 759.00, '3', NULL, '2026-06-20 14:00:00', '2026-06-19 08:00:00', '2026-06-21 10:00:00');
INSERT INTO `orders` VALUES (176, 'ORD202606240016', 306, 2, 7, '2026-07-05', '2026-07-07', 1878.00, '1', NULL, '2026-07-04 18:00:00', '2026-07-03 10:00:00', '2026-07-04 18:00:00');
INSERT INTO `orders` VALUES (177, 'ORD202606240017', 306, 8, 27, '2026-07-20', '2026-07-23', 2997.00, '4', NULL, '2026-07-19 10:00:00', '2026-07-15 09:00:00', '2026-07-20 14:00:00');
INSERT INTO `orders` VALUES (178, 'ORD202606240018', 307, 3, 9, '2026-06-01', '2026-06-05', 3516.00, '3', NULL, '2026-06-01 08:00:00', '2026-05-28 12:00:00', '2026-06-05 12:00:00');
INSERT INTO `orders` VALUES (179, 'ORD202606240019', 307, 4, 15, '2026-06-25', '2026-06-27', 2158.00, '2', NULL, NULL, '2026-06-20 14:00:00', '2026-06-20 14:00:00');
INSERT INTO `orders` VALUES (180, 'ORD202606240020', 307, 6, 20, '2026-08-10', '2026-08-13', 3177.00, '1', NULL, '2026-08-09 16:00:00', '2026-08-05 10:00:00', '2026-08-09 16:00:00');
INSERT INTO `orders` VALUES (181, 'ORD202606240021', 308, 1, 3, '2026-06-10', '2026-06-12', 2158.00, '3', NULL, '2026-06-10 09:00:00', '2026-06-05 14:00:00', '2026-06-12 10:00:00');
INSERT INTO `orders` VALUES (182, 'ORD202606240022', 308, 5, 18, '2026-07-15', '2026-07-18', 4197.00, '1', NULL, '2026-07-14 20:00:00', '2026-07-10 08:00:00', '2026-07-14 20:00:00');
INSERT INTO `orders` VALUES (183, 'ORD202606240023', 308, 7, 26, '2026-08-20', '2026-08-22', 3118.00, '0', NULL, NULL, '2026-08-10 16:00:00', '2026-08-10 16:00:00');
INSERT INTO `orders` VALUES (184, 'ORD202606240024', 309, 2, 5, '2026-06-05', '2026-06-10', 4095.00, '3', NULL, '2026-06-05 10:00:00', '2026-06-01 08:00:00', '2026-06-10 12:00:00');
INSERT INTO `orders` VALUES (185, 'ORD202606240025', 309, 6, 22, '2026-07-01', '2026-07-03', 7198.00, '1', NULL, '2026-06-30 18:00:00', '2026-06-25 10:00:00', '2026-06-30 18:00:00');
INSERT INTO `orders` VALUES (186, 'ORD202606240026', 309, 8, 30, '2026-07-20', '2026-07-23', 4077.00, '4', NULL, '2026-07-19 10:00:00', '2026-07-15 09:00:00', '2026-07-22 15:00:00');
INSERT INTO `orders` VALUES (187, 'ORD20260626001', 2, 1, 1, '2026-06-28', '2026-06-30', 1298.00, '1', NULL, '2026-06-26 10:30:00', '2026-06-26 10:30:00', '2026-06-26 10:30:00');
INSERT INTO `orders` VALUES (188, 'ORD20260626002', 305, 1, 2, '2026-06-27', '2026-06-29', 1518.00, '1', NULL, '2026-06-26 11:00:00', '2026-06-26 11:00:00', '2026-06-26 11:00:00');
INSERT INTO `orders` VALUES (189, 'ORD20260626003', 306, 51, 193, '2026-06-29', '2026-07-02', 2277.00, '1', NULL, '2026-06-26 12:00:00', '2026-06-26 12:00:00', '2026-06-26 12:00:00');
INSERT INTO `orders` VALUES (190, 'ORD20260626004', 307, 1, 3, '2026-07-01', '2026-07-04', 3237.00, '7', NULL, '2026-06-26 13:00:00', '2026-06-26 13:00:00', '2026-06-26 20:06:29');
INSERT INTO `orders` VALUES (191, 'ORD20260625001', 308, 1, 1, '2026-06-25', '2026-06-28', 1947.00, '7', NULL, '2026-06-25 09:00:00', '2026-06-25 09:00:00', '2026-06-26 08:00:00');
INSERT INTO `orders` VALUES (192, 'ORD20260625002', 306, 51, 192, '2026-06-24', '2026-06-27', 1947.00, '7', NULL, '2026-06-24 14:00:00', '2026-06-24 14:00:00', '2026-06-25 15:00:00');
INSERT INTO `orders` VALUES (193, 'ORD20260626005', 307, 1, 1, '2026-07-05', '2026-07-08', 1947.00, '0', NULL, NULL, '2026-06-26 14:00:00', '2026-06-26 14:00:00');
INSERT INTO `orders` VALUES (194, 'ORD20260626006', 2, 51, 194, '2026-07-10', '2026-07-12', 2158.00, '0', NULL, NULL, '2026-06-26 15:00:00', '2026-06-26 15:00:00');
INSERT INTO `orders` VALUES (195, 'ORD2026062663640', 310, 1, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:07:49', '2026-06-26 20:07:49');
INSERT INTO `orders` VALUES (196, 'ORD2026062617144', 310, 1, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:07:55', '2026-06-26 20:07:55');
INSERT INTO `orders` VALUES (197, 'ORD2026062678769', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '1', NULL, '2026-06-26 20:24:50', '2026-06-26 20:08:15', '2026-06-26 20:24:50');
INSERT INTO `orders` VALUES (198, 'ORD2026062657655', 310, 555, 1, '2026-06-27', '2026-06-28', 649.00, '1', NULL, '2026-06-26 20:18:38', '2026-06-26 20:08:26', '2026-06-26 20:18:38');
INSERT INTO `orders` VALUES (199, 'ORD2026062658944', 310, 555, 1, '2026-06-27', '2026-06-28', 649.00, '1', NULL, '2026-06-26 20:13:31', '2026-06-26 20:08:36', '2026-06-26 20:13:31');
INSERT INTO `orders` VALUES (200, 'ORD2026062671424', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:42:31', '2026-06-26 20:42:31');
INSERT INTO `orders` VALUES (201, 'ORD2026062646286', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:45:17', '2026-06-26 20:45:17');
INSERT INTO `orders` VALUES (202, 'ORD2026062616129', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:45:19', '2026-06-26 20:45:19');
INSERT INTO `orders` VALUES (203, 'ORD2026062659186', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:45:21', '2026-06-26 20:45:21');
INSERT INTO `orders` VALUES (204, 'ORD2026062637288', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '0', NULL, NULL, '2026-06-26 20:45:49', '2026-06-26 20:45:49');
INSERT INTO `orders` VALUES (205, 'ORD2026062615871', 310, 977, 1, '2026-06-27', '2026-06-28', 649.00, '1', NULL, '2026-06-26 20:47:29', '2026-06-26 20:46:06', '2026-06-26 20:47:29');
INSERT INTO `orders` VALUES (206, 'ORD2026062660927', 310, 51, 192, '2026-06-27', '2026-06-28', 649.00, '3', NULL, '2026-06-26 20:51:28', '2026-06-26 20:49:49', '2026-06-26 20:52:07');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `pay_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付类型（1微信 2支付宝 3银行卡）',
  `pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '支付状态（0待支付 1已支付 2支付失败 3退款中 4已退款）',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_pay_status`(`pay_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 1, 2398.10, '2', '4', '2026-05-24 00:30:58', 'TXN2026052400305800000001', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (2, 2, 1745.80, '1', '1', '2026-05-04 00:30:58', 'TXN2026050400305800000002', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (3, 3, 1360.42, '1', '4', '2026-05-13 00:30:58', 'TXN2026051300305800000003', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (4, 4, 687.59, '1', '1', '2026-05-19 00:30:58', 'TXN2026051900305800000004', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (5, 6, 2384.60, '3', '3', '2026-05-28 00:30:58', 'TXN2026052800305800000006', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (6, 7, 2707.33, '2', '1', '2026-05-15 00:30:58', 'TXN2026051500305800000007', '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (7, 8, 3797.54, '3', '1', '2026-05-19 00:30:58', 'TXN2026051900305800000008', '2026-04-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (8, 12, 4831.67, '3', '3', '2026-05-17 00:30:58', 'TXN2026051700305800000012', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (9, 13, 1400.81, '1', '4', '2026-05-05 00:30:58', 'TXN2026050500305800000013', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (10, 14, 439.02, '2', '3', '2026-05-08 00:30:58', 'TXN2026050800305800000014', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (11, 16, 2980.45, '1', '3', '2026-05-31 00:30:58', 'TXN2026053100305800000016', '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (12, 18, 2443.83, '1', '1', '2026-05-19 00:30:58', 'TXN2026051900305800000018', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (13, 19, 2395.49, '3', '1', '2026-05-09 00:30:58', 'TXN2026050900305800000019', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (14, 22, 769.16, '3', '4', '2026-05-16 00:30:58', 'TXN2026051600305800000022', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (15, 23, 1362.29, '1', '4', '2026-05-15 00:30:58', 'TXN2026051500305800000023', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (16, 27, 1436.17, '3', '4', '2026-05-28 00:30:58', 'TXN2026052800305800000027', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (17, 29, 607.57, '1', '4', '2026-05-10 00:30:58', 'TXN2026051000305800000029', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (18, 30, 3550.41, '1', '1', '2026-06-02 00:30:58', 'TXN2026060200305800000030', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (19, 31, 1640.72, '2', '4', '2026-05-21 00:30:58', 'TXN2026052100305800000031', '2026-05-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (20, 32, 2942.54, '3', '3', '2026-05-11 00:30:58', 'TXN2026051100305800000032', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (21, 33, 2604.75, '3', '1', '2026-05-20 00:30:58', 'TXN2026052000305800000033', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (22, 34, 4689.89, '3', '3', '2026-06-01 00:30:58', 'TXN2026060100305800000034', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (23, 37, 4350.51, '2', '4', '2026-05-31 00:30:58', 'TXN2026053100305800000037', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (24, 39, 3467.89, '3', '4', '2026-05-13 00:30:58', 'TXN2026051300305800000039', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (25, 40, 3031.12, '1', '4', '2026-05-30 00:30:58', 'TXN2026053000305800000040', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (26, 41, 4658.03, '3', '4', '2026-05-19 00:30:58', 'TXN2026051900305800000041', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (27, 42, 2890.52, '2', '1', '2026-06-01 00:30:58', 'TXN2026060100305800000042', '2026-04-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (28, 43, 1501.34, '3', '3', '2026-05-15 00:30:58', 'TXN2026051500305800000043', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (29, 44, 1240.82, '1', '3', '2026-05-22 00:30:58', 'TXN2026052200305800000044', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (30, 46, 3503.89, '2', '4', '2026-05-22 00:30:58', 'TXN2026052200305800000046', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (31, 47, 3583.61, '2', '1', '2026-05-30 00:30:58', 'TXN2026053000305800000047', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (32, 48, 4694.19, '2', '1', '2026-05-17 00:30:58', 'TXN2026051700305800000048', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (33, 50, 1418.11, '3', '3', '2026-05-28 00:30:58', 'TXN2026052800305800000050', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (34, 52, 1170.18, '1', '4', '2026-05-24 00:30:58', 'TXN2026052400305800000052', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (35, 55, 3569.92, '3', '1', '2026-05-12 00:30:58', 'TXN2026051200305800000055', '2026-04-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (36, 56, 412.93, '3', '1', '2026-05-07 00:30:58', 'TXN2026050700305800000056', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (37, 59, 3557.52, '3', '4', '2026-05-07 00:30:58', 'TXN2026050700305800000059', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (38, 60, 3821.78, '2', '3', '2026-05-23 00:30:58', 'TXN2026052300305800000060', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (39, 61, 4792.59, '3', '1', '2026-05-24 00:30:58', 'TXN2026052400305800000061', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (40, 62, 4136.31, '2', '1', '2026-05-11 00:30:58', 'TXN2026051100305800000062', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (41, 63, 1493.47, '1', '4', '2026-05-12 00:30:58', 'TXN2026051200305800000063', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (42, 64, 3572.14, '3', '3', '2026-05-16 00:30:58', 'TXN2026051600305800000064', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (43, 65, 1504.66, '3', '4', '2026-05-27 00:30:58', 'TXN2026052700305800000065', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (44, 66, 452.85, '3', '3', '2026-05-21 00:30:58', 'TXN2026052100305800000066', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (45, 67, 3603.39, '3', '1', '2026-05-09 00:30:58', 'TXN2026050900305800000067', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (46, 68, 2951.87, '1', '1', '2026-05-15 00:30:58', 'TXN2026051500305800000068', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (47, 71, 676.53, '3', '1', '2026-05-05 00:30:58', 'TXN2026050500305800000071', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (48, 72, 3184.78, '3', '1', '2026-06-02 00:30:58', 'TXN2026060200305800000072', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (49, 74, 2168.93, '3', '4', '2026-05-14 00:30:58', 'TXN2026051400305800000074', '2026-05-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (50, 80, 590.63, '1', '1', '2026-05-20 00:30:58', 'TXN2026052000305800000080', '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (51, 82, 4255.59, '2', '4', '2026-06-01 00:30:58', 'TXN2026060100305800000082', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (52, 84, 2968.01, '1', '4', '2026-05-15 00:30:58', 'TXN2026051500305800000084', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (53, 87, 904.66, '1', '4', '2026-05-17 00:30:58', 'TXN2026051700305800000087', '2026-04-21 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (54, 88, 2768.82, '1', '3', '2026-05-25 00:30:58', 'TXN2026052500305800000088', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (55, 90, 4157.97, '3', '1', '2026-05-18 00:30:58', 'TXN2026051800305800000090', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (56, 92, 3489.62, '1', '1', '2026-05-18 00:30:58', 'TXN2026051800305800000092', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (57, 93, 4972.84, '1', '3', '2026-05-12 00:30:58', 'TXN2026051200305800000093', '2026-05-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (58, 94, 4560.05, '3', '3', '2026-06-02 00:30:58', 'TXN2026060200305800000094', '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (59, 96, 1053.45, '3', '1', '2026-05-21 00:30:58', 'TXN2026052100305800000096', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (60, 97, 1833.85, '1', '3', '2026-05-21 00:30:58', 'TXN2026052100305800000097', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (61, 98, 3338.95, '3', '1', '2026-05-31 00:30:58', 'TXN2026053100305800000098', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (62, 100, 3519.77, '2', '3', '2026-05-21 00:30:58', 'TXN2026052100305800000100', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (63, 101, 406.55, '3', '3', '2026-05-05 00:30:58', 'TXN2026050500305800000101', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (64, 103, 587.57, '3', '1', '2026-05-31 00:30:58', 'TXN2026053100305800000103', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (65, 104, 964.99, '1', '1', '2026-05-09 00:30:58', 'TXN2026050900305800000104', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (66, 106, 4087.95, '2', '3', '2026-05-23 00:30:58', 'TXN2026052300305800000106', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (67, 108, 3757.76, '3', '1', '2026-05-30 00:30:58', 'TXN2026053000305800000108', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (68, 109, 387.57, '3', '1', '2026-05-27 00:30:58', 'TXN2026052700305800000109', '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (69, 111, 4941.05, '1', '3', '2026-05-15 00:30:58', 'TXN2026051500305800000111', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (70, 112, 2910.07, '2', '1', '2026-05-09 00:30:58', 'TXN2026050900305800000112', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (71, 114, 2993.06, '2', '1', '2026-05-20 00:30:58', 'TXN2026052000305800000114', '2026-05-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (72, 116, 1342.00, '1', '1', '2026-05-04 00:30:58', 'TXN2026050400305800000116', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (73, 117, 4646.86, '3', '1', '2026-05-06 00:30:58', 'TXN2026050600305800000117', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (74, 118, 4092.05, '1', '4', '2026-05-08 00:30:58', 'TXN2026050800305800000118', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (75, 119, 3037.39, '1', '3', '2026-05-25 00:30:58', 'TXN2026052500305800000119', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (76, 120, 4247.40, '2', '1', '2026-05-15 00:30:58', 'TXN2026051500305800000120', '2026-05-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (77, 122, 4863.20, '2', '4', '2026-05-25 00:30:58', 'TXN2026052500305800000122', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (78, 124, 2106.50, '2', '4', '2026-05-28 00:30:58', 'TXN2026052800305800000124', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (79, 125, 1041.30, '3', '3', '2026-05-21 00:30:58', 'TXN2026052100305800000125', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (80, 126, 3128.49, '3', '1', '2026-05-12 00:30:58', 'TXN2026051200305800000126', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (81, 128, 4671.77, '2', '1', '2026-05-28 00:30:58', 'TXN2026052800305800000128', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (82, 130, 487.22, '3', '1', '2026-05-30 00:30:58', 'TXN2026053000305800000130', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (83, 132, 4667.28, '1', '4', '2026-05-16 00:30:58', 'TXN2026051600305800000132', '2026-05-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (84, 137, 3875.78, '1', '3', '2026-05-24 00:30:58', 'TXN2026052400305800000137', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (85, 138, 4826.84, '1', '3', '2026-05-15 00:30:58', 'TXN2026051500305800000138', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (86, 141, 1212.44, '2', '1', '2026-05-04 00:30:58', 'TXN2026050400305800000141', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (87, 142, 653.53, '1', '1', '2026-05-07 00:30:58', 'TXN2026050700305800000142', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (88, 143, 4723.91, '2', '4', '2026-06-01 00:30:58', 'TXN2026060100305800000143', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (89, 144, 2380.31, '2', '3', '2026-05-15 00:30:58', 'TXN2026051500305800000144', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (90, 145, 4564.92, '1', '1', '2026-05-16 00:30:58', 'TXN2026051600305800000145', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (91, 146, 4706.35, '1', '4', '2026-05-08 00:30:58', 'TXN2026050800305800000146', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (92, 148, 1570.28, '3', '1', '2026-05-22 00:30:58', 'TXN2026052200305800000148', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (93, 149, 2988.78, '3', '3', '2026-05-27 00:30:58', 'TXN2026052700305800000149', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (94, 10, 2977.69, '1', '0', NULL, NULL, '2026-05-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (95, 11, 3005.26, '1', '0', NULL, NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (96, 15, 3793.12, '1', '0', NULL, NULL, '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (97, 20, 2254.06, '1', '0', NULL, NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (98, 25, 3373.94, '1', '0', NULL, NULL, '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (99, 28, 2339.22, '1', '0', NULL, NULL, '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (100, 38, 1098.15, '1', '0', NULL, NULL, '2026-04-22 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (101, 49, 867.63, '1', '0', NULL, NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (102, 51, 4171.90, '1', '0', NULL, NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (103, 54, 650.12, '1', '0', NULL, NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (104, 57, 944.64, '1', '0', NULL, NULL, '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (105, 58, 2540.99, '1', '0', NULL, NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (106, 78, 1989.41, '1', '0', NULL, NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (107, 89, 3677.34, '1', '0', NULL, NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (108, 91, 977.19, '1', '0', NULL, NULL, '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (109, 107, 340.97, '1', '0', NULL, NULL, '2026-05-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (110, 110, 980.01, '1', '0', NULL, NULL, '2026-05-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (111, 113, 1619.04, '1', '0', NULL, NULL, '2026-05-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (112, 123, 2167.40, '1', '0', NULL, NULL, '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (113, 127, 4523.46, '1', '0', NULL, NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (114, 129, 1242.33, '1', '0', NULL, NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (115, 134, 4596.29, '1', '0', NULL, NULL, '2026-04-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (116, 136, 1637.66, '1', '0', NULL, NULL, '2026-05-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (117, 140, 4542.54, '1', '0', NULL, NULL, '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (118, 150, 3332.84, '1', '0', NULL, NULL, '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `payment` VALUES (119, 162, 2247.00, '2', '1', '2026-06-24 14:05:00', 'TXN310162', '2026-06-24 14:00:00', '2026-06-24 14:05:00');
INSERT INTO `payment` VALUES (120, 163, 1878.00, '1', '1', '2026-06-16 10:00:00', 'TXN310163', '2026-06-15 09:00:00', '2026-06-16 10:00:00');
INSERT INTO `payment` VALUES (121, 164, 3996.00, '2', '1', '2026-06-24 15:00:00', 'TXN310164', '2026-06-24 14:00:00', '2026-06-24 15:00:00');
INSERT INTO `payment` VALUES (122, 166, 1798.00, '1', '1', '2026-06-11 08:00:00', 'TXN310166', '2026-06-09 10:00:00', '2026-06-11 08:00:00');
INSERT INTO `payment` VALUES (123, 168, 1298.00, '1', '1', '2026-07-01 14:00:00', 'TXN002168', '2026-06-30 10:00:00', '2026-07-01 14:00:00');
INSERT INTO `payment` VALUES (124, 169, 1398.00, '2', '1', '2026-07-09 16:00:00', 'TXN002169', '2026-07-08 08:00:00', '2026-07-09 16:00:00');
INSERT INTO `payment` VALUES (125, 172, 2547.00, '1', '1', '2026-09-01 08:00:00', 'TXN305172', '2026-08-20 10:00:00', '2026-09-01 08:00:00');
INSERT INTO `payment` VALUES (126, 173, 1798.00, '2', '1', '2026-07-24 20:00:00', 'TXN305173', '2026-07-22 15:00:00', '2026-07-24 20:00:00');
INSERT INTO `payment` VALUES (127, 175, 759.00, '1', '1', '2026-06-20 14:00:00', 'TXN306175', '2026-06-19 08:00:00', '2026-06-20 14:00:00');
INSERT INTO `payment` VALUES (128, 176, 1878.00, '2', '1', '2026-07-04 18:00:00', 'TXN306176', '2026-07-03 10:00:00', '2026-07-04 18:00:00');
INSERT INTO `payment` VALUES (129, 177, 2997.00, '3', '3', '2026-07-19 10:00:00', 'TXN306177', '2026-07-15 09:00:00', '2026-07-20 14:00:00');
INSERT INTO `payment` VALUES (130, 178, 3516.00, '1', '1', '2026-06-01 08:00:00', 'TXN307178', '2026-05-28 12:00:00', '2026-06-01 08:00:00');
INSERT INTO `payment` VALUES (131, 180, 3177.00, '2', '1', '2026-08-09 16:00:00', 'TXN307180', '2026-08-05 10:00:00', '2026-08-09 16:00:00');
INSERT INTO `payment` VALUES (132, 181, 2158.00, '1', '1', '2026-06-10 09:00:00', 'TXN308181', '2026-06-05 14:00:00', '2026-06-10 09:00:00');
INSERT INTO `payment` VALUES (133, 182, 4197.00, '2', '1', '2026-07-14 20:00:00', 'TXN308182', '2026-07-10 08:00:00', '2026-07-14 20:00:00');
INSERT INTO `payment` VALUES (134, 184, 4095.00, '1', '1', '2026-06-05 10:00:00', 'TXN309184', '2026-06-01 08:00:00', '2026-06-05 10:00:00');
INSERT INTO `payment` VALUES (135, 185, 7198.00, '2', '1', '2026-06-30 18:00:00', 'TXN309185', '2026-06-25 10:00:00', '2026-06-30 18:00:00');
INSERT INTO `payment` VALUES (136, 186, 4077.00, '3', '3', '2026-07-19 10:00:00', 'TXN309186', '2026-07-15 09:00:00', '2026-07-22 15:00:00');
INSERT INTO `payment` VALUES (137, 170, 2247.00, '1', '1', '2026-06-26 20:10:51', 'WX202606262010514473', '2026-06-26 20:08:59', '2026-06-26 20:10:51');
INSERT INTO `payment` VALUES (138, 199, 649.00, '1', '1', '2026-06-26 20:13:31', 'WX202606262013306836', '2026-06-26 20:13:29', '2026-06-26 20:13:31');
INSERT INTO `payment` VALUES (139, 198, 649.00, '1', '1', '2026-06-26 20:18:38', 'WX202606262018374393', '2026-06-26 20:17:56', '2026-06-26 20:18:38');
INSERT INTO `payment` VALUES (140, 197, 649.00, '1', '1', '2026-06-26 20:24:50', 'WX202606262024494912', '2026-06-26 20:18:50', '2026-06-26 20:24:50');
INSERT INTO `payment` VALUES (141, 196, 649.00, '1', '0', NULL, NULL, '2026-06-26 20:28:27', '2026-06-26 20:28:27');
INSERT INTO `payment` VALUES (142, 204, 649.00, '1', '0', NULL, NULL, '2026-06-26 20:45:52', '2026-06-26 20:45:52');
INSERT INTO `payment` VALUES (143, 205, 649.00, '1', '1', '2026-06-26 20:47:29', 'WX202606262047285903', '2026-06-26 20:47:27', '2026-06-26 20:47:29');
INSERT INTO `payment` VALUES (144, 206, 649.00, '1', '1', '2026-06-26 20:51:28', 'WX202606262051275370', '2026-06-26 20:51:25', '2026-06-26 20:51:28');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '房源ID',
  `hotel_id` bigint NOT NULL COMMENT '酒店ID',
  `room_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房型名称',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间面积',
  `bed_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '床型',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存数量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `img_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片URL',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 485 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房源/房型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 1, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel1_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (2, 1, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 13, '0', 'https://example.com/hotel1_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (3, 1, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel1_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (4, 2, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel2_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (5, 2, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 14, '0', 'https://example.com/hotel2_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (6, 2, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel2_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (7, 2, '景观房', '45平米', '1.8米大床', 939.00, 12, '0', 'https://example.com/hotel2_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (8, 3, '豪华大床房', '38平米', '1.8米大床', 749.00, 18, '0', 'https://example.com/hotel3_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (9, 3, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 15, '0', 'https://example.com/hotel3_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (10, 3, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel3_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (11, 3, '总统套房', '120平米', '2米特大床', 3299.00, 2, '0', 'https://example.com/hotel3_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (12, 4, '豪华大床房', '38平米', '1.8米大床', 799.00, 19, '0', 'https://example.com/hotel4_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (13, 4, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 16, '0', 'https://example.com/hotel4_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (14, 4, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel4_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (15, 4, '景观房', '45平米', '1.8米大床', 1079.00, 14, '0', 'https://example.com/hotel4_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (16, 5, '豪华大床房', '38平米', '1.8米大床', 849.00, 20, '0', 'https://example.com/hotel5_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (17, 5, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 17, '0', 'https://example.com/hotel5_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (18, 5, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel5_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (19, 6, '豪华大床房', '38平米', '1.8米大床', 899.00, 21, '0', 'https://example.com/hotel6_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (20, 6, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 18, '0', 'https://example.com/hotel6_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (21, 6, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel6_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (22, 6, '总统套房', '120平米', '2米特大床', 3599.00, 2, '0', 'https://example.com/hotel6_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (23, 6, '景观房', '45平米', '1.8米大床', 1219.00, 16, '0', 'https://example.com/hotel6_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (24, 7, '豪华大床房', '38平米', '1.8米大床', 949.00, 22, '0', 'https://example.com/hotel7_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (25, 7, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 19, '0', 'https://example.com/hotel7_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (26, 7, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel7_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (27, 8, '豪华大床房', '38平米', '1.8米大床', 999.00, 23, '0', 'https://example.com/hotel8_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (28, 8, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 20, '0', 'https://example.com/hotel8_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (29, 8, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel8_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (30, 8, '景观房', '45平米', '1.8米大床', 1359.00, 18, '0', 'https://example.com/hotel8_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (31, 9, '豪华大床房', '38平米', '1.8米大床', 1049.00, 24, '0', 'https://example.com/hotel9_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (32, 9, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 21, '0', 'https://example.com/hotel9_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (33, 9, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel9_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (34, 9, '总统套房', '120平米', '2米特大床', 3899.00, 2, '0', 'https://example.com/hotel9_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (35, 10, '豪华大床房', '38平米', '1.8米大床', 599.00, 25, '0', 'https://example.com/hotel10_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (36, 10, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 22, '0', 'https://example.com/hotel10_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (37, 10, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel10_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (38, 10, '景观房', '45平米', '1.8米大床', 799.00, 20, '0', 'https://example.com/hotel10_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (39, 11, '豪华大床房', '38平米', '1.8米大床', 649.00, 26, '0', 'https://example.com/hotel11_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (40, 11, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 23, '0', 'https://example.com/hotel11_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (41, 11, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel11_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (42, 12, '豪华大床房', '38平米', '1.8米大床', 699.00, 27, '0', 'https://example.com/hotel12_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (43, 12, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 24, '0', 'https://example.com/hotel12_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (44, 12, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel12_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (45, 12, '总统套房', '120平米', '2米特大床', 4199.00, 2, '0', 'https://example.com/hotel12_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (46, 12, '景观房', '45平米', '1.8米大床', 939.00, 10, '0', 'https://example.com/hotel12_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (47, 13, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://example.com/hotel13_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (48, 13, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 25, '0', 'https://example.com/hotel13_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (49, 13, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel13_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (50, 14, '豪华大床房', '38平米', '1.8米大床', 799.00, 29, '0', 'https://example.com/hotel14_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (51, 14, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 26, '0', 'https://example.com/hotel14_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (52, 14, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel14_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (53, 14, '景观房', '45平米', '1.8米大床', 1079.00, 12, '0', 'https://example.com/hotel14_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (54, 15, '豪华大床房', '38平米', '1.8米大床', 849.00, 30, '0', 'https://example.com/hotel15_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (55, 15, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 12, '0', 'https://example.com/hotel15_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (56, 15, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel15_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (57, 15, '总统套房', '120平米', '2米特大床', 4499.00, 2, '0', 'https://example.com/hotel15_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (58, 16, '豪华大床房', '38平米', '1.8米大床', 899.00, 31, '0', 'https://example.com/hotel16_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (59, 16, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 13, '0', 'https://example.com/hotel16_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (60, 16, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel16_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (61, 16, '景观房', '45平米', '1.8米大床', 1219.00, 14, '0', 'https://example.com/hotel16_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (62, 17, '豪华大床房', '38平米', '1.8米大床', 949.00, 32, '0', 'https://example.com/hotel17_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (63, 17, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 14, '0', 'https://example.com/hotel17_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (64, 17, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel17_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (65, 18, '豪华大床房', '38平米', '1.8米大床', 999.00, 33, '0', 'https://example.com/hotel18_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (66, 18, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 15, '0', 'https://example.com/hotel18_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (67, 18, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel18_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (68, 18, '总统套房', '120平米', '2米特大床', 4799.00, 2, '0', 'https://example.com/hotel18_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (69, 18, '景观房', '45平米', '1.8米大床', 1359.00, 16, '0', 'https://example.com/hotel18_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (70, 19, '豪华大床房', '38平米', '1.8米大床', 1049.00, 34, '0', 'https://example.com/hotel19_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (71, 19, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 16, '0', 'https://example.com/hotel19_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (72, 19, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel19_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (73, 20, '豪华大床房', '38平米', '1.8米大床', 599.00, 15, '0', 'https://example.com/hotel20_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (74, 20, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 17, '0', 'https://example.com/hotel20_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (75, 20, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel20_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (76, 20, '景观房', '45平米', '1.8米大床', 799.00, 18, '0', 'https://example.com/hotel20_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (77, 21, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel21_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (78, 21, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 18, '0', 'https://example.com/hotel21_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (79, 21, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel21_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (80, 21, '总统套房', '120平米', '2米特大床', 3099.00, 2, '0', 'https://example.com/hotel21_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (81, 22, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel22_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (82, 22, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 19, '0', 'https://example.com/hotel22_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (83, 22, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel22_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (84, 22, '景观房', '45平米', '1.8米大床', 939.00, 20, '0', 'https://example.com/hotel22_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (85, 23, '豪华大床房', '38平米', '1.8米大床', 749.00, 18, '0', 'https://example.com/hotel23_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (86, 23, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 20, '0', 'https://example.com/hotel23_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (87, 23, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel23_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (88, 24, '豪华大床房', '38平米', '1.8米大床', 799.00, 19, '0', 'https://example.com/hotel24_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (89, 24, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 21, '0', 'https://example.com/hotel24_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (90, 24, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel24_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (91, 24, '总统套房', '120平米', '2米特大床', 3399.00, 2, '0', 'https://example.com/hotel24_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (92, 24, '景观房', '45平米', '1.8米大床', 1079.00, 10, '0', 'https://example.com/hotel24_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (93, 25, '豪华大床房', '38平米', '1.8米大床', 849.00, 20, '0', 'https://example.com/hotel25_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (94, 25, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 22, '0', 'https://example.com/hotel25_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (95, 25, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel25_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (96, 26, '豪华大床房', '38平米', '1.8米大床', 899.00, 21, '0', 'https://example.com/hotel26_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (97, 26, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 23, '0', 'https://example.com/hotel26_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (98, 26, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel26_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (99, 26, '景观房', '45平米', '1.8米大床', 1219.00, 12, '0', 'https://example.com/hotel26_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (100, 27, '豪华大床房', '38平米', '1.8米大床', 949.00, 22, '0', 'https://example.com/hotel27_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (101, 27, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 24, '0', 'https://example.com/hotel27_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (102, 27, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel27_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (103, 27, '总统套房', '120平米', '2米特大床', 3699.00, 2, '0', 'https://example.com/hotel27_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (104, 28, '豪华大床房', '38平米', '1.8米大床', 999.00, 23, '0', 'https://example.com/hotel28_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (105, 28, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 25, '0', 'https://example.com/hotel28_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (106, 28, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel28_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (107, 28, '景观房', '45平米', '1.8米大床', 1359.00, 14, '0', 'https://example.com/hotel28_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (108, 29, '豪华大床房', '38平米', '1.8米大床', 1049.00, 24, '0', 'https://example.com/hotel29_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (109, 29, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 26, '0', 'https://example.com/hotel29_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (110, 29, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel29_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (111, 30, '豪华大床房', '38平米', '1.8米大床', 599.00, 25, '0', 'https://example.com/hotel30_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (112, 30, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 12, '0', 'https://example.com/hotel30_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (113, 30, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel30_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (114, 30, '总统套房', '120平米', '2米特大床', 3999.00, 2, '0', 'https://example.com/hotel30_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (115, 30, '景观房', '45平米', '1.8米大床', 799.00, 16, '0', 'https://example.com/hotel30_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (116, 31, '豪华大床房', '38平米', '1.8米大床', 649.00, 26, '0', 'https://example.com/hotel31_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (117, 31, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 13, '0', 'https://example.com/hotel31_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (118, 31, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel31_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (119, 32, '豪华大床房', '38平米', '1.8米大床', 699.00, 27, '0', 'https://example.com/hotel32_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (120, 32, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 14, '0', 'https://example.com/hotel32_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (121, 32, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel32_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (122, 32, '景观房', '45平米', '1.8米大床', 939.00, 18, '0', 'https://example.com/hotel32_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (123, 33, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://example.com/hotel33_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (124, 33, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 15, '0', 'https://example.com/hotel33_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (125, 33, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel33_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (126, 33, '总统套房', '120平米', '2米特大床', 4299.00, 2, '0', 'https://example.com/hotel33_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (127, 34, '豪华大床房', '38平米', '1.8米大床', 799.00, 29, '0', 'https://example.com/hotel34_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (128, 34, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 16, '0', 'https://example.com/hotel34_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (129, 34, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel34_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (130, 34, '景观房', '45平米', '1.8米大床', 1079.00, 20, '0', 'https://example.com/hotel34_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (131, 35, '豪华大床房', '38平米', '1.8米大床', 849.00, 30, '0', 'https://example.com/hotel35_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (132, 35, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 17, '0', 'https://example.com/hotel35_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (133, 35, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel35_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (134, 36, '豪华大床房', '38平米', '1.8米大床', 899.00, 31, '0', 'https://example.com/hotel36_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (135, 36, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 18, '0', 'https://example.com/hotel36_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (136, 36, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel36_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (137, 36, '总统套房', '120平米', '2米特大床', 4599.00, 2, '0', 'https://example.com/hotel36_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (138, 36, '景观房', '45平米', '1.8米大床', 1219.00, 10, '0', 'https://example.com/hotel36_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (139, 37, '豪华大床房', '38平米', '1.8米大床', 949.00, 32, '0', 'https://example.com/hotel37_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (140, 37, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 19, '0', 'https://example.com/hotel37_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (141, 37, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel37_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (142, 38, '豪华大床房', '38平米', '1.8米大床', 999.00, 33, '0', 'https://example.com/hotel38_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (143, 38, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 20, '0', 'https://example.com/hotel38_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (144, 38, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel38_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (145, 38, '景观房', '45平米', '1.8米大床', 1359.00, 12, '0', 'https://example.com/hotel38_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (146, 39, '豪华大床房', '38平米', '1.8米大床', 1049.00, 34, '0', 'https://example.com/hotel39_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (147, 39, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 21, '0', 'https://example.com/hotel39_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (148, 39, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel39_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (149, 39, '总统套房', '120平米', '2米特大床', 4899.00, 2, '0', 'https://example.com/hotel39_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (150, 40, '豪华大床房', '38平米', '1.8米大床', 599.00, 15, '0', 'https://example.com/hotel40_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (151, 40, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 22, '0', 'https://example.com/hotel40_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (152, 40, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel40_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (153, 40, '景观房', '45平米', '1.8米大床', 799.00, 14, '0', 'https://example.com/hotel40_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (154, 41, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel41_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (155, 41, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 23, '0', 'https://example.com/hotel41_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (156, 41, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel41_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (157, 42, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel42_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (158, 42, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 24, '0', 'https://example.com/hotel42_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (159, 42, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel42_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (160, 42, '总统套房', '120平米', '2米特大床', 3199.00, 2, '0', 'https://example.com/hotel42_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (161, 42, '景观房', '45平米', '1.8米大床', 939.00, 16, '0', 'https://example.com/hotel42_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (162, 43, '豪华大床房', '38平米', '1.8米大床', 749.00, 18, '0', 'https://example.com/hotel43_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (163, 43, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 25, '0', 'https://example.com/hotel43_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (164, 43, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel43_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (165, 44, '豪华大床房', '38平米', '1.8米大床', 799.00, 19, '0', 'https://example.com/hotel44_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (166, 44, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 26, '0', 'https://example.com/hotel44_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (167, 44, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel44_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (168, 44, '景观房', '45平米', '1.8米大床', 1079.00, 18, '0', 'https://example.com/hotel44_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (169, 45, '豪华大床房', '38平米', '1.8米大床', 849.00, 20, '0', 'https://example.com/hotel45_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (170, 45, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 12, '0', 'https://example.com/hotel45_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (171, 45, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel45_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (172, 45, '总统套房', '120平米', '2米特大床', 3499.00, 2, '0', 'https://example.com/hotel45_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (173, 46, '豪华大床房', '38平米', '1.8米大床', 899.00, 21, '0', 'https://example.com/hotel46_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (174, 46, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 13, '0', 'https://example.com/hotel46_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (175, 46, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel46_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (176, 46, '景观房', '45平米', '1.8米大床', 1219.00, 20, '0', 'https://example.com/hotel46_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (177, 47, '豪华大床房', '38平米', '1.8米大床', 949.00, 22, '0', 'https://example.com/hotel47_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (178, 47, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 14, '0', 'https://example.com/hotel47_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (179, 47, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel47_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (180, 48, '豪华大床房', '38平米', '1.8米大床', 999.00, 23, '0', 'https://example.com/hotel48_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (181, 48, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 15, '0', 'https://example.com/hotel48_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (182, 48, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel48_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (183, 48, '总统套房', '120平米', '2米特大床', 3799.00, 2, '0', 'https://example.com/hotel48_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (184, 48, '景观房', '45平米', '1.8米大床', 1359.00, 10, '0', 'https://example.com/hotel48_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (185, 49, '豪华大床房', '38平米', '1.8米大床', 1049.00, 24, '0', 'https://example.com/hotel49_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (186, 49, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 16, '0', 'https://example.com/hotel49_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (187, 49, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel49_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (188, 50, '豪华大床房', '38平米', '1.8米大床', 599.00, 25, '0', 'https://example.com/hotel50_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (189, 50, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 17, '0', 'https://example.com/hotel50_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (190, 50, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel50_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (191, 50, '景观房', '45平米', '1.8米大床', 799.00, 12, '0', 'https://example.com/hotel50_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (192, 51, '豪华大床房', '38平米', '1.8米大床', 649.00, 26, '0', 'https://example.com/hotel51_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (193, 51, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 18, '0', 'https://example.com/hotel51_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (194, 51, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel51_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (195, 51, '总统套房', '120平米', '2米特大床', 4099.00, 2, '0', 'https://example.com/hotel51_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (196, 52, '豪华大床房', '38平米', '1.8米大床', 699.00, 27, '0', 'https://example.com/hotel52_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (197, 52, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 19, '0', 'https://example.com/hotel52_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (198, 52, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel52_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (199, 52, '景观房', '45平米', '1.8米大床', 939.00, 14, '0', 'https://example.com/hotel52_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (200, 53, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://example.com/hotel53_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (201, 53, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 20, '0', 'https://example.com/hotel53_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (202, 53, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel53_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (203, 54, '豪华大床房', '38平米', '1.8米大床', 799.00, 29, '0', 'https://example.com/hotel54_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (204, 54, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 21, '0', 'https://example.com/hotel54_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (205, 54, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel54_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (206, 54, '总统套房', '120平米', '2米特大床', 4399.00, 2, '0', 'https://example.com/hotel54_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (207, 54, '景观房', '45平米', '1.8米大床', 1079.00, 16, '0', 'https://example.com/hotel54_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (208, 55, '豪华大床房', '38平米', '1.8米大床', 849.00, 30, '0', 'https://example.com/hotel55_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (209, 55, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 22, '0', 'https://example.com/hotel55_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (210, 55, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel55_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (211, 56, '豪华大床房', '38平米', '1.8米大床', 899.00, 31, '0', 'https://example.com/hotel56_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (212, 56, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 23, '0', 'https://example.com/hotel56_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (213, 56, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel56_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (214, 56, '景观房', '45平米', '1.8米大床', 1219.00, 18, '0', 'https://example.com/hotel56_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (215, 57, '豪华大床房', '38平米', '1.8米大床', 949.00, 32, '0', 'https://example.com/hotel57_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (216, 57, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 24, '0', 'https://example.com/hotel57_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (217, 57, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel57_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (218, 57, '总统套房', '120平米', '2米特大床', 4699.00, 2, '0', 'https://example.com/hotel57_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (219, 58, '豪华大床房', '38平米', '1.8米大床', 999.00, 33, '0', 'https://example.com/hotel58_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (220, 58, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 25, '0', 'https://example.com/hotel58_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (221, 58, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel58_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (222, 58, '景观房', '45平米', '1.8米大床', 1359.00, 20, '0', 'https://example.com/hotel58_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (223, 59, '豪华大床房', '38平米', '1.8米大床', 1049.00, 34, '0', 'https://example.com/hotel59_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (224, 59, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 26, '0', 'https://example.com/hotel59_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (225, 59, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel59_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (226, 60, '豪华大床房', '38平米', '1.8米大床', 599.00, 15, '0', 'https://example.com/hotel60_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (227, 60, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 12, '0', 'https://example.com/hotel60_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (228, 60, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel60_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (229, 60, '总统套房', '120平米', '2米特大床', 2999.00, 2, '0', 'https://example.com/hotel60_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (230, 60, '景观房', '45平米', '1.8米大床', 799.00, 10, '0', 'https://example.com/hotel60_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (231, 61, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel61_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (232, 61, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 13, '0', 'https://example.com/hotel61_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (233, 61, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel61_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (234, 62, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel62_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (235, 62, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 14, '0', 'https://example.com/hotel62_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (236, 62, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel62_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (237, 62, '景观房', '45平米', '1.8米大床', 939.00, 12, '0', 'https://example.com/hotel62_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (238, 63, '豪华大床房', '38平米', '1.8米大床', 749.00, 18, '0', 'https://example.com/hotel63_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (239, 63, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 15, '0', 'https://example.com/hotel63_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (240, 63, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel63_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (241, 63, '总统套房', '120平米', '2米特大床', 3299.00, 2, '0', 'https://example.com/hotel63_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (242, 64, '豪华大床房', '38平米', '1.8米大床', 799.00, 19, '0', 'https://example.com/hotel64_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (243, 64, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 16, '0', 'https://example.com/hotel64_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (244, 64, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel64_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (245, 64, '景观房', '45平米', '1.8米大床', 1079.00, 14, '0', 'https://example.com/hotel64_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (246, 65, '豪华大床房', '38平米', '1.8米大床', 849.00, 20, '0', 'https://example.com/hotel65_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (247, 65, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 17, '0', 'https://example.com/hotel65_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (248, 65, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel65_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (249, 66, '豪华大床房', '38平米', '1.8米大床', 899.00, 21, '0', 'https://example.com/hotel66_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (250, 66, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 18, '0', 'https://example.com/hotel66_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (251, 66, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel66_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (252, 66, '总统套房', '120平米', '2米特大床', 3599.00, 2, '0', 'https://example.com/hotel66_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (253, 66, '景观房', '45平米', '1.8米大床', 1219.00, 16, '0', 'https://example.com/hotel66_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (254, 67, '豪华大床房', '38平米', '1.8米大床', 949.00, 22, '0', 'https://example.com/hotel67_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (255, 67, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 19, '0', 'https://example.com/hotel67_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (256, 67, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel67_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (257, 68, '豪华大床房', '38平米', '1.8米大床', 999.00, 23, '0', 'https://example.com/hotel68_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (258, 68, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 20, '0', 'https://example.com/hotel68_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (259, 68, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel68_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (260, 68, '景观房', '45平米', '1.8米大床', 1359.00, 18, '0', 'https://example.com/hotel68_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (261, 69, '豪华大床房', '38平米', '1.8米大床', 1049.00, 24, '0', 'https://example.com/hotel69_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (262, 69, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 21, '0', 'https://example.com/hotel69_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (263, 69, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel69_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (264, 69, '总统套房', '120平米', '2米特大床', 3899.00, 2, '0', 'https://example.com/hotel69_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (265, 70, '豪华大床房', '38平米', '1.8米大床', 599.00, 25, '0', 'https://example.com/hotel70_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (266, 70, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 22, '0', 'https://example.com/hotel70_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (267, 70, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel70_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (268, 70, '景观房', '45平米', '1.8米大床', 799.00, 20, '0', 'https://example.com/hotel70_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (269, 71, '豪华大床房', '38平米', '1.8米大床', 649.00, 26, '0', 'https://example.com/hotel71_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (270, 71, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 23, '0', 'https://example.com/hotel71_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (271, 71, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel71_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (272, 72, '豪华大床房', '38平米', '1.8米大床', 699.00, 27, '0', 'https://example.com/hotel72_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (273, 72, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 24, '0', 'https://example.com/hotel72_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (274, 72, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel72_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (275, 72, '总统套房', '120平米', '2米特大床', 4199.00, 2, '0', 'https://example.com/hotel72_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (276, 72, '景观房', '45平米', '1.8米大床', 939.00, 10, '0', 'https://example.com/hotel72_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (277, 73, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://pavo.elongstatic.com/i/tHotel800_600/IW5g7O5cKk.jpg', '2026-06-02 00:30:57', '2026-06-20 01:35:46');
INSERT INTO `room` VALUES (278, 73, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 25, '0', 'https://ts3.tc.mm.bing.net/th/id/OIP-C.1Uq_u9irpFlsd3NRbVFrtwHaEH?rs=1&pid=ImgDetMain&o=7&rm=3', '2026-06-02 00:30:57', '2026-06-20 01:36:20');
INSERT INTO `room` VALUES (279, 73, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://ts3.tc.mm.bing.net/th/id/OIP-C.AgXElXiK98b5ZLm7F7LH1wAAAA?rs=1&pid=ImgDetMain&o=7&rm=3', '2026-06-02 00:30:57', '2026-06-20 01:36:44');
INSERT INTO `room` VALUES (280, 74, '豪华大床房', '38平米', '1.8米大床', 799.00, 29, '0', 'https://example.com/hotel74_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (281, 74, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 26, '0', 'https://example.com/hotel74_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (282, 74, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel74_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (283, 74, '景观房', '45平米', '1.8米大床', 1079.00, 12, '0', 'https://example.com/hotel74_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (284, 75, '豪华大床房', '38平米', '1.8米大床', 849.00, 30, '0', 'https://example.com/hotel75_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (285, 75, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 12, '0', 'https://example.com/hotel75_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (286, 75, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel75_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (287, 75, '总统套房', '120平米', '2米特大床', 4499.00, 2, '0', 'https://example.com/hotel75_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (288, 76, '豪华大床房', '38平米', '1.8米大床', 899.00, 31, '0', 'https://example.com/hotel76_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (289, 76, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 13, '0', 'https://example.com/hotel76_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (290, 76, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel76_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (291, 76, '景观房', '45平米', '1.8米大床', 1219.00, 14, '0', 'https://example.com/hotel76_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (292, 77, '豪华大床房', '38平米', '1.8米大床', 949.00, 32, '0', 'https://example.com/hotel77_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (293, 77, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 14, '0', 'https://example.com/hotel77_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (294, 77, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel77_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (295, 78, '豪华大床房', '38平米', '1.8米大床', 999.00, 33, '0', 'https://example.com/hotel78_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (296, 78, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 15, '0', 'https://example.com/hotel78_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (297, 78, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel78_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (298, 78, '总统套房', '120平米', '2米特大床', 4799.00, 2, '0', 'https://example.com/hotel78_room4.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (299, 78, '景观房', '45平米', '1.8米大床', 1359.00, 16, '0', 'https://example.com/hotel78_room5.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (300, 79, '豪华大床房', '38平米', '1.8米大床', 1049.00, 34, '0', 'https://example.com/hotel79_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (301, 79, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 16, '0', 'https://example.com/hotel79_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (302, 79, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel79_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (303, 80, '豪华大床房', '38平米', '1.8米大床', 599.00, 15, '0', 'https://example.com/hotel80_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (304, 80, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 17, '0', 'https://example.com/hotel80_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (305, 80, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel80_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (306, 80, '景观房', '45平米', '1.8米大床', 799.00, 18, '0', 'https://example.com/hotel80_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (307, 81, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel81_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (308, 81, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 18, '0', 'https://example.com/hotel81_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (309, 81, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel81_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (310, 81, '总统套房', '120平米', '2米特大床', 3099.00, 2, '0', 'https://example.com/hotel81_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (311, 82, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel82_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (312, 82, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 19, '0', 'https://example.com/hotel82_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (313, 82, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel82_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (314, 82, '景观房', '45平米', '1.8米大床', 939.00, 20, '0', 'https://example.com/hotel82_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (315, 83, '豪华大床房', '38平米', '1.8米大床', 749.00, 18, '0', 'https://example.com/hotel83_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (316, 83, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 20, '0', 'https://example.com/hotel83_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (317, 83, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel83_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (318, 84, '豪华大床房', '38平米', '1.8米大床', 799.00, 19, '0', 'https://example.com/hotel84_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (319, 84, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 21, '0', 'https://example.com/hotel84_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (320, 84, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel84_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (321, 84, '总统套房', '120平米', '2米特大床', 3399.00, 2, '0', 'https://example.com/hotel84_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (322, 84, '景观房', '45平米', '1.8米大床', 1079.00, 10, '0', 'https://example.com/hotel84_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (323, 85, '豪华大床房', '38平米', '1.8米大床', 849.00, 20, '0', 'https://example.com/hotel85_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (324, 85, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 22, '0', 'https://example.com/hotel85_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (325, 85, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel85_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (326, 86, '豪华大床房', '38平米', '1.8米大床', 899.00, 21, '0', 'https://example.com/hotel86_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (327, 86, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 23, '0', 'https://example.com/hotel86_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (328, 86, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel86_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (329, 86, '景观房', '45平米', '1.8米大床', 1219.00, 12, '0', 'https://example.com/hotel86_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (330, 87, '豪华大床房', '38平米', '1.8米大床', 949.00, 22, '0', 'https://example.com/hotel87_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (331, 87, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 24, '0', 'https://example.com/hotel87_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (332, 87, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel87_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (333, 87, '总统套房', '120平米', '2米特大床', 3699.00, 2, '0', 'https://example.com/hotel87_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (334, 88, '豪华大床房', '38平米', '1.8米大床', 999.00, 23, '0', 'https://example.com/hotel88_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (335, 88, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 25, '0', 'https://example.com/hotel88_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (336, 88, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel88_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (337, 88, '景观房', '45平米', '1.8米大床', 1359.00, 14, '0', 'https://example.com/hotel88_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (338, 89, '豪华大床房', '38平米', '1.8米大床', 1049.00, 24, '0', 'https://example.com/hotel89_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (339, 89, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 26, '0', 'https://example.com/hotel89_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (340, 89, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel89_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (341, 90, '豪华大床房', '38平米', '1.8米大床', 599.00, 25, '0', 'https://example.com/hotel90_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (342, 90, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 12, '0', 'https://example.com/hotel90_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (343, 90, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel90_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (344, 90, '总统套房', '120平米', '2米特大床', 3999.00, 2, '0', 'https://example.com/hotel90_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (345, 90, '景观房', '45平米', '1.8米大床', 799.00, 16, '0', 'https://example.com/hotel90_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (346, 91, '豪华大床房', '38平米', '1.8米大床', 649.00, 26, '0', 'https://example.com/hotel91_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (347, 91, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 13, '0', 'https://example.com/hotel91_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (348, 91, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel91_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (349, 92, '豪华大床房', '38平米', '1.8米大床', 699.00, 27, '0', 'https://example.com/hotel92_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (350, 92, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 14, '0', 'https://example.com/hotel92_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (351, 92, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel92_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (352, 92, '景观房', '45平米', '1.8米大床', 939.00, 18, '0', 'https://example.com/hotel92_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (353, 93, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://example.com/hotel93_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (354, 93, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 15, '0', 'https://example.com/hotel93_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (355, 93, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel93_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (356, 93, '总统套房', '120平米', '2米特大床', 4299.00, 2, '0', 'https://example.com/hotel93_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (357, 94, '豪华大床房', '38平米', '1.8米大床', 799.00, 29, '0', 'https://example.com/hotel94_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (358, 94, '行政双床房', '42平米', '2张1.2米单人床', 939.00, 16, '0', 'https://example.com/hotel94_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (359, 94, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1319.00, 12, '0', 'https://example.com/hotel94_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (360, 94, '景观房', '45平米', '1.8米大床', 1079.00, 20, '0', 'https://example.com/hotel94_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (361, 95, '豪华大床房', '38平米', '1.8米大床', 849.00, 30, '0', 'https://example.com/hotel95_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (362, 95, '行政双床房', '42平米', '2张1.2米单人床', 999.00, 17, '0', 'https://example.com/hotel95_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (363, 95, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1399.00, 13, '0', 'https://example.com/hotel95_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (364, 96, '豪华大床房', '38平米', '1.8米大床', 899.00, 31, '0', 'https://example.com/hotel96_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (365, 96, '行政双床房', '42平米', '2张1.2米单人床', 1059.00, 18, '0', 'https://example.com/hotel96_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (366, 96, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1479.00, 14, '0', 'https://example.com/hotel96_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (367, 96, '总统套房', '120平米', '2米特大床', 4599.00, 2, '0', 'https://example.com/hotel96_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (368, 96, '景观房', '45平米', '1.8米大床', 1219.00, 10, '0', 'https://example.com/hotel96_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (369, 97, '豪华大床房', '38平米', '1.8米大床', 949.00, 32, '0', 'https://example.com/hotel97_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (370, 97, '行政双床房', '42平米', '2张1.2米单人床', 1119.00, 19, '0', 'https://example.com/hotel97_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (371, 97, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1559.00, 15, '0', 'https://example.com/hotel97_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (372, 98, '豪华大床房', '38平米', '1.8米大床', 999.00, 33, '0', 'https://example.com/hotel98_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (373, 98, '行政双床房', '42平米', '2张1.2米单人床', 1179.00, 20, '0', 'https://example.com/hotel98_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (374, 98, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1639.00, 16, '0', 'https://example.com/hotel98_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (375, 98, '景观房', '45平米', '1.8米大床', 1359.00, 12, '0', 'https://example.com/hotel98_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (376, 99, '豪华大床房', '38平米', '1.8米大床', 1049.00, 34, '0', 'https://example.com/hotel99_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (377, 99, '行政双床房', '42平米', '2张1.2米单人床', 1239.00, 21, '0', 'https://example.com/hotel99_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (378, 99, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1719.00, 17, '0', 'https://example.com/hotel99_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (379, 99, '总统套房', '120平米', '2米特大床', 4899.00, 2, '0', 'https://example.com/hotel99_room4.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (380, 100, '豪华大床房', '38平米', '1.8米大床', 599.00, 15, '0', 'https://example.com/hotel100_room1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (381, 100, '行政双床房', '42平米', '2张1.2米单人床', 699.00, 22, '0', 'https://example.com/hotel100_room2.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (382, 100, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999.00, 8, '0', 'https://example.com/hotel100_room3.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (383, 100, '景观房', '45平米', '1.8米大床', 799.00, 14, '0', 'https://example.com/hotel100_room5.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (384, 1, '海景套房', '80平米', '1.8米大床', 1899.00, 5, '0', 'https://example.com/hotel1_extra1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (385, 2, '日式榻榻米房', '35平米', '榻榻米', 899.00, 8, '0', 'https://example.com/hotel2_extra1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (386, 3, '亲子主题房', '50平米', '1.8米大床+儿童床', 1299.00, 6, '0', 'https://example.com/hotel3_extra1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (387, 4, '商务行政房', '55平米', '1.8米大床', 1099.00, 10, '0', 'https://example.com/hotel4_extra1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (388, 5, '湖景别墅', '150平米', '2米特大床', 3999.00, 3, '0', 'https://example.com/hotel5_extra1.jpg', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `room` VALUES (390, 1, '���Է���', '50ƽ��', '��', 888.00, 10, '0', NULL, '2026-06-24 20:42:27', '2026-06-24 20:42:27');
INSERT INTO `room` VALUES (392, 103, '多人混住床位', '15平米', '上下铺单人床', 69.00, 20, '0', 'https://example.com/room_dorm1.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (393, 103, '女生多人间', '15平米', '上下铺单人床', 79.00, 10, '0', 'https://example.com/room_dorm2.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (394, 103, '大床房', '20平米', '1.5米大床', 189.00, 5, '0', 'https://example.com/room_single1.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (395, 104, '多人混住床位', '12平米', '上下铺单人床', 79.00, 16, '0', 'https://example.com/room_dorm3.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (396, 104, '双人间', '18平米', '1.5米大床', 199.00, 4, '0', 'https://example.com/room_single2.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (397, 105, '4人间床位', '18平米', '上下铺单人床', 59.00, 16, '0', 'https://example.com/room_dorm4.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (398, 105, '榻榻米双人间', '22平米', '榻榻米', 169.00, 3, '0', 'https://example.com/room_single3.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (399, 106, '标准单人间', '18平米', '1.5米大床', 159.00, 20, '0', 'https://example.com/room_std1.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (400, 106, '标准双人间', '22平米', '2张1.2米单人床', 189.00, 15, '0', 'https://example.com/room_std2.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (401, 107, '大床房', '20平米', '1.8米大床', 179.00, 25, '0', 'https://example.com/room_std3.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (402, 107, '双床房', '22平米', '2张1.2米单人床', 199.00, 20, '0', 'https://example.com/room_std4.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (403, 108, '经济单人间', '16平米', '1.5米大床', 139.00, 30, '0', 'https://example.com/room_std5.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (404, 108, '经济双人间', '20平米', '2张1.2米单人床', 169.00, 20, '0', 'https://example.com/room_std6.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (405, 109, '特价大床房', '18平米', '1.5米大床', 129.00, 15, '0', 'https://example.com/room_std7.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (406, 109, '标准双床房', '22平米', '2张1.2米单人床', 159.00, 12, '0', 'https://example.com/room_std8.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (407, 110, '舒适大床房', '28平米', '1.8米大床', 299.00, 15, '0', 'https://example.com/room_comfort1.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (408, 110, '舒适双床房', '30平米', '2张1.2米单人床', 329.00, 10, '0', 'https://example.com/room_comfort2.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (409, 111, '商务大床房', '32平米', '1.8米大床', 359.00, 20, '0', 'https://example.com/room_comfort3.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (410, 111, '商务双床房', '35平米', '2张1.2米单人床', 389.00, 15, '0', 'https://example.com/room_comfort4.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (411, 112, '亚朵大床房', '30平米', '1.8米大床', 399.00, 20, '0', 'https://example.com/room_comfort5.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (412, 112, '几木双床房', '35平米', '2张1.2米单人床', 459.00, 10, '0', 'https://example.com/room_comfort6.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (413, 113, '意式风情大床房', '28平米', '1.8米大床', 319.00, 12, '0', 'https://example.com/room_comfort7.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (414, 113, '意式风情双床房', '32平米', '2张1.2米单人床', 349.00, 8, '0', 'https://example.com/room_comfort8.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (415, 114, '海景大床房', '30平米', '1.8米大床', 429.00, 10, '0', 'https://example.com/room_comfort9.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (416, 114, '城景双床房', '28平米', '2张1.2米单人床', 359.00, 12, '0', 'https://example.com/room_comfort10.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (417, 115, '温泉大床房', '35平米', '1.8米大床', 469.00, 8, '0', 'https://example.com/room_comfort11.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (418, 115, '翠湖景观双床房', '32平米', '2张1.2米单人床', 399.00, 10, '0', 'https://example.com/room_comfort12.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (419, 116, '冰雪主题大床房', '28平米', '1.8米大床', 339.00, 15, '0', 'https://example.com/room_comfort13.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (420, 116, '中央大街景观房', '30平米', '2张1.2米单人床', 369.00, 10, '0', 'https://example.com/room_comfort14.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (421, 117, '海景民宿大床房', '32平米', '1.8米大床', 499.00, 6, '0', 'https://example.com/room_comfort15.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (422, 117, '园景家庭房', '45平米', '1.8米大床+1.2米单人床', 699.00, 4, '0', 'https://example.com/room_comfort16.jpg', '2026-06-25 17:58:11', '2026-06-25 17:58:11');
INSERT INTO `room` VALUES (423, 103, '多人混住床位', '15平米', '上下铺单人床', 69.00, 20, '0', 'https://example.com/room_dorm1.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (424, 103, '女生多人间', '15平米', '上下铺单人床', 79.00, 10, '0', 'https://example.com/room_dorm2.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (425, 103, '大床房', '20平米', '1.5米大床', 189.00, 5, '0', 'https://example.com/room_single1.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (426, 104, '多人混住床位', '12平米', '上下铺单人床', 79.00, 16, '0', 'https://example.com/room_dorm3.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (427, 104, '双人间', '18平米', '1.5米大床', 199.00, 4, '0', 'https://example.com/room_single2.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (428, 105, '4人间床位', '18平米', '上下铺单人床', 59.00, 16, '0', 'https://example.com/room_dorm4.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (429, 105, '榻榻米双人间', '22平米', '榻榻米', 169.00, 3, '0', 'https://example.com/room_single3.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (430, 106, '标准单人间', '18平米', '1.5米大床', 159.00, 20, '0', 'https://example.com/room_std1.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (431, 106, '标准双人间', '22平米', '2张1.2米单人床', 189.00, 15, '0', 'https://example.com/room_std2.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (432, 107, '大床房', '20平米', '1.8米大床', 179.00, 25, '0', 'https://example.com/room_std3.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (433, 107, '双床房', '22平米', '2张1.2米单人床', 199.00, 20, '0', 'https://example.com/room_std4.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (434, 108, '经济单人间', '16平米', '1.5米大床', 139.00, 30, '0', 'https://example.com/room_std5.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (435, 108, '经济双人间', '20平米', '2张1.2米单人床', 169.00, 20, '0', 'https://example.com/room_std6.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (436, 109, '特价大床房', '18平米', '1.5米大床', 129.00, 15, '0', 'https://example.com/room_std7.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (437, 109, '标准双床房', '22平米', '2张1.2米单人床', 159.00, 12, '0', 'https://example.com/room_std8.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (438, 110, '舒适大床房', '28平米', '1.8米大床', 299.00, 15, '0', 'https://example.com/room_comfort1.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (439, 110, '舒适双床房', '30平米', '2张1.2米单人床', 329.00, 10, '0', 'https://example.com/room_comfort2.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (440, 111, '商务大床房', '32平米', '1.8米大床', 359.00, 20, '0', 'https://example.com/room_comfort3.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (441, 111, '商务双床房', '35平米', '2张1.2米单人床', 389.00, 15, '0', 'https://example.com/room_comfort4.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (442, 112, '亚朵大床房', '30平米', '1.8米大床', 399.00, 20, '0', 'https://example.com/room_comfort5.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (443, 112, '几木双床房', '35平米', '2张1.2米单人床', 459.00, 10, '0', 'https://example.com/room_comfort6.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (444, 113, '意式风情大床房', '28平米', '1.8米大床', 319.00, 12, '0', 'https://example.com/room_comfort7.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (445, 113, '意式风情双床房', '32平米', '2张1.2米单人床', 349.00, 8, '0', 'https://example.com/room_comfort8.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (446, 114, '海景大床房', '30平米', '1.8米大床', 429.00, 10, '0', 'https://example.com/room_comfort9.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (447, 114, '城景双床房', '28平米', '2张1.2米单人床', 359.00, 12, '0', 'https://example.com/room_comfort10.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (448, 115, '温泉大床房', '35平米', '1.8米大床', 469.00, 8, '0', 'https://example.com/room_comfort11.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (449, 115, '翠湖景观双床房', '32平米', '2张1.2米单人床', 399.00, 10, '0', 'https://example.com/room_comfort12.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (450, 116, '冰雪主题大床房', '28平米', '1.8米大床', 339.00, 15, '0', 'https://example.com/room_comfort13.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (451, 116, '中央大街景观房', '30平米', '2张1.2米单人床', 369.00, 10, '0', 'https://example.com/room_comfort14.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (452, 117, '海景民宿大床房', '32平米', '1.8米大床', 499.00, 6, '0', 'https://example.com/room_comfort15.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (453, 117, '园景家庭房', '45平米', '1.8米大床+1.2米单人床', 699.00, 4, '0', 'https://example.com/room_comfort16.jpg', '2026-06-25 18:00:04', '2026-06-25 18:00:04');
INSERT INTO `room` VALUES (454, 103, '多人混住床位', '15平米', '上下铺单人床', 69.00, 20, '0', 'https://example.com/room_dorm1.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (455, 103, '女生多人间', '15平米', '上下铺单人床', 79.00, 10, '0', 'https://example.com/room_dorm2.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (456, 103, '大床房', '20平米', '1.5米大床', 189.00, 5, '0', 'https://example.com/room_single1.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (457, 104, '多人混住床位', '12平米', '上下铺单人床', 79.00, 16, '0', 'https://example.com/room_dorm3.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (458, 104, '双人间', '18平米', '1.5米大床', 199.00, 4, '0', 'https://example.com/room_single2.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (459, 105, '4人间床位', '18平米', '上下铺单人床', 59.00, 16, '0', 'https://example.com/room_dorm4.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (460, 105, '榻榻米双人间', '22平米', '榻榻米', 169.00, 3, '0', 'https://example.com/room_single3.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (461, 106, '标准单人间', '18平米', '1.5米大床', 159.00, 20, '0', 'https://example.com/room_std1.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (462, 106, '标准双人间', '22平米', '2张1.2米单人床', 189.00, 15, '0', 'https://example.com/room_std2.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (463, 107, '大床房', '20平米', '1.8米大床', 179.00, 25, '0', 'https://example.com/room_std3.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (464, 107, '双床房', '22平米', '2张1.2米单人床', 199.00, 20, '0', 'https://example.com/room_std4.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (465, 108, '经济单人间', '16平米', '1.5米大床', 139.00, 30, '0', 'https://example.com/room_std5.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (466, 108, '经济双人间', '20平米', '2张1.2米单人床', 169.00, 20, '0', 'https://example.com/room_std6.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (467, 109, '特价大床房', '18平米', '1.5米大床', 129.00, 15, '0', 'https://example.com/room_std7.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (468, 109, '标准双床房', '22平米', '2张1.2米单人床', 159.00, 12, '0', 'https://example.com/room_std8.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (469, 110, '舒适大床房', '28平米', '1.8米大床', 299.00, 15, '0', 'https://example.com/room_comfort1.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (470, 110, '舒适双床房', '30平米', '2张1.2米单人床', 329.00, 10, '0', 'https://example.com/room_comfort2.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (471, 111, '商务大床房', '32平米', '1.8米大床', 359.00, 20, '0', 'https://example.com/room_comfort3.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (472, 111, '商务双床房', '35平米', '2张1.2米单人床', 389.00, 15, '0', 'https://example.com/room_comfort4.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (473, 112, '亚朵大床房', '30平米', '1.8米大床', 399.00, 20, '0', 'https://example.com/room_comfort5.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (474, 112, '几木双床房', '35平米', '2张1.2米单人床', 459.00, 10, '0', 'https://example.com/room_comfort6.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (475, 113, '意式风情大床房', '28平米', '1.8米大床', 319.00, 12, '0', 'https://example.com/room_comfort7.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (476, 113, '意式风情双床房', '32平米', '2张1.2米单人床', 349.00, 8, '0', 'https://example.com/room_comfort8.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (477, 114, '海景大床房', '30平米', '1.8米大床', 429.00, 10, '0', 'https://example.com/room_comfort9.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (478, 114, '城景双床房', '28平米', '2张1.2米单人床', 359.00, 12, '0', 'https://example.com/room_comfort10.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (479, 115, '温泉大床房', '35平米', '1.8米大床', 469.00, 8, '0', 'https://example.com/room_comfort11.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (480, 115, '翠湖景观双床房', '32平米', '2张1.2米单人床', 399.00, 10, '0', 'https://example.com/room_comfort12.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (481, 116, '冰雪主题大床房', '28平米', '1.8米大床', 339.00, 15, '0', 'https://example.com/room_comfort13.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (482, 116, '中央大街景观房', '30平米', '2张1.2米单人床', 369.00, 10, '0', 'https://example.com/room_comfort14.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (483, 117, '海景民宿大床房', '32平米', '1.8米大床', 499.00, 6, '0', 'https://example.com/room_comfort15.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');
INSERT INTO `room` VALUES (484, 117, '园景家庭房', '45平米', '1.8米大床+1.2米单人床', 699.00, 4, '0', 'https://example.com/room_comfort16.jpg', '2026-06-25 18:01:18', '2026-06-25 18:01:18');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-03-06 01:54:38', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-03-06 01:54:36', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '学生', '1', 'reader_type', NULL, 'info', 'N', '0', 'admin', '2026-03-09 01:49:32', 'admin', '2026-03-09 02:50:35', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '职工', '2', 'reader_type', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 01:49:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '借出', '1', 'borrow_status', NULL, 'primary', 'N', '0', 'admin', '2026-03-09 01:53:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '已归还', '2', 'borrow_status', NULL, 'success', 'N', '0', 'admin', '2026-03-09 01:53:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '逾期', '3', 'borrow_status', NULL, 'warning', 'N', '0', 'admin', '2026-03-09 01:53:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '遗失', '4', 'borrow_status', NULL, 'danger', 'N', '0', 'admin', '2026-03-09 01:54:06', 'admin', '2026-03-09 01:54:22', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '启用', '1', 'category_status', NULL, 'success', 'N', '0', 'admin', '2026-03-09 02:14:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '禁用', '0', 'category_status', NULL, 'danger', 'N', '0', 'admin', '2026-03-09 02:15:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '在架', '1', 'book_status', NULL, 'success', 'N', '0', 'admin', '2026-03-09 02:50:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '未上架', '2', 'book_status', NULL, 'info', 'N', '0', 'admin', '2026-03-09 02:50:13', 'admin', '2026-03-09 02:50:21', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '管理员', 'admin', 'sys_user_role_type', '', 'danger', 'N', '0', 'admin', '2026-06-01 00:00:00', '', NULL, '系统管理员角色');
INSERT INTO `sys_dict_data` VALUES (111, 2, '普通用户', 'customer', 'sys_user_role_type', '', 'primary', 'Y', '0', 'admin', '2026-06-01 00:00:00', '', NULL, '前台普通用户角色');
INSERT INTO `sys_dict_data` VALUES (112, 3, '商户', 'merchant', 'sys_user_role_type', '', 'success', 'N', '0', 'admin', '2026-06-01 00:00:00', '', NULL, '酒店商家角色');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-03-06 01:54:38', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '读者类型', 'reader_type', '0', 'admin', '2026-03-09 01:46:16', 'admin', '2026-03-09 01:46:53', NULL);
INSERT INTO `sys_dict_type` VALUES (101, '借阅状态', 'borrow_status', '0', 'admin', '2026-03-09 01:52:17', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '图书分类状态', 'category_status', '0', 'admin', '2026-03-09 02:14:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '图书状态', 'book_status', '0', 'admin', '2026-03-09 02:49:38', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '读者状态', 'reader_status', '0', 'admin', '2026-03-10 09:47:20', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '用户角色类型', 'sys_user_role_type', '0', 'admin', '2026-06-01 00:00:00', '', NULL, '系统用户角色分类');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-03-06 01:54:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-03-06 01:54:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-03-06 01:54:38', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '退出成功', '2026-03-06 01:56:19');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-06 01:56:22');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-06 03:18:43');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-06 04:00:50');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-07 09:23:39');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 01:53:59');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 02:49:17');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 06:35:28');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 08:02:00');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 08:02:00');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 08:41:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-08 08:50:35');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'IntelliJ HTTP Client 2025.3.3', '', '0', '登录成功', '2026-03-09 01:05:32');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 01:12:40');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 02:48:37');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 04:14:42');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 06:21:41');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 08:06:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-09 12:03:30');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-10 01:08:07');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-10 08:19:19');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-10 10:36:59');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Edge 145', 'Windows >=10', '0', '登录成功', '2026-03-12 09:10:09');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-01 02:38:13');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-01 08:34:33');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-03 12:17:10');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '1', '验证码错误', '2026-04-03 13:16:24');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-03 13:16:29');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-07 11:55:40');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Edge 146', 'Windows >=10', '0', '登录成功', '2026-04-07 13:31:02');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:33:15');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:39:08');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:39:26');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:39:56');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:40:05');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:40:56');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:41:00');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:41:08');
INSERT INTO `sys_logininfor` VALUES (138, 'user', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-02 00:41:18');
INSERT INTO `sys_logininfor` VALUES (139, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-02 00:41:46');
INSERT INTO `sys_logininfor` VALUES (140, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-02 00:42:13');
INSERT INTO `sys_logininfor` VALUES (141, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:42:17');
INSERT INTO `sys_logininfor` VALUES (142, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:42:23');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:42:34');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:43:21');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:43:29');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:43:35');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:43:39');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:43:56');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:44:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:44:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:48:13');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:48:18');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:50:42');
INSERT INTO `sys_logininfor` VALUES (154, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:50:54');
INSERT INTO `sys_logininfor` VALUES (155, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:50:56');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:51:03');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:53:38');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:53:42');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:54:27');
INSERT INTO `sys_logininfor` VALUES (160, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:54:35');
INSERT INTO `sys_logininfor` VALUES (161, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:54:37');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:54:44');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:54:53');
INSERT INTO `sys_logininfor` VALUES (164, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:55:02');
INSERT INTO `sys_logininfor` VALUES (165, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:55:03');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:55:11');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:59:53');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 00:59:57');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 00:59:59');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:00:04');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:00:13');
INSERT INTO `sys_logininfor` VALUES (172, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:00:22');
INSERT INTO `sys_logininfor` VALUES (173, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:00:24');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-02 01:00:32');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:00:36');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:02:04');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:02:08');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:04:14');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:04:22');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:04:27');
INSERT INTO `sys_logininfor` VALUES (181, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:04:43');
INSERT INTO `sys_logininfor` VALUES (182, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:04:47');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:04:52');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:04:58');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:08:24');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:08:26');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:08:34');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:08:43');
INSERT INTO `sys_logininfor` VALUES (189, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:08:53');
INSERT INTO `sys_logininfor` VALUES (190, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:08:56');
INSERT INTO `sys_logininfor` VALUES (191, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:09:04');
INSERT INTO `sys_logininfor` VALUES (192, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:11:12');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:11:24');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:11:49');
INSERT INTO `sys_logininfor` VALUES (195, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:12:07');
INSERT INTO `sys_logininfor` VALUES (196, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:12:10');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:12:18');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:13:59');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:14:03');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:15:58');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:16:03');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:16:10');
INSERT INTO `sys_logininfor` VALUES (203, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:16:18');
INSERT INTO `sys_logininfor` VALUES (204, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:16:19');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-02 01:16:26');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:16:32');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:18:36');
INSERT INTO `sys_logininfor` VALUES (208, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:18:45');
INSERT INTO `sys_logininfor` VALUES (209, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 01:18:49');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 01:18:58');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 15:41:33');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 08:37:39');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-06 09:06:56');
INSERT INTO `sys_logininfor` VALUES (214, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 09:07:13');
INSERT INTO `sys_logininfor` VALUES (215, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 10:06:07');
INSERT INTO `sys_logininfor` VALUES (216, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-06 10:20:38');
INSERT INTO `sys_logininfor` VALUES (217, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 10:20:52');
INSERT INTO `sys_logininfor` VALUES (218, 'customer01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-06 10:27:34');
INSERT INTO `sys_logininfor` VALUES (219, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-06 10:28:03');
INSERT INTO `sys_logininfor` VALUES (220, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 10:28:07');
INSERT INTO `sys_logininfor` VALUES (221, 'merchant01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-06 10:32:27');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 10:32:44');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 10:46:48');
INSERT INTO `sys_logininfor` VALUES (224, 'customer01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-08 10:11:58');
INSERT INTO `sys_logininfor` VALUES (225, 'customer01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-06-08 10:12:20');
INSERT INTO `sys_logininfor` VALUES (226, 'merchant01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-08 10:12:31');
INSERT INTO `sys_logininfor` VALUES (227, 'merchant01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-06-08 10:13:29');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-08 10:13:38');
INSERT INTO `sys_logininfor` VALUES (229, 'merchant01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-09 16:28:34');
INSERT INTO `sys_logininfor` VALUES (230, 'merchant01', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-06-09 16:47:00');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 17:22:55');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 19:19:00');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-17 19:20:46');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 19:26:20');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-17 19:26:52');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 19:51:03');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:03:17');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-17 20:17:15');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:17:39');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-17 20:34:15');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:34:21');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:37:43');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-17 20:37:56');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:38:02');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-17 20:42:03');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-17 21:13:55');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-17 21:15:32');
INSERT INTO `sys_logininfor` VALUES (248, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-17 21:16:16');
INSERT INTO `sys_logininfor` VALUES (249, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-17 21:16:42');
INSERT INTO `sys_logininfor` VALUES (250, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-17 21:16:49');
INSERT INTO `sys_logininfor` VALUES (251, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-17 21:29:21');
INSERT INTO `sys_logininfor` VALUES (252, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 20:32:19');
INSERT INTO `sys_logininfor` VALUES (253, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 20:33:28');
INSERT INTO `sys_logininfor` VALUES (254, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 20:33:55');
INSERT INTO `sys_logininfor` VALUES (255, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 21:03:42');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 21:03:48');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 21:04:22');
INSERT INTO `sys_logininfor` VALUES (258, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 21:04:41');
INSERT INTO `sys_logininfor` VALUES (259, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 22:22:28');
INSERT INTO `sys_logininfor` VALUES (260, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 22:22:32');
INSERT INTO `sys_logininfor` VALUES (261, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 22:23:12');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 22:23:19');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-18 23:02:44');
INSERT INTO `sys_logininfor` VALUES (264, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 23:03:04');
INSERT INTO `sys_logininfor` VALUES (265, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-18 23:52:45');
INSERT INTO `sys_logininfor` VALUES (266, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 01:15:03');
INSERT INTO `sys_logininfor` VALUES (267, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 01:22:25');
INSERT INTO `sys_logininfor` VALUES (268, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 01:28:23');
INSERT INTO `sys_logininfor` VALUES (269, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 01:30:12');
INSERT INTO `sys_logininfor` VALUES (270, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 01:30:41');
INSERT INTO `sys_logininfor` VALUES (271, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 19:21:09');
INSERT INTO `sys_logininfor` VALUES (272, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 19:58:35');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 19:58:45');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 20:23:05');
INSERT INTO `sys_logininfor` VALUES (275, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 20:23:17');
INSERT INTO `sys_logininfor` VALUES (276, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 20:28:23');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-19 20:28:33');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 20:28:35');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 20:28:42');
INSERT INTO `sys_logininfor` VALUES (280, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-19 20:28:48');
INSERT INTO `sys_logininfor` VALUES (281, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 20:28:50');
INSERT INTO `sys_logininfor` VALUES (282, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 20:38:18');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 20:38:25');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 20:38:34');
INSERT INTO `sys_logininfor` VALUES (285, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 20:38:43');
INSERT INTO `sys_logininfor` VALUES (286, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 22:54:45');
INSERT INTO `sys_logininfor` VALUES (287, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 23:00:16');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 23:00:23');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-19 23:00:28');
INSERT INTO `sys_logininfor` VALUES (290, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 23:00:36');
INSERT INTO `sys_logininfor` VALUES (291, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-19 23:32:15');
INSERT INTO `sys_logininfor` VALUES (292, 'merchant01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-20 02:21:49');
INSERT INTO `sys_logininfor` VALUES (293, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码已失效', '2026-06-23 17:01:18');
INSERT INTO `sys_logininfor` VALUES (294, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-23 17:01:22');
INSERT INTO `sys_logininfor` VALUES (295, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-23 17:01:36');
INSERT INTO `sys_logininfor` VALUES (296, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-23 17:01:39');
INSERT INTO `sys_logininfor` VALUES (297, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-23 17:04:30');
INSERT INTO `sys_logininfor` VALUES (298, 'test_user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-23 17:04:44');
INSERT INTO `sys_logininfor` VALUES (299, 'test_user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-23 17:06:16');
INSERT INTO `sys_logininfor` VALUES (300, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-23 17:06:45');
INSERT INTO `sys_logininfor` VALUES (301, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-23 17:08:53');
INSERT INTO `sys_logininfor` VALUES (302, 'test_user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-23 17:09:35');
INSERT INTO `sys_logininfor` VALUES (303, 'test_user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-23 17:32:45');
INSERT INTO `sys_logininfor` VALUES (304, 'test_user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-23 17:32:52');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-24 20:17:21');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-24 20:32:04');
INSERT INTO `sys_logininfor` VALUES (307, 'merchent01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-24 20:32:13');
INSERT INTO `sys_logininfor` VALUES (308, 'merchnt01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-24 20:32:23');
INSERT INTO `sys_logininfor` VALUES (309, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-24 20:32:32');
INSERT INTO `sys_logininfor` VALUES (310, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-24 20:33:38');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-24 20:33:47');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:34:48');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码错误', '2026-06-24 20:35:58');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码错误', '2026-06-24 20:36:12');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:12');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:12');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:12');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:12');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:13');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:14');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:38');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:45');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:36:55');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:37:56');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', '', '', '0', '登录成功', '2026-06-24 20:41:04');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-24 20:55:21');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 20:58:13');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 21:06:23');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', '', '', '0', '登录成功', '2026-06-24 21:06:51');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', '', '', '0', '登录成功', '2026-06-24 21:08:33');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', '', '', '0', '登录成功', '2026-06-24 21:08:41');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 21:10:45');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-24 21:10:52');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', '', '', '0', '登录成功', '2026-06-24 21:11:23');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 15:20:34');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 15:33:20');
INSERT INTO `sys_logininfor` VALUES (351, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 15:33:38');
INSERT INTO `sys_logininfor` VALUES (352, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 15:44:25');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 15:44:40');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 15:51:52');
INSERT INTO `sys_logininfor` VALUES (355, 'hero2192039831@163.com', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '注册成功', '2026-06-25 15:52:44');
INSERT INTO `sys_logininfor` VALUES (356, 'hero2192039831@163.com', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 15:54:46');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 15:54:52');
INSERT INTO `sys_logininfor` VALUES (358, 'lyx', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 15:56:23');
INSERT INTO `sys_logininfor` VALUES (359, 'lyx', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 15:56:32');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 15:56:40');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 15:58:59');
INSERT INTO `sys_logininfor` VALUES (362, 'lyx', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 15:59:07');
INSERT INTO `sys_logininfor` VALUES (363, 'lyx', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 15:59:15');
INSERT INTO `sys_logininfor` VALUES (364, 'lyx', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 15:59:21');
INSERT INTO `sys_logininfor` VALUES (365, 'hero2192039831@163.com', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:00:08');
INSERT INTO `sys_logininfor` VALUES (366, 'hero2192039831@163.com', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:07:07');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:07:19');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:07:47');
INSERT INTO `sys_logininfor` VALUES (369, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:08:03');
INSERT INTO `sys_logininfor` VALUES (370, 'merchant01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:11:16');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:11:36');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:27:40');
INSERT INTO `sys_logininfor` VALUES (373, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:27:51');
INSERT INTO `sys_logininfor` VALUES (374, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:28:46');
INSERT INTO `sys_logininfor` VALUES (375, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:48:07');
INSERT INTO `sys_logininfor` VALUES (376, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:48:22');
INSERT INTO `sys_logininfor` VALUES (377, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 16:49:31');
INSERT INTO `sys_logininfor` VALUES (378, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '验证码已失效', '2026-06-25 16:52:59');
INSERT INTO `sys_logininfor` VALUES (379, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 16:53:03');
INSERT INTO `sys_logininfor` VALUES (380, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:09:00');
INSERT INTO `sys_logininfor` VALUES (381, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:10:33');
INSERT INTO `sys_logininfor` VALUES (382, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:26:27');
INSERT INTO `sys_logininfor` VALUES (383, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:27:41');
INSERT INTO `sys_logininfor` VALUES (384, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:29:01');
INSERT INTO `sys_logininfor` VALUES (385, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:29:08');
INSERT INTO `sys_logininfor` VALUES (386, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:30:42');
INSERT INTO `sys_logininfor` VALUES (387, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:39:27');
INSERT INTO `sys_logininfor` VALUES (388, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:40:19');
INSERT INTO `sys_logininfor` VALUES (389, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:42:44');
INSERT INTO `sys_logininfor` VALUES (390, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:43:46');
INSERT INTO `sys_logininfor` VALUES (391, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 17:53:43');
INSERT INTO `sys_logininfor` VALUES (392, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 17:53:59');
INSERT INTO `sys_logininfor` VALUES (393, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 18:01:33');
INSERT INTO `sys_logininfor` VALUES (394, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:30:53');
INSERT INTO `sys_logininfor` VALUES (395, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:31:13');
INSERT INTO `sys_logininfor` VALUES (396, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:39:17');
INSERT INTO `sys_logininfor` VALUES (397, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:39:21');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:41:42');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:41:47');
INSERT INTO `sys_logininfor` VALUES (400, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:42:03');
INSERT INTO `sys_logininfor` VALUES (401, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:42:06');
INSERT INTO `sys_logininfor` VALUES (402, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:45:32');
INSERT INTO `sys_logininfor` VALUES (403, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:45:34');
INSERT INTO `sys_logininfor` VALUES (404, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:45:44');
INSERT INTO `sys_logininfor` VALUES (405, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:48:26');
INSERT INTO `sys_logininfor` VALUES (406, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 19:55:45');
INSERT INTO `sys_logininfor` VALUES (407, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 19:59:43');
INSERT INTO `sys_logininfor` VALUES (408, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 20:00:06');
INSERT INTO `sys_logininfor` VALUES (409, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 20:01:20');
INSERT INTO `sys_logininfor` VALUES (410, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 20:02:34');
INSERT INTO `sys_logininfor` VALUES (411, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '1', '用户不存在/密码错误', '2026-06-25 20:05:58');
INSERT INTO `sys_logininfor` VALUES (412, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 20:06:07');
INSERT INTO `sys_logininfor` VALUES (413, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 20:09:26');
INSERT INTO `sys_logininfor` VALUES (414, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 20:16:33');
INSERT INTO `sys_logininfor` VALUES (415, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-25 20:42:41');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', '', '', '1', '验证码已失效', '2026-06-25 20:46:19');
INSERT INTO `sys_logininfor` VALUES (417, 'customer01', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '退出成功', '2026-06-25 20:56:44');
INSERT INTO `sys_logininfor` VALUES (418, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 15:58:04');
INSERT INTO `sys_logininfor` VALUES (419, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 15:58:07');
INSERT INTO `sys_logininfor` VALUES (420, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 16:04:21');
INSERT INTO `sys_logininfor` VALUES (421, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 17:34:26');
INSERT INTO `sys_logininfor` VALUES (422, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 17:58:36');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 17:58:52');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 18:07:36');
INSERT INTO `sys_logininfor` VALUES (425, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 18:07:51');
INSERT INTO `sys_logininfor` VALUES (426, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:00:06');
INSERT INTO `sys_logininfor` VALUES (427, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:06:57');
INSERT INTO `sys_logininfor` VALUES (428, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:07:30');
INSERT INTO `sys_logininfor` VALUES (429, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:08:38');
INSERT INTO `sys_logininfor` VALUES (430, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:08:56');
INSERT INTO `sys_logininfor` VALUES (431, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:10:25');
INSERT INTO `sys_logininfor` VALUES (432, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:10:34');
INSERT INTO `sys_logininfor` VALUES (433, 'customer01', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:12:07');
INSERT INTO `sys_logininfor` VALUES (434, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:12:18');
INSERT INTO `sys_logininfor` VALUES (435, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:13:05');
INSERT INTO `sys_logininfor` VALUES (436, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:13:22');
INSERT INTO `sys_logininfor` VALUES (437, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:24:01');
INSERT INTO `sys_logininfor` VALUES (438, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:24:19');
INSERT INTO `sys_logininfor` VALUES (439, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-26 20:30:47');
INSERT INTO `sys_logininfor` VALUES (440, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:30:52');
INSERT INTO `sys_logininfor` VALUES (441, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:35:54');
INSERT INTO `sys_logininfor` VALUES (442, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:46:14');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-26 20:46:26');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:46:29');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:46:35');
INSERT INTO `sys_logininfor` VALUES (446, 'gen15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-26 20:46:56');
INSERT INTO `sys_logininfor` VALUES (447, 'gnz15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-26 20:47:05');
INSERT INTO `sys_logininfor` VALUES (448, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:47:22');
INSERT INTO `sys_logininfor` VALUES (449, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:49:52');
INSERT INTO `sys_logininfor` VALUES (450, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:50:05');
INSERT INTO `sys_logininfor` VALUES (451, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:50:58');
INSERT INTO `sys_logininfor` VALUES (452, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:51:18');
INSERT INTO `sys_logininfor` VALUES (453, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:51:32');
INSERT INTO `sys_logininfor` VALUES (454, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:51:45');
INSERT INTO `sys_logininfor` VALUES (455, 'merchant_bj', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-26 20:52:18');
INSERT INTO `sys_logininfor` VALUES (456, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-26 20:52:33');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-03-06 01:54:37', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-03-06 01:54:37', 'admin', '2026-06-17 20:49:06', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-03-06 01:54:37', 'admin', '2026-06-17 20:49:11', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '业务管理', 0, 2, 'biz', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2026-06-17 20:30:24', 'admin', '2026-06-17 20:48:56', '业务管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-03-06 01:54:37', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-03-06 01:54:37', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-03-06 01:54:37', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-03-06 01:54:37', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-03-06 01:54:37', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-03-06 01:54:37', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-03-06 01:54:37', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-03-06 01:54:37', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-03-06 01:54:37', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-03-06 01:54:37', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-03-06 01:54:37', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-03-06 01:54:37', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-03-06 01:54:37', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-03-06 01:54:37', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-03-06 01:54:37', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-03-06 01:54:37', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-03-06 01:54:37', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-03-06 01:54:37', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-03-06 01:54:37', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-03-06 01:54:37', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '订单管理', 4, 5, 'order', 'biz/order/index', NULL, 'Order', 1, 0, 'C', '0', '0', 'biz:order:list', 'list', 'admin', '2026-06-17 20:41:07', '', NULL, '订单管理菜单');
INSERT INTO `sys_menu` VALUES (2001, '订单查询', 2000, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:query', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '订单取消', 2000, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:cancel', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '订单完成', 2000, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:complete', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '订单退款', 2000, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:refund', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '订单修改', 2000, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:edit', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '订单删除', 2000, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'biz:order:remove', '#', 'admin', '2026-06-17 20:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3001, '商户管理', 4, 1, 'merchant', 'biz/merchant/index', NULL, 'Merchant', 1, 0, 'C', '0', '0', 'biz:merchant:list', 'peoples', 'admin', '2026-06-17 20:47:19', '', NULL, '商户管理菜单');
INSERT INTO `sys_menu` VALUES (3002, '商户审核', 4, 2, 'merchantAudit', 'biz/merchant/audit', NULL, 'MerchantAudit', 1, 0, 'C', '0', '0', 'biz:merchant:audit', 'checkbox', 'admin', '2026-06-17 20:47:19', '', NULL, '商户审核菜单');
INSERT INTO `sys_menu` VALUES (3003, '评价管理', 4, 3, 'comment', 'biz/comment/index', NULL, 'Comment', 1, 0, 'C', '0', '0', 'biz:comment:list', 'message', 'admin', '2026-06-17 20:47:19', '', NULL, '评价管理菜单');
INSERT INTO `sys_menu` VALUES (3004, '支付记录', 4, 4, 'payment', 'biz/payment/index', NULL, 'Payment', 1, 0, 'C', '0', '0', 'biz:payment:list', 'money', 'admin', '2026-06-17 20:47:19', '', NULL, '支付记录菜单');
INSERT INTO `sys_menu` VALUES (4000, '酒店管理', 4, 6, 'hotelManage', '', '', '', 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2026-06-24 15:59:08', '', NULL, '酒店管理目录');
INSERT INTO `sys_menu` VALUES (4001, '酒店信息', 4000, 1, 'hotelInfo', 'biz/hotelManage/hotelInfo', '', '', 1, 0, 'C', '0', '0', 'biz:hotel:list', 'component', 'admin', '2026-06-24 15:59:08', '', NULL, '酒店信息菜单');
INSERT INTO `sys_menu` VALUES (4002, '房源管理', 4000, 2, 'roomManage', 'biz/hotelManage/roomManage', '', '', 1, 0, 'C', '0', '0', 'biz:room:list', 'list', 'admin', '2026-06-24 15:59:08', '', NULL, '房源管理菜单');
INSERT INTO `sys_menu` VALUES (4003, '酒店分类', 4000, 3, 'category', 'biz/hotelManage/category', '', '', 1, 0, 'C', '0', '0', 'biz:category:list', 'tree', 'admin', '2026-06-24 15:59:08', '', NULL, '酒店分类菜单');
INSERT INTO `sys_menu` VALUES (4004, '酒店审核', 4, 7, 'hotelAudit', 'biz/hotelManage/hotelAudit', NULL, '', 1, 0, 'C', '0', '0', 'biz:hotelAudit:list', 'checkbox', '', '2026-06-24 18:50:50', 'admin', '2026-06-24 19:10:34', '');
INSERT INTO `sys_menu` VALUES (4010, '酒店查询', 4001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotel:query', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4011, '酒店新增', 4001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotel:add', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4012, '酒店修改', 4001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotel:edit', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4013, '酒店删除', 4001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotel:remove', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4014, '房源查询', 4002, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:room:query', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4015, '房源新增', 4002, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:room:add', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4016, '房源修改', 4002, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:room:edit', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4017, '房源删除', 4002, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:room:remove', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4018, '分类查询', 4003, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:category:query', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4019, '分类新增', 4003, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:category:add', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4020, '分类修改', 4003, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:category:edit', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (4021, '分类删除', 4003, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:category:remove', '#', 'admin', '2026-06-24 15:59:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5001, '商户中心', 4, 0, 'merchant', 'biz/merchant/index', NULL, '', 1, 0, 'C', '0', '0', '', 'home', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5002, '酒店管理', 4, 0, 'hotel', 'biz/hotel/index', NULL, '', 1, 0, 'C', '0', '0', '', 'building', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5003, '房型管理', 4, 0, 'room', 'biz/room/index', NULL, '', 1, 0, 'C', '0', '0', '', 'component', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5004, '评价管理', 4, 0, 'comment', 'biz/merchantComments', NULL, '', 1, 0, 'C', '0', '0', '', 'star', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5005, '数据统计', 4, 0, 'statistics', 'biz/statistics/index', NULL, '', 1, 0, 'C', '0', '0', '', 'chart', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5006, '通知中心', 4, 0, 'notice', 'biz/notice/index', NULL, '', 1, 0, 'C', '0', '0', '', 'message', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5007, '营收报表', 4, 0, 'statistics/report', 'biz/statistics/report', NULL, '', 1, 0, 'C', '0', '0', '', 'documentation', '', '2026-06-24 17:59:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5008, '审核查询', 4004, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotelAudit:query', '#', 'admin', '2026-06-24 19:52:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5009, '审核修改', 4004, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'biz:hotelAudit:edit', '#', 'admin', '2026-06-24 19:52:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (5010, '订单管理', 4, 3, 'merchant/order', 'biz/merchant/order', NULL, '', 1, 0, 'C', '0', '0', '', 'list', '', '2026-06-26 17:57:13', '', NULL, '商户订单管理菜单');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-03-06 01:54:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-03-06 01:54:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (10, '入驻申请审核通过', '1', 0xE681ADE5969CEFBC81E682A8E79A84E585A5E9A9BBE794B3E8AFB7E5B7B2E5AEA1E6A0B8E9809AE8BF87EFBC8CE682A8E78EB0E59CA8E58FAFE4BBA5E6ADA3E5B8B8E4BDBFE794A8E59586E688B7E58A9FE883BDEFBC8CE58C85E68BACE6B7BBE58AA0E98592E5BA97E38081E7AEA1E79086E688BFE59E8BE7AD89E38082, '0', 'hero2192039831@163.com', '2026-06-25 15:55:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `book`;\\nCREATE TABLE `book` (\\n  `book_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书的唯一标识符\',\\n  `title` varchar(255) NOT NULL COMMENT \'书名\',\\n  `author` varchar(100) DEFAULT NULL COMMENT \'作者\',\\n  `isbn` varchar(60) NOT NULL,\\n  `publisher` varchar(100) DEFAULT NULL COMMENT \'出版社\',\\n  `publication_year` int DEFAULT NULL COMMENT \'出版年份\',\\n  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'封面图片\',\\n  `price` decimal(10,2) DEFAULT NULL COMMENT \'价格\',\\n  `category_id` bigint unsigned DEFAULT NULL COMMENT \'图书分类号\\\\n\',\\n  `language` varchar(50) DEFAULT NULL COMMENT \'图书语言\',\\n  `total_copies` int unsigned DEFAULT \'0\' COMMENT \'总副本数\',\\n  `available_copies` int unsigned DEFAULT \'0\' COMMENT \'可用副本数\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'馆藏地址\',\\n  `status` tinyint unsigned DEFAULT \'1\' COMMENT \'状态:AVAILABLE(1, \\\"在架\\\"),\\\\n// 表示书籍下架的状态\\\\nOFF_SHELF(2, \\\"未上架\\\");\\\\n\',\\n  `description` text COMMENT \'图书介绍\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `attachment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'图书附件URL\',\\n  PRIMARY KEY (`book_id`),\\n  KEY `idx_isbn` (`isbn`),\\n  KEY `idx_author` (`author`)\\n) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 02:16:57', 7);
INSERT INTO `sys_oper_log` VALUES (101, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `book`;\\nCREATE TABLE `book` (\\n  `book_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书的唯一标识符\',\\n  `title` varchar(255) NOT NULL COMMENT \'书名\',\\n  `author` varchar(100) DEFAULT NULL COMMENT \'作者\',\\n  `isbn` varchar(60) NOT NULL,\\n  `publisher` varchar(100) DEFAULT NULL COMMENT \'出版社\',\\n  `publication_year` int DEFAULT NULL COMMENT \'出版年份\',\\n  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'封面图片\',\\n  `price` decimal(10,2) DEFAULT NULL COMMENT \'价格\',\\n  `category_id` bigint unsigned DEFAULT NULL COMMENT \'图书分类号\\\\n\',\\n  `language` varchar(50) DEFAULT NULL COMMENT \'图书语言\',\\n  `total_copies` int unsigned DEFAULT \'0\' COMMENT \'总副本数\',\\n  `available_copies` int unsigned DEFAULT \'0\' COMMENT \'可用副本数\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'馆藏地址\',\\n  `status` tinyint unsigned DEFAULT \'1\' COMMENT \'状态:AVAILABLE(1, \\\"在架\\\"),\\\\n// 表示书籍下架的状态\\\\nOFF_SHELF(2, \\\"未上架\\\");\\\\n\',\\n  `description` text COMMENT \'图书介绍\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `attachment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'图书附件URL\',\\n  PRIMARY KEY (`book_id`),\\n  KEY `idx_isbn` (`isbn`),\\n  KEY `idx_author` (`author`)\\n) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 02:17:08', 5);
INSERT INTO `sys_oper_log` VALUES (102, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `book` (\\n  `book_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书的唯一标识符\',\\n  `title` varchar(255) NOT NULL COMMENT \'书名\',\\n  `author` varchar(100) DEFAULT NULL COMMENT \'作者\',\\n  `isbn` varchar(60) NOT NULL,\\n  `publisher` varchar(100) DEFAULT NULL COMMENT \'出版社\',\\n  `publication_year` int DEFAULT NULL COMMENT \'出版年份\',\\n  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'封面图片\',\\n  `price` decimal(10,2) DEFAULT NULL COMMENT \'价格\',\\n  `category_id` bigint unsigned DEFAULT NULL COMMENT \'图书分类号\\\\n\',\\n  `language` varchar(50) DEFAULT NULL COMMENT \'图书语言\',\\n  `total_copies` int unsigned DEFAULT \'0\' COMMENT \'总副本数\',\\n  `available_copies` int unsigned DEFAULT \'0\' COMMENT \'可用副本数\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'馆藏地址\',\\n  `status` tinyint unsigned DEFAULT \'1\' COMMENT \'状态:AVAILABLE(1, \\\"在架\\\"),\\\\n// 表示书籍下架的状态\\\\nOFF_SHELF(2, \\\"未上架\\\");\\\\n\',\\n  `description` text COMMENT \'图书介绍\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `attachment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'图书附件URL\',\\n  PRIMARY KEY (`book_id`),\\n  KEY `idx_isbn` (`isbn`),\\n  KEY `idx_author` (`author`)\\n) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书信息表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 02:19:33', 146);
INSERT INTO `sys_oper_log` VALUES (103, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `book` (\\n  `book_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书的唯一标识符\',\\n  `title` varchar(255) NOT NULL COMMENT \'书名\',\\n  `author` varchar(100) DEFAULT NULL COMMENT \'作者\',\\n  `isbn` varchar(60) NOT NULL,\\n  `publisher` varchar(100) DEFAULT NULL COMMENT \'出版社\',\\n  `publication_year` int DEFAULT NULL COMMENT \'出版年份\',\\n  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'封面图片\',\\n  `price` decimal(10,2) DEFAULT NULL COMMENT \'价格\',\\n  `category_id` bigint unsigned DEFAULT NULL COMMENT \'图书分类号\\\\n\',\\n  `language` varchar(50) DEFAULT NULL COMMENT \'图书语言\',\\n  `total_copies` int unsigned DEFAULT \'0\' COMMENT \'总副本数\',\\n  `available_copies` int unsigned DEFAULT \'0\' COMMENT \'可用副本数\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'馆藏地址\',\\n  `status` tinyint unsigned DEFAULT \'1\' COMMENT \'状态:AVAILABLE(1, \\\"在架\\\"),\\\\n// 表示书籍下架的状态\\\\nOFF_SHELF(2, \\\"未上架\\\");\\\\n\',\\n  `description` text COMMENT \'图书介绍\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `attachment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'图书附件URL\',\\n  PRIMARY KEY (`book_id`),\\n  KEY `idx_isbn` (`isbn`),\\n  KEY `idx_author` (`author`)\\n) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书信息表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 03:18:49', 3);
INSERT INTO `sys_oper_log` VALUES (104, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"drop table if exists sys_student;\\ncreate table sys_student (\\n  student_id           int(11)         auto_increment    comment \'编号\',\\n  student_name         varchar(30)     default \'\'        comment \'学生名称\',\\n  student_age          int(3)          default null      comment \'年龄\',\\n  student_hobby        varchar(30)     default \'\'        comment \'爱好（0代码 1音乐 2电影）\',\\n  student_sex          char(1)         default \'0\'       comment \'性别（0男 1女 2未知）\',\\n  student_status       char(1)         default \'0\'       comment \'状态（0正常 1停用）\',\\n  student_birthday     datetime                          comment \'生日\',\\n  primary key (student_id)\\n) engine=innodb auto_increment=1 comment = \'学生信息表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 03:24:12', 2);
INSERT INTO `sys_oper_log` VALUES (105, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"drop table if exists sys_student;\\ncreate table sys_student (\\n  student_id           int(11)         auto_increment    comment \'编号\',\\n  student_name         varchar(30)     default \'\'        comment \'学生名称\',\\n  student_age          int(3)          default null      comment \'年龄\',\\n  student_hobby        varchar(30)     default \'\'        comment \'爱好（0代码 1音乐 2电影）\',\\n  student_sex          char(1)         default \'0\'       comment \'性别（0男 1女 2未知）\',\\n  student_status       char(1)         default \'0\'       comment \'状态（0正常 1停用）\',\\n  student_birthday     datetime                          comment \'生日\',\\n  primary key (student_id)\\n) engine=innodb auto_increment=1 comment = \'学生信息表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2026-03-06 04:01:53', 2);
INSERT INTO `sys_oper_log` VALUES (106, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `book`;\\nCREATE TABLE `book` (\\n  `book_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书的唯一标识符\',\\n  `title` varchar(255) NOT NULL COMMENT \'书名\',\\n  `author` varchar(100) DEFAULT NULL COMMENT \'作者\',\\n  `isbn` varchar(60) NOT NULL,\\n  `publisher` varchar(100) DEFAULT NULL COMMENT \'出版社\',\\n  `publication_year` int DEFAULT NULL COMMENT \'出版年份\',\\n  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'封面图片\',\\n  `price` decimal(10,2) DEFAULT NULL COMMENT \'价格\',\\n  `category_id` bigint unsigned DEFAULT NULL COMMENT \'图书分类号\',\\n  `language` varchar(50) DEFAULT NULL COMMENT \'图书语言\',\\n  `total_copies` int unsigned DEFAULT \'0\' COMMENT \'总副本数\',\\n  `available_copies` int unsigned DEFAULT \'0\' COMMENT \'可用副本数\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'馆藏地址\',\\n  `status` tinyint unsigned DEFAULT \'1\' COMMENT \'状态:AVAILABLE(1, \\\"在架\\\"),表示书籍下架的状态OFF_SHELF(2, \\\"未上架\\\");\',\\n  `description` text COMMENT \'图书介绍\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `attachment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'图书附件URL\',\\n  PRIMARY KEY (`book_id`),\\n  KEY `idx_isbn` (`isbn`),\\n  KEY `idx_author` (`author`)\\n) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书信息表\';\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:07:36', 475);
INSERT INTO `sys_oper_log` VALUES (107, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `book_category`;\\nCREATE TABLE `book_category` (\\n  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'图书分类ID\',\\n  `category_name` varchar(100) NOT NULL COMMENT \'图书分类名称\',\\n  `status` tinyint DEFAULT \'1\' COMMENT \'分类状态：1=启用，0=禁用\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  `description` varchar(150) DEFAULT NULL,\\n  PRIMARY KEY (`category_id`),\\n  KEY `idx_status` (`status`)\\n) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT=\'图书分类表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:07:58', 104);
INSERT INTO `sys_oper_log` VALUES (108, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `book_copy`;\\nCREATE TABLE `book_copy` (\\n  `copy_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'副本ID\',\\n  `book_id` bigint NOT NULL COMMENT \'图书ID\',\\n  `barcode` varchar(255) NOT NULL COMMENT \'条形码\',\\n  `location` varchar(255) DEFAULT NULL COMMENT \'存放位置\',\\n  `status` tinyint DEFAULT \'1\' COMMENT \'副本状态：AVAILABLE(1, \\\"可借\\\"),\\\\nBORROWED(2, \\\"已借出\\\"),\\\\nDAMAGED(3, \\\"损坏\\\"),\\\\nLOST(4, \\\"遗失\\\");\\\\n\\\\n\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  PRIMARY KEY (`copy_id`),\\n  UNIQUE KEY `barcode` (`barcode`)\\n) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT=\'图书副本表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:08:17', 108);
INSERT INTO `sys_oper_log` VALUES (109, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `borrow_record`;\\nCREATE TABLE `borrow_record` (\\n  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT \'借阅记录ID\',\\n  `copy_id` bigint NOT NULL COMMENT \'图书副本ID\',\\n  `reader_id` bigint NOT NULL COMMENT \'读者ID\',\\n  `borrow_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT \'借阅日期\',\\n  `due_date` datetime NOT NULL COMMENT \'应还日期\',\\n  `return_date` datetime DEFAULT NULL COMMENT \'实际还书日期\',\\n  `overdue_days` int DEFAULT \'0\' COMMENT \'逾期天数\',\\n  `status` tinyint DEFAULT \'1\' COMMENT \'借阅状态：BORROWED(1, \\\"借出\\\"),\\\\nRETURNED(2, \\\"已归还\\\"),\\\\nOVERDUE(3, \\\"逾期\\\"),\\\\nLOST(4, \\\"遗失\\\");\\\\n\',\\n  `is_overdue` tinyint(1) DEFAULT NULL COMMENT \'是否逾期\',\\n  `fine` decimal(10,2) DEFAULT \'0.00\' COMMENT \'罚款金额\',\\n  `remark` varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  PRIMARY KEY (`record_id`),\\n  KEY `idx_copy_id` (`copy_id`),\\n  KEY `idx_reader_id` (`reader_id`)\\n) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb3 COMMENT=\'借阅记录表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:08:34', 158);
INSERT INTO `sys_oper_log` VALUES (110, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `reader`;\\nCREATE TABLE `reader` (\\n  `reader_id` bigint NOT NULL AUTO_INCREMENT,\\n  `reader_number` varchar(50) NOT NULL COMMENT \'学号/工号\',\\n  `name` varchar(100) NOT NULL COMMENT \'读者姓名\',\\n  `grade_major` varchar(150) DEFAULT NULL COMMENT \'年级专业\',\\n  `gender` char(1) DEFAULT NULL COMMENT \'性别，M-男，F-女\',\\n  `avatar_url` varchar(255) DEFAULT NULL COMMENT \'读者相片\',\\n  `type` tinyint DEFAULT \'1\' COMMENT \'读者类型：1=学生，2=职工\',\\n  `borrow_limit` int DEFAULT \'5\' COMMENT \'借书额度\',\\n  `email` varchar(100) DEFAULT NULL COMMENT \'邮箱地址\',\\n  `phone` varchar(20) DEFAULT NULL COMMENT \'联系电话\',\\n  `department_id` bigint NOT NULL COMMENT \'所属部门ID\',\\n  `status` tinyint DEFAULT \'1\' COMMENT \'读者状态：\\\\nNORMAL(1, \\\"正常\\\"),\\\\nLOSS(2, \\\"挂失\\\"),\\\\nCANCEL(3, \\\"注销\\\");\\\\n\',\\n  `user_id` bigint DEFAULT NULL COMMENT \'关联的用户ID\',\\n  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT \'备注\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  PRIMARY KEY (`reader_id`),\\n  UNIQUE KEY `email` (`email`),\\n  UNIQUE KEY `phone` (`phone`),\\n  KEY `reader_number` (`reader_number`),\\n  KEY `email_2` (`email`),\\n  KEY `phone_2` (`phone`),\\n  KEY `fk_user_id` (`user_id`)\\n) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COMMENT=\'读者表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:08:52', 189);
INSERT INTO `sys_oper_log` VALUES (111, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"DROP TABLE IF EXISTS `reservation`;\\nCREATE TABLE `reservation` (\\n  `res_id` bigint unsigned NOT NULL AUTO_INCREMENT,\\n  `book_id` bigint NOT NULL COMMENT \'图书ID\',\\n  `reader_id` int NOT NULL COMMENT \'读者ID\',\\n  `reservation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT \'预约日期\',\\n  `status` tinyint DEFAULT \'1\' COMMENT \'预约状态：1=待处理，2=已完成，3=已取消,4-超期作废\',\\n  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT \'创建时间\',\\n  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\\n  `remark` varchar(1024) DEFAULT NULL COMMENT \'备注\',\\n  `created_by` varchar(60) DEFAULT NULL COMMENT \'创建人\',\\n  `updated_by` varchar(60) DEFAULT NULL COMMENT \'更新人\',\\n  PRIMARY KEY (`res_id`),\\n  KEY `reader_id` (`reader_id`),\\n  KEY `book_id` (`book_id`)\\n) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT=\'预约表\';\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-06 04:09:09', 100);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"reservation,reader,borrow_record,book_copy,book_category,book\"}', NULL, 0, NULL, '2026-03-06 04:09:34', 555);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFie', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:17:31', 170);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:17:31\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:17:31\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:17:31\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:27:17', 84);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"BorrowRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"借阅记录ID\",\"columnId\":37,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CopyId\",\"columnComment\":\"图书副本ID\",\"columnId\":38,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":39,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BorrowDate\",\"columnComment\":\"借阅日期\",\"columnId\":40,\"columnName\":\"borrow_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:35:38', 102);
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"读者类型\",\"dictType\":\"reader_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:46:16', 27);
INSERT INTO `sys_oper_log` VALUES (117, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 01:46:16\",\"dictId\":100,\"dictName\":\"读者类型\",\"dictType\":\"reader_type\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:46:24', 39);
INSERT INTO `sys_oper_log` VALUES (118, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 01:46:16\",\"dictId\":100,\"dictName\":\"读者类型\",\"dictType\":\"reader_type\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:46:53', 35);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"学生\",\"dictSort\":0,\"dictType\":\"reader_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:49:32', 27);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"职工\",\"dictSort\":1,\"dictType\":\"reader_type\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:49:44', 15);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:50:53', 88);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:50:53\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:50:53\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:50:53\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:51:33', 79);
INSERT INTO `sys_oper_log` VALUES (123, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"借阅状态\",\"dictType\":\"borrow_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:52:17', 20);
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"借出\",\"dictSort\":0,\"dictType\":\"borrow_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:53:09', 19);
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已归还\",\"dictSort\":1,\"dictType\":\"borrow_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:53:29', 37);
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"逾期\",\"dictSort\":2,\"dictType\":\"borrow_status\",\"dictValue\":\"3\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:53:53', 26);
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"遗失\",\"dictSort\":4,\"dictType\":\"borrow_status\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:54:06', 25);
INSERT INTO `sys_oper_log` VALUES (128, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 01:54:06\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"遗失\",\"dictSort\":3,\"dictType\":\"borrow_status\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:54:22', 20);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:27:17\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 01:54:31', 97);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"BorrowRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"借阅记录ID\",\"columnId\":37,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:35:38\",\"usableColumn\":false},{\"capJavaField\":\"CopyId\",\"columnComment\":\"图书副本ID\",\"columnId\":38,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:35:38\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":39,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:35:38\",\"usableColumn\":false},{\"capJavaField\":\"BorrowDate\",\"columnComment\":\"借阅日期\",\"columnId\":40,\"columnName\":\"borrow_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:02:43', 105);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"copy\",\"className\":\"BookCopy\",\"columns\":[{\"capJavaField\":\"CopyId\",\"columnComment\":\"副本ID\",\"columnId\":30,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":31,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Barcode\",\"columnComment\":\"条形码\",\"columnId\":32,\"columnName\":\"barcode\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"barcode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnComment\":\"存放位置\",\"columnId\":33,\"columnName\":\"location\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"lo', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:13:15', 47);
INSERT INTO `sys_oper_log` VALUES (132, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"图书分类状态\",\"dictType\":\"category_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:14:40', 21);
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":0,\"dictType\":\"category_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:14:58', 15);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":1,\"dictType\":\"category_status\",\"dictValue\":\"0\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:15:15', 20);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"BookCategory\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"图书分类ID\",\"columnId\":22,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryName\",\"columnComment\":\"图书分类名称\",\"columnId\":23,\"columnName\":\"category_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"分类状态：1=启用，0=禁用\",\"columnId\":24,\"columnName\":\"status\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreatedTime\",\"columnComment\":\"创建时间\",\"columnId\":25,\"columnName\":\"created_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:15:32', 43);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"BookCategory\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"图书分类ID\",\"columnId\":22,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:15:31\",\"usableColumn\":false},{\"capJavaField\":\"CategoryName\",\"columnComment\":\"图书分类名称\",\"columnId\":23,\"columnName\":\"category_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:15:31\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"分类状态：1=启用，0=禁用\",\"columnId\":24,\"columnName\":\"status\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"category_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:15:31\",\"usableColumn\":false},{\"capJavaField\":\"CreatedTime\",\"columnComment\":\"创建时间\",\"columnId\":25,\"columnName\":\"created_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"e', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:16:18', 55);
INSERT INTO `sys_oper_log` VALUES (137, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"图书状态\",\"dictType\":\"book_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:49:38', 17);
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在架\",\"dictSort\":0,\"dictType\":\"book_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:50:02', 17);
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未上架\",\"dictSort\":1,\"dictType\":\"book_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:50:14', 19);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 02:50:13\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"未上架\",\"dictSort\":1,\"dictType\":\"book_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:50:21', 22);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-03-09 01:49:32\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"学生\",\"dictSort\":0,\"dictType\":\"reader_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:50:35', 21);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"图书的唯一标识符\",\"columnId\":1,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"书名\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":3,\"columnName\":\"author\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Isbn\",\"columnId\":4,\"columnName\":\"isbn\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"isbn\",\"javaType\":\"String\",\"list\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:50:55', 91);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"图书的唯一标识符\",\"columnId\":1,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:50:55\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"书名\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:50:55\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":3,\"columnName\":\"author\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:50:55\",\"usableColumn\":false},{\"capJavaField\":\"Isbn\",\"columnId\":4,\"columnName\":\"isbn\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:52:28', 96);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"Reservation\",\"columns\":[{\"capJavaField\":\"ResId\",\"columnId\":70,\"columnName\":\"res_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"resId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":71,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":72,\"columnName\":\"reader_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReservationDate\",\"columnComment\":\"预约日期\",\"columnId\":73,\"columnName\":\"reservation_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"reservationDate\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 02:52:37', 59);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"reservation,reader,borrow_record,book_copy,book_category,book\"}', NULL, 0, NULL, '2026-03-09 02:52:43', 1159);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"Reservation\",\"columns\":[{\"capJavaField\":\"ResId\",\"columnId\":70,\"columnName\":\"res_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"resId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:37\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":71,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:37\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":72,\"columnName\":\"reader_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:37\",\"usableColumn\":false},{\"capJavaField\":\"ReservationDate\",\"columnComment\":\"预约日期\",\"columnId\":73,\"columnName\":\"reservation_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:02:08', 59);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"Reservation\",\"columns\":[{\"capJavaField\":\"ResId\",\"columnId\":70,\"columnName\":\"res_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"resId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:08\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":71,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:08\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":72,\"columnName\":\"reader_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:08\",\"usableColumn\":false},{\"capJavaField\":\"ReservationDate\",\"columnComment\":\"预约日期\",\"columnId\":73,\"columnName\":\"reservation_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:02:17', 57);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:54:31\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:54:31\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 01:54:31\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:02:26', 75);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"BorrowRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"借阅记录ID\",\"columnId\":37,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:02:43\",\"usableColumn\":false},{\"capJavaField\":\"CopyId\",\"columnComment\":\"图书副本ID\",\"columnId\":38,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:02:43\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":39,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:02:43\",\"usableColumn\":false},{\"capJavaField\":\"BorrowDate\",\"columnComment\":\"借阅日期\",\"columnId\":40,\"columnName\":\"borrow_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:02:38', 75);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"book\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/book\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:03:43', 38);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-03-09 03:03:43\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"book\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:04:09', 24);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reservation\",\"className\":\"Reservation\",\"columns\":[{\"capJavaField\":\"ResId\",\"columnId\":70,\"columnName\":\"res_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"resId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:17\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":71,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:17\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":72,\"columnName\":\"reader_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:17\",\"usableColumn\":false},{\"capJavaField\":\"ReservationDate\",\"columnComment\":\"预约日期\",\"columnId\":73,\"columnName\":\"reservation_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:09:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:04:26', 59);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"reader\",\"className\":\"Reader\",\"columns\":[{\"capJavaField\":\"ReaderId\",\"columnId\":52,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:26\",\"usableColumn\":false},{\"capJavaField\":\"ReaderNumber\",\"columnComment\":\"学号/工号\",\"columnId\":53,\"columnName\":\"reader_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:26\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"读者姓名\",\"columnId\":54,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:26\",\"usableColumn\":false},{\"capJavaField\":\"GradeMajor\",\"columnComment\":\"年级专业\",\"columnId\":55,\"columnName\":\"grade_major\",\"columnType\":\"varchar(150)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:04:35', 87);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"BorrowRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"借阅记录ID\",\"columnId\":37,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:38\",\"usableColumn\":false},{\"capJavaField\":\"CopyId\",\"columnComment\":\"图书副本ID\",\"columnId\":38,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:38\",\"usableColumn\":false},{\"capJavaField\":\"ReaderId\",\"columnComment\":\"读者ID\",\"columnId\":39,\"columnName\":\"reader_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"readerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 03:02:38\",\"usableColumn\":false},{\"capJavaField\":\"BorrowDate\",\"columnComment\":\"借阅日期\",\"columnId\":40,\"columnName\":\"borrow_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:04:45', 66);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"copy\",\"className\":\"BookCopy\",\"columns\":[{\"capJavaField\":\"CopyId\",\"columnComment\":\"副本ID\",\"columnId\":30,\"columnName\":\"copy_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"copyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:13:15\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书ID\",\"columnId\":31,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:13:15\",\"usableColumn\":false},{\"capJavaField\":\"Barcode\",\"columnComment\":\"条形码\",\"columnId\":32,\"columnName\":\"barcode\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"barcode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:13:15\",\"usableColumn\":false},{\"capJavaField\":\"Location\",\"columnComment\":\"存放位置\",\"columnId\":33,\"columnName\":\"location\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:08:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:05:13', 43);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"BookCategory\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"图书分类ID\",\"columnId\":22,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:16:18\",\"usableColumn\":false},{\"capJavaField\":\"CategoryName\",\"columnComment\":\"图书分类名称\",\"columnId\":23,\"columnName\":\"category_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:16:18\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"分类状态：1=启用，0=禁用\",\"columnId\":24,\"columnName\":\"status\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"category_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:16:18\",\"usableColumn\":false},{\"capJavaField\":\"CreatedTime\",\"columnComment\":\"创建时间\",\"columnId\":25,\"columnName\":\"created_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:58\",\"dictType\":\"\",\"e', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:05:26', 60);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"图书的唯一标识符\",\"columnId\":1,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:28\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"书名\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:28\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":3,\"columnName\":\"author\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-03-09 02:52:28\",\"usableColumn\":false},{\"capJavaField\":\"Isbn\",\"columnId\":4,\"columnName\":\"isbn\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2026-03-06 04:07:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-09 03:05:42', 87);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"reservation,reader,borrow_record,book_copy,book_category,book\"}', NULL, 0, NULL, '2026-03-09 03:05:47', 830);
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"nickName\":\"张三\",\"params\":{},\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"zhangsan\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-10 09:24:30', 127);
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-10 09:24:34', 11);
INSERT INTO `sys_oper_log` VALUES (161, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-10 09:24:36', 14);
INSERT INTO `sys_oper_log` VALUES (162, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-10 09:46:45', 32);
INSERT INTO `sys_oper_log` VALUES (163, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"读者状态\",\"dictType\":\"reader_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-03-10 09:47:20', 23);
INSERT INTO `sys_oper_log` VALUES (164, '图书管理', 2, 'com.ruoyi.book.controller.BookController.update()', 'PUT', 1, 'admin', '研发部门', '/api/admin/book/', '127.0.0.1', '内网IP', '{\"author\":\"豆豆\",\"availableCopies\":7,\"bookId\":146,\"categoryId\":10,\"coverUrl\":\"/profile/upload/2026/04/01/1_20260401103936A001.png\",\"description\":\"都市权谋小说极具魅力，央视同名热播剧原著。\",\"isbn\":\"9787540213657\",\"language\":\"中文\",\"location\":\"B区1排3架\",\"publicationYear\":2005,\"publisher\":\"作家出版社\",\"status\":1,\"title\":\"遥远的救世主\",\"totalCopies\":8} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-04-01 02:39:50', 31);
INSERT INTO `sys_oper_log` VALUES (165, '图书管理', 2, 'com.ruoyi.book.controller.BookController.update()', 'PUT', 1, 'admin', '研发部门', '/api/admin/book/', '127.0.0.1', '内网IP', '{\"author\":\"豆豆\",\"availableCopies\":7,\"bookId\":146,\"categoryId\":10,\"coverUrl\":\"/profile/upload/2026/04/01/1_20260401103936A001.png,/profile/upload/2026/04/01/2_20260401163516A002.png\",\"description\":\"都市权谋小说极具魅力，央视同名热播剧原著。\",\"isbn\":\"9787540213657\",\"language\":\"中文\",\"location\":\"B区1排3架\",\"publicationYear\":2005,\"publisher\":\"作家出版社\",\"status\":1,\"title\":\"遥远的救世主\",\"totalCopies\":8} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-04-01 08:35:18', 19);
INSERT INTO `sys_oper_log` VALUES (166, '商户管理', 1, 'com.zsc.module.controller.MerchantController.add()', 'POST', 1, 'merchant01', '市场部门', '/api/merchant', '127.0.0.1', '内网IP', '{\"address\":\"石岐区学院路一号\",\"businessScope\":\"酒店管理\",\"description\":\"\",\"email\":\"1622633698@qq.com\",\"legalPerson\":\"冲击波\",\"licenseNo\":\"Y9140824CU5EQ5G8EX\",\"logoUrl\":\"\",\"merchantName\":\"AAA皮拽子批发酒店\",\"phone\":\"13316366046\",\"status\":\"0\"} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-06-09 16:41:13', 543);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.zsc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-17 20:30:24\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"biz\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-17 20:48:56', 90);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.zsc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-03-06 01:54:37\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-17 20:49:06', 38);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.zsc.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-03-06 01:54:37\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-17 20:49:11', 30);
INSERT INTO `sys_oper_log` VALUES (170, '商户管理', 1, 'com.zsc.module.controller.MerchantController.add()', 'POST', 1, 'merchant01', '市场部门', '/api/merchant', '127.0.0.1', '内网IP', '{\"address\":\"石岐区学院路一号\",\"businessScope\":\"123456\",\"description\":\"\",\"email\":\"1622633698@qq.com\",\"legalPerson\":\"aaa\",\"licenseNo\":\"Y13311008N32EEJ712\",\"logoUrl\":\"https://ts1.tc.mm.bing.net/th/id/R-C.21b6355339bb8739100e5d38b7916b01?rik=mduC0RML8NRHuQ&riu=http%3a%2f%2fblog.logo123.com%2fwp-content%2fuploads%2f2016%2f11%2f1.jpg&ehk=w8tPvXMUPi8cyftJ%2fmQMm2IbjkVi4SzCM%2bp%2bZB1Lc9U%3d&risl=&pid=ImgRaw&r=0\",\"merchantName\":\"111\",\"phone\":\"13316366046\",\"status\":\"0\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'submit_user_id\' in \'field list\'\r\n### The error may exist in com/zsc/module/mapper/MerchantAuditMapper.java (best guess)\r\n### The error may involve com.zsc.module.mapper.MerchantAuditMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO merchant_audit  ( merchant_id, audit_type, audit_status,     submit_time,  create_time, update_time, submit_user_id )  VALUES (  ?, ?, ?,     ?,  ?, ?, ?  )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'submit_user_id\' in \'field list\'\n; bad SQL grammar []', '2026-06-18 21:45:04', 286);
INSERT INTO `sys_oper_log` VALUES (171, '商户管理', 1, 'com.zsc.module.controller.MerchantController.add()', 'POST', 1, 'merchant01', '市场部门', '/api/merchant', '127.0.0.1', '内网IP', '{\"address\":\"石岐区学院路一号\",\"businessScope\":\"123456\",\"description\":\"\",\"email\":\"1622633698@qq.com\",\"legalPerson\":\"aaa\",\"licenseNo\":\"Y13311008N32EEJ712\",\"logoUrl\":\"https://ts1.tc.mm.bing.net/th/id/R-C.21b6355339bb8739100e5d38b7916b01?rik=mduC0RML8NRHuQ&riu=http%3a%2f%2fblog.logo123.com%2fwp-content%2fuploads%2f2016%2f11%2f1.jpg&ehk=w8tPvXMUPi8cyftJ%2fmQMm2IbjkVi4SzCM%2bp%2bZB1Lc9U%3d&risl=&pid=ImgRaw&r=0\",\"merchantName\":\"111\",\"phone\":\"13316366046\",\"status\":\"0\"} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-06-18 21:54:11', 51);
INSERT INTO `sys_oper_log` VALUES (172, '商户审核管理', 2, 'com.zsc.module.controller.MerchantController.processAudit()', 'PUT', 1, 'admin', '研发部门', '/api/merchant/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"111\",\"auditStatus\":\"1\",\"auditType\":\"1\",\"id\":71,\"merchantId\":1073} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-06-18 22:24:46', 24);
INSERT INTO `sys_oper_log` VALUES (173, '商户酒店管理', 2, 'com.zsc.module.controller.MerchantHotelController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/hotel', '127.0.0.1', '内网IP', '{\"address\":\"泉州市丰泽区丰海路1005号\",\"businessId\":1073,\"facility\":\"WiFi,停车场,游泳池,健身房,餐厅\",\"id\":73,\"imgUrl\":\"https://pic.nximg.cn/file/20151122/21259462_235034561875_2.jpg\",\"name\":\"泉州泰禾洲际酒店\",\"star\":5,\"status\":\"0\"} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 00:51:27', 60);
INSERT INTO `sys_oper_log` VALUES (174, '商户酒店管理', 2, 'com.zsc.module.controller.MerchantHotelController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/hotel', '127.0.0.1', '内网IP', '{\"address\":\"泉州市丰泽区丰海路1005号\",\"businessId\":1073,\"facility\":\"WiFi,停车场,游泳池,健身房,餐厅\",\"id\":73,\"imgUrl\":\"https://ts4.tc.mm.bing.net/th/id/OIP-C.LSeIPMv4pdxMiwnuVf6RtAHaG2?rs=1&pid=ImgDetMain&o=7&rm=3\",\"name\":\"泉州泰禾洲际酒店\",\"star\":5,\"status\":\"0\"} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 00:58:37', 36);
INSERT INTO `sys_oper_log` VALUES (175, '商户房型管理', 2, 'com.zsc.module.controller.MerchantRoomController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/room', '127.0.0.1', '内网IP', '{\"area\":\"38平米\",\"bedType\":\"1.8米大床\",\"hotelId\":73,\"id\":277,\"imgUrl\":\"https://cn.bing.com/images/search?view=detailV2&ccid=vbx4iSrZ&id=F1F8E9BE450086D4EBA5A411E759021714060A5F&thid=OIP.vbx4iSrZeVsZ969iymDudwHaE7&mediaurl=https%3a%2f%2fpavo.elongstatic.com%2fi%2ftHotel800_600%2fIW5g7O5cKk.jpg&exph=533&expw=800&q=%e9%85%92%e5%ba%97%e6%88%bf%e5%9e%8b%e5%9b%be%e7%89%87&FORM=IRPRST&ck=F97AA600C2959A6BFAF1000765426D3F&selectedIndex=0&itb=0\",\"price\":749,\"roomType\":\"豪华大床房\",\"status\":\"0\",\"stock\":28} ', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\r\n### The error may exist in com/zsc/module/mapper/RoomMapper.java (best guess)\r\n### The error may involve com.zsc.module.mapper.RoomMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE room  SET hotel_id=?, room_type=?, area=?, bed_type=?, price=?, stock=?, status=?, img_url=?,  update_time=?  WHERE id=?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'img_url\' at row 1\n; Data truncation: Data too long for column \'img_url\' at row 1', '2026-06-20 01:26:48', 236);
INSERT INTO `sys_oper_log` VALUES (176, '商户房型管理', 2, 'com.zsc.module.controller.MerchantRoomController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/room', '127.0.0.1', '内网IP', '{\"area\":\"38平米\",\"bedType\":\"1.8米大床\",\"hotelId\":73,\"id\":277,\"imgUrl\":\"https://cn.bing.com/images/search?view=detailV2&ccid=vbx4iSrZ&id=F1F8E9BE450086D4EBA5A411E759021714060A5F&thid=OIP.vbx4iSrZeVsZ969iymDudwHaE7&mediaurl=https%3a%2f%2fpavo.elongstatic.com%2fi%2ftHotel800_600%2fIW5g7O5cKk.jpg&exph=533&expw=800&q=%e9%85%92%e5%ba%97%e6%88%bf%e5%9e%8b%e5%9b%be%e7%89%87&FORM=IRPRST&ck=F97AA600C2959A6BFAF1000765426D3F&selectedIndex=0&itb=0\",\"price\":749,\"roomType\":\"豪华大床房\",\"status\":\"0\",\"stock\":28} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 01:28:55', 176);
INSERT INTO `sys_oper_log` VALUES (177, '商户房型管理', 2, 'com.zsc.module.controller.MerchantRoomController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/room', '127.0.0.1', '内网IP', '{\"area\":\"38平米\",\"bedType\":\"1.8米大床\",\"hotelId\":73,\"id\":277,\"imgUrl\":\"https://pavo.elongstatic.com/i/tHotel800_600/IW5g7O5cKk.jpg\",\"price\":749,\"roomType\":\"豪华大床房\",\"status\":\"0\",\"stock\":28} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 01:35:46', 39);
INSERT INTO `sys_oper_log` VALUES (178, '商户房型管理', 2, 'com.zsc.module.controller.MerchantRoomController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/room', '127.0.0.1', '内网IP', '{\"area\":\"42平米\",\"bedType\":\"2张1.2米单人床\",\"hotelId\":73,\"id\":278,\"imgUrl\":\"https://ts3.tc.mm.bing.net/th/id/OIP-C.1Uq_u9irpFlsd3NRbVFrtwHaEH?rs=1&pid=ImgDetMain&o=7&rm=3\",\"price\":879,\"roomType\":\"行政双床房\",\"status\":\"0\",\"stock\":25} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 01:36:20', 40);
INSERT INTO `sys_oper_log` VALUES (179, '商户房型管理', 2, 'com.zsc.module.controller.MerchantRoomController.update()', 'PUT', 1, 'merchant01', '市场部门', '/api/merchant/room', '127.0.0.1', '内网IP', '{\"area\":\"65平米\",\"bedType\":\"1.8米大床+1.2米单人床\",\"hotelId\":73,\"id\":279,\"imgUrl\":\"https://ts3.tc.mm.bing.net/th/id/OIP-C.AgXElXiK98b5ZLm7F7LH1wAAAA?rs=1&pid=ImgDetMain&o=7&rm=3\",\"price\":1239,\"roomType\":\"家庭套房\",\"status\":\"0\",\"stock\":11} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-20 01:36:43', 41);
INSERT INTO `sys_oper_log` VALUES (180, '酒店管理', 1, 'com.zsc.module.controller.HotelController.add()', 'POST', 1, 'admin', '研发部门', '/api/hotel', '127.0.0.1', '内网IP', '{\"address\":\"���Ե�ַ123��\",\"businessId\":1001,\"facility\":\"WiFi,ͣ����\",\"imgUrl\":\"https://example.com/test.jpg\",\"name\":\"���ԾƵ�API\",\"star\":4} ', '{\"code\":200,\"data\":101,\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:31', 40);
INSERT INTO `sys_oper_log` VALUES (181, '酒店管理', 2, 'com.zsc.module.controller.HotelController.update()', 'PUT', 1, 'admin', '研发部门', '/api/hotel', '127.0.0.1', '内网IP', '{\"address\":\"�޸ĺ�ĵ�ַ\",\"id\":101,\"name\":\"���ԾƵ�API-���޸�\",\"star\":5} ', '{\"code\":200,\"data\":\"修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:31', 19);
INSERT INTO `sys_oper_log` VALUES (182, '酒店管理', 2, 'com.zsc.module.controller.HotelController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/api/hotel/101/status/1', '127.0.0.1', '内网IP', '101 \"1\" ', NULL, 1, '目标状态与当前状态相同', '2026-06-24 20:41:31', 7);
INSERT INTO `sys_oper_log` VALUES (183, '酒店管理', 3, 'com.zsc.module.controller.HotelController.delete()', 'DELETE', 1, 'admin', '研发部门', '/api/hotel/101', '127.0.0.1', '内网IP', '101 ', '{\"code\":200,\"data\":\"删除成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:31', 20);
INSERT INTO `sys_oper_log` VALUES (184, '房型管理', 1, 'com.zsc.module.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门', '/api/room', '127.0.0.1', '内网IP', '{\"area\":\"50ƽ��\",\"bedType\":\"��\",\"hotelId\":1,\"price\":888,\"roomType\":\"���Է���\",\"status\":\"0\",\"stock\":10} ', '{\"code\":200,\"data\":389,\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:46', 17);
INSERT INTO `sys_oper_log` VALUES (185, '房型管理', 2, 'com.zsc.module.controller.RoomController.updatePrice()', 'PUT', 1, 'admin', '研发部门', '/api/room/389/price', '127.0.0.1', '内网IP', '{\"price\":\"999\"}', '{\"code\":200,\"data\":\"价格修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:46', 21);
INSERT INTO `sys_oper_log` VALUES (186, '房型管理', 2, 'com.zsc.module.controller.RoomController.updateStock()', 'PUT', 1, 'admin', '研发部门', '/api/room/389/stock', '127.0.0.1', '内网IP', '{\"stock\":\"20\"}', '{\"code\":200,\"data\":\"库存修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:47', 15);
INSERT INTO `sys_oper_log` VALUES (187, '房型管理', 3, 'com.zsc.module.controller.RoomController.delete()', 'DELETE', 1, 'admin', '研发部门', '/api/room/389', '127.0.0.1', '内网IP', '389 ', '{\"code\":200,\"data\":\"删除成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:41:47', 20);
INSERT INTO `sys_oper_log` VALUES (188, '房型管理', 1, 'com.zsc.module.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门', '/api/room', '127.0.0.1', '内网IP', '{\"area\":\"50ƽ��\",\"bedType\":\"��\",\"hotelId\":1,\"price\":888,\"roomType\":\"���Է���\",\"status\":\"0\",\"stock\":10} ', '{\"code\":200,\"data\":390,\"message\":\"success\"}', 0, NULL, '2026-06-24 20:42:26', 13);
INSERT INTO `sys_oper_log` VALUES (189, '房型管理', 1, 'com.zsc.module.controller.RoomController.add()', 'POST', 1, 'admin', '研发部门', '/api/room', '127.0.0.1', '内网IP', '{\"area\":\"50ƽ��\",\"bedType\":\"��\",\"hotelId\":1,\"price\":888,\"roomType\":\"���Է���\",\"status\":\"0\",\"stock\":10} ', '{\"code\":200,\"data\":391,\"message\":\"success\"}', 0, NULL, '2026-06-24 20:42:26', 14);
INSERT INTO `sys_oper_log` VALUES (190, '房型管理', 2, 'com.zsc.module.controller.RoomController.updatePrice()', 'PUT', 1, 'admin', '研发部门', '/api/room/389/price', '127.0.0.1', '内网IP', '{\"price\":\"999\"}', NULL, 1, '房型不存在', '2026-06-24 20:42:27', 4);
INSERT INTO `sys_oper_log` VALUES (191, '房型管理', 2, 'com.zsc.module.controller.RoomController.updateStock()', 'PUT', 1, 'admin', '研发部门', '/api/room/389/stock', '127.0.0.1', '内网IP', '{\"stock\":\"20\"}', NULL, 1, '房型不存在', '2026-06-24 20:42:27', 5);
INSERT INTO `sys_oper_log` VALUES (192, '房型管理', 3, 'com.zsc.module.controller.RoomController.delete()', 'DELETE', 1, 'admin', '研发部门', '/api/room/389', '127.0.0.1', '内网IP', '389 ', NULL, 1, '房型不存在', '2026-06-24 20:42:27', 5);
INSERT INTO `sys_oper_log` VALUES (193, '房型管理', 2, 'com.zsc.module.controller.RoomController.updatePrice()', 'PUT', 1, 'admin', '研发部门', '/api/room/391/price', '127.0.0.1', '内网IP', '{\"price\":\"999\"}', '{\"code\":200,\"data\":\"价格修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:42:42', 16);
INSERT INTO `sys_oper_log` VALUES (194, '房型管理', 2, 'com.zsc.module.controller.RoomController.updateStock()', 'PUT', 1, 'admin', '研发部门', '/api/room/391/stock', '127.0.0.1', '内网IP', '{\"stock\":\"20\"}', '{\"code\":200,\"data\":\"库存修改成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:42:42', 13);
INSERT INTO `sys_oper_log` VALUES (195, '房型管理', 3, 'com.zsc.module.controller.RoomController.delete()', 'DELETE', 1, 'admin', '研发部门', '/api/room/391', '127.0.0.1', '内网IP', '391 ', '{\"code\":200,\"data\":\"删除成功\",\"message\":\"success\"}', 0, NULL, '2026-06-24 20:42:42', 16);
INSERT INTO `sys_oper_log` VALUES (196, '酒店审核管理', 2, 'com.zsc.module.controller.HotelAuditController.approve()', 'PUT', 1, 'admin', '研发部门', '/api/hotelAudit/1/approve', '127.0.0.1', '内网IP', '1 {\"auditOpinion\":\"�������ͨ��\"} ', NULL, 1, '该酒店当前不是待审核状态，无法进行审核操作！', '2026-06-24 21:08:41', 14);
INSERT INTO `sys_oper_log` VALUES (197, '商户管理', 1, 'com.zsc.module.controller.MerchantController.add()', 'POST', 1, 'hero2192039831@163.com', '若依科技', '/api/merchant', '127.0.0.1', '内网IP', '{\"address\":\"zsc\",\"businessScope\":\"酒店\",\"description\":\"123\",\"email\":\"hero2192039831@163.com\",\"legalPerson\":\"lyx\",\"licenseNo\":\"91440101MA5B3C4D2E\",\"logoUrl\":\"欧ku\",\"merchantName\":\"lyx\",\"phone\":\"17359201669\",\"status\":\"0\"} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-06-25 15:54:27', 33);
INSERT INTO `sys_oper_log` VALUES (198, '商户审核管理', 2, 'com.zsc.module.controller.MerchantController.processAudit()', 'PUT', 1, 'admin', '研发部门', '/api/merchant/audit', '127.0.0.1', '内网IP', '{\"auditOpinion\":\"通过\",\"auditStatus\":\"1\",\"auditType\":\"1\",\"id\":72,\"merchantId\":1074} ', '{\"code\":200,\"message\":\"success\"}', 0, NULL, '2026-06-25 15:55:15', 30);
INSERT INTO `sys_oper_log` VALUES (199, '商户酒店管理', 1, 'com.zsc.module.controller.MerchantHotelController.add()', 'POST', 1, 'merchant01', '市场部门', '/api/merchant/hotel', '127.0.0.1', '内网IP', '{\"address\":\"zsc\",\"businessId\":1073,\"facility\":\"无\",\"imgUrl\":\"https://picsum.photos/400/300\",\"name\":\"豆涛\",\"star\":1,\"status\":\"1\"} ', '{\"code\":200,\"data\":102,\"message\":\"success\"}', 0, NULL, '2026-06-25 16:10:13', 17);
INSERT INTO `sys_oper_log` VALUES (200, '商户订单管理', 2, 'com.zsc.module.controller.MerchantOrderController.checkin()', 'PUT', 1, 'merchant_bj', '若依科技', '/api/merchant/order/190/checkin', '127.0.0.1', '内网IP', '{\"remark\":\"301\"}', '{\"code\":200,\"data\":\"已办理入住\",\"message\":\"success\"}', 0, NULL, '2026-06-26 20:06:28', 131);
INSERT INTO `sys_oper_log` VALUES (201, '商户订单管理', 2, 'com.zsc.module.controller.MerchantOrderController.checkin()', 'PUT', 1, 'merchant_bj', '若依科技', '/api/merchant/order/206/checkin', '127.0.0.1', '内网IP', '{\"remark\":\"3002\"}', '{\"code\":200,\"data\":\"已办理入住\",\"message\":\"success\"}', 0, NULL, '2026-06-26 20:52:02', 92);
INSERT INTO `sys_oper_log` VALUES (202, '商户订单管理', 2, 'com.zsc.module.controller.MerchantOrderController.checkout()', 'PUT', 1, 'merchant_bj', '若依科技', '/api/merchant/order/206/checkout', '127.0.0.1', '内网IP', '{\"remark\":\"\"}', '{\"code\":200,\"data\":\"已办理退房，订单已完成\",\"message\":\"success\"}', 0, NULL, '2026-06-26 20:52:06', 68);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-03-06 01:54:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-03-06 01:54:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '系统超级管理员，拥有所有权限');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'customer', 2, '5', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '前台普通用户，可以浏览酒店、预订房间');
INSERT INTO `sys_role` VALUES (3, '商家', 'merchant', 3, '3', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '酒店商家，可以管理自己的酒店和房源');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 116);
INSERT INTO `sys_role_menu` VALUES (1, 117);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2002);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2005);
INSERT INTO `sys_role_menu` VALUES (1, 2006);
INSERT INTO `sys_role_menu` VALUES (1, 3001);
INSERT INTO `sys_role_menu` VALUES (1, 3002);
INSERT INTO `sys_role_menu` VALUES (1, 3003);
INSERT INTO `sys_role_menu` VALUES (1, 3004);
INSERT INTO `sys_role_menu` VALUES (1, 4000);
INSERT INTO `sys_role_menu` VALUES (1, 4001);
INSERT INTO `sys_role_menu` VALUES (1, 4002);
INSERT INTO `sys_role_menu` VALUES (1, 4003);
INSERT INTO `sys_role_menu` VALUES (1, 4004);
INSERT INTO `sys_role_menu` VALUES (1, 4010);
INSERT INTO `sys_role_menu` VALUES (1, 4011);
INSERT INTO `sys_role_menu` VALUES (1, 4012);
INSERT INTO `sys_role_menu` VALUES (1, 4013);
INSERT INTO `sys_role_menu` VALUES (1, 4014);
INSERT INTO `sys_role_menu` VALUES (1, 4015);
INSERT INTO `sys_role_menu` VALUES (1, 4016);
INSERT INTO `sys_role_menu` VALUES (1, 4017);
INSERT INTO `sys_role_menu` VALUES (1, 4018);
INSERT INTO `sys_role_menu` VALUES (1, 4019);
INSERT INTO `sys_role_menu` VALUES (1, 4020);
INSERT INTO `sys_role_menu` VALUES (1, 4021);
INSERT INTO `sys_role_menu` VALUES (1, 5008);
INSERT INTO `sys_role_menu` VALUES (1, 5009);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 5001);
INSERT INTO `sys_role_menu` VALUES (3, 5002);
INSERT INTO `sys_role_menu` VALUES (3, 5003);
INSERT INTO `sys_role_menu` VALUES (3, 5004);
INSERT INTO `sys_role_menu` VALUES (3, 5005);
INSERT INTO `sys_role_menu` VALUES (3, 5006);
INSERT INTO `sys_role_menu` VALUES (3, 5007);
INSERT INTO `sys_role_menu` VALUES (3, 5010);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `points` int NULL DEFAULT 0 COMMENT '用户积分',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 312 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', 'admin@hotel.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-26 20:46:30', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '超级管理员账号', 0);
INSERT INTO `sys_user` VALUES (2, 105, 'customer01', '普通用户', '00', 'customer@test.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-26 20:10:35', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '前台普通用户账号', 1298);
INSERT INTO `sys_user` VALUES (100, 104, 'merchant01', '酒店商户', '01', 'merchant@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-25 16:08:04', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '酒店商家账号', 0);
INSERT INTO `sys_user` VALUES (301, 100, 'merchant_bj', '张经理(北京希尔顿)', '00', 'merchant_bj@hotel.com', '13800138001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-26 20:51:45', NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '商家-北京希尔顿', 0);
INSERT INTO `sys_user` VALUES (302, 100, 'merchant_sh', '李总(上海华尔道夫)', '00', 'merchant_sh@hotel.com', '13800138002', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '商家-上海华尔道夫', 0);
INSERT INTO `sys_user` VALUES (303, 100, 'merchant_gz', '王总(广州丽思卡尔顿)', '00', 'merchant_gz@hotel.com', '13800138003', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '商家-广州丽思卡尔顿', 0);
INSERT INTO `sys_user` VALUES (304, 100, 'merchant_hz', '孙总(杭州西湖国宾馆)', '00', 'merchant_hz@hotel.com', '13800138005', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '商家-杭州西湖国宾馆', 0);
INSERT INTO `sys_user` VALUES (305, 100, 'test_user1', '旅游达人小王', '00', 'test_user1@test.com', '13900000101', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-23 17:32:52', NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '普通用户', 2547);
INSERT INTO `sys_user` VALUES (306, 100, 'test_user2', '出差老李', '00', 'test_user2@test.com', '13900000102', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '普通用户', 759);
INSERT INTO `sys_user` VALUES (307, 100, 'test_user3', '度假小红', '00', 'test_user3@test.com', '13900000103', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '普通用户', 3516);
INSERT INTO `sys_user` VALUES (308, 100, 'test_user4', '商务张总', '00', 'test_user4@test.com', '13900000104', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '普通用户', 2158);
INSERT INTO `sys_user` VALUES (309, 100, 'test_user5', '蜜月小周', '00', 'test_user5@test.com', '13900000105', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-23 08:57:53', '', NULL, '普通用户', 4095);
INSERT INTO `sys_user` VALUES (310, 100, 'gez15036734839@163.com', 'onz', '00', 'gez15036734839@163.com', '13800001234', '2', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-26 20:52:33', NULL, 'admin', '2026-06-24 14:00:00', '', '2026-06-26 20:52:06', '测试用户onz', 4325);
INSERT INTO `sys_user` VALUES (311, 100, 'hero2192039831@163.com', 'lyx', '00', 'hero2192039831@163.com', '', '2', '', '$2a$10$Wa6AYLDxugu9nPiGRVb40epo5YjYgnrRylEamuGdUY3fv36iV7QOa', '0', '0', '127.0.0.1', '2026-06-25 16:00:08', '2026-06-25 15:52:44', 'hero2192039831@163.com', '2026-06-25 15:52:44', '', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 3);
INSERT INTO `sys_user_role` VALUES (301, 3);
INSERT INTO `sys_user_role` VALUES (302, 3);
INSERT INTO `sys_user_role` VALUES (303, 3);
INSERT INTO `sys_user_role` VALUES (304, 3);
INSERT INTO `sys_user_role` VALUES (305, 2);
INSERT INTO `sys_user_role` VALUES (306, 2);
INSERT INTO `sys_user_role` VALUES (307, 2);
INSERT INTO `sys_user_role` VALUES (308, 2);
INSERT INTO `sys_user_role` VALUES (309, 2);
INSERT INTO `sys_user_role` VALUES (311, 3);

SET FOREIGN_KEY_CHECKS = 1;
