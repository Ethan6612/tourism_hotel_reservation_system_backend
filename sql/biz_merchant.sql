-- =====================================================
-- 商户管理模块数据库脚本
-- 包含：商户表 + 商户审核表
-- =====================================================

-- =====================================================
-- 1. 商户表
-- =====================================================
DROP TABLE IF EXISTS merchant;
CREATE TABLE merchant (
    id              BIGINT(20)      NOT NULL AUTO_INCREMENT  COMMENT '商户ID',
    merchant_name   VARCHAR(100)    NOT NULL                 COMMENT '商户名称（店铺名）',
    license_no      VARCHAR(50)     NOT NULL                 COMMENT '营业执照号',
    legal_person    VARCHAR(50)     DEFAULT NULL             COMMENT '法人姓名',
    phone           VARCHAR(20)     DEFAULT NULL             COMMENT '联系电话',
    email           VARCHAR(100)    DEFAULT NULL             COMMENT '邮箱',
    address         VARCHAR(255)    DEFAULT NULL             COMMENT '商户地址',
    business_scope  VARCHAR(500)    DEFAULT NULL             COMMENT '经营范围',
    logo_url        VARCHAR(255)    DEFAULT NULL             COMMENT '商户LOGO图片URL',
    description     TEXT            DEFAULT NULL             COMMENT '商户简介',
    status          CHAR(1)         DEFAULT '0'              COMMENT '商户状态（0正常 1冻结 2注销）',
    user_id         BIGINT(20)      DEFAULT NULL             COMMENT '关联系统用户ID',
    create_time     DATETIME        DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time     DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id),
    UNIQUE KEY uk_license_no (license_no),
    KEY idx_phone (phone),
    KEY idx_status (status),
    KEY idx_user_id (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='商户表';

-- 插入测试商户数据
INSERT INTO merchant (id, merchant_name, license_no, legal_person, phone, email, address, business_scope, logo_url, description, status, user_id, create_time, update_time) VALUES
(1001, '北京希尔顿酒店管理有限公司', '91110000MA001001X1', '张三', '13800138001', 'merchant001@hotel.com', '北京市东城区王府井大街88号', '酒店管理、餐饮服务、住宿服务', 'https://example.com/merchant1001.png', '专注于高端酒店管理运营', '0', NULL, NOW(), NOW()),
(1002, '上海华尔道夫酒店管理有限公司', '91310000MA001002X2', '李四', '13800138002', 'merchant002@hotel.com', '上海市黄浦区中山东一路2号', '酒店管理、商务服务', 'https://example.com/merchant1002.png', '国际知名酒店管理集团', '0', NULL, NOW(), NOW()),
(1003, '广州丽思卡尔顿酒店有限公司', '91440000MA001003X3', '王五', '13800138003', 'merchant003@hotel.com', '广州市天河区珠江新城兴民路222号', '酒店管理、餐饮、SPA', 'https://example.com/merchant1003.png', '五星级度假酒店管理', '0', NULL, NOW(), NOW()),
(1004, '深圳香格里拉酒店有限公司', '91440000MA001004X4', '赵六', '13800138004', 'merchant004@hotel.com', '深圳市福田区中心城益田路4088号', '酒店管理、会议服务', 'https://example.com/merchant1004.png', '国际连锁酒店品牌', '0', NULL, NOW(), NOW()),
(1005, '杭州西湖国宾馆有限公司', '91330000MA001005X5', '孙七', '13800138005', 'merchant005@hotel.com', '杭州市西湖区杨公堤18号', '酒店住宿、餐饮、旅游服务', 'https://example.com/merchant1005.png', '西湖畔高端度假酒店管理', '0', NULL, NOW(), NOW()),
(1006, '成都尼依格罗酒店有限公司', '91510000MA001006X6', '周八', '13800138006', 'merchant006@hotel.com', '成都市锦江区红星路三段1号', '酒店管理、奢侈品服务', 'https://example.com/merchant1006.png', '高端时尚酒店管理', '0', NULL, NOW(), NOW()),
(1007, '西安开元酒店管理有限公司', '91610000MA001007X7', '吴九', '13800138007', 'merchant007@hotel.com', '西安市碑林区南大街30号', '酒店管理、旅游接待', 'https://example.com/merchant1007.png', '西安地区知名酒店管理公司', '0', NULL, NOW(), NOW()),
(1008, '三亚瑞吉度假酒店有限公司', '91460000MA001008X8', '郑十', '13800138008', 'merchant008@hotel.com', '三亚市吉阳区亚龙湾国家旅游度假区', '度假酒店、SPA、水上运动', 'https://example.com/merchant1008.png', '亚龙湾顶级度假酒店', '0', NULL, NOW(), NOW()),
(1009, '厦门鼓浪屿酒店有限公司', '91350000MA001009X9', '陈十一', '13800138009', 'merchant009@hotel.com', '厦门市思明区鼓浪屿康泰路151号', '精品酒店、旅游服务', 'https://example.com/merchant1009.png', '鼓浪屿特色海景酒店管理', '0', NULL, NOW(), NOW()),
(1010, '青岛洲际酒店管理有限公司', '91370000MA001010X0', '刘十二', '13800138010', 'merchant010@hotel.com', '青岛市市南区香港中路98号', '酒店管理、海景度假', 'https://example.com/merchant1010.png', '青岛沿海高端酒店管理', '0', NULL, NOW(), NOW()),
(1011, '南京金陵饭店有限公司', '91320000MA001011XA', '黄十三', '13800138011', 'merchant011@hotel.com', '南京市鼓楼区汉中路2号', '酒店住宿、餐饮、会议', 'https://example.com/merchant1011.png', '南京标志性酒店管理', '0', NULL, NOW(), NOW()),
(1012, '苏州泛太平洋酒店有限公司', '91320000MA001012XB', '杨十四', '13800138012', 'merchant012@hotel.com', '苏州市姑苏区新市路259号', '酒店管理、园林景观服务', 'https://example.com/merchant1012.png', '苏州古典园林风格酒店', '0', NULL, NOW(), NOW()),
(1013, '武汉万达瑞华酒店有限公司', '91420000MA001013XC', '朱十五', '13800138013', 'merchant013@hotel.com', '武汉市武昌区水果湖街东湖路138号', '高端酒店管理、餐饮', 'https://example.com/merchant1013.png', '万达集团旗下酒店管理', '0', NULL, NOW(), NOW()),
(1014, '长沙君悦酒店有限公司', '91430000MA001014XD', '何十六', '13800138014', 'merchant014@hotel.com', '长沙市天心区湘江中路36号', '酒店管理、江景住宿', 'https://example.com/merchant1014.png', '长沙高端江景酒店', '0', NULL, NOW(), NOW()),
(1015, '重庆威斯汀酒店管理有限公司', '91500000MA001015XE', '马十七', '13800138015', 'merchant015@hotel.com', '重庆市渝中区新华路222号', '酒店管理、商务接待', 'https://example.com/merchant1015.png', '重庆解放碑核心商圈酒店', '0', NULL, NOW(), NOW()),
(1016, '昆明洲际酒店有限公司', '91530000MA001016XF', '林十八', '13800138016', 'merchant016@hotel.com', '昆明市西山区怡景路5号', '酒店管理、度假服务', 'https://example.com/merchant1016.png', '春城高端度假酒店', '0', NULL, NOW(), NOW()),
(1017, '贵阳凯宾斯基酒店有限公司', '91520000MA001017XG', '罗十九', '13800138017', 'merchant017@hotel.com', '贵阳市南明区护国路68号', '酒店管理、会议服务', 'https://example.com/merchant1017.png', '贵阳国际品牌酒店', '0', NULL, NOW(), NOW()),
(1018, '南宁万达文华酒店有限公司', '91450000MA001018XH', '谢二十', '13800138018', 'merchant018@hotel.com', '南宁市青秀区东葛路118号', '酒店管理、餐饮服务', 'https://example.com/merchant1018.png', '万达旗下高端酒店品牌', '0', NULL, NOW(), NOW()),
(1019, '海口鲁能希尔顿酒店有限公司', '91460000MA001019XI', '韩二一', '13800138019', 'merchant019@hotel.com', '海口市美兰区琼山大道2号', '酒店管理、海景度假', 'https://example.com/merchant1019.png', '海口沿海度假酒店', '0', NULL, NOW(), NOW()),
(1020, '大理洱海天域酒店有限公司', '91530000MA001020XJ', '冯二二', '13800138020', 'merchant020@hotel.com', '大理市下关镇洱河南路1号', '精品酒店、旅游服务', 'https://example.com/merchant1020.png', '大理洱海边特色度假酒店', '0', NULL, NOW(), NOW());

-- =====================================================
-- 2. 商户审核表
-- =====================================================
DROP TABLE IF EXISTS merchant_audit;
CREATE TABLE merchant_audit (
    id              BIGINT(20)      NOT NULL AUTO_INCREMENT  COMMENT '审核ID',
    merchant_id     BIGINT(20)      NOT NULL                 COMMENT '商户ID',
    audit_type      CHAR(1)         NOT NULL DEFAULT '1'     COMMENT '审核类型（1入驻申请 2信息变更 3状态变更）',
    audit_status    CHAR(1)         NOT NULL DEFAULT '0'     COMMENT '审核状态（0待审核 1审核通过 2审核驳回）',
    submit_material VARCHAR(1000)   DEFAULT NULL             COMMENT '提交材料（JSON格式，营业执照图片URL等）',
    audit_opinion   VARCHAR(500)    DEFAULT NULL             COMMENT '审核意见',
    auditor_id      BIGINT(20)      DEFAULT NULL             COMMENT '审核人ID',
    auditor_name    VARCHAR(50)     DEFAULT NULL             COMMENT '审核人姓名',
    submit_time     DATETIME        DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
    audit_time      DATETIME        DEFAULT NULL             COMMENT '审核时间',
    create_time     DATETIME        DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time     DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id),
    KEY idx_merchant_id (merchant_id),
    KEY idx_audit_status (audit_status),
    KEY idx_auditor_id (auditor_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='商户审核表';

-- 插入测试审核数据
INSERT INTO merchant_audit (merchant_id, audit_type, audit_status, submit_material, audit_opinion, auditor_id, auditor_name, submit_time, audit_time, create_time, update_time) VALUES
(1001, '1', '1', '{"license_img":"https://example.com/license1001.jpg","id_card":"https://example.com/id1001.jpg"}', '资质齐全，审核通过', 1, 'admin', DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 28 DAY), DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 28 DAY)),
(1002, '1', '1', '{"license_img":"https://example.com/license1002.jpg","id_card":"https://example.com/id1002.jpg"}', '资质审核通过', 1, 'admin', DATE_SUB(NOW(), INTERVAL 28 DAY), DATE_SUB(NOW(), INTERVAL 26 DAY), DATE_SUB(NOW(), INTERVAL 28 DAY), DATE_SUB(NOW(), INTERVAL 26 DAY)),
(1003, '1', '1', '{"license_img":"https://example.com/license1003.jpg","id_card":"https://example.com/id1003.jpg"}', '审核通过', 1, 'admin', DATE_SUB(NOW(), INTERVAL 25 DAY), DATE_SUB(NOW(), INTERVAL 23 DAY), DATE_SUB(NOW(), INTERVAL 25 DAY), DATE_SUB(NOW(), INTERVAL 23 DAY)),
(1004, '1', '1', '{"license_img":"https://example.com/license1004.jpg","id_card":"https://example.com/id1004.jpg"}', '资质齐全，通过入驻', 1, 'admin', DATE_SUB(NOW(), INTERVAL 22 DAY), DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 22 DAY), DATE_SUB(NOW(), INTERVAL 20 DAY)),
(1005, '1', '1', '{"license_img":"https://example.com/license1005.jpg","id_card":"https://example.com/id1005.jpg"}', '审核通过，资质良好', 1, 'admin', DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 18 DAY), DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 18 DAY)),
(1006, '1', '0', '{"license_img":"https://example.com/license1006.jpg","id_card":"https://example.com/id1006.jpg"}', NULL, NULL, NULL, DATE_SUB(NOW(), INTERVAL 2 DAY), NULL, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)),
(1007, '1', '0', '{"license_img":"https://example.com/license1007.jpg","id_card":"https://example.com/id1007.jpg"}', NULL, NULL, NULL, DATE_SUB(NOW(), INTERVAL 1 DAY), NULL, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
(1008, '1', '2', '{"license_img":"https://example.com/license1008.jpg"}', '营业执照信息不清晰，请重新上传', 1, 'admin', DATE_SUB(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 14 DAY), DATE_SUB(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 14 DAY)),
(1009, '1', '1', '{"license_img":"https://example.com/license1009.jpg","id_card":"https://example.com/id1009.jpg"}', '审核通过', 1, 'admin', DATE_SUB(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY)),
(1010, '1', '1', '{"license_img":"https://example.com/license1010.jpg","id_card":"https://example.com/id1010.jpg"}', '资质审核通过', 1, 'admin', DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 8 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 8 DAY));
