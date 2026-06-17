/*
 Navicat Premium Dump SQL

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80404 (8.4.4)
 Source Host           : localhost:3306
 Source Schema         : zsc

 Target Server Type    : MySQL
 Target Server Version : 80404 (8.4.4)
 File Encoding         : 65001

 Date: 17/06/2026 20:54:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `hotel_id` bigint NOT NULL COMMENT '酒店ID',
  `room_id` bigint NULL DEFAULT NULL COMMENT '房型ID',
  `score` int NOT NULL COMMENT '评分（1-5星）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价内容',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片URL',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_room_id`(`room_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2485, 86, 131, 3, '景观很棒，视野开阔。', 'https://example.com/comment1.jpg', '2026-04-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (2, 2025, 20, 286, 4, '非常满意，服务很好！', NULL, '2026-05-31 00:30:58', NULL, '2026-05-31 00:30:58');
INSERT INTO `comment` VALUES (3, 2257, 34, 50, 5, '位置便利，干净卫生，值得推荐。', NULL, '2026-04-08 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58');
INSERT INTO `comment` VALUES (4, 2023, 67, 60, 5, '泳池干净，健身房设备好。', NULL, '2026-04-16 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-21 00:30:58');
INSERT INTO `comment` VALUES (5, 2263, 35, 42, 4, '隔音效果不错，很安静。', 'https://example.com/comment5.jpg', '2026-05-25 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (6, 2184, 60, 304, 4, '性价比高，下次还会来。', NULL, '2026-04-25 00:30:58', NULL, '2026-05-24 00:30:58');
INSERT INTO `comment` VALUES (7, 2482, 83, 80, 5, '酒店很新，装修时尚。', NULL, '2026-05-06 00:30:58', NULL, '2026-05-11 00:30:58');
INSERT INTO `comment` VALUES (8, 2151, 28, 158, 4, '泳池干净，健身房设备好。', 'https://example.com/comment8.jpg', '2026-05-05 00:30:58', NULL, '2026-05-15 00:30:58');
INSERT INTO `comment` VALUES (9, 2428, 43, 195, 4, '泳池干净，健身房设备好。', 'https://example.com/comment9.jpg', '2026-05-30 00:30:58', NULL, '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (10, 2320, 76, 305, 3, '儿童设施齐全，适合亲子。', NULL, '2026-04-10 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-30 00:30:58');
INSERT INTO `comment` VALUES (11, 2364, 33, 158, 3, '还会再来的！', NULL, '2026-05-12 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (12, 2056, 91, 64, 3, '卫生间干净，热水充足。', NULL, '2026-04-28 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (13, 2055, 48, 19, 5, '非常满意，服务很好！', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (14, 2399, 8, 335, 4, '性价比很高，超出预期。', NULL, '2026-05-10 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (15, 2407, 85, 273, 4, '隔音效果不错，很安静。', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (16, 2090, 72, 4, 5, '空调给力，温度适宜。', 'https://example.com/comment16.jpg', '2026-05-20 00:30:58', NULL, '2026-05-05 00:30:58');
INSERT INTO `comment` VALUES (17, 2036, 56, 199, 3, '位置便利，干净卫生，值得推荐。', NULL, '2026-04-16 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (18, 2271, 92, 330, 5, '还会再来的！', 'https://example.com/comment18.jpg', '2026-04-08 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (19, 2394, 90, 44, 5, '设施齐全，环境优雅。', NULL, '2026-05-11 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (20, 2244, 86, 291, 4, '景观很棒，视野开阔。', NULL, '2026-04-09 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-24 00:30:58');
INSERT INTO `comment` VALUES (21, 2085, 90, 333, 3, '空调给力，温度适宜。', NULL, '2026-05-03 00:30:58', NULL, '2026-05-27 00:30:58');
INSERT INTO `comment` VALUES (22, 2360, 93, 161, 4, '设施齐全，环境优雅。', NULL, '2026-04-07 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (23, 2005, 71, 170, 3, '位置便利，干净卫生，值得推荐。', NULL, '2026-05-31 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (24, 2497, 66, 101, 4, '隔音效果不错，很安静。', NULL, '2026-04-28 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-04 00:30:58');
INSERT INTO `comment` VALUES (25, 2002, 8, 135, 5, '前台服务热情，停车方便。', NULL, '2026-04-09 00:30:58', NULL, '2026-06-01 00:30:58');
INSERT INTO `comment` VALUES (26, 2092, 75, 64, 4, '儿童设施齐全，适合亲子。', 'https://example.com/comment26.jpg', '2026-05-18 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-10 00:30:58');
INSERT INTO `comment` VALUES (27, 2113, 84, 165, 5, '早餐种类多，味道不错。', 'https://example.com/comment27.jpg', '2026-05-07 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58');
INSERT INTO `comment` VALUES (28, 2084, 39, 144, 5, '前台服务热情，停车方便。', 'https://example.com/comment28.jpg', '2026-04-22 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (29, 2268, 21, 148, 4, '性价比高，下次还会来。', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-14 00:30:58');
INSERT INTO `comment` VALUES (30, 2294, 4, 138, 5, '性价比高，下次还会来。', NULL, '2026-04-26 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (31, 2264, 53, 6, 4, '空调给力，温度适宜。', NULL, '2026-06-01 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-16 00:30:58');
INSERT INTO `comment` VALUES (32, 2302, 26, 158, 4, '房间宽敞舒适，早餐丰富。', NULL, '2026-05-17 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-31 00:30:58');
INSERT INTO `comment` VALUES (33, 2230, 5, 291, 3, '周边购物吃饭都很方便。', NULL, '2026-05-19 00:30:58', NULL, '2026-05-27 00:30:58');
INSERT INTO `comment` VALUES (34, 2180, 14, 207, 4, '还会再来的！', NULL, '2026-05-18 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (35, 2204, 1, 272, 5, '位置便利，干净卫生，值得推荐。', 'https://example.com/comment35.jpg', '2026-05-03 00:30:58', NULL, '2026-05-10 00:30:58');
INSERT INTO `comment` VALUES (36, 2033, 3, 318, 4, '酒店很新，装修时尚。', 'https://example.com/comment36.jpg', '2026-05-12 00:30:58', NULL, '2026-05-06 00:30:58');
INSERT INTO `comment` VALUES (37, 2409, 40, 174, 3, '非常满意，服务很好！', NULL, '2026-04-09 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (38, 2264, 40, 135, 5, 'WiFi信号稳定，速度快。', NULL, '2026-05-24 00:30:58', NULL, '2026-05-27 00:30:58');
INSERT INTO `comment` VALUES (39, 2221, 56, 153, 4, '前台服务热情，停车方便。', 'https://example.com/comment39.jpg', '2026-05-10 00:30:58', NULL, '2026-05-14 00:30:58');
INSERT INTO `comment` VALUES (40, 2127, 35, 330, 5, '周边购物吃饭都很方便。', 'https://example.com/comment40.jpg', '2026-06-02 00:30:58', NULL, '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (41, 2183, 24, 32, 5, '卫生间干净，热水充足。', 'https://example.com/comment41.jpg', '2026-05-15 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-27 00:30:58');
INSERT INTO `comment` VALUES (42, 2191, 27, 61, 3, '早餐种类多，味道不错。', NULL, '2026-04-13 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (43, 2418, 12, 31, 3, '房间宽敞舒适，早餐丰富。', NULL, '2026-05-14 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (44, 2295, 1, 94, 3, '儿童设施齐全，适合亲子。', 'https://example.com/comment44.jpg', '2026-05-09 00:30:58', NULL, '2026-05-21 00:30:58');
INSERT INTO `comment` VALUES (45, 2352, 24, 27, 5, '房间宽敞舒适，早餐丰富。', NULL, '2026-05-13 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (46, 2387, 67, 347, 5, '泳池干净，健身房设备好。', NULL, '2026-05-27 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (47, 2353, 100, 297, 3, '服务态度很好，有求必应。', 'https://example.com/comment47.jpg', '2026-05-19 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (48, 2447, 11, 299, 5, '性价比高，下次还会来。', 'https://example.com/comment48.jpg', '2026-05-08 00:30:58', NULL, '2026-05-30 00:30:58');
INSERT INTO `comment` VALUES (49, 2186, 49, 109, 3, '空调给力，温度适宜。', NULL, '2026-05-02 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (50, 2241, 13, 60, 4, '早餐种类多，味道不错。', 'https://example.com/comment50.jpg', '2026-04-21 00:30:58', NULL, '2026-05-21 00:30:58');
INSERT INTO `comment` VALUES (51, 2201, 78, 236, 3, '性价比高，下次还会来。', 'https://example.com/comment51.jpg', '2026-05-31 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (52, 2452, 17, 45, 3, '前台服务热情，停车方便。', NULL, '2026-05-12 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (53, 2234, 44, 276, 4, '儿童设施齐全，适合亲子。', 'https://example.com/comment53.jpg', '2026-05-08 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (54, 2238, 23, 250, 5, '前台服务热情，停车方便。', NULL, '2026-04-22 00:30:58', NULL, '2026-05-29 00:30:58');
INSERT INTO `comment` VALUES (55, 2449, 1, 123, 5, 'WiFi信号稳定，速度快。', NULL, '2026-05-14 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (56, 2456, 38, 47, 4, '床很舒服，睡得很好。', 'https://example.com/comment56.jpg', '2026-04-28 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (57, 2057, 51, 68, 4, '周边购物吃饭都很方便。', 'https://example.com/comment57.jpg', '2026-05-27 00:30:58', NULL, '2026-05-26 00:30:58');
INSERT INTO `comment` VALUES (58, 2306, 30, 217, 3, '设施齐全，环境优雅。', NULL, '2026-05-10 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-17 00:30:58');
INSERT INTO `comment` VALUES (59, 2006, 46, 90, 5, '儿童设施齐全，适合亲子。', NULL, '2026-05-22 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-06 00:30:58');
INSERT INTO `comment` VALUES (60, 2112, 38, 66, 5, 'WiFi信号稳定，速度快。', NULL, '2026-04-16 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (61, 2413, 11, 17, 5, '卫生间干净，热水充足。', NULL, '2026-04-10 00:30:58', NULL, '2026-05-23 00:30:58');
INSERT INTO `comment` VALUES (62, 2434, 33, 16, 3, '非常满意，服务很好！', NULL, '2026-04-24 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (63, 2286, 40, 88, 3, 'WiFi信号稳定，速度快。', 'https://example.com/comment63.jpg', '2026-05-29 00:30:58', NULL, '2026-05-16 00:30:58');
INSERT INTO `comment` VALUES (64, 2058, 84, 289, 4, '周边购物吃饭都很方便。', NULL, '2026-05-21 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (65, 2467, 38, 29, 3, '房间宽敞舒适，早餐丰富。', 'https://example.com/comment65.jpg', '2026-04-25 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (66, 2226, 71, 63, 5, '前台服务热情，停车方便。', NULL, '2026-04-05 00:30:58', NULL, '2026-05-04 00:30:58');
INSERT INTO `comment` VALUES (67, 2261, 66, 253, 4, '还会再来的！', NULL, '2026-05-19 00:30:58', NULL, '2026-05-20 00:30:58');
INSERT INTO `comment` VALUES (68, 2495, 62, 35, 4, '还会再来的！', 'https://example.com/comment68.jpg', '2026-04-21 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-24 00:30:58');
INSERT INTO `comment` VALUES (69, 2177, 86, 76, 4, '早餐种类多，味道不错。', 'https://example.com/comment69.jpg', '2026-05-27 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (70, 2228, 98, 172, 4, '性价比高，下次还会来。', NULL, '2026-05-20 00:30:58', NULL, '2026-05-11 00:30:58');
INSERT INTO `comment` VALUES (71, 2490, 67, 143, 3, '性价比很高，超出预期。', NULL, '2026-05-05 00:30:58', NULL, '2026-05-15 00:30:58');
INSERT INTO `comment` VALUES (72, 2114, 26, 205, 3, '位置便利，干净卫生，值得推荐。', 'https://example.com/comment72.jpg', '2026-04-13 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (73, 2364, 39, 265, 4, '儿童设施齐全，适合亲子。', NULL, '2026-05-19 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58');
INSERT INTO `comment` VALUES (74, 2060, 16, 142, 4, 'WiFi信号稳定，速度快。', NULL, '2026-05-04 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (75, 2038, 28, 51, 5, '非常满意，服务很好！', NULL, '2026-05-01 00:30:58', NULL, '2026-05-28 00:30:58');
INSERT INTO `comment` VALUES (76, 2084, 34, 53, 5, '床很舒服，睡得很好。', NULL, '2026-04-18 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (77, 2393, 75, 136, 5, '前台服务热情，停车方便。', NULL, '2026-05-02 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58');
INSERT INTO `comment` VALUES (78, 2012, 70, 143, 5, '空调给力，温度适宜。', 'https://example.com/comment78.jpg', '2026-06-02 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (79, 2249, 1, 182, 4, '景观很棒，视野开阔。', NULL, '2026-05-18 00:30:58', NULL, '2026-05-28 00:30:58');
INSERT INTO `comment` VALUES (80, 2408, 56, 106, 5, '床很舒服，睡得很好。', NULL, '2026-04-14 00:30:58', '感谢您的评价，我们会继续努力！', '2026-06-02 00:30:58');
INSERT INTO `comment` VALUES (81, 2211, 4, 315, 4, '前台服务热情，停车方便。', NULL, '2026-04-13 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (82, 2343, 96, 257, 5, '儿童设施齐全，适合亲子。', NULL, '2026-04-17 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-04 00:30:58');
INSERT INTO `comment` VALUES (83, 2334, 37, 279, 5, '房间宽敞舒适，早餐丰富。', 'https://example.com/comment83.jpg', '2026-04-04 00:30:58', NULL, '2026-05-11 00:30:58');
INSERT INTO `comment` VALUES (84, 2271, 42, 165, 3, '位置便利，干净卫生，值得推荐。', NULL, '2026-04-13 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (85, 2266, 41, 153, 5, '隔音效果不错，很安静。', NULL, '2026-05-13 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (86, 2072, 63, 238, 4, 'WiFi信号稳定，速度快。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (87, 2285, 54, 333, 3, '性价比很高，超出预期。', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (88, 2330, 34, 234, 4, '服务态度很好，有求必应。', NULL, '2026-05-30 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (89, 2082, 55, 89, 4, '床很舒服，睡得很好。', 'https://example.com/comment89.jpg', '2026-05-18 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-16 00:30:58');
INSERT INTO `comment` VALUES (90, 2383, 5, 321, 4, '空调给力，温度适宜。', NULL, '2026-04-28 00:30:58', NULL, '2026-05-20 00:30:58');
INSERT INTO `comment` VALUES (91, 2138, 3, 97, 3, '服务态度很好，有求必应。', 'https://example.com/comment91.jpg', '2026-04-22 00:30:58', NULL, '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (92, 2335, 92, 190, 5, '设施齐全，环境优雅。', NULL, '2026-04-25 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (93, 2189, 53, 173, 5, '还会再来的！', NULL, '2026-05-31 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (94, 2117, 11, 286, 5, '景观很棒，视野开阔。', NULL, '2026-04-14 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (95, 2204, 17, 207, 4, '空调给力，温度适宜。', NULL, '2026-05-07 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58');
INSERT INTO `comment` VALUES (96, 2322, 65, 105, 4, '早餐种类多，味道不错。', 'https://example.com/comment96.jpg', '2026-05-30 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (97, 2201, 68, 51, 5, '房间宽敞舒适，早餐丰富。', NULL, '2026-05-21 00:30:58', NULL, '2026-05-10 00:30:58');
INSERT INTO `comment` VALUES (98, 2165, 33, 213, 3, 'WiFi信号稳定，速度快。', NULL, '2026-05-20 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (99, 2248, 16, 94, 5, '周边购物吃饭都很方便。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-05 00:30:58');
INSERT INTO `comment` VALUES (100, 2103, 15, 45, 3, '空调给力，温度适宜。', NULL, '2026-04-18 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58');
INSERT INTO `comment` VALUES (101, 2156, 15, 272, 4, '早餐种类多，味道不错。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58');
INSERT INTO `comment` VALUES (102, 2494, 54, 252, 5, '服务态度很好，有求必应。', NULL, '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (103, 2483, 57, 317, 5, '隔音效果不错，很安静。', 'https://example.com/comment103.jpg', '2026-05-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (104, 2124, 7, 194, 4, '设施齐全，环境优雅。', NULL, '2026-04-28 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (105, 2124, 62, 117, 5, '位置便利，干净卫生，值得推荐。', 'https://example.com/comment105.jpg', '2026-05-22 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (106, 2046, 45, 329, 4, '还会再来的！', 'https://example.com/comment106.jpg', '2026-05-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (107, 2218, 77, 174, 3, '隔音效果不错，很安静。', 'https://example.com/comment107.jpg', '2026-04-16 00:30:58', NULL, '2026-05-25 00:30:58');
INSERT INTO `comment` VALUES (108, 2163, 77, 291, 5, '泳池干净，健身房设备好。', NULL, '2026-04-27 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (109, 2376, 59, 242, 5, '床很舒服，睡得很好。', NULL, '2026-04-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (110, 2323, 2, 42, 4, '隔音效果不错，很安静。', NULL, '2026-05-01 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (111, 2384, 48, 33, 3, '泳池干净，健身房设备好。', NULL, '2026-04-07 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (112, 2382, 56, 168, 5, '设施齐全，环境优雅。', 'https://example.com/comment112.jpg', '2026-04-19 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (113, 2100, 79, 112, 3, '前台服务热情，停车方便。', NULL, '2026-05-25 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (114, 2086, 31, 6, 3, '服务态度很好，有求必应。', NULL, '2026-04-23 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (115, 2445, 57, 50, 3, '酒店很新，装修时尚。', NULL, '2026-04-17 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-15 00:30:58');
INSERT INTO `comment` VALUES (116, 2139, 56, 331, 3, '卫生间干净，热水充足。', 'https://example.com/comment116.jpg', '2026-04-25 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (117, 2395, 4, 286, 5, '景观很棒，视野开阔。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (118, 2112, 3, 162, 3, '儿童设施齐全，适合亲子。', NULL, '2026-05-12 00:30:58', NULL, '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (119, 2272, 32, 332, 5, '房间宽敞舒适，早餐丰富。', NULL, '2026-05-09 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (120, 2052, 97, 179, 4, '儿童设施齐全，适合亲子。', 'https://example.com/comment120.jpg', '2026-04-20 00:30:58', NULL, '2026-06-02 00:30:58');
INSERT INTO `comment` VALUES (121, 2112, 12, 312, 3, '性价比很高，超出预期。', NULL, '2026-05-28 00:30:58', NULL, '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (122, 2478, 21, 48, 3, '还会再来的！', 'https://example.com/comment122.jpg', '2026-04-26 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-21 00:30:58');
INSERT INTO `comment` VALUES (123, 2246, 26, 271, 3, '设施齐全，环境优雅。', 'https://example.com/comment123.jpg', '2026-05-13 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (124, 2262, 17, 84, 5, '泳池干净，健身房设备好。', 'https://example.com/comment124.jpg', '2026-05-17 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (125, 2231, 20, 208, 4, '房间宽敞舒适，早餐丰富。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58');
INSERT INTO `comment` VALUES (126, 2227, 85, 297, 5, '还会再来的！', 'https://example.com/comment126.jpg', '2026-06-02 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (127, 2286, 92, 307, 4, '隔音效果不错，很安静。', NULL, '2026-04-30 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (128, 2206, 23, 308, 5, '还会再来的！', 'https://example.com/comment128.jpg', '2026-04-09 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (129, 2425, 39, 130, 5, '景观很棒，视野开阔。', NULL, '2026-05-11 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58');
INSERT INTO `comment` VALUES (130, 2256, 16, 84, 5, '性价比很高，超出预期。', NULL, '2026-06-02 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-09 00:30:58');
INSERT INTO `comment` VALUES (131, 2070, 30, 24, 4, '非常满意，服务很好！', 'https://example.com/comment131.jpg', '2026-04-24 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (132, 2190, 98, 263, 5, '泳池干净，健身房设备好。', NULL, '2026-04-16 00:30:58', NULL, '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (133, 2408, 58, 149, 4, '酒店很新，装修时尚。', NULL, '2026-05-16 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (134, 2245, 64, 240, 4, 'WiFi信号稳定，速度快。', NULL, '2026-04-04 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (135, 2260, 32, 1, 3, '床很舒服，睡得很好。', NULL, '2026-06-01 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-19 00:30:58');
INSERT INTO `comment` VALUES (136, 2238, 90, 14, 4, '卫生间干净，热水充足。', NULL, '2026-04-21 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58');
INSERT INTO `comment` VALUES (137, 2110, 59, 87, 4, '服务态度很好，有求必应。', NULL, '2026-05-11 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-07 00:30:58');
INSERT INTO `comment` VALUES (138, 2164, 95, 258, 5, '非常满意，服务很好！', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (139, 2135, 10, 230, 5, '还会再来的！', NULL, '2026-05-28 00:30:58', NULL, '2026-05-08 00:30:58');
INSERT INTO `comment` VALUES (140, 2412, 55, 83, 4, '位置便利，干净卫生，值得推荐。', NULL, '2026-05-24 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-29 00:30:58');
INSERT INTO `comment` VALUES (141, 2077, 38, 138, 5, '位置便利，干净卫生，值得推荐。', 'https://example.com/comment141.jpg', '2026-05-05 00:30:58', NULL, '2026-05-04 00:30:58');
INSERT INTO `comment` VALUES (142, 2215, 18, 206, 4, '前台服务热情，停车方便。', NULL, '2026-04-16 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-07 00:30:58');
INSERT INTO `comment` VALUES (143, 2432, 67, 253, 4, '性价比很高，超出预期。', 'https://example.com/comment143.jpg', '2026-05-10 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (144, 2346, 47, 89, 5, 'WiFi信号稳定，速度快。', NULL, '2026-05-12 00:30:58', NULL, '2026-05-04 00:30:58');
INSERT INTO `comment` VALUES (145, 2064, 72, 64, 5, '前台服务热情，停车方便。', NULL, '2026-04-11 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (146, 2286, 63, 138, 3, '床很舒服，睡得很好。', NULL, '2026-04-29 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (147, 2416, 71, 9, 3, '性价比很高，超出预期。', NULL, '2026-04-30 00:30:58', '感谢您的评价，我们会继续努力！', NULL);
INSERT INTO `comment` VALUES (148, 2175, 39, 300, 3, '位置便利，干净卫生，值得推荐。', NULL, '2026-04-14 00:30:58', NULL, NULL);
INSERT INTO `comment` VALUES (149, 2418, 10, 335, 4, '酒店很新，装修时尚。', 'https://example.com/comment149.jpg', '2026-04-15 00:30:58', '感谢您的评价，我们会继续努力！', '2026-05-20 00:30:58');
INSERT INTO `comment` VALUES (150, 2292, 54, 331, 3, '酒店很新，装修时尚。', NULL, '2026-05-21 00:30:58', '感谢您的评价，我们会继续努力！', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

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
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店图片URL',
  `facility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店设施',
  `business_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '北京王府井希尔顿酒店', '北京市东城区王府井大街88号', 5, 4.80, 'https://example.com/hotel1.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室', 1001, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (2, '上海外滩华尔道夫酒店', '上海市黄浦区中山东一路2号', 5, 4.90, 'https://example.com/hotel2.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧,商务中心', 1002, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (3, '广州塔丽思卡尔顿酒店', '广州市天河区珠江新城兴民路222号', 5, 4.70, 'https://example.com/hotel3.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,儿童乐园', 1003, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (4, '深圳福田香格里拉大酒店', '深圳市福田区中心城益田路4088号', 5, 4.60, 'https://example.com/hotel4.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室,商务中心', 1004, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (5, '杭州西湖国宾馆', '杭州市西湖区杨公堤18号', 4, 4.50, 'https://example.com/hotel5.jpg', 'WiFi,停车场,餐厅,花园,湖景房,会议室', 1005, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (6, '成都太古里尼依格罗酒店', '成都市锦江区红星路三段1号', 5, 4.80, 'https://example.com/hotel6.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1006, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (7, '西安钟楼开元酒店', '西安市碑林区南大街30号', 4, 4.30, 'https://example.com/hotel7.jpg', 'WiFi,停车场,餐厅,会议室,商务中心', 1007, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (8, '三亚亚龙湾瑞吉度假酒店', '三亚市吉阳区亚龙湾国家旅游度假区', 5, 4.90, 'https://example.com/hotel8.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅,儿童俱乐部', 1008, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (9, '厦门鼓浪屿海景酒店', '厦门市思明区鼓浪屿康泰路151号', 4, 4.40, 'https://example.com/hotel9.jpg', 'WiFi,海景房,餐厅,花园,露台', 1009, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (10, '青岛五四广场海尔洲际酒店', '青岛市市南区香港中路98号', 5, 4.70, 'https://example.com/hotel10.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房,会议室', 1010, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (11, '南京金陵饭店', '南京市鼓楼区汉中路2号', 5, 4.60, 'https://example.com/hotel11.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,会议室', 1011, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (12, '苏州吴宫泛太平洋酒店', '苏州市姑苏区新市路259号', 4, 4.40, 'https://example.com/hotel12.jpg', 'WiFi,停车场,园林景观,餐厅,会议室', 1012, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (13, '武汉万达瑞华酒店', '武汉市武昌区水果湖街东湖路138号', 5, 4.70, 'https://example.com/hotel13.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1013, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (14, '长沙君悦酒店', '长沙市天心区湘江中路36号', 5, 4.60, 'https://example.com/hotel14.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1014, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (15, '重庆解放碑威斯汀酒店', '重庆市渝中区新华路222号', 5, 4.80, 'https://example.com/hotel15.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1015, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (16, '昆明洲际酒店', '昆明市西山区怡景路5号', 5, 4.50, 'https://example.com/hotel16.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,花园', 1016, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (17, '贵阳凯宾斯基大酒店', '贵阳市南明区护国路68号', 5, 4.40, 'https://example.com/hotel17.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1017, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (18, '南宁万达文华酒店', '南宁市青秀区东葛路118号', 5, 4.50, 'https://example.com/hotel18.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1018, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (19, '海口鲁能希尔顿酒店', '海口市美兰区琼山大道2号', 4, 4.30, 'https://example.com/hotel19.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1019, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (20, '大理洱海天域酒店', '大理市下关镇洱河南路1号', 4, 4.60, 'https://example.com/hotel20.jpg', 'WiFi,停车场,海景房,餐厅,花园', 1020, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (21, '丽江和府洲际度假酒店', '丽江市古城区祥和路276号', 5, 4.70, 'https://example.com/hotel21.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1021, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (22, '桂林香格里拉大酒店', '桂林市七星区环城北二路111号', 5, 4.60, 'https://example.com/hotel22.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1022, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (23, '珠海瑞吉酒店', '珠海市香洲区湾仔银湾路1663号', 5, 4.80, 'https://example.com/hotel23.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1023, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (24, '佛山保利洲际酒店', '佛山市南海区灯湖东路20号', 5, 4.50, 'https://example.com/hotel24.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1024, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (25, '东莞松山湖凯悦酒店', '东莞市松山湖高新区沁园路', 4, 4.40, 'https://example.com/hotel25.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,湖景房', 1025, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (26, '无锡苏宁凯悦酒店', '无锡市梁溪区人民中路109号', 5, 4.60, 'https://example.com/hotel26.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1026, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (27, '常州万豪酒店', '常州市新北区龙锦路1590号', 5, 4.40, 'https://example.com/hotel27.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1027, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (28, '扬州香格里拉大酒店', '扬州市邗江区文昌西路472号', 5, 4.50, 'https://example.com/hotel28.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1028, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (29, '南通滨江洲际酒店', '南通市崇川区跃龙南路508号', 4, 4.30, 'https://example.com/hotel29.jpg', 'WiFi,停车场,餐厅,江景房', 1029, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (30, '宁波东港喜来登酒店', '宁波市鄞州区彩虹北路50号', 5, 4.50, 'https://example.com/hotel30.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1030, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (31, '温州香格里拉大酒店', '温州市鹿城区香源路1号', 5, 4.40, 'https://example.com/hotel31.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1031, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (32, '福州世茂洲际酒店', '福州市台江区广达路108号', 5, 4.50, 'https://example.com/hotel32.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1032, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (33, '厦门康莱德酒店', '厦门市思明区演武西路186号', 5, 4.80, 'https://example.com/hotel33.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1033, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (34, '南昌瑞颐大酒店', '南昌市东湖区沿江北路69号', 4, 4.30, 'https://example.com/hotel34.jpg', 'WiFi,停车场,餐厅,江景房', 1034, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (35, '济南鲁能希尔顿酒店', '济南市市中区二环南路2888号', 5, 4.50, 'https://example.com/hotel35.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1035, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (36, '青岛金沙滩希尔顿酒店', '青岛市黄岛区嘉陵江东路1号', 5, 4.60, 'https://example.com/hotel36.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1036, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (37, '烟台金海岸希尔顿酒店', '烟台市福山区宁波路1号', 4, 4.40, 'https://example.com/hotel37.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1037, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (38, '威海百纳中心酒店', '威海市环翠区新威路58号', 4, 4.20, 'https://example.com/hotel38.jpg', 'WiFi,停车场,餐厅', 1038, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (39, '郑州绿地JW万豪酒店', '郑州市郑东新区商务中央公园2号', 5, 4.60, 'https://example.com/hotel39.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1039, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (40, '洛阳华阳广场国际大饭店', '洛阳市涧西区辽宁路1号', 4, 4.30, 'https://example.com/hotel40.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (41, '太原凯宾斯基饭店', '太原市小店区长风街115号', 5, 4.50, 'https://example.com/hotel41.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1041, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (42, '石家庄希尔顿酒店', '石家庄市长安区东大街5号', 5, 4.40, 'https://example.com/hotel42.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1042, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (43, '天津丽思卡尔顿酒店', '天津市和平区大沽北路167号', 5, 4.80, 'https://example.com/hotel43.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1043, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (44, '沈阳君悦酒店', '沈阳市和平区青年大街288号', 5, 4.60, 'https://example.com/hotel44.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1044, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (45, '大连君悦酒店', '大连市沙河口区星海广场C3区33号', 5, 4.70, 'https://example.com/hotel45.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1045, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (46, '长春香格里拉大酒店', '长春市朝阳区西安大路569号', 5, 4.50, 'https://example.com/hotel46.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1046, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (47, '哈尔滨香格里拉大酒店', '哈尔滨市道里区友谊路555号', 5, 4.60, 'https://example.com/hotel47.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1047, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (48, '呼和浩特香格里拉大酒店', '呼和浩特市回民区锡林郭勒南路5号', 5, 4.30, 'https://example.com/hotel48.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1048, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (49, '银川凯宾斯基饭店', '银川市金凤区北京中路160号', 5, 4.40, 'https://example.com/hotel49.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1049, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (50, '兰州皇冠假日酒店', '兰州市城关区北滨河东路1号', 4, 4.30, 'https://example.com/hotel50.jpg', 'WiFi,停车场,餐厅,黄河景观', 1050, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (51, '西宁新华联索菲特大酒店', '西宁市城西区五四西路63号', 5, 4.40, 'https://example.com/hotel51.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1051, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (52, '乌鲁木齐希尔顿酒店', '乌鲁木齐市米东区红光山路1237号', 5, 4.50, 'https://example.com/hotel52.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1052, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (53, '拉萨瑞吉度假酒店', '拉萨市城关区江苏路22号', 5, 4.70, 'https://example.com/hotel53.jpg', 'WiFi,停车场,SPA,餐厅,藏式风格', 1053, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (54, '成都华尔道夫酒店', '成都市武侯区天府大道北段1199号', 5, 4.80, 'https://example.com/hotel54.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1054, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (55, '重庆尼依格罗酒店', '重庆市江北区庆云路1号', 5, 4.70, 'https://example.com/hotel55.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1055, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (56, '武汉光谷凯悦酒店', '武汉市洪山区珞喻路1077号', 5, 4.50, 'https://example.com/hotel56.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1056, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (57, '西安W酒店', '西安市雁塔区曲江池东路333号', 5, 4.80, 'https://example.com/hotel57.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1057, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (58, '南京卓美亚酒店', '南京市建邺区邺城路2号', 5, 4.70, 'https://example.com/hotel58.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1058, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (59, '杭州康莱德酒店', '杭州市江干区新业路228号', 5, 4.70, 'https://example.com/hotel59.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,钱塘江景', 1059, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (60, '苏州W酒店', '苏州市苏州工业园区苏州中心广场7幢', 5, 4.70, 'https://example.com/hotel60.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1060, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (61, '宁波泛太平洋大酒店', '宁波市鄞州区民安东路99号', 4, 4.40, 'https://example.com/hotel61.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1061, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (62, '无锡君来洲际酒店', '无锡市梁溪区永和路6号', 5, 4.50, 'https://example.com/hotel62.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1062, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (63, '常州新城希尔顿酒店', '常州市武进区虹北路68号', 5, 4.40, 'https://example.com/hotel63.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1063, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (64, '镇江富力喜来登酒店', '镇江市京口区北府路88号', 4, 4.30, 'https://example.com/hotel64.jpg', 'WiFi,停车场,餐厅', 1064, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (65, '扬州皇冠假日酒店', '扬州市广陵区文昌东路3号', 4, 4.40, 'https://example.com/hotel65.jpg', 'WiFi,停车场,游泳池,餐厅', 1065, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (66, '南通绿洲国际假日酒店', '南通市港闸区北大街199号', 4, 4.20, 'https://example.com/hotel66.jpg', 'WiFi,停车场,餐厅', 1066, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (67, '芜湖华邑酒店', '芜湖市镜湖区长江中路15号', 5, 4.50, 'https://example.com/hotel67.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1067, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (68, '合肥洲际酒店', '合肥市政务区潜山路888号', 5, 4.60, 'https://example.com/hotel68.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1068, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (69, '安庆碧桂园凤凰酒店', '安庆市迎江区港口路88号', 4, 4.20, 'https://example.com/hotel69.jpg', 'WiFi,停车场,餐厅', 1069, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (70, '黄山悦榕庄', '黄山市黟县宏村镇', 5, 4.90, 'https://example.com/hotel70.jpg', 'WiFi,停车场,SPA,餐厅,徽派建筑', 1070, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (71, '厦门艾美酒店', '厦门市湖里区南山冠军路7号', 5, 4.50, 'https://example.com/hotel71.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1071, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (72, '福州仓山凯悦酒店', '福州市仓山区花溪南路46号', 5, 4.40, 'https://example.com/hotel72.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1072, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (73, '泉州泰禾洲际酒店', '泉州市丰泽区丰海路1005号', 5, 4.50, 'https://example.com/hotel73.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1073, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (74, '南昌香格里拉大酒店', '南昌市红谷滩新区翠林路669号', 5, 4.50, 'https://example.com/hotel74.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1074, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (75, '赣州锦江国际酒店', '赣州市章贡区金东北路88号', 4, 4.20, 'https://example.com/hotel75.jpg', 'WiFi,停车场,餐厅', 1075, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (76, '济南香格里拉大酒店', '济南市历下区泺源大街106号', 5, 4.50, 'https://example.com/hotel76.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1076, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (77, '青岛香格里拉大酒店', '青岛市市南区香港中路9号', 5, 4.60, 'https://example.com/hotel77.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1077, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (78, '烟台金海湾酒店', '烟台市芝罘区海岸路34号', 4, 4.30, 'https://example.com/hotel78.jpg', 'WiFi,停车场,餐厅,海景房', 1078, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (79, '威海抱海大酒店', '威海市环翠区海滨中路29号', 4, 4.20, 'https://example.com/hotel79.jpg', 'WiFi,停车场,餐厅,海景房', 1079, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (80, '郑州希尔顿酒店', '郑州市金水区金水路288号', 5, 4.50, 'https://example.com/hotel80.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1080, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (81, '洛阳钼都利豪国际饭店', '洛阳市洛龙区开元大道239号', 4, 4.30, 'https://example.com/hotel81.jpg', 'WiFi,停车场,餐厅', 1081, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (82, '太原洲际酒店', '太原市晋源区长兴南街8号', 5, 4.50, 'https://example.com/hotel82.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1082, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (83, '石家庄富力洲际酒店', '石家庄市裕华区槐安东路119号', 5, 4.40, 'https://example.com/hotel83.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1083, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (84, '天津四季酒店', '天津市和平区赤峰道138号', 5, 4.80, 'https://example.com/hotel84.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1084, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (85, '沈阳香格里拉大酒店', '沈阳市沈河区青年大街115号', 5, 4.60, 'https://example.com/hotel85.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1085, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (86, '大连香格里拉大酒店', '大连市中山区人民路66号', 5, 4.60, 'https://example.com/hotel86.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1086, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (87, '长春凯悦酒店', '长春市朝阳区人民大街3233号', 5, 4.50, 'https://example.com/hotel87.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1087, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (88, '哈尔滨万达嘉华酒店', '哈尔滨市松北区世茂大道99号', 5, 4.40, 'https://example.com/hotel88.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1088, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (89, '呼和浩特万达文华酒店', '呼和浩特市赛罕区新华东街26号', 5, 4.30, 'https://example.com/hotel89.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1089, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (90, '银川万豪酒店', '银川市金凤区北京中路166号', 5, 4.40, 'https://example.com/hotel90.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1090, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (91, '兰州凯悦酒店', '兰州市城关区南滨河东路501号', 5, 4.40, 'https://example.com/hotel91.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1091, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (92, '西宁富力万达嘉华酒店', '西宁市城西区西川南路76号', 5, 4.30, 'https://example.com/hotel92.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1092, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (93, '乌鲁木齐康莱德酒店', '乌鲁木齐市沙依巴克区友好北路669号', 5, 4.50, 'https://example.com/hotel93.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1093, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (94, '拉萨圣地天堂洲际酒店', '拉萨市城关区江苏大道1号', 5, 4.60, 'https://example.com/hotel94.jpg', 'WiFi,停车场,SPA,餐厅', 1094, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (95, '贵阳亨特索菲特酒店', '贵阳市南明区都司高架桥路33号', 5, 4.50, 'https://example.com/hotel95.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1095, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (96, '南宁龙光那莲豪华精选酒店', '南宁市青秀区中柬路8号', 5, 4.70, 'https://example.com/hotel96.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1096, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (97, '海口华彩华邑酒店', '海口市美兰区碧海大道21号', 5, 4.50, 'https://example.com/hotel97.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1097, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (98, '三亚海棠湾君悦酒店', '三亚市海棠区海棠北路68号', 5, 4.80, 'https://example.com/hotel98.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅', 1098, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (99, '北海银滩皇冠假日酒店', '北海市银海区银滩四号路8号', 4, 4.40, 'https://example.com/hotel99.jpg', 'WiFi,停车场,游泳池,餐厅,海景房', 1099, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (100, '桂林漓江大瀑布饭店', '桂林市秀峰区杉湖北路1号', 4, 4.30, 'https://example.com/hotel100.jpg', 'WiFi,停车场,餐厅,江景房', 1100, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1072 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1001, '北京希尔顿酒店管理有限公司', '91110000MA001001X1', '张三', '13800138001', 'merchant001@hotel.com', '北京市东城区王府井大街88号', '酒店管理、餐饮服务、住宿服务', 'https://example.com/merchant1001.png', '专注于高端酒店管理运营', '0', '1', '资质齐全，审核通过', '2026-05-07 08:52:15', '2026-05-09 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1002, '上海华尔道夫酒店管理有限公司', '91310000MA001002X2', '李四', '13800138002', 'merchant002@hotel.com', '上海市黄浦区中山东一路2号', '酒店管理、商务服务', 'https://example.com/merchant1002.png', '国际知名酒店管理集团', '0', '1', '资质审核通过', '2026-05-09 08:52:15', '2026-05-11 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1003, '广州丽思卡尔顿酒店有限公司', '91440000MA001003X3', '王五', '13800138003', 'merchant003@hotel.com', '广州市天河区珠江新城兴民路222号', '酒店管理、餐饮、SPA', 'https://example.com/merchant1003.png', '五星级度假酒店管理', '0', '1', '审核通过', '2026-05-12 08:52:15', '2026-05-14 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1004, '深圳香格里拉酒店有限公司', '91440000MA001004X4', '赵六', '13800138004', 'merchant004@hotel.com', '深圳市福田区中心城益田路4088号', '酒店管理、会议服务', 'https://example.com/merchant1004.png', '国际连锁酒店品牌', '0', '1', '资质齐全，通过入驻', '2026-05-15 08:52:15', '2026-05-17 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1005, '杭州西湖国宾馆有限公司', '91330000MA001005X5', '孙七', '13800138005', 'merchant005@hotel.com', '杭州市西湖区杨公堤18号', '酒店住宿、餐饮、旅游服务', 'https://example.com/merchant1005.png', '西湖畔高端度假酒店管理', '0', '1', '审核通过，资质良好', '2026-05-17 08:52:15', '2026-05-19 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_merchant_id`(`merchant_id` ASC) USING BTREE,
  INDEX `idx_audit_status`(`audit_status` ASC) USING BTREE,
  INDEX `idx_auditor_id`(`auditor_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_audit
-- ----------------------------
INSERT INTO `merchant_audit` VALUES (1, 1001, '1', '1', '{\"license_img\":\"https://example.com/license1001.jpg\",\"id_card\":\"https://example.com/id1001.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-05-07 08:52:15', '2026-05-09 08:52:15', '2026-05-07 08:52:15', '2026-05-09 08:52:15');
INSERT INTO `merchant_audit` VALUES (2, 1002, '1', '1', '{\"license_img\":\"https://example.com/license1002.jpg\",\"id_card\":\"https://example.com/id1002.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-09 08:52:15', '2026-05-11 08:52:15', '2026-05-09 08:52:15', '2026-05-11 08:52:15');
INSERT INTO `merchant_audit` VALUES (3, 1003, '1', '1', '{\"license_img\":\"https://example.com/license1003.jpg\",\"id_card\":\"https://example.com/id1003.jpg\"}', '审核通过', 1, 'admin', '2026-05-12 08:52:15', '2026-05-14 08:52:15', '2026-05-12 08:52:15', '2026-05-14 08:52:15');
INSERT INTO `merchant_audit` VALUES (4, 1004, '1', '1', '{\"license_img\":\"https://example.com/license1004.jpg\",\"id_card\":\"https://example.com/id1004.jpg\"}', '资质齐全，通过入驻', 1, 'admin', '2026-05-15 08:52:15', '2026-05-17 08:52:15', '2026-05-15 08:52:15', '2026-05-17 08:52:15');
INSERT INTO `merchant_audit` VALUES (5, 1005, '1', '1', '{\"license_img\":\"https://example.com/license1005.jpg\",\"id_card\":\"https://example.com/id1005.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-05-17 08:52:15', '2026-05-19 08:52:15', '2026-05-17 08:52:15', '2026-05-19 08:52:15');
INSERT INTO `merchant_audit` VALUES (6, 1006, '1', '0', '{\"license_img\":\"https://example.com/license1006.jpg\",\"id_card\":\"https://example.com/id1006.jpg\"}', NULL, NULL, NULL, '2026-06-04 08:52:15', NULL, '2026-06-04 08:52:15', '2026-06-04 08:52:15');
INSERT INTO `merchant_audit` VALUES (7, 1007, '1', '0', '{\"license_img\":\"https://example.com/license1007.jpg\",\"id_card\":\"https://example.com/id1007.jpg\"}', NULL, NULL, NULL, '2026-06-05 08:52:15', NULL, '2026-06-05 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (8, 1008, '1', '2', '{\"license_img\":\"https://example.com/license1008.jpg\"}', '营业执照信息不清晰，请重新上传', 1, 'admin', '2026-05-22 08:52:15', '2026-05-23 08:52:15', '2026-05-22 08:52:15', '2026-05-23 08:52:15');
INSERT INTO `merchant_audit` VALUES (9, 1009, '1', '1', '{\"license_img\":\"https://example.com/license1009.jpg\",\"id_card\":\"https://example.com/id1009.jpg\"}', '审核通过', 1, 'admin', '2026-05-25 08:52:15', '2026-05-27 08:52:15', '2026-05-25 08:52:15', '2026-05-27 08:52:15');
INSERT INTO `merchant_audit` VALUES (10, 1010, '1', '1', '{\"license_img\":\"https://example.com/license1010.jpg\",\"id_card\":\"https://example.com/id1010.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-27 08:52:15', '2026-05-29 08:52:15', '2026-05-27 08:52:15', '2026-05-29 08:52:15');
INSERT INTO `merchant_audit` VALUES (11, 1011, '1', '1', '{\"license_img\":\"https://example.com/license1011.jpg\",\"id_card\":\"https://example.com/id1011.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-05-28 08:52:15', '2026-05-30 08:52:15', '2026-05-28 08:52:15', '2026-05-30 08:52:15');
INSERT INTO `merchant_audit` VALUES (12, 1012, '1', '1', '{\"license_img\":\"https://example.com/license1012.jpg\",\"id_card\":\"https://example.com/id1012.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-05-29 08:52:15', '2026-05-31 08:52:15', '2026-05-29 08:52:15', '2026-05-31 08:52:15');
INSERT INTO `merchant_audit` VALUES (13, 1013, '1', '1', '{\"license_img\":\"https://example.com/license1013.jpg\",\"id_card\":\"https://example.com/id1013.jpg\"}', '审核通过', 1, 'admin', '2026-05-30 08:52:15', '2026-06-01 08:52:15', '2026-05-30 08:52:15', '2026-06-01 08:52:15');
INSERT INTO `merchant_audit` VALUES (14, 1014, '1', '1', '{\"license_img\":\"https://example.com/license1014.jpg\",\"id_card\":\"https://example.com/id1014.jpg\"}', '资质审核通过', 1, 'admin', '2026-05-31 08:52:15', '2026-06-02 08:52:15', '2026-05-31 08:52:15', '2026-06-02 08:52:15');
INSERT INTO `merchant_audit` VALUES (15, 1015, '1', '1', '{\"license_img\":\"https://example.com/license1015.jpg\",\"id_card\":\"https://example.com/id1015.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-01 08:52:15', '2026-06-03 08:52:15', '2026-06-01 08:52:15', '2026-06-03 08:52:15');
INSERT INTO `merchant_audit` VALUES (16, 1016, '1', '1', '{\"license_img\":\"https://example.com/license1016.jpg\",\"id_card\":\"https://example.com/id1016.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-02 08:52:15', '2026-06-04 08:52:15', '2026-06-02 08:52:15', '2026-06-04 08:52:15');
INSERT INTO `merchant_audit` VALUES (17, 1017, '1', '1', '{\"license_img\":\"https://example.com/license1017.jpg\",\"id_card\":\"https://example.com/id1017.jpg\"}', '审核通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-05 08:52:15', '2026-06-03 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (18, 1018, '1', '0', '{\"license_img\":\"https://example.com/license1018.jpg\",\"id_card\":\"https://example.com/id1018.jpg\"}', NULL, NULL, NULL, '2026-06-05 20:52:15', NULL, '2026-06-05 20:52:15', '2026-06-05 20:52:15');
INSERT INTO `merchant_audit` VALUES (19, 1019, '1', '0', '{\"license_img\":\"https://example.com/license1019.jpg\",\"id_card\":\"https://example.com/id1019.jpg\"}', NULL, NULL, NULL, '2026-06-06 02:52:15', NULL, '2026-06-06 02:52:15', '2026-06-06 02:52:15');
INSERT INTO `merchant_audit` VALUES (20, 1020, '1', '1', '{\"license_img\":\"https://example.com/license1020.jpg\",\"id_card\":\"https://example.com/id1020.jpg\"}', '审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (21, 1021, '1', '1', '{\"license_img\":\"https://example.com/license1021.jpg\",\"id_card\":\"https://example.com/id1021.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-04 08:52:15', '2026-06-03 08:52:15', '2026-06-04 08:52:15');
INSERT INTO `merchant_audit` VALUES (22, 1022, '1', '2', '{\"license_img\":\"https://example.com/license1022.jpg\"}', '营业执照过期，请更新后重新提交', 1, 'admin', '2026-06-01 08:52:15', '2026-06-02 08:52:15', '2026-06-01 08:52:15', '2026-06-02 08:52:15');
INSERT INTO `merchant_audit` VALUES (23, 1023, '1', '1', '{\"license_img\":\"https://example.com/license1023.jpg\",\"id_card\":\"https://example.com/id1023.jpg\"}', '审核通过', 1, 'admin', '2026-06-02 08:52:15', '2026-06-03 08:52:15', '2026-06-02 08:52:15', '2026-06-03 08:52:15');
INSERT INTO `merchant_audit` VALUES (24, 1024, '1', '1', '{\"license_img\":\"https://example.com/license1024.jpg\",\"id_card\":\"https://example.com/id1024.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-03 08:52:15', '2026-06-04 08:52:15', '2026-06-03 08:52:15', '2026-06-04 08:52:15');
INSERT INTO `merchant_audit` VALUES (25, 1025, '1', '0', '{\"license_img\":\"https://example.com/license1025.jpg\",\"id_card\":\"https://example.com/id1025.jpg\"}', NULL, NULL, NULL, '2026-06-06 00:52:15', NULL, '2026-06-06 00:52:15', '2026-06-06 00:52:15');
INSERT INTO `merchant_audit` VALUES (26, 1026, '1', '1', '{\"license_img\":\"https://example.com/license1026.jpg\",\"id_card\":\"https://example.com/id1026.jpg\"}', '审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (27, 1027, '1', '1', '{\"license_img\":\"https://example.com/license1027.jpg\",\"id_card\":\"https://example.com/id1027.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (28, 1028, '1', '2', '{\"license_img\":\"https://example.com/license1028.jpg\"}', '法人身份证信息不匹配，请核实', 1, 'admin', '2026-06-02 08:52:15', '2026-06-03 08:52:15', '2026-06-02 08:52:15', '2026-06-03 08:52:15');
INSERT INTO `merchant_audit` VALUES (29, 1029, '1', '1', '{\"license_img\":\"https://example.com/license1029.jpg\",\"id_card\":\"https://example.com/id1029.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 20:52:15', '2026-06-05 08:52:15', '2026-06-05 20:52:15');
INSERT INTO `merchant_audit` VALUES (30, 1030, '1', '1', '{\"license_img\":\"https://example.com/license1030.jpg\",\"id_card\":\"https://example.com/id1030.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 22:52:15', '2026-06-05 08:52:15', '2026-06-05 22:52:15');
INSERT INTO `merchant_audit` VALUES (31, 1031, '1', '0', '{\"license_img\":\"https://example.com/license1031.jpg\",\"id_card\":\"https://example.com/id1031.jpg\"}', NULL, NULL, NULL, '2026-06-06 03:52:15', NULL, '2026-06-06 03:52:15', '2026-06-06 03:52:15');
INSERT INTO `merchant_audit` VALUES (32, 1032, '1', '1', '{\"license_img\":\"https://example.com/license1032.jpg\",\"id_card\":\"https://example.com/id1032.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 08:52:15', '2026-06-06 00:52:15', '2026-06-05 08:52:15', '2026-06-06 00:52:15');
INSERT INTO `merchant_audit` VALUES (33, 1033, '1', '1', '{\"license_img\":\"https://example.com/license1033.jpg\",\"id_card\":\"https://example.com/id1033.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-05 14:52:15', '2026-06-06 02:52:15', '2026-06-05 14:52:15', '2026-06-06 02:52:15');
INSERT INTO `merchant_audit` VALUES (34, 1034, '1', '1', '{\"license_img\":\"https://example.com/license1034.jpg\",\"id_card\":\"https://example.com/id1034.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-05 16:52:15', '2026-06-06 04:52:15', '2026-06-05 16:52:15', '2026-06-06 04:52:15');
INSERT INTO `merchant_audit` VALUES (35, 1035, '1', '2', '{\"license_img\":\"https://example.com/license1035.jpg\"}', '经营范围与申请类型不符，请修改', 1, 'admin', '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-04 08:52:15', '2026-06-05 08:52:15');
INSERT INTO `merchant_audit` VALUES (36, 1036, '1', '1', '{\"license_img\":\"https://example.com/license1036.jpg\",\"id_card\":\"https://example.com/id1036.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 18:52:15', '2026-06-06 06:52:15', '2026-06-05 18:52:15', '2026-06-06 06:52:15');
INSERT INTO `merchant_audit` VALUES (37, 1037, '1', '1', '{\"license_img\":\"https://example.com/license1037.jpg\",\"id_card\":\"https://example.com/id1037.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-05 20:52:15', '2026-06-06 07:52:15', '2026-06-05 20:52:15', '2026-06-06 07:52:15');
INSERT INTO `merchant_audit` VALUES (38, 1038, '1', '0', '{\"license_img\":\"https://example.com/license1038.jpg\",\"id_card\":\"https://example.com/id1038.jpg\"}', NULL, NULL, NULL, '2026-06-06 05:52:15', NULL, '2026-06-06 05:52:15', '2026-06-06 05:52:15');
INSERT INTO `merchant_audit` VALUES (39, 1039, '1', '1', '{\"license_img\":\"https://example.com/license1039.jpg\",\"id_card\":\"https://example.com/id1039.jpg\"}', '审核通过', 1, 'admin', '2026-06-05 22:52:15', '2026-06-06 08:22:15', '2026-06-05 22:52:15', '2026-06-06 08:22:15');
INSERT INTO `merchant_audit` VALUES (40, 1040, '1', '1', '{\"license_img\":\"https://example.com/license1040.jpg\",\"id_card\":\"https://example.com/id1040.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 00:52:15', '2026-06-06 07:52:15', '2026-06-06 00:52:15', '2026-06-06 07:52:15');
INSERT INTO `merchant_audit` VALUES (41, 1041, '1', '1', '{\"license_img\":\"https://example.com/license1041.jpg\",\"id_card\":\"https://example.com/id1041.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-06-06 02:52:15', '2026-06-06 08:22:15', '2026-06-06 02:52:15', '2026-06-06 08:22:15');
INSERT INTO `merchant_audit` VALUES (42, 1042, '1', '2', '{\"license_img\":\"https://example.com/license1042.jpg\"}', '联系电话无法接通，请确认后重新提交', 1, 'admin', '2026-06-05 08:52:15', '2026-06-05 20:52:15', '2026-06-05 08:52:15', '2026-06-05 20:52:15');
INSERT INTO `merchant_audit` VALUES (43, 1043, '1', '1', '{\"license_img\":\"https://example.com/license1043.jpg\",\"id_card\":\"https://example.com/id1043.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 04:52:15', '2026-06-06 07:52:15', '2026-06-06 04:52:15', '2026-06-06 07:52:15');
INSERT INTO `merchant_audit` VALUES (44, 1044, '1', '1', '{\"license_img\":\"https://example.com/license1044.jpg\",\"id_card\":\"https://example.com/id1044.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 05:52:15', '2026-06-06 08:22:15', '2026-06-06 05:52:15', '2026-06-06 08:22:15');
INSERT INTO `merchant_audit` VALUES (45, 1045, '1', '0', '{\"license_img\":\"https://example.com/license1045.jpg\",\"id_card\":\"https://example.com/id1045.jpg\"}', NULL, NULL, NULL, '2026-06-06 06:52:15', NULL, '2026-06-06 06:52:15', '2026-06-06 06:52:15');
INSERT INTO `merchant_audit` VALUES (46, 1046, '1', '1', '{\"license_img\":\"https://example.com/license1046.jpg\",\"id_card\":\"https://example.com/id1046.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 06:52:15', '2026-06-06 07:52:15', '2026-06-06 06:52:15', '2026-06-06 07:52:15');
INSERT INTO `merchant_audit` VALUES (47, 1047, '1', '1', '{\"license_img\":\"https://example.com/license1047.jpg\",\"id_card\":\"https://example.com/id1047.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 07:22:15', '2026-06-06 08:22:15', '2026-06-06 07:22:15', '2026-06-06 08:22:15');
INSERT INTO `merchant_audit` VALUES (48, 1048, '1', '1', '{\"license_img\":\"https://example.com/license1048.jpg\",\"id_card\":\"https://example.com/id1048.jpg\"}', '审核通过，准予入驻', 1, 'admin', '2026-06-06 07:52:15', '2026-06-06 08:37:15', '2026-06-06 07:52:15', '2026-06-06 08:37:15');
INSERT INTO `merchant_audit` VALUES (49, 1049, '1', '0', '{\"license_img\":\"https://example.com/license1049.jpg\",\"id_card\":\"https://example.com/id1049.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:07:15', NULL, '2026-06-06 08:07:15', '2026-06-06 08:07:15');
INSERT INTO `merchant_audit` VALUES (50, 1050, '1', '1', '{\"license_img\":\"https://example.com/license1050.jpg\",\"id_card\":\"https://example.com/id1050.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:22:15', '2026-06-06 08:42:15', '2026-06-06 08:22:15', '2026-06-06 08:42:15');
INSERT INTO `merchant_audit` VALUES (51, 1051, '1', '1', '{\"license_img\":\"https://example.com/license1051.jpg\",\"id_card\":\"https://example.com/id1051.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-06 08:27:15', '2026-06-06 08:47:15', '2026-06-06 08:27:15', '2026-06-06 08:47:15');
INSERT INTO `merchant_audit` VALUES (52, 1052, '1', '2', '{\"license_img\":\"https://example.com/license1052.jpg\"}', '邮箱地址格式错误，请修正后重新提交', 1, 'admin', '2026-06-06 06:52:15', '2026-06-06 07:52:15', '2026-06-06 06:52:15', '2026-06-06 07:52:15');
INSERT INTO `merchant_audit` VALUES (53, 1053, '1', '1', '{\"license_img\":\"https://example.com/license1053.jpg\",\"id_card\":\"https://example.com/id1053.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:32:15', '2026-06-06 08:47:15', '2026-06-06 08:32:15', '2026-06-06 08:47:15');
INSERT INTO `merchant_audit` VALUES (54, 1054, '1', '1', '{\"license_img\":\"https://example.com/license1054.jpg\",\"id_card\":\"https://example.com/id1054.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 08:37:15', '2026-06-06 08:49:15', '2026-06-06 08:37:15', '2026-06-06 08:49:15');
INSERT INTO `merchant_audit` VALUES (55, 1055, '1', '0', '{\"license_img\":\"https://example.com/license1055.jpg\",\"id_card\":\"https://example.com/id1055.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:42:15', NULL, '2026-06-06 08:42:15', '2026-06-06 08:42:15');
INSERT INTO `merchant_audit` VALUES (56, 1056, '1', '1', '{\"license_img\":\"https://example.com/license1056.jpg\",\"id_card\":\"https://example.com/id1056.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:44:15', '2026-06-06 08:50:15', '2026-06-06 08:44:15', '2026-06-06 08:50:15');
INSERT INTO `merchant_audit` VALUES (57, 1057, '1', '1', '{\"license_img\":\"https://example.com/license1057.jpg\",\"id_card\":\"https://example.com/id1057.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 08:47:15', '2026-06-06 08:51:15', '2026-06-06 08:47:15', '2026-06-06 08:51:15');
INSERT INTO `merchant_audit` VALUES (58, 1058, '1', '1', '{\"license_img\":\"https://example.com/license1058.jpg\",\"id_card\":\"https://example.com/id1058.jpg\"}', '审核通过，资质良好', 1, 'admin', '2026-06-06 08:49:15', '2026-06-06 08:52:15', '2026-06-06 08:49:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (59, 1059, '1', '0', '{\"license_img\":\"https://example.com/license1059.jpg\",\"id_card\":\"https://example.com/id1059.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (60, 1060, '1', '1', '{\"license_img\":\"https://example.com/license1060.jpg\",\"id_card\":\"https://example.com/id1060.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:50:15', '2026-06-06 08:52:15', '2026-06-06 08:50:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (61, 1061, '1', '1', '{\"license_img\":\"https://example.com/license1061.jpg\",\"id_card\":\"https://example.com/id1061.jpg\"}', '资质齐全，审核通过', 1, 'admin', '2026-06-06 08:51:15', '2026-06-06 08:52:15', '2026-06-06 08:51:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (62, 1062, '1', '0', '{\"license_img\":\"https://example.com/license1062.jpg\",\"id_card\":\"https://example.com/id1062.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (63, 1063, '1', '1', '{\"license_img\":\"https://example.com/license1063.jpg\",\"id_card\":\"https://example.com/id1063.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:51:45', '2026-06-06 08:52:15', '2026-06-06 08:51:45', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (64, 1064, '1', '1', '{\"license_img\":\"https://example.com/license1064.jpg\",\"id_card\":\"https://example.com/id1064.jpg\"}', '资质审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (65, 1065, '1', '2', '{\"license_img\":\"https://example.com/license1065.jpg\"}', '地址信息不完整，请补充详细地址', 1, 'admin', '2026-06-06 08:47:15', '2026-06-06 08:51:15', '2026-06-06 08:47:15', '2026-06-06 08:51:15');
INSERT INTO `merchant_audit` VALUES (66, 1066, '1', '1', '{\"license_img\":\"https://example.com/license1066.jpg\",\"id_card\":\"https://example.com/id1066.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (67, 1067, '1', '1', '{\"license_img\":\"https://example.com/license1067.jpg\",\"id_card\":\"https://example.com/id1067.jpg\"}', '资质齐全，通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (68, 1068, '1', '0', '{\"license_img\":\"https://example.com/license1068.jpg\",\"id_card\":\"https://example.com/id1068.jpg\"}', NULL, NULL, NULL, '2026-06-06 08:52:15', NULL, '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (69, 1069, '1', '1', '{\"license_img\":\"https://example.com/license1069.jpg\",\"id_card\":\"https://example.com/id1069.jpg\"}', '审核通过', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15');
INSERT INTO `merchant_audit` VALUES (70, 1070, '1', '1', '{\"license_img\":\"https://example.com/license1070.jpg\",\"id_card\":\"https://example.com/id1070.jpg\"}', '资质审核通过，准予入驻', 1, 'admin', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15', '2026-06-06 08:52:15');

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
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_room_id`(`room_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ORD20260602000001', 2349, 88, 303, '2026-07-21', '2026-07-24', 2398.10, '5', '2026-05-24 00:30:58', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (2, 'ORD20260602000002', 2022, 16, 106, '2026-05-29', '2026-06-01', 1745.80, '1', '2026-05-04 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (3, 'ORD20260602000003', 2410, 99, 265, '2026-07-15', '2026-07-19', 1360.42, '5', '2026-05-13 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (4, 'ORD20260602000004', 2071, 24, 199, '2026-05-01', '2026-05-05', 687.59, '3', '2026-05-19 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (5, 'ORD20260602000005', 2213, 25, 12, '2026-05-04', '2026-05-09', 2304.59, '2', NULL, '2026-04-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (6, 'ORD20260602000006', 2087, 58, 203, '2026-05-13', '2026-05-14', 2384.60, '4', '2026-05-28 00:30:58', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (7, 'ORD20260602000007', 2272, 38, 188, '2026-05-12', '2026-05-17', 2707.33, '3', '2026-05-15 00:30:58', '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (8, 'ORD20260602000008', 2347, 39, 61, '2026-07-26', '2026-07-30', 3797.54, '3', '2026-05-19 00:30:58', '2026-04-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (9, 'ORD20260602000009', 2195, 30, 90, '2026-05-17', '2026-05-21', 963.60, '2', NULL, '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (10, 'ORD20260602000010', 2493, 76, 229, '2026-07-27', '2026-08-01', 2977.69, '0', NULL, '2026-05-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (11, 'ORD20260602000011', 2355, 96, 181, '2026-05-02', '2026-05-07', 3005.26, '0', NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (12, 'ORD20260602000012', 2472, 84, 243, '2026-06-27', '2026-06-29', 4831.67, '4', '2026-05-17 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (13, 'ORD20260602000013', 2348, 61, 37, '2026-05-16', '2026-05-20', 1400.81, '5', '2026-05-05 00:30:58', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (14, 'ORD20260602000014', 2471, 87, 178, '2026-05-18', '2026-05-19', 439.02, '4', '2026-05-08 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (15, 'ORD20260602000015', 2420, 98, 54, '2026-07-06', '2026-07-07', 3793.12, '0', NULL, '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (16, 'ORD20260602000016', 2101, 76, 174, '2026-06-17', '2026-06-18', 2980.45, '4', '2026-05-31 00:30:58', '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (17, 'ORD20260602000017', 2086, 53, 53, '2026-06-07', '2026-06-10', 3179.89, '2', NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (18, 'ORD20260602000018', 2219, 35, 33, '2026-07-21', '2026-07-23', 2443.83, '3', '2026-05-19 00:30:58', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (19, 'ORD20260602000019', 2195, 88, 142, '2026-07-06', '2026-07-09', 2395.49, '3', '2026-05-09 00:30:58', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (20, 'ORD20260602000020', 2036, 23, 263, '2026-05-11', '2026-05-13', 2254.06, '0', NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (21, 'ORD20260602000021', 2181, 30, 298, '2026-05-24', '2026-05-26', 2305.06, '2', NULL, '2026-04-21 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (22, 'ORD20260602000022', 2444, 35, 204, '2026-07-03', '2026-07-08', 769.16, '5', '2026-05-16 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (23, 'ORD20260602000023', 2251, 9, 195, '2026-07-16', '2026-07-20', 1362.29, '5', '2026-05-15 00:30:58', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (24, 'ORD20260602000024', 2424, 60, 185, '2026-06-29', '2026-07-03', 3670.47, '2', NULL, '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (25, 'ORD20260602000025', 2243, 47, 62, '2026-07-21', '2026-07-22', 3373.94, '0', NULL, '2026-05-18 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (26, 'ORD20260602000026', 2243, 16, 346, '2026-06-12', '2026-06-17', 302.93, '2', NULL, '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (27, 'ORD20260602000027', 2042, 92, 58, '2026-07-23', '2026-07-26', 1436.17, '5', '2026-05-28 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (28, 'ORD20260602000028', 2016, 63, 344, '2026-05-21', '2026-05-22', 2339.22, '0', NULL, '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (29, 'ORD20260602000029', 2320, 83, 148, '2026-07-24', '2026-07-28', 607.57, '5', '2026-05-10 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (30, 'ORD20260602000030', 2164, 40, 36, '2026-06-01', '2026-06-05', 3550.41, '1', '2026-06-02 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (31, 'ORD20260602000031', 2154, 8, 38, '2026-05-21', '2026-05-22', 1640.72, '5', '2026-05-21 00:30:58', '2026-05-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (32, 'ORD20260602000032', 2300, 12, 67, '2026-06-09', '2026-06-11', 2942.54, '4', '2026-05-11 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (33, 'ORD20260602000033', 2032, 37, 221, '2026-06-08', '2026-06-13', 2604.75, '3', '2026-05-20 00:30:58', '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (34, 'ORD20260602000034', 2070, 12, 34, '2026-06-06', '2026-06-10', 4689.89, '4', '2026-06-01 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (35, 'ORD20260602000035', 2219, 52, 280, '2026-07-11', '2026-07-15', 4383.80, '2', NULL, '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (36, 'ORD20260602000036', 2148, 68, 93, '2026-07-01', '2026-07-04', 3205.55, '2', NULL, '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (37, 'ORD20260602000037', 2191, 47, 194, '2026-05-23', '2026-05-24', 4350.51, '5', '2026-05-31 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (38, 'ORD20260602000038', 2245, 75, 332, '2026-06-25', '2026-06-29', 1098.15, '0', NULL, '2026-04-22 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (39, 'ORD20260602000039', 2414, 33, 197, '2026-06-11', '2026-06-16', 3467.89, '5', '2026-05-13 00:30:58', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (40, 'ORD20260602000040', 2053, 75, 25, '2026-05-30', '2026-06-01', 3031.12, '5', '2026-05-30 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (41, 'ORD20260602000041', 2433, 73, 284, '2026-07-21', '2026-07-26', 4658.03, '5', '2026-05-19 00:30:58', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (42, 'ORD20260602000042', 2398, 53, 97, '2026-05-15', '2026-05-18', 2890.52, '3', '2026-06-01 00:30:58', '2026-04-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (43, 'ORD20260602000043', 2098, 77, 35, '2026-07-02', '2026-07-07', 1501.34, '4', '2026-05-15 00:30:58', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (44, 'ORD20260602000044', 2082, 68, 14, '2026-07-04', '2026-07-05', 1240.82, '4', '2026-05-22 00:30:58', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (45, 'ORD20260602000045', 2343, 54, 21, '2026-05-24', '2026-05-26', 2246.49, '2', NULL, '2026-05-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (46, 'ORD20260602000046', 2449, 59, 116, '2026-06-15', '2026-06-20', 3503.89, '5', '2026-05-22 00:30:58', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (47, 'ORD20260602000047', 2020, 8, 229, '2026-05-22', '2026-05-23', 3583.61, '1', '2026-05-30 00:30:58', '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (48, 'ORD20260602000048', 2182, 65, 302, '2026-05-23', '2026-05-24', 4694.19, '1', '2026-05-17 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (49, 'ORD20260602000049', 2455, 94, 331, '2026-07-04', '2026-07-09', 867.63, '0', NULL, '2026-04-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (50, 'ORD20260602000050', 2156, 9, 321, '2026-07-13', '2026-07-14', 1418.11, '4', '2026-05-28 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (51, 'ORD20260602000051', 2350, 45, 142, '2026-05-26', '2026-05-28', 4171.90, '0', NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (52, 'ORD20260602000052', 2355, 99, 257, '2026-06-02', '2026-06-06', 1170.18, '5', '2026-05-24 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (53, 'ORD20260602000053', 2480, 26, 120, '2026-07-09', '2026-07-10', 3530.21, '2', NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (54, 'ORD20260602000054', 2404, 4, 344, '2026-05-10', '2026-05-11', 650.12, '0', NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (55, 'ORD20260602000055', 2402, 12, 10, '2026-07-25', '2026-07-27', 3569.92, '3', '2026-05-12 00:30:58', '2026-04-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (56, 'ORD20260602000056', 2482, 34, 349, '2026-07-15', '2026-07-17', 412.93, '1', '2026-05-07 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (57, 'ORD20260602000057', 2326, 62, 175, '2026-07-09', '2026-07-14', 944.64, '0', NULL, '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (58, 'ORD20260602000058', 2324, 36, 261, '2026-05-01', '2026-05-02', 2540.99, '0', NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (59, 'ORD20260602000059', 2037, 63, 66, '2026-07-12', '2026-07-17', 3557.52, '5', '2026-05-07 00:30:58', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (60, 'ORD20260602000060', 2172, 55, 138, '2026-06-18', '2026-06-22', 3821.78, '4', '2026-05-23 00:30:58', '2026-04-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (61, 'ORD20260602000061', 2344, 11, 210, '2026-06-28', '2026-06-29', 4792.59, '1', '2026-05-24 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (62, 'ORD20260602000062', 2468, 36, 71, '2026-05-08', '2026-05-12', 4136.31, '1', '2026-05-11 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (63, 'ORD20260602000063', 2192, 69, 171, '2026-06-10', '2026-06-11', 1493.47, '5', '2026-05-12 00:30:58', '2026-04-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (64, 'ORD20260602000064', 2407, 55, 312, '2026-06-06', '2026-06-09', 3572.14, '4', '2026-05-16 00:30:58', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (65, 'ORD20260602000065', 2266, 67, 108, '2026-07-06', '2026-07-07', 1504.66, '5', '2026-05-27 00:30:58', '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (66, 'ORD20260602000066', 2234, 98, 168, '2026-07-22', '2026-07-23', 452.85, '4', '2026-05-21 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (67, 'ORD20260602000067', 2349, 45, 142, '2026-05-26', '2026-05-28', 3603.39, '3', '2026-05-09 00:30:58', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (68, 'ORD20260602000068', 2353, 38, 269, '2026-05-22', '2026-05-23', 2951.87, '3', '2026-05-15 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (69, 'ORD20260602000069', 2048, 40, 301, '2026-07-22', '2026-07-24', 3335.80, '2', NULL, '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (70, 'ORD20260602000070', 2194, 6, 38, '2026-06-25', '2026-06-30', 4280.76, '2', NULL, '2026-05-04 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (71, 'ORD20260602000071', 2471, 25, 257, '2026-06-15', '2026-06-19', 676.53, '1', '2026-05-05 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (72, 'ORD20260602000072', 2198, 5, 107, '2026-05-07', '2026-05-08', 3184.78, '3', '2026-06-02 00:30:58', '2026-05-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (73, 'ORD20260602000073', 2151, 82, 333, '2026-06-29', '2026-07-02', 892.91, '2', NULL, '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (74, 'ORD20260602000074', 2157, 93, 146, '2026-05-30', '2026-06-03', 2168.93, '5', '2026-05-14 00:30:58', '2026-05-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (75, 'ORD20260602000075', 2362, 72, 201, '2026-07-21', '2026-07-23', 808.84, '2', NULL, '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (76, 'ORD20260602000076', 2208, 8, 255, '2026-07-21', '2026-07-23', 3378.82, '2', NULL, '2026-05-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (77, 'ORD20260602000077', 2261, 14, 276, '2026-05-23', '2026-05-27', 3625.14, '2', NULL, '2026-05-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (78, 'ORD20260602000078', 2150, 50, 336, '2026-06-26', '2026-06-28', 1989.41, '0', NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (79, 'ORD20260602000079', 2249, 63, 237, '2026-06-11', '2026-06-16', 3966.58, '2', NULL, '2026-04-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (80, 'ORD20260602000080', 2143, 94, 287, '2026-07-27', '2026-08-01', 590.63, '1', '2026-05-20 00:30:58', '2026-05-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (81, 'ORD20260602000081', 2045, 80, 103, '2026-06-21', '2026-06-24', 1364.40, '2', NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (82, 'ORD20260602000082', 2312, 69, 327, '2026-05-30', '2026-06-03', 4255.59, '5', '2026-06-01 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (83, 'ORD20260602000083', 2437, 7, 5, '2026-05-31', '2026-06-01', 1908.94, '2', NULL, '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (84, 'ORD20260602000084', 2441, 76, 151, '2026-05-12', '2026-05-17', 2968.01, '5', '2026-05-15 00:30:58', '2026-04-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (85, 'ORD20260602000085', 2426, 93, 324, '2026-06-14', '2026-06-19', 383.63, '2', NULL, '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (86, 'ORD20260602000086', 2375, 39, 64, '2026-05-19', '2026-05-24', 2054.03, '2', NULL, '2026-05-22 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (87, 'ORD20260602000087', 2121, 61, 144, '2026-07-29', '2026-07-31', 904.66, '5', '2026-05-17 00:30:58', '2026-04-21 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (88, 'ORD20260602000088', 2424, 99, 266, '2026-07-26', '2026-07-28', 2768.82, '4', '2026-05-25 00:30:58', '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (89, 'ORD20260602000089', 2042, 72, 88, '2026-07-01', '2026-07-02', 3677.34, '0', NULL, '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (90, 'ORD20260602000090', 2067, 18, 117, '2026-06-30', '2026-07-05', 4157.97, '1', '2026-05-18 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (91, 'ORD20260602000091', 2038, 63, 347, '2026-06-08', '2026-06-13', 977.19, '0', NULL, '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (92, 'ORD20260602000092', 2179, 43, 114, '2026-07-13', '2026-07-14', 3489.62, '1', '2026-05-18 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (93, 'ORD20260602000093', 2282, 48, 211, '2026-05-02', '2026-05-05', 4972.84, '4', '2026-05-12 00:30:58', '2026-05-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (94, 'ORD20260602000094', 2474, 39, 7, '2026-07-01', '2026-07-04', 4560.05, '4', '2026-06-02 00:30:58', '2026-04-11 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (95, 'ORD20260602000095', 2076, 34, 12, '2026-06-30', '2026-07-05', 2311.68, '2', NULL, '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (96, 'ORD20260602000096', 2319, 11, 67, '2026-06-26', '2026-06-28', 1053.45, '1', '2026-05-21 00:30:58', '2026-04-28 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (97, 'ORD20260602000097', 2001, 68, 213, '2026-05-18', '2026-05-23', 1833.85, '4', '2026-05-21 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (98, 'ORD20260602000098', 2355, 81, 10, '2026-06-12', '2026-06-14', 3338.95, '3', '2026-05-31 00:30:58', '2026-05-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (99, 'ORD20260602000099', 2235, 54, 5, '2026-05-28', '2026-05-29', 3992.03, '2', NULL, '2026-05-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (100, 'ORD20260602000100', 2182, 15, 127, '2026-07-06', '2026-07-09', 3519.77, '4', '2026-05-21 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (101, 'ORD20260602000101', 2026, 62, 64, '2026-07-04', '2026-07-07', 406.55, '4', '2026-05-05 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (102, 'ORD20260602000102', 2098, 10, 105, '2026-05-08', '2026-05-13', 4977.43, '2', NULL, '2026-05-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (103, 'ORD20260602000103', 2025, 31, 69, '2026-06-30', '2026-07-02', 587.57, '3', '2026-05-31 00:30:58', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (104, 'ORD20260602000104', 2373, 25, 244, '2026-06-28', '2026-06-29', 964.99, '3', '2026-05-09 00:30:58', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (105, 'ORD20260602000105', 2366, 27, 318, '2026-07-25', '2026-07-28', 4105.04, '2', NULL, '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (106, 'ORD20260602000106', 2482, 96, 58, '2026-05-30', '2026-06-03', 4087.95, '4', '2026-05-23 00:30:58', '2026-05-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (107, 'ORD20260602000107', 2178, 13, 122, '2026-07-06', '2026-07-10', 340.97, '0', NULL, '2026-05-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (108, 'ORD20260602000108', 2222, 8, 326, '2026-06-08', '2026-06-13', 3757.76, '1', '2026-05-30 00:30:58', '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (109, 'ORD20260602000109', 2007, 91, 332, '2026-05-22', '2026-05-23', 387.57, '3', '2026-05-27 00:30:58', '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (110, 'ORD20260602000110', 2286, 71, 119, '2026-07-16', '2026-07-19', 980.01, '0', NULL, '2026-05-29 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (111, 'ORD20260602000111', 2463, 10, 86, '2026-07-21', '2026-07-25', 4941.05, '4', '2026-05-15 00:30:58', '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (112, 'ORD20260602000112', 2040, 94, 272, '2026-05-08', '2026-05-09', 2910.07, '1', '2026-05-09 00:30:58', '2026-05-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (113, 'ORD20260602000113', 2418, 76, 7, '2026-05-12', '2026-05-13', 1619.04, '0', NULL, '2026-05-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (114, 'ORD20260602000114', 2044, 85, 255, '2026-05-25', '2026-05-26', 2993.06, '3', '2026-05-20 00:30:58', '2026-05-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (115, 'ORD20260602000115', 2202, 67, 28, '2026-07-11', '2026-07-15', 1801.61, '2', NULL, '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (116, 'ORD20260602000116', 2162, 62, 83, '2026-07-22', '2026-07-25', 1342.00, '1', '2026-05-04 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (117, 'ORD20260602000117', 2001, 90, 188, '2026-06-06', '2026-06-07', 4646.86, '3', '2026-05-06 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (118, 'ORD20260602000118', 2257, 83, 139, '2026-06-04', '2026-06-06', 4092.05, '5', '2026-05-08 00:30:58', '2026-04-27 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (119, 'ORD20260602000119', 2270, 59, 20, '2026-06-17', '2026-06-18', 3037.39, '4', '2026-05-25 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (120, 'ORD20260602000120', 2293, 17, 286, '2026-06-13', '2026-06-17', 4247.40, '1', '2026-05-15 00:30:58', '2026-05-13 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (121, 'ORD20260602000121', 2494, 92, 192, '2026-05-28', '2026-05-31', 4136.36, '2', NULL, '2026-04-16 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (122, 'ORD20260602000122', 2051, 59, 201, '2026-07-11', '2026-07-15', 4863.20, '5', '2026-05-25 00:30:58', '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (123, 'ORD20260602000123', 2456, 72, 284, '2026-05-13', '2026-05-18', 2167.40, '0', NULL, '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (124, 'ORD20260602000124', 2231, 13, 268, '2026-05-02', '2026-05-06', 2106.50, '5', '2026-05-28 00:30:58', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (125, 'ORD20260602000125', 2109, 84, 120, '2026-05-06', '2026-05-10', 1041.30, '4', '2026-05-21 00:30:58', '2026-04-20 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (126, 'ORD20260602000126', 2058, 42, 305, '2026-07-27', '2026-07-30', 3128.49, '3', '2026-05-12 00:30:58', '2026-06-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (127, 'ORD20260602000127', 2062, 92, 202, '2026-07-20', '2026-07-21', 4523.46, '0', NULL, '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (128, 'ORD20260602000128', 2190, 51, 203, '2026-05-15', '2026-05-19', 4671.77, '3', '2026-05-28 00:30:58', '2026-05-25 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (129, 'ORD20260602000129', 2298, 12, 67, '2026-06-07', '2026-06-09', 1242.33, '0', NULL, '2026-05-30 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (130, 'ORD20260602000130', 2472, 91, 116, '2026-07-06', '2026-07-11', 487.22, '3', '2026-05-30 00:30:58', '2026-04-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (131, 'ORD20260602000131', 2122, 92, 209, '2026-06-09', '2026-06-12', 4775.18, '2', NULL, '2026-05-24 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (132, 'ORD20260602000132', 2462, 56, 112, '2026-06-30', '2026-07-03', 4667.28, '5', '2026-05-16 00:30:58', '2026-05-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (133, 'ORD20260602000133', 2483, 97, 271, '2026-06-16', '2026-06-20', 4606.29, '2', NULL, '2026-04-19 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (134, 'ORD20260602000134', 2485, 19, 247, '2026-07-07', '2026-07-12', 4596.29, '0', NULL, '2026-04-26 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (135, 'ORD20260602000135', 2147, 90, 209, '2026-07-02', '2026-07-05', 4287.19, '2', NULL, '2026-04-12 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (136, 'ORD20260602000136', 2248, 89, 291, '2026-07-28', '2026-07-31', 1637.66, '0', NULL, '2026-05-02 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (137, 'ORD20260602000137', 2229, 38, 112, '2026-06-01', '2026-06-03', 3875.78, '4', '2026-05-24 00:30:58', '2026-05-07 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (138, 'ORD20260602000138', 2018, 26, 338, '2026-05-27', '2026-05-29', 4826.84, '4', '2026-05-15 00:30:58', '2026-05-31 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (139, 'ORD20260602000139', 2493, 36, 213, '2026-05-10', '2026-05-13', 3245.43, '2', NULL, '2026-04-09 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (140, 'ORD20260602000140', 2459, 49, 236, '2026-06-21', '2026-06-22', 4542.54, '0', NULL, '2026-04-06 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (141, 'ORD20260602000141', 2250, 41, 51, '2026-05-08', '2026-05-13', 1212.44, '1', '2026-05-04 00:30:58', '2026-04-05 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (142, 'ORD20260602000142', 2040, 95, 274, '2026-05-06', '2026-05-07', 653.53, '1', '2026-05-07 00:30:58', '2026-04-14 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (143, 'ORD20260602000143', 2313, 41, 200, '2026-06-08', '2026-06-10', 4723.91, '5', '2026-06-01 00:30:58', '2026-05-10 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (144, 'ORD20260602000144', 2456, 77, 225, '2026-06-27', '2026-06-30', 2380.31, '4', '2026-05-15 00:30:58', '2026-04-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (145, 'ORD20260602000145', 2197, 95, 158, '2026-06-26', '2026-07-01', 4564.92, '3', '2026-05-16 00:30:58', '2026-04-08 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (146, 'ORD20260602000146', 2268, 89, 223, '2026-07-09', '2026-07-11', 4706.35, '5', '2026-05-08 00:30:58', '2026-05-03 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (147, 'ORD20260602000147', 2420, 98, 125, '2026-05-13', '2026-05-14', 2094.36, '2', NULL, '2026-06-01 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (148, 'ORD20260602000148', 2006, 84, 37, '2026-07-07', '2026-07-11', 1570.28, '1', '2026-05-22 00:30:58', '2026-05-17 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (149, 'ORD20260602000149', 2186, 16, 339, '2026-07-26', '2026-07-30', 2988.78, '4', '2026-05-27 00:30:58', '2026-04-23 00:30:58', '2026-06-02 00:30:58');
INSERT INTO `orders` VALUES (150, 'ORD20260602000150', 2475, 78, 301, '2026-05-16', '2026-05-17', 3332.84, '0', NULL, '2026-04-24 00:30:58', '2026-06-02 00:30:58');

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
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

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
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片URL',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房源/房型表' ROW_FORMAT = Dynamic;

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
INSERT INTO `room` VALUES (277, 73, '豪华大床房', '38平米', '1.8米大床', 749.00, 28, '0', 'https://example.com/hotel73_room1.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (278, 73, '行政双床房', '42平米', '2张1.2米单人床', 879.00, 25, '0', 'https://example.com/hotel73_room2.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (279, 73, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1239.00, 11, '0', 'https://example.com/hotel73_room3.jpg', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-03-06 01:54:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-03-06 01:54:38', '', NULL, '管理员');

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
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '系统超级管理员，拥有所有权限');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'customer', 2, '5', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '前台普通用户，可以浏览酒店、预订房间');
INSERT INTO `sys_role` VALUES (3, '商户', 'merchant', 3, '3', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '酒店商家，可以管理自己的酒店和房源');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);

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
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', 'admin@hotel.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-17 20:42:03', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '超级管理员账号');
INSERT INTO `sys_user` VALUES (2, 105, 'customer01', '普通用户', '00', 'customer@test.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-08 10:11:53', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '前台普通用户账号');
INSERT INTO `sys_user` VALUES (100, 104, 'merchant01', '酒店商户', '01', 'merchant@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-09 16:28:27', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '酒店商家账号');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 3);

SET FOREIGN_KEY_CHECKS = 1;
