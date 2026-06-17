/*
 Navicat Premium Dump SQL

 Source Server         : book_library
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : zsc

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 16/06/2026 16:57:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_category
-- ----------------------------
DROP TABLE IF EXISTS `biz_category`;
CREATE TABLE `biz_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志(0正常 2删除)',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务类别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_category
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `hotel_id` bigint NOT NULL,
  `room_id` bigint NULL DEFAULT NULL,
  `order_id` bigint NULL DEFAULT NULL,
  `score` int NOT NULL DEFAULT 5,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_anonymous` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0待审核 1已发布 2已拒绝',
  `like_count` int NULL DEFAULT 0,
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `reply_time` datetime NULL DEFAULT NULL,
  `reply_by` bigint NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appeal_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `appeal_time` datetime NULL DEFAULT NULL,
  `appeal_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 100, 1, 1, 1, 5, '非常满意，下次还来！', NULL, '0', '1', 3, NULL, NULL, NULL, 'admin', '2026-06-10 22:11:24', '', '2026-06-10 22:11:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (2, 2, 2, 3, 3, 4, '环境不错，价格略高', NULL, '0', '1', 1, '感谢反馈', '2026-06-10 22:11:24', 1, 'admin', '2026-06-10 22:11:24', '', '2026-06-10 22:11:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (3, 103, 3, 4, 9, 5, '在成都出差入住了锦城大酒店，位置太方便了，就在春熙路旁边。大堂气派豪华，设施很新，服务人员非常专业！', '[]', '0', '1', 12, '感谢您的五星好评！期待您的再次光临！', '2026-06-16 16:17:18', 200, 'user3', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (4, 104, 3, 5, 15, 4, '酒店各方面都不错，位置好服务好。唯一小遗憾是入住时前台人比较多排了一会儿队。不过整体体验还是很满意的，推荐。', '[]', '0', '1', 3, '非常抱歉给您带来了排队的不便！我们已经增加了前台人手。', '2026-06-16 16:17:18', 200, 'user4', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (5, 105, 3, 1, 18, 2, '预订了豪华套房但是到了说没房了，给换了个普通大床房，没有提前通知，前台态度生硬。', '[]', '1', '1', 6, NULL, NULL, NULL, 'user5', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, '客人预订的是普通大床房而非豪华套房', '2026-06-16 16:17:18', '1');
INSERT INTO `comment` VALUES (6, 101, 1, 1, 8, 5, '来北京出差住了三天，位置绝佳步行五分钟到王府井。豪华大床房的床品很舒服，行政酒廊的下午茶非常精致。礼宾部小王专业又热情！', '[\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop\"]', '0', '1', 8, '感谢您的细致好评！我们会把您的表扬转达给礼宾部小王。', '2026-06-16 16:17:18', 100, 'user1', '2026-06-16 16:17:18', '', '2026-06-16 16:17:18', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (7, 101, 3, 4, 9, 4, '成都的酒店就是舒服！春熙路旁边逛街太方便了。房间设计很现代，设施也很新。稍微隔音差了点，不过整体性价比很高。', '[]', '0', '1', 4, '感谢您的反馈！关于隔音问题我们会安排工程部检查改善。', '2026-06-16 16:17:18', 200, 'user1', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (8, 102, 2, 3, 10, 5, '华尔道夫果然名不虚传！外滩景观房view一级棒，从房间就能看到陆家嘴三件套。早餐种类多到眼花缭乱。蜜月旅行选华尔道夫太对了！', '[\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', '0', '1', 15, '恭喜新婚！很高兴华尔道夫为您的蜜月之旅增添了美好回忆。', '2026-06-16 16:17:18', 2, 'user2', '2026-06-16 16:17:18', '', '2026-06-16 16:17:18', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (9, 102, 4, 6, 11, 4, '三亚阳光度假酒店很适合亲子游！儿童俱乐部内容丰富，娃玩得不想走。私人沙滩沙质很好。海鲜餐厅的椰子鸡火锅超好吃。水上乐园下午五点就关门有点早。', '[\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&h=300&fit=crop\"]', '0', '1', 7, '感谢您的反馈！水上乐园的开放时间我们已记录并会考虑延长。', '2026-06-16 16:17:18', 201, 'user2', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (10, 103, 1, 2, 12, 3, '北京希尔顿整体水平在线，但这次入住只能说中规中矩。标间面积偏小，两个人住有点拥挤。空调制冷效果一般。不过前台服务很好，位置确实方便。', '[]', '0', '1', 2, '感谢您的诚实反馈！建议您下次选择豪华大床房，空间更宽敞。', '2026-06-16 16:17:18', 100, 'user3', '2026-06-16 16:17:18', '', '2026-06-16 16:17:18', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (11, 103, 4, 6, 13, 5, '三亚这家度假酒店太棒了！海景套房面积超大，阳台上还有私人泡池，一边泡澡一边看海景太爽了。早餐种类丰富，SPA手法专业，值得一试！', '[\"https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&h=300&fit=crop\"]', '0', '1', 12, '感谢您的详细好评！海景套房是我们的招牌房型，期待您下次再来！', '2026-06-16 16:17:18', 201, 'user3', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (12, 104, 1, 1, 14, 5, '带家人来北京旅游选了希尔顿果然没错！豪华大床房空间够大，加了一张儿童床也不挤。早餐种类丰富。步行去故宫只要十五分钟。全家满意！', '[\"https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop\"]', '0', '1', 10, '很高兴您和家人在这里度过了愉快的假期！期待您全家的再次光临！', '2026-06-16 16:17:18', 100, 'user4', '2026-06-16 16:17:18', '', '2026-06-16 16:17:18', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (13, 104, 3, 4, 15, 5, '成都锦城大酒店真是意外之喜！位置绝佳出门就是春熙路。房间新装修设施齐全。三楼川菜馆的水煮鱼和麻婆豆腐超级正宗，不用去外面排队！', '[]', '0', '1', 6, '感谢您对锦城大酒店和川菜馆的认可！我们的大厨都是资深川菜师傅。', '2026-06-16 16:17:18', 200, 'user4', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (14, 105, 2, 3, 16, 5, '华尔道夫是我们的蜜月酒店太完美了！套房里有香槟和玫瑰花瓣布置非常浪漫。顶楼酒吧的鸡尾酒搭配外滩夜景，此生最难忘的回忆。强烈推荐给所有情侣！', '[\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', '0', '1', 22, '祝福你们！华尔道夫很荣幸能见证你们的甜蜜时刻。', '2026-06-16 16:17:18', 2, 'user5', '2026-06-16 16:17:18', '', '2026-06-16 16:17:18', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (15, 105, 4, 7, 17, 2, '这次三亚之行有些失望。预订的海景套房只给了三楼基本看不到海景。服务人员响应速度很慢，叫客房服务等了快四十分钟。作为五星级酒店完全不合格。', '[]', '0', '1', 9, NULL, NULL, NULL, 'user5', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, '客人预订的并非海景套房而是普通园景房', '2026-06-16 16:17:18', '1');
INSERT INTO `comment` VALUES (16, 100, 4, 6, 18, 4, '阳光度假酒店总体不错，沙滩很美设施齐全。就是暑期人太多了吃饭要排队。不过孩子们玩得很开心，水上乐园是亮点。', '[]', '0', '1', 3, '感谢您的评价！暑期是旺季，建议九月份错峰出行体验会更舒适。', '2026-06-16 16:17:18', 201, 'zhangsan', '2026-06-16 16:17:18', '', '2026-06-16 16:41:24', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (17, 106, 3, 5, 10, 5, '成都锦城大酒店太赞了！行政套房空间超级大，装修风格现代又有川式元素。最惊喜的是楼下川菜馆，水煮牛肉和担担面简直一绝。春熙路就在旁边逛街超方便。还会再来！', '[\"https://images.unsplash.com/photo-1551882547-be7b2a60087d?w=400&h=300&fit=crop\"]', '0', '1', 8, '感谢onz的好评！很高兴您喜欢我们的川菜馆，期待您再次光临成都！', '2026-06-22 10:30:00', 200, 'onz', '2026-06-22 10:30:00', '', '2026-06-22 10:30:00', NULL, NULL, NULL, '0');
INSERT INTO `comment` VALUES (18, 106, 1, 2, 12, 4, '北京希尔顿位置很好，行政双床房住着也舒服。就是价格稍微贵了点，不过一分钱一分货吧。早餐种类很多，推荐中式早点。整体满意！', '[]', '0', '1', 5, '感谢您的反馈！我们会继续优化价格策略，期待您再次选择希尔顿。', '2026-06-17 12:00:00', 100, 'onz', '2026-06-17 12:00:00', '', '2026-06-17 12:00:00', NULL, NULL, NULL, '0');

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `star` int NULL DEFAULT NULL,
  `score` decimal(3, 2) NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `facility` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `business_id` bigint NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店联系电话',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店简介',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志(0正常 2删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '北京王府井希尔顿酒店', '北京市东城区王府井大街88号', 5, 4.80, NULL, 'WiFi,游泳池,健身房,SPA,餐厅', 1001, '0', '2026-06-10 21:58:33', '2026-06-10 21:58:33', NULL, NULL, NULL, NULL, '0');
INSERT INTO `hotel` VALUES (2, '上海外滩华尔道夫酒店', '上海市黄浦区中山东一路2号', 5, 4.90, NULL, 'WiFi,游泳池,健身房,SPA,餐厅,酒吧', 1002, '0', '2026-06-10 21:58:33', '2026-06-10 21:58:33', NULL, NULL, NULL, NULL, '0');
INSERT INTO `hotel` VALUES (3, '成都春熙路锦城大酒店', '成都市锦江区春熙路168号', 5, 4.70, NULL, 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室', 2001, '0', '2026-06-16 16:10:47', '2026-06-16 16:10:47', '028-88886666', '五星级旗舰店，坐落于春熙路商圈，步行可达太古里、IFS。', 104.072000, 30.659000, '0');
INSERT INTO `hotel` VALUES (4, '三亚海棠湾阳光度假酒店', '三亚市海棠区海棠北路68号', 5, 4.60, NULL, 'WiFi,私人海滩,游泳池,水上乐园,SPA,海鲜餐厅,儿童俱乐部', 2002, '0', '2026-06-16 16:10:47', '2026-06-16 16:10:47', '0898-88889999', '面朝大海的五星级度假酒店，拥有600米私家沙滩。', 109.736000, 18.316000, '0');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `merchant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `license_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `legal_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `business_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `user_id` bigint NULL DEFAULT NULL,
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '审核状态',
  `reject_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `submit_time` datetime NULL DEFAULT NULL,
  `audit_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1001, '北京王府井酒店管理有限公司', '91110101MA12345678', '张经理', '13800001111', 'bjwj@hotel.com', '北京市东城区', '酒店管理', NULL, NULL, '0', 100, '1', NULL, NULL, NULL, '2026-06-10 21:57:50', '2026-06-10 21:57:50');
INSERT INTO `merchant` VALUES (1002, '上海外滩奢华酒店集团', '91310115MA87654321', '李总裁', '13800002222', 'shwt@hotel.com', '上海市黄浦区', '酒店管理', NULL, NULL, '0', 2, '1', NULL, NULL, NULL, '2026-06-10 21:57:50', '2026-06-10 21:57:50');
INSERT INTO `merchant` VALUES (2001, '成都锦城酒店管理有限公司', '91510100MA87650001', '王老板', '13800009999', 'merchant1@hotel.com', '成都市锦江区红星路', '酒店管理、餐饮服务', NULL, '成都本地知名酒店管理集团', '0', 200, '1', NULL, '2026-06-16 16:32:13', NULL, '2026-06-16 16:32:13', '2026-06-16 16:32:13');
INSERT INTO `merchant` VALUES (2002, '三亚阳光度假酒店管理有限公司', '91460100MA76543210', '刘总', '13800008888', 'merchant2@hotel.com', '三亚市海棠区海棠北路', '酒店管理、度假村运营', NULL, '三亚知名度假酒店品牌', '0', 201, '1', NULL, '2026-06-16 16:32:13', NULL, '2026-06-16 16:32:13', '2026-06-16 16:32:13');

-- ----------------------------
-- Table structure for merchant_audit
-- ----------------------------
DROP TABLE IF EXISTS `merchant_audit`;
CREATE TABLE `merchant_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint NOT NULL,
  `audit_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `submit_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auditor_id` bigint NULL DEFAULT NULL,
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `submit_time` datetime NULL DEFAULT NULL,
  `audit_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户审核表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of merchant_audit
-- ----------------------------
INSERT INTO `merchant_audit` VALUES (1, 1001, '1', '1', NULL, '审核通过', 1, 'admin', '2026-06-10 21:58:12', '2026-06-10 21:58:12', '2026-06-10 21:58:12', '2026-06-10 21:58:12');
INSERT INTO `merchant_audit` VALUES (2, 1002, '1', '1', NULL, '审核通过', 1, 'admin', '2026-06-10 21:58:12', '2026-06-10 21:58:12', '2026-06-10 21:58:12', '2026-06-10 21:58:12');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `hotel_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0待支付 1已支付 2已取消 3已完成 4退款中 5已退款',
  `pay_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ORD202606100001', 100, 1, 1, '2026-06-15', '2026-06-18', 2097.00, '1', '2026-06-10 21:59:07', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (2, 'ORD202606100002', 100, 1, 2, '2026-06-20', '2026-06-22', 1718.00, '0', NULL, '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (3, 'ORD202606100003', 2, 2, 3, '2026-06-25', '2026-06-28', 3897.00, '3', '2026-06-08 15:30:00', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (4, 'ORD202606100004', 1, 1, 1, '2026-07-15', '2026-07-18', 2097.00, '1', '2026-06-10 21:59:07', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (5, 'ORD202606100005', 2, 2, 3, '2026-08-01', '2026-08-03', 2598.00, '1', '2026-06-10 21:59:07', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (6, 'ORD202606100006', 100, 1, 2, '2026-07-20', '2026-07-22', 1718.00, '4', '2026-07-15 10:00:00', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (7, 'ORD202606100007', 103, 2, 3, '2026-08-10', '2026-08-15', 6495.00, '1', '2026-06-10 21:59:07', '2026-06-10 21:59:07', '2026-06-10 21:59:07');
INSERT INTO `orders` VALUES (8, 'ORD202606160001', 106, 1, 1, '2026-07-01', '2026-07-03', 1398.00, '0', NULL, '2026-06-16 17:00:00', '2026-06-16 17:00:00');
INSERT INTO `orders` VALUES (9, 'ORD202606160002', 106, 2, 3, '2026-07-10', '2026-07-13', 3897.00, '1', '2026-06-16 17:05:00', '2026-06-16 17:00:00', '2026-06-16 17:05:00');
INSERT INTO `orders` VALUES (10, 'ORD202606160003', 106, 3, 5, '2026-06-20', '2026-06-22', 3360.00, '3', '2026-06-20 10:30:00', '2026-06-16 17:00:00', '2026-06-22 10:30:00');
INSERT INTO `orders` VALUES (11, 'ORD202606160004', 106, 4, 6, '2026-08-05', '2026-08-09', 5120.00, '2', NULL, '2026-06-16 17:00:00', '2026-06-16 17:00:00');
INSERT INTO `orders` VALUES (12, 'ORD202606170001', 106, 1, 2, '2026-07-25', '2026-07-28', 2577.00, '1', '2026-06-17 10:00:00', '2026-06-17 10:00:00', '2026-06-17 10:05:00');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `pay_amount` decimal(10, 2) NOT NULL,
  `pay_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1微信 2支付宝 3银行卡',
  `pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0待支付 1已支付 2失败 3退款中 4已退款',
  `pay_time` datetime NULL DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 1, 2097.00, '1', '1', '2026-06-10 21:59:21', 'TXN001', '2026-06-10 21:59:21', '2026-06-10 21:59:21');
INSERT INTO `payment` VALUES (2, 4, 2097.00, '2', '1', '2026-06-10 21:59:21', 'TXN004', '2026-06-10 21:59:21', '2026-06-10 21:59:21');
INSERT INTO `payment` VALUES (3, 5, 2598.00, '1', '1', '2026-06-10 21:59:21', 'TXN005', '2026-06-10 21:59:21', '2026-06-10 21:59:21');
INSERT INTO `payment` VALUES (4, 6, 1718.00, '3', '3', '2026-06-10 21:59:21', 'TXN006', '2026-06-10 21:59:21', '2026-06-10 21:59:21');
INSERT INTO `payment` VALUES (5, 7, 6495.00, '1', '1', '2026-06-10 21:59:21', 'TXN007', '2026-06-10 21:59:21', '2026-06-10 21:59:21');
INSERT INTO `payment` VALUES (6, 9, 3897.00, '2', '1', '2026-06-16 17:05:00', 'TXN106002', '2026-06-16 17:00:00', '2026-06-16 17:05:00');
INSERT INTO `payment` VALUES (7, 10, 3360.00, '1', '1', '2026-06-20 10:30:00', 'TXN106003', '2026-06-16 17:00:00', '2026-06-20 10:30:00');
INSERT INTO `payment` VALUES (8, 12, 2577.00, '2', '1', '2026-06-17 10:00:00', 'TXN106004', '2026-06-17 10:00:00', '2026-06-17 10:05:00');

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint NOT NULL,
  `room_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bed_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `stock` int NOT NULL DEFAULT 0,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `guest_num` int NULL DEFAULT NULL COMMENT '可入住人数',
  `has_breakfast` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0无早餐 1含早餐',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志(0正常 2删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 1, '豪华大床房', '38平米', '1.8米大床', 699.00, 10, '0', NULL, '2026-06-10 21:58:48', '2026-06-10 21:58:48', NULL, '0', '0');
INSERT INTO `room` VALUES (2, 1, '行政双床房', '42平米', '2张1.2米单人床', 859.00, 8, '0', NULL, '2026-06-10 21:58:49', '2026-06-10 21:58:49', NULL, '0', '0');
INSERT INTO `room` VALUES (3, 2, '江景大床房', '45平米', '1.8米大床', 1299.00, 5, '0', NULL, '2026-06-10 21:58:49', '2026-06-10 21:58:49', NULL, '0', '0');
INSERT INTO `room` VALUES (4, 3, '豪华大床房', '42平米', '1.8米大床', 798.00, 12, '0', NULL, '2026-06-16 16:41:13', '2026-06-16 16:41:13', NULL, '0', '0');
INSERT INTO `room` VALUES (5, 3, '行政套房', '65平米', '2米特大床', 1680.00, 6, '0', NULL, '2026-06-16 16:41:13', '2026-06-16 16:41:13', NULL, '0', '0');
INSERT INTO `room` VALUES (6, 4, '海景大床房', '48平米', '1.8米大床', 1280.00, 15, '0', NULL, '2026-06-16 16:41:13', '2026-06-16 16:41:13', NULL, '0', '0');
INSERT INTO `room` VALUES (7, 4, '豪华海景套房', '72平米', '2米特大床', 2280.00, 8, '0', NULL, '2026-06-16 16:41:13', '2026-06-16 16:41:13', NULL, '0', '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-16 20:36:37');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码已失效', '2026-05-16 21:36:40');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-16 21:36:47');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-28 21:05:56');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Code 1.120.0', 'Windows 10.0', '0', '登录成功', '2026-05-28 21:09:57');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-10 17:51:32');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-10 17:52:03');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-10 17:52:35');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome142', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 18:20:43');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome142', 'Windows10', '0', '登录成功', '2026-06-10 18:21:16');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 21:45:39');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-10 21:45:44');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-10 21:47:18');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-10 22:04:39');
INSERT INTO `sys_logininfor` VALUES (144, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:12:23');
INSERT INTO `sys_logininfor` VALUES (145, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:12:23');
INSERT INTO `sys_logininfor` VALUES (146, 'onz', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:13:21');
INSERT INTO `sys_logininfor` VALUES (147, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:13:34');
INSERT INTO `sys_logininfor` VALUES (148, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:13:44');
INSERT INTO `sys_logininfor` VALUES (149, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:13:58');
INSERT INTO `sys_logininfor` VALUES (150, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:14:03');
INSERT INTO `sys_logininfor` VALUES (151, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:15:08');
INSERT INTO `sys_logininfor` VALUES (152, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:15:08');
INSERT INTO `sys_logininfor` VALUES (153, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '* 必须填写', '2026-06-10 22:15:27');
INSERT INTO `sys_logininfor` VALUES (154, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:26:33');
INSERT INTO `sys_logininfor` VALUES (155, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:26:33');
INSERT INTO `sys_logininfor` VALUES (156, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:27:15');
INSERT INTO `sys_logininfor` VALUES (157, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:27:16');
INSERT INTO `sys_logininfor` VALUES (158, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:27:17');
INSERT INTO `sys_logininfor` VALUES (159, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:27:17');
INSERT INTO `sys_logininfor` VALUES (160, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:27:18');
INSERT INTO `sys_logininfor` VALUES (161, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:27:18');
INSERT INTO `sys_logininfor` VALUES (162, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:28:59');
INSERT INTO `sys_logininfor` VALUES (163, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:28:59');
INSERT INTO `sys_logininfor` VALUES (164, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:32:36');
INSERT INTO `sys_logininfor` VALUES (165, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:32:36');
INSERT INTO `sys_logininfor` VALUES (166, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '注册成功', '2026-06-10 22:39:09');
INSERT INTO `sys_logininfor` VALUES (167, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-10 22:42:58');
INSERT INTO `sys_logininfor` VALUES (168, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:43:14');
INSERT INTO `sys_logininfor` VALUES (169, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:43:20');
INSERT INTO `sys_logininfor` VALUES (170, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:43:30');
INSERT INTO `sys_logininfor` VALUES (171, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:43:32');
INSERT INTO `sys_logininfor` VALUES (172, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:43:32');
INSERT INTO `sys_logininfor` VALUES (173, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-10 22:44:04');
INSERT INTO `sys_logininfor` VALUES (174, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:44:04');
INSERT INTO `sys_logininfor` VALUES (175, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:44:05');
INSERT INTO `sys_logininfor` VALUES (176, 'gez15036734839@163.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-10 22:44:05');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-12 15:13:50');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome131', 'Windows10', '0', '登录成功', '2026-06-12 16:48:30');
INSERT INTO `sys_logininfor` VALUES (179, 'merchant1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-16 16:18:11');
INSERT INTO `sys_logininfor` VALUES (180, 'merchant1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-16 16:18:31');
INSERT INTO `sys_logininfor` VALUES (181, 'merchant1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-16 16:20:08');
INSERT INTO `sys_logininfor` VALUES (182, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-16 16:20:39');
INSERT INTO `sys_logininfor` VALUES (183, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '用户不存在/密码错误', '2026-06-16 16:22:37');
INSERT INTO `sys_logininfor` VALUES (184, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-16 16:24:06');
INSERT INTO `sys_logininfor` VALUES (185, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:24:10');
INSERT INTO `sys_logininfor` VALUES (186, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '1', '验证码错误', '2026-06-16 16:33:23');
INSERT INTO `sys_logininfor` VALUES (187, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:33:28');
INSERT INTO `sys_logininfor` VALUES (188, 'merchant1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-16 16:42:30');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:42:41');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-16 16:52:40');
INSERT INTO `sys_logininfor` VALUES (191, 'merchant1@hotel.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:53:08');
INSERT INTO `sys_logininfor` VALUES (192, 'merchant1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-16 16:55:13');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:55:25');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-16 16:55:33');
INSERT INTO `sys_logininfor` VALUES (195, 'user1@test.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-16 16:55:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-03-06 01:54:37', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-03-06 01:54:37', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-03-06 01:54:37', '', NULL, '系统工具目录');
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
INSERT INTO `sys_menu` VALUES (2000, '订单', 0, 4, 'order', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'order', 'admin', '2026-06-10 21:54:03', '', NULL, '订单目录');
INSERT INTO `sys_menu` VALUES (2001, '订单管理', 2000, 1, 'index', 'biz/order/index', NULL, 'Order', 1, 0, 'C', '0', '0', 'order:list', 'list', 'admin', '2026-06-10 21:54:07', '', NULL, '订单管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '订单查询', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'order:query', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '订单取消', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'order:cancel', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '订单完成', 2001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'order:complete', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '订单退款', 2001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'order:refund', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '订单修改', 2001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'order:edit', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '订单删除', 2001, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'order:remove', '#', 'admin', '2026-06-10 21:54:12', '', NULL, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.zsc.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-28 21:07:55', 116);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.zsc.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"add\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"add\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2037,\"path\":\"add\",\"query\":\"add\",\"routeName\":\"add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-28 21:09:19', 99);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.zsc.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2037', '127.0.0.1', '内网IP', '2037 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-10 18:35:13', 76);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.zsc.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-10 18:52:46', 281);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.zsc.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '2039 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-10 21:54:58', 84);

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
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-03-06 01:54:37', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '商家', 'merchant', 3, '3', 1, 1, '0', '0', 'admin', '2026-06-16 16:10:21', '', NULL, '商户角色');

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
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2002);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2005);
INSERT INTO `sys_role_menu` VALUES (1, 2006);
INSERT INTO `sys_role_menu` VALUES (1, 2007);
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
  `points` int NOT NULL DEFAULT 0 COMMENT '用户积分（1元=1积分）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-16 16:55:26', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '管理员', 0);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-03-06 01:54:37', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '测试员', 0);
INSERT INTO `sys_user` VALUES (100, 104, 'zhangsan', '张三', '00', '', '', '0', '', '$2a$10$.k.Lr6u1Two8wqrPRblYaeZH.yP8jGNihMXO1cJQsqi82Wi3h5CBu', '0', '0', '', NULL, NULL, 'admin', '2026-03-10 09:24:30', '', '2026-03-10 09:24:36', NULL, 0);
INSERT INTO `sys_user` VALUES (101, 100, 'user1', '旅行达人小李', '00', 'user1@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-16 16:55:50', NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (102, 100, 'user2', '背包客小王', '00', 'user2@test.com', '13800000002', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (103, 100, 'user3', '商务精英陈总', '00', 'user3@test.com', '13800000003', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (104, 100, 'user4', '家庭游客赵姐', '00', 'user4@test.com', '13800000004', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (105, 100, 'user5', '蜜月旅行周先生', '00', 'user5@test.com', '13800000005', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (106, 100, 'gez15036734839@163.com', 'onz', '00', 'gez15036734839@163.com', '', '2', '', '$2a$10$.TanMViDHhRe.xfPXE00jOzmECqovJjhQ5Fdn0mfEPa1RX3M8Ikm.', '0', '0', '', NULL, '2026-06-10 22:39:09', 'gez15036734839@163.com', '2026-06-10 22:39:09', '', NULL, NULL, 3360);
INSERT INTO `sys_user` VALUES (200, 100, 'merchant1', '王老板', '00', 'merchant1@hotel.com', '13800009999', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-16 16:53:09', NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);
INSERT INTO `sys_user` VALUES (201, 100, 'merchant2', '刘总', '00', 'merchant2@hotel.com', '13800008888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '', 0);

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
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (100, 3);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (200, 3);
INSERT INTO `sys_user_role` VALUES (201, 3);

SET FOREIGN_KEY_CHECKS = 1;
