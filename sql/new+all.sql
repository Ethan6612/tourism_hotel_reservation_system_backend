/*
 Navicat Premium Dump SQL

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : zsc

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 17/06/2026 19:54:26
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_category
-- ----------------------------

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
  `score` int NOT NULL DEFAULT 5 COMMENT '评分（1-5星）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评价内容',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '图片URL（支持多图JSON）',
  `is_anonymous` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否匿名 0否 1是',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0待审核 1已发布 2已拒绝',
  `like_count` int NULL DEFAULT 0 COMMENT '点赞数',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `reply_by` bigint NULL DEFAULT NULL COMMENT '回复人ID',
  `appeal_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '申诉原因',
  `appeal_time` datetime NULL DEFAULT NULL COMMENT '申诉时间',
  `appeal_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '申诉状态 0未申诉 1申诉中 2申诉通过 3申诉驳回',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_room_id`(`room_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2485, 86, 131, NULL, 3, '景观很棒，视野开阔。', 'https://example.com/comment1.jpg', '0', '1', 0, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2026-04-27 00:30:58', '', '2026-04-27 00:30:58', NULL);
INSERT INTO `comment` VALUES (2, 2025, 20, 286, NULL, 4, '非常满意，服务很好！', NULL, '0', '1', 0, NULL, '2026-05-31 00:30:58', NULL, NULL, NULL, '0', 'admin', '2026-05-31 00:30:58', '', '2026-05-31 00:30:58', NULL);
INSERT INTO `comment` VALUES (3, 2257, 34, 50, NULL, 5, '位置便利，干净卫生，值得推荐。', NULL, '0', '1', 0, '感谢您的评价，我们会继续努力！', '2026-05-18 00:30:58', NULL, NULL, NULL, '0', 'admin', '2026-04-08 00:30:58', '', '2026-05-18 00:30:58', NULL);

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
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '酒店联系电话',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '酒店简介',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志(0正常 2删除)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '酒店表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '北京王府井希尔顿酒店', '北京市东城区王府井大街88号', 5, 4.80, 'https://example.com/hotel1.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室', 1001, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (2, '上海外滩华尔道夫酒店', '上海市黄浦区中山东一路2号', 5, 4.90, 'https://example.com/hotel2.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧,商务中心', 1002, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (3, '广州塔丽思卡尔顿酒店', '广州市天河区珠江新城兴民路222号', 5, 4.70, 'https://example.com/hotel3.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,儿童乐园', 1003, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (4, '深圳福田香格里拉大酒店', '深圳市福田区中心城益田路4088号', 5, 4.60, 'https://example.com/hotel4.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室,商务中心', 1004, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (5, '杭州西湖国宾馆', '杭州市西湖区杨公堤18号', 4, 4.50, 'https://example.com/hotel5.jpg', 'WiFi,停车场,餐厅,花园,湖景房,会议室', 1005, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (6, '成都太古里尼依格罗酒店', '成都市锦江区红星路三段1号', 5, 4.80, 'https://example.com/hotel6.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1006, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (7, '西安钟楼开元酒店', '西安市碑林区南大街30号', 4, 4.30, 'https://example.com/hotel7.jpg', 'WiFi,停车场,餐厅,会议室,商务中心', 1007, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (8, '三亚亚龙湾瑞吉度假酒店', '三亚市吉阳区亚龙湾国家旅游度假区', 5, 4.90, 'https://example.com/hotel8.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅,儿童俱乐部', 1008, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (9, '厦门鼓浪屿海景酒店', '厦门市思明区鼓浪屿康泰路151号', 4, 4.40, 'https://example.com/hotel9.jpg', 'WiFi,海景房,餐厅,花园,露台', 1009, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (10, '青岛五四广场海尔洲际酒店', '青岛市市南区香港中路98号', 5, 4.70, 'https://example.com/hotel10.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房,会议室', 1010, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (11, '南京金陵饭店', '南京市鼓楼区汉中路2号', 5, 4.60, 'https://example.com/hotel11.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,会议室', 1011, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (12, '苏州吴宫泛太平洋酒店', '苏州市姑苏区新市路259号', 4, 4.40, 'https://example.com/hotel12.jpg', 'WiFi,停车场,园林景观,餐厅,会议室', 1012, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (13, '武汉万达瑞华酒店', '武汉市武昌区水果湖街东湖路138号', 5, 4.70, 'https://example.com/hotel13.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1013, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (14, '长沙君悦酒店', '长沙市天心区湘江中路36号', 5, 4.60, 'https://example.com/hotel14.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1014, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (15, '重庆解放碑威斯汀酒店', '重庆市渝中区新华路222号', 5, 4.80, 'https://example.com/hotel15.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1015, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (16, '昆明洲际酒店', '昆明市西山区怡景路5号', 5, 4.50, 'https://example.com/hotel16.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,花园', 1016, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (17, '贵阳凯宾斯基大酒店', '贵阳市南明区护国路68号', 5, 4.40, 'https://example.com/hotel17.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1017, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (18, '南宁万达文华酒店', '南宁市青秀区东葛路118号', 5, 4.50, 'https://example.com/hotel18.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1018, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (19, '海口鲁能希尔顿酒店', '海口市美兰区琼山大道2号', 4, 4.30, 'https://example.com/hotel19.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1019, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (20, '大理洱海天域酒店', '大理市下关镇洱河南路1号', 4, 4.60, 'https://example.com/hotel20.jpg', 'WiFi,停车场,海景房,餐厅,花园', 1020, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (21, '丽江和府洲际度假酒店', '丽江市古城区祥和路276号', 5, 4.70, 'https://example.com/hotel21.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1021, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (22, '桂林香格里拉大酒店', '桂林市七星区环城北二路111号', 5, 4.60, 'https://example.com/hotel22.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1022, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (23, '珠海瑞吉酒店', '珠海市香洲区湾仔银湾路1663号', 5, 4.80, 'https://example.com/hotel23.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1023, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (24, '佛山保利洲际酒店', '佛山市南海区灯湖东路20号', 5, 4.50, 'https://example.com/hotel24.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1024, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (25, '东莞松山湖凯悦酒店', '东莞市松山湖高新区沁园路', 4, 4.40, 'https://example.com/hotel25.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,湖景房', 1025, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (26, '无锡苏宁凯悦酒店', '无锡市梁溪区人民中路109号', 5, 4.60, 'https://example.com/hotel26.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1026, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (27, '常州万豪酒店', '常州市新北区龙锦路1590号', 5, 4.40, 'https://example.com/hotel27.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1027, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (28, '扬州香格里拉大酒店', '扬州市邗江区文昌西路472号', 5, 4.50, 'https://example.com/hotel28.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1028, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (29, '南通滨江洲际酒店', '南通市崇川区跃龙南路508号', 4, 4.30, 'https://example.com/hotel29.jpg', 'WiFi,停车场,餐厅,江景房', 1029, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (30, '宁波东港喜来登酒店', '宁波市鄞州区彩虹北路50号', 5, 4.50, 'https://example.com/hotel30.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1030, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (31, '温州香格里拉大酒店', '温州市鹿城区香源路1号', 5, 4.40, 'https://example.com/hotel31.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1031, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (32, '福州世茂洲际酒店', '福州市台江区广达路108号', 5, 4.50, 'https://example.com/hotel32.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1032, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (33, '厦门康莱德酒店', '厦门市思明区演武西路186号', 5, 4.80, 'https://example.com/hotel33.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1033, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (34, '南昌瑞颐大酒店', '南昌市东湖区沿江北路69号', 4, 4.30, 'https://example.com/hotel34.jpg', 'WiFi,停车场,餐厅,江景房', 1034, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (35, '济南鲁能希尔顿酒店', '济南市市中区二环南路2888号', 5, 4.50, 'https://example.com/hotel35.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1035, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (36, '青岛金沙滩希尔顿酒店', '青岛市黄岛区嘉陵江东路1号', 5, 4.60, 'https://example.com/hotel36.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1036, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (37, '烟台金海岸希尔顿酒店', '烟台市福山区宁波路1号', 4, 4.40, 'https://example.com/hotel37.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1037, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (38, '威海百纳中心酒店', '威海市环翠区新威路58号', 4, 4.20, 'https://example.com/hotel38.jpg', 'WiFi,停车场,餐厅', 1038, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (39, '郑州绿地JW万豪酒店', '郑州市郑东新区商务中央公园2号', 5, 4.60, 'https://example.com/hotel39.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1039, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (40, '洛阳华阳广场国际大饭店', '洛阳市涧西区辽宁路1号', 4, 4.30, 'https://example.com/hotel40.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (41, '太原凯宾斯基饭店', '太原市小店区长风街115号', 5, 4.50, 'https://example.com/hotel41.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1041, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (42, '石家庄希尔顿酒店', '石家庄市长安区东大街5号', 5, 4.40, 'https://example.com/hotel42.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1042, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (43, '天津丽思卡尔顿酒店', '天津市和平区大沽北路167号', 5, 4.80, 'https://example.com/hotel43.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1043, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (44, '沈阳君悦酒店', '沈阳市和平区青年大街288号', 5, 4.60, 'https://example.com/hotel44.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1044, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (45, '大连君悦酒店', '大连市沙河口区星海广场C3区33号', 5, 4.70, 'https://example.com/hotel45.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1045, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (46, '长春香格里拉大酒店', '长春市朝阳区西安大路569号', 5, 4.50, 'https://example.com/hotel46.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1046, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (47, '哈尔滨香格里拉大酒店', '哈尔滨市道里区友谊路555号', 5, 4.60, 'https://example.com/hotel47.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1047, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (48, '呼和浩特香格里拉大酒店', '呼和浩特市回民区锡林郭勒南路5号', 5, 4.30, 'https://example.com/hotel48.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1048, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (49, '银川凯宾斯基饭店', '银川市金凤区北京中路160号', 5, 4.40, 'https://example.com/hotel49.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1049, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (50, '兰州皇冠假日酒店', '兰州市城关区北滨河东路1号', 4, 4.30, 'https://example.com/hotel50.jpg', 'WiFi,停车场,餐厅,黄河景观', 1050, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (51, '西宁新华联索菲特大酒店', '西宁市城西区五四西路63号', 5, 4.40, 'https://example.com/hotel51.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1051, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (52, '乌鲁木齐希尔顿酒店', '乌鲁木齐市米东区红光山路1237号', 5, 4.50, 'https://example.com/hotel52.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1052, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (53, '拉萨瑞吉度假酒店', '拉萨市城关区江苏路22号', 5, 4.70, 'https://example.com/hotel53.jpg', 'WiFi,停车场,SPA,餐厅,藏式风格', 1053, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (54, '成都华尔道夫酒店', '成都市武侯区天府大道北段1199号', 5, 4.80, 'https://example.com/hotel54.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1054, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (55, '重庆尼依格罗酒店', '重庆市江北区庆云路1号', 5, 4.70, 'https://example.com/hotel55.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1055, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (56, '武汉光谷凯悦酒店', '武汉市洪山区珞喻路1077号', 5, 4.50, 'https://example.com/hotel56.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1056, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (57, '西安W酒店', '西安市雁塔区曲江池东路333号', 5, 4.80, 'https://example.com/hotel57.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1057, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (58, '南京卓美亚酒店', '南京市建邺区邺城路2号', 5, 4.70, 'https://example.com/hotel58.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1058, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (59, '杭州康莱德酒店', '杭州市江干区新业路228号', 5, 4.70, 'https://example.com/hotel59.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,钱塘江景', 1059, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (60, '苏州W酒店', '苏州市苏州工业园区苏州中心广场7幢', 5, 4.70, 'https://example.com/hotel60.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1060, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (61, '宁波泛太平洋大酒店', '宁波市鄞州区民安东路99号', 4, 4.40, 'https://example.com/hotel61.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1061, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (62, '无锡君来洲际酒店', '无锡市梁溪区永和路6号', 5, 4.50, 'https://example.com/hotel62.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1062, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (63, '常州新城希尔顿酒店', '常州市武进区虹北路68号', 5, 4.40, 'https://example.com/hotel63.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1063, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (64, '镇江富力喜来登酒店', '镇江市京口区北府路88号', 4, 4.30, 'https://example.com/hotel64.jpg', 'WiFi,停车场,餐厅', 1064, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (65, '扬州皇冠假日酒店', '扬州市广陵区文昌东路3号', 4, 4.40, 'https://example.com/hotel65.jpg', 'WiFi,停车场,游泳池,餐厅', 1065, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (66, '南通绿洲国际假日酒店', '南通市港闸区北大街199号', 4, 4.20, 'https://example.com/hotel66.jpg', 'WiFi,停车场,餐厅', 1066, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (67, '芜湖华邑酒店', '芜湖市镜湖区长江中路15号', 5, 4.50, 'https://example.com/hotel67.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1067, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (68, '合肥洲际酒店', '合肥市政务区潜山路888号', 5, 4.60, 'https://example.com/hotel68.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1068, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (69, '安庆碧桂园凤凰酒店', '安庆市迎江区港口路88号', 4, 4.20, 'https://example.com/hotel69.jpg', 'WiFi,停车场,餐厅', 1069, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (70, '黄山悦榕庄', '黄山市黟县宏村镇', 5, 4.90, 'https://example.com/hotel70.jpg', 'WiFi,停车场,SPA,餐厅,徽派建筑', 1070, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (71, '厦门艾美酒店', '厦门市湖里区南山冠军路7号', 5, 4.50, 'https://example.com/hotel71.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1071, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (72, '福州仓山凯悦酒店', '福州市仓山区花溪南路46号', 5, 4.40, 'https://example.com/hotel72.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1072, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (73, '泉州泰禾洲际酒店', '泉州市丰泽区丰海路1005号', 5, 4.50, 'https://example.com/hotel73.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1073, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (74, '南昌香格里拉大酒店', '南昌市红谷滩新区翠林路669号', 5, 4.50, 'https://example.com/hotel74.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1074, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (75, '赣州锦江国际酒店', '赣州市章贡区金东北路88号', 4, 4.20, 'https://example.com/hotel75.jpg', 'WiFi,停车场,餐厅', 1075, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (76, '济南香格里拉大酒店', '济南市历下区泺源大街106号', 5, 4.50, 'https://example.com/hotel76.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1076, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (77, '青岛香格里拉大酒店', '青岛市市南区香港中路9号', 5, 4.60, 'https://example.com/hotel77.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1077, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (78, '烟台金海湾酒店', '烟台市芝罘区海岸路34号', 4, 4.30, 'https://example.com/hotel78.jpg', 'WiFi,停车场,餐厅,海景房', 1078, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (79, '威海抱海大酒店', '威海市环翠区海滨中路29号', 4, 4.20, 'https://example.com/hotel79.jpg', 'WiFi,停车场,餐厅,海景房', 1079, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (80, '郑州希尔顿酒店', '郑州市金水区金水路288号', 5, 4.50, 'https://example.com/hotel80.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1080, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (81, '洛阳钼都利豪国际饭店', '洛阳市洛龙区开元大道239号', 4, 4.30, 'https://example.com/hotel81.jpg', 'WiFi,停车场,餐厅', 1081, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (82, '太原洲际酒店', '太原市晋源区长兴南街8号', 5, 4.50, 'https://example.com/hotel82.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1082, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (83, '石家庄富力洲际酒店', '石家庄市裕华区槐安东路119号', 5, 4.40, 'https://example.com/hotel83.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1083, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (84, '天津四季酒店', '天津市和平区赤峰道138号', 5, 4.80, 'https://example.com/hotel84.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1084, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (85, '沈阳香格里拉大酒店', '沈阳市沈河区青年大街115号', 5, 4.60, 'https://example.com/hotel85.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1085, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (86, '大连香格里拉大酒店', '大连市中山区人民路66号', 5, 4.60, 'https://example.com/hotel86.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1086, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (87, '长春凯悦酒店', '长春市朝阳区人民大街3233号', 5, 4.50, 'https://example.com/hotel87.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1087, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (88, '哈尔滨万达嘉华酒店', '哈尔滨市松北区世茂大道99号', 5, 4.40, 'https://example.com/hotel88.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1088, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (89, '呼和浩特万达文华酒店', '呼和浩特市赛罕区新华东街26号', 5, 4.30, 'https://example.com/hotel89.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1089, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (90, '银川万豪酒店', '银川市金凤区北京中路166号', 5, 4.40, 'https://example.com/hotel90.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1090, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (91, '兰州凯悦酒店', '兰州市城关区南滨河东路501号', 5, 4.40, 'https://example.com/hotel91.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1091, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (92, '西宁富力万达嘉华酒店', '西宁市城西区西川南路76号', 5, 4.30, 'https://example.com/hotel92.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1092, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (93, '乌鲁木齐康莱德酒店', '乌鲁木齐市沙依巴克区友好北路669号', 5, 4.50, 'https://example.com/hotel93.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1093, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (94, '拉萨圣地天堂洲际酒店', '拉萨市城关区江苏大道1号', 5, 4.60, 'https://example.com/hotel94.jpg', 'WiFi,停车场,SPA,餐厅', 1094, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (95, '贵阳亨特索菲特酒店', '贵阳市南明区都司高架桥路33号', 5, 4.50, 'https://example.com/hotel95.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1095, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (96, '南宁龙光那莲豪华精选酒店', '南宁市青秀区中柬路8号', 5, 4.70, 'https://example.com/hotel96.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1096, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (97, '海口华彩华邑酒店', '海口市美兰区碧海大道21号', 5, 4.50, 'https://example.com/hotel97.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1097, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (98, '三亚海棠湾君悦酒店', '三亚市海棠区海棠北路68号', 5, 4.80, 'https://example.com/hotel98.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅', 1098, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (99, '北海银滩皇冠假日酒店', '北海市银海区银滩四号路8号', 4, 4.40, 'https://example.com/hotel99.jpg', 'WiFi,停车场,游泳池,餐厅,海景房', 1099, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `hotel` VALUES (100, '桂林漓江大瀑布饭店', '桂林市秀峰区杉湖北路1号', 4, 4.30, 'https://example.com/hotel100.jpg', 'WiFi,停车场,餐厅,江景房', 1100, '0', NULL, NULL, NULL, NULL, '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户ID',
  `merchant_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商户名称（店铺名）',
  `license_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '营业执照号',
  `legal_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '法人姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户地址',
  `business_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经营范围',
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商户LOGO图片URL',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商户简介',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '商户状态（0正常 1冻结 2注销）',
  `user_id` bigint NULL DEFAULT NULL COMMENT '关联系统用户ID',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
  `reject_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '提交审核时间',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_audit_status`(`audit_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1072 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1001, '北京希尔顿酒店管理有限公司', '91110000MA001001X1', '张三', '13800138001', 'merchant001@hotel.com', '北京市东城区王府井大街88号', '酒店管理、餐饮服务、住宿服务', 'https://example.com/merchant1001.png', '专注于高端酒店管理运营', '0', 100, '1', NULL, '2026-05-07 08:52:15', '2026-05-09 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1002, '上海华尔道夫酒店管理有限公司', '91310000MA001002X2', '李四', '13800138002', 'merchant002@hotel.com', '上海市黄浦区中山东一路2号', '酒店管理、商务服务', 'https://example.com/merchant1002.png', '国际知名酒店管理集团', '0', NULL, '1', NULL, '2026-05-09 08:52:15', '2026-05-11 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1003, '广州丽思卡尔顿酒店有限公司', '91440000MA001003X3', '王五', '13800138003', 'merchant003@hotel.com', '广州市天河区珠江新城兴民路222号', '酒店管理、餐饮、SPA', 'https://example.com/merchant1003.png', '五星级度假酒店管理', '0', NULL, '1', NULL, '2026-05-12 08:52:15', '2026-05-14 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1004, '深圳香格里拉酒店有限公司', '91440000MA001004X4', '赵六', '13800138004', 'merchant004@hotel.com', '深圳市福田区中心城益田路4088号', '酒店管理、会议服务', 'https://example.com/merchant1004.png', '国际连锁酒店品牌', '0', NULL, '1', NULL, '2026-05-15 08:52:15', '2026-05-17 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1005, '杭州西湖国宾馆有限公司', '91330000MA001005X5', '孙七', '13800138005', 'merchant005@hotel.com', '杭州市西湖区杨公堤18号', '酒店住宿、餐饮、旅游服务', 'https://example.com/merchant1005.png', '西湖畔高端度假酒店管理', '0', NULL, '1', NULL, '2026-05-17 08:52:15', '2026-05-19 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1006, '成都尼依格罗酒店有限公司', '91510000MA001006X6', '周八', '13800138006', 'merchant006@hotel.com', '成都市锦江区红星路三段1号', '酒店管理、奢侈品服务', 'https://example.com/merchant1006.png', '高端时尚酒店管理', '0', NULL, '0', NULL, '2026-06-04 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1007, '西安开元酒店管理有限公司', '91610000MA001007X7', '吴九', '13800138007', 'merchant007@hotel.com', '西安市碑林区南大街30号', '酒店管理、旅游接待', 'https://example.com/merchant1007.png', '西安地区知名酒店管理公司', '0', NULL, '0', NULL, '2026-06-05 08:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1008, '三亚瑞吉度假酒店有限公司', '91460000MA001008X8', '郑十', '13800138008', 'merchant008@hotel.com', '三亚市吉阳区亚龙湾国家旅游度假区', '度假酒店、SPA、水上运动', 'https://example.com/merchant1008.png', '亚龙湾顶级度假酒店', '0', NULL, '2', '营业执照信息不清晰，请重新上传', '2026-05-22 08:52:15', '2026-05-23 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1009, '厦门鼓浪屿酒店有限公司', '91350000MA001009X9', '陈十一', '13800138009', 'merchant009@hotel.com', '厦门市思明区鼓浪屿康泰路151号', '精品酒店、旅游服务', 'https://example.com/merchant1009.png', '鼓浪屿特色海景酒店管理', '0', NULL, '1', NULL, '2026-05-25 08:52:15', '2026-05-27 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1010, '青岛洲际酒店管理有限公司', '91370000MA001010X0', '刘十二', '13800138010', 'merchant010@hotel.com', '青岛市市南区香港中路98号', '酒店管理、海景度假', 'https://example.com/merchant1010.png', '青岛沿海高端酒店管理', '0', NULL, '1', NULL, '2026-05-27 08:52:15', '2026-05-29 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1011, '南京金陵饭店有限公司', '91320000MA001011XA', '黄十三', '13800138011', 'merchant011@hotel.com', '南京市鼓楼区汉中路2号', '酒店住宿、餐饮、会议', 'https://example.com/merchant1011.png', '南京标志性酒店管理', '0', NULL, '1', NULL, '2026-05-28 08:52:15', '2026-05-30 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1012, '苏州泛太平洋酒店有限公司', '91320000MA001012XB', '杨十四', '13800138012', 'merchant012@hotel.com', '苏州市姑苏区新市路259号', '酒店管理、园林景观服务', 'https://example.com/merchant1012.png', '苏州古典园林风格酒店', '0', NULL, '1', NULL, '2026-05-29 08:52:15', '2026-05-31 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1013, '武汉万达瑞华酒店有限公司', '91420000MA001013XC', '朱十五', '13800138013', 'merchant013@hotel.com', '武汉市武昌区水果湖街东湖路138号', '高端酒店管理、餐饮', 'https://example.com/merchant1013.png', '万达集团旗下酒店管理', '0', NULL, '1', NULL, '2026-05-30 08:52:15', '2026-06-01 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1014, '长沙君悦酒店有限公司', '91430000MA001014XD', '何十六', '13800138014', 'merchant014@hotel.com', '长沙市天心区湘江中路36号', '酒店管理、江景住宿', 'https://example.com/merchant1014.png', '长沙高端江景酒店', '0', NULL, '1', NULL, '2026-05-31 08:52:15', '2026-06-02 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1015, '重庆威斯汀酒店管理有限公司', '91500000MA001015XE', '马十七', '13800138015', 'merchant015@hotel.com', '重庆市渝中区新华路222号', '酒店管理、商务接待', 'https://example.com/merchant1015.png', '重庆解放碑核心商圈酒店', '0', NULL, '1', NULL, '2026-06-01 08:52:15', '2026-06-03 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1016, '昆明洲际酒店有限公司', '91530000MA001016XF', '林十八', '13800138016', 'merchant016@hotel.com', '昆明市西山区怡景路5号', '酒店管理、度假服务', 'https://example.com/merchant1016.png', '春城高端度假酒店', '0', NULL, '1', NULL, '2026-06-02 08:52:15', '2026-06-04 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1017, '贵阳凯宾斯基酒店有限公司', '91520000MA001017XG', '罗十九', '13800138017', 'merchant017@hotel.com', '贵阳市南明区护国路68号', '酒店管理、会议服务', 'https://example.com/merchant1017.png', '贵阳国际品牌酒店', '0', NULL, '1', NULL, '2026-06-03 08:52:15', '2026-06-05 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1018, '南宁万达文华酒店有限公司', '91450000MA001018XH', '谢二十', '13800138018', 'merchant018@hotel.com', '南宁市青秀区东葛路118号', '酒店管理、餐饮服务', 'https://example.com/merchant1018.png', '万达旗下高端酒店品牌', '0', NULL, '0', NULL, '2026-06-05 20:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1019, '海口鲁能希尔顿酒店有限公司', '91460000MA001019XI', '韩二一', '13800138019', 'merchant019@hotel.com', '海口市美兰区琼山大道2号', '酒店管理、海景度假', 'https://example.com/merchant1019.png', '海口沿海度假酒店', '0', NULL, '0', NULL, '2026-06-06 02:52:15', NULL, '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1020, '大理洱海天域酒店有限公司', '91530000MA001020XJ', '冯二二', '13800138020', 'merchant020@hotel.com', '大理市下关镇洱河南路1号', '精品酒店、旅游服务', 'https://example.com/merchant1020.png', '大理洱海边特色度假酒店', '0', NULL, '1', NULL, '2026-06-04 08:52:15', '2026-06-05 08:52:15', '2026-06-06 08:52:14', '2026-06-09 17:06:43');
INSERT INTO `merchant` VALUES (1071, 'AAA皮拽子批发酒店', 'Y9140824CU5EQ5G8EX', '冲击波', '13316366046', '1622633698@qq.com', '石岐区学院路一号', '酒店管理', '', '', '0', NULL, '0', NULL, NULL, NULL, '2026-06-09 16:41:13', '2026-06-09 16:41:13');

-- ----------------------------
-- Table structure for merchant_audit
-- ----------------------------
DROP TABLE IF EXISTS `merchant_audit`;
CREATE TABLE `merchant_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `audit_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '审核类型（1入驻申请 2信息变更 3状态变更）',
  `audit_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
  `submit_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '提交材料（JSON格式）',
  `audit_opinion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核意见',
  `auditor_id` bigint NULL DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
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
  `guest_num` int NULL DEFAULT NULL COMMENT '可入住人数',
  `has_breakfast` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '0无早餐 1含早餐',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志(0正常 2删除)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hotel_id`(`hotel_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房源/房型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 1, '豪华大床房', '38平米', '1.8米大床', 649.00, 16, '0', 'https://example.com/hotel1_room1.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (2, 1, '行政双床房', '42平米', '2张1.2米单人床', 759.00, 13, '0', 'https://example.com/hotel1_room2.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (3, 1, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1079.00, 9, '0', 'https://example.com/hotel1_room3.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (4, 2, '豪华大床房', '38平米', '1.8米大床', 699.00, 17, '0', 'https://example.com/hotel2_room1.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (5, 2, '行政双床房', '42平米', '2张1.2米单人床', 819.00, 14, '0', 'https://example.com/hotel2_room2.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (6, 2, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 1159.00, 10, '0', 'https://example.com/hotel2_room3.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');
INSERT INTO `room` VALUES (7, 2, '景观房', '45平米', '1.8米大床', 939.00, 12, '0', 'https://example.com/hotel2_room5.jpg', NULL, '0', '0', '2026-06-02 00:30:57', '2026-06-02 00:30:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (231, 'user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-17 19:51:40');
INSERT INTO `sys_logininfor` VALUES (232, 'user1@test.com', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '登录成功', '2026-06-17 19:52:06');
INSERT INTO `sys_logininfor` VALUES (233, 'user1', '127.0.0.1', '内网IP', 'Chrome149', 'Windows10', '0', '退出成功', '2026-06-17 19:52:14');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

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
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);

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
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', 'admin@hotel.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-16 16:55:26', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '超级管理员账号');
INSERT INTO `sys_user` VALUES (2, 105, 'customer01', '普通用户', '00', 'customer@test.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-08 10:11:53', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '前台普通用户账号');
INSERT INTO `sys_user` VALUES (100, 104, 'merchant01', '酒店商户', '01', 'merchant@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-09 16:28:27', '2026-03-06 01:54:37', 'admin', '2026-03-06 01:54:37', '', NULL, '酒店商家账号');
INSERT INTO `sys_user` VALUES (101, 100, 'user1', '旅行达人小李', '00', 'user1@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-17 19:52:06', NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '');
INSERT INTO `sys_user` VALUES (102, 100, 'user2', '背包客小王', '00', 'user2@test.com', '13800000002', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '');
INSERT INTO `sys_user` VALUES (103, 100, 'user3', '商务精英陈总', '00', 'user3@test.com', '13800000003', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '');
INSERT INTO `sys_user` VALUES (104, 100, 'user4', '家庭游客赵姐', '00', 'user4@test.com', '13800000004', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '');
INSERT INTO `sys_user` VALUES (105, 100, 'user5', '蜜月旅行周先生', '00', 'user5@test.com', '13800000005', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NULL, 'admin', '2026-06-16 16:10:32', '', NULL, '');
INSERT INTO `sys_user` VALUES (106, 100, 'gez15036734839@163.com', 'onz', '00', 'gez15036734839@163.com', '', '2', '', '$2a$10$.TanMViDHhRe.xfPXE00jOzmECqovJjhQ5Fdn0mfEPa1RX3M8Ikm.', '0', '0', '', NULL, '2026-06-10 22:39:09', 'gez15036734839@163.com', '2026-06-10 22:39:09', '', NULL, NULL);

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
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);

SET FOREIGN_KEY_CHECKS = 1;
