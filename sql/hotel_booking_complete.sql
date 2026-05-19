-- =====================================================
-- 旅游酒店预订系统完整数据库脚本（含大量测试数据）
-- 包含：建表语句 + 数据插入（每表至少100条）
-- =====================================================

-- 使用数据库
-- CREATE DATABASE IF NOT EXISTS hotel_booking DEFAULT CHARSET=utf8mb4;
-- USE hotel_booking;

-- =====================================================
-- 1. 酒店表
-- =====================================================
DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
                       id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '酒店ID',
                       name VARCHAR(100) NOT NULL COMMENT '酒店名称',
                       address VARCHAR(255) NOT NULL COMMENT '酒店地址',
                       star INT(11) DEFAULT NULL COMMENT '酒店星级',
                       score DECIMAL(3,2) DEFAULT NULL COMMENT '酒店评分',
                       img_url VARCHAR(255) DEFAULT NULL COMMENT '酒店图片URL',
                       facility TEXT COMMENT '酒店设施',
                       business_id BIGINT(20) DEFAULT NULL COMMENT '商家ID',
                       status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                       create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                       update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                       PRIMARY KEY (id),
                       KEY idx_name (name),
                       KEY idx_status (status)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='酒店表';

-- 插入100条酒店数据
INSERT INTO hotel (id, name, address, star, score, img_url, facility, business_id, status, create_time, update_time) VALUES
                                                                                                                         (1, '北京王府井希尔顿酒店', '北京市东城区王府井大街88号', 5, 4.8, 'https://example.com/hotel1.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室', 1001, '0', NOW(), NOW()),
                                                                                                                         (2, '上海外滩华尔道夫酒店', '上海市黄浦区中山东一路2号', 5, 4.9, 'https://example.com/hotel2.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧,商务中心', 1002, '0', NOW(), NOW()),
                                                                                                                         (3, '广州塔丽思卡尔顿酒店', '广州市天河区珠江新城兴民路222号', 5, 4.7, 'https://example.com/hotel3.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,儿童乐园', 1003, '0', NOW(), NOW()),
                                                                                                                         (4, '深圳福田香格里拉大酒店', '深圳市福田区中心城益田路4088号', 5, 4.6, 'https://example.com/hotel4.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,会议室,商务中心', 1004, '0', NOW(), NOW()),
                                                                                                                         (5, '杭州西湖国宾馆', '杭州市西湖区杨公堤18号', 4, 4.5, 'https://example.com/hotel5.jpg', 'WiFi,停车场,餐厅,花园,湖景房,会议室', 1005, '0', NOW(), NOW()),
                                                                                                                         (6, '成都太古里尼依格罗酒店', '成都市锦江区红星路三段1号', 5, 4.8, 'https://example.com/hotel6.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1006, '0', NOW(), NOW()),
                                                                                                                         (7, '西安钟楼开元酒店', '西安市碑林区南大街30号', 4, 4.3, 'https://example.com/hotel7.jpg', 'WiFi,停车场,餐厅,会议室,商务中心', 1007, '0', NOW(), NOW()),
                                                                                                                         (8, '三亚亚龙湾瑞吉度假酒店', '三亚市吉阳区亚龙湾国家旅游度假区', 5, 4.9, 'https://example.com/hotel8.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅,儿童俱乐部', 1008, '0', NOW(), NOW()),
                                                                                                                         (9, '厦门鼓浪屿海景酒店', '厦门市思明区鼓浪屿康泰路151号', 4, 4.4, 'https://example.com/hotel9.jpg', 'WiFi,海景房,餐厅,花园,露台', 1009, '0', NOW(), NOW()),
                                                                                                                         (10, '青岛五四广场海尔洲际酒店', '青岛市市南区香港中路98号', 5, 4.7, 'https://example.com/hotel10.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房,会议室', 1010, '0', NOW(), NOW()),
                                                                                                                         (11, '南京金陵饭店', '南京市鼓楼区汉中路2号', 5, 4.6, 'https://example.com/hotel11.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,会议室', 1011, '0', NOW(), NOW()),
                                                                                                                         (12, '苏州吴宫泛太平洋酒店', '苏州市姑苏区新市路259号', 4, 4.4, 'https://example.com/hotel12.jpg', 'WiFi,停车场,园林景观,餐厅,会议室', 1012, '0', NOW(), NOW()),
                                                                                                                         (13, '武汉万达瑞华酒店', '武汉市武昌区水果湖街东湖路138号', 5, 4.7, 'https://example.com/hotel13.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1013, '0', NOW(), NOW()),
                                                                                                                         (14, '长沙君悦酒店', '长沙市天心区湘江中路36号', 5, 4.6, 'https://example.com/hotel14.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1014, '0', NOW(), NOW()),
                                                                                                                         (15, '重庆解放碑威斯汀酒店', '重庆市渝中区新华路222号', 5, 4.8, 'https://example.com/hotel15.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1015, '0', NOW(), NOW()),
                                                                                                                         (16, '昆明洲际酒店', '昆明市西山区怡景路5号', 5, 4.5, 'https://example.com/hotel16.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,花园', 1016, '0', NOW(), NOW()),
                                                                                                                         (17, '贵阳凯宾斯基大酒店', '贵阳市南明区护国路68号', 5, 4.4, 'https://example.com/hotel17.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1017, '0', NOW(), NOW()),
                                                                                                                         (18, '南宁万达文华酒店', '南宁市青秀区东葛路118号', 5, 4.5, 'https://example.com/hotel18.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1018, '0', NOW(), NOW()),
                                                                                                                         (19, '海口鲁能希尔顿酒店', '海口市美兰区琼山大道2号', 4, 4.3, 'https://example.com/hotel19.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1019, '0', NOW(), NOW()),
                                                                                                                         (20, '大理洱海天域酒店', '大理市下关镇洱河南路1号', 4, 4.6, 'https://example.com/hotel20.jpg', 'WiFi,停车场,海景房,餐厅,花园', 1020, '0', NOW(), NOW()),
                                                                                                                         (21, '丽江和府洲际度假酒店', '丽江市古城区祥和路276号', 5, 4.7, 'https://example.com/hotel21.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1021, '0', NOW(), NOW()),
                                                                                                                         (22, '桂林香格里拉大酒店', '桂林市七星区环城北二路111号', 5, 4.6, 'https://example.com/hotel22.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1022, '0', NOW(), NOW()),
                                                                                                                         (23, '珠海瑞吉酒店', '珠海市香洲区湾仔银湾路1663号', 5, 4.8, 'https://example.com/hotel23.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1023, '0', NOW(), NOW()),
                                                                                                                         (24, '佛山保利洲际酒店', '佛山市南海区灯湖东路20号', 5, 4.5, 'https://example.com/hotel24.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1024, '0', NOW(), NOW()),
                                                                                                                         (25, '东莞松山湖凯悦酒店', '东莞市松山湖高新区沁园路', 4, 4.4, 'https://example.com/hotel25.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,湖景房', 1025, '0', NOW(), NOW()),
                                                                                                                         (26, '无锡苏宁凯悦酒店', '无锡市梁溪区人民中路109号', 5, 4.6, 'https://example.com/hotel26.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1026, '0', NOW(), NOW()),
                                                                                                                         (27, '常州万豪酒店', '常州市新北区龙锦路1590号', 5, 4.4, 'https://example.com/hotel27.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1027, '0', NOW(), NOW()),
                                                                                                                         (28, '扬州香格里拉大酒店', '扬州市邗江区文昌西路472号', 5, 4.5, 'https://example.com/hotel28.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1028, '0', NOW(), NOW()),
                                                                                                                         (29, '南通滨江洲际酒店', '南通市崇川区跃龙南路508号', 4, 4.3, 'https://example.com/hotel29.jpg', 'WiFi,停车场,餐厅,江景房', 1029, '0', NOW(), NOW()),
                                                                                                                         (30, '宁波东港喜来登酒店', '宁波市鄞州区彩虹北路50号', 5, 4.5, 'https://example.com/hotel30.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1030, '0', NOW(), NOW()),
                                                                                                                         (31, '温州香格里拉大酒店', '温州市鹿城区香源路1号', 5, 4.4, 'https://example.com/hotel31.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1031, '0', NOW(), NOW()),
                                                                                                                         (32, '福州世茂洲际酒店', '福州市台江区广达路108号', 5, 4.5, 'https://example.com/hotel32.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1032, '0', NOW(), NOW()),
                                                                                                                         (33, '厦门康莱德酒店', '厦门市思明区演武西路186号', 5, 4.8, 'https://example.com/hotel33.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1033, '0', NOW(), NOW()),
                                                                                                                         (34, '南昌瑞颐大酒店', '南昌市东湖区沿江北路69号', 4, 4.3, 'https://example.com/hotel34.jpg', 'WiFi,停车场,餐厅,江景房', 1034, '0', NOW(), NOW()),
                                                                                                                         (35, '济南鲁能希尔顿酒店', '济南市市中区二环南路2888号', 5, 4.5, 'https://example.com/hotel35.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1035, '0', NOW(), NOW()),
                                                                                                                         (36, '青岛金沙滩希尔顿酒店', '青岛市黄岛区嘉陵江东路1号', 5, 4.6, 'https://example.com/hotel36.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1036, '0', NOW(), NOW()),
                                                                                                                         (37, '烟台金海岸希尔顿酒店', '烟台市福山区宁波路1号', 4, 4.4, 'https://example.com/hotel37.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1037, '0', NOW(), NOW()),
                                                                                                                         (38, '威海百纳中心酒店', '威海市环翠区新威路58号', 4, 4.2, 'https://example.com/hotel38.jpg', 'WiFi,停车场,餐厅', 1038, '0', NOW(), NOW()),
                                                                                                                         (39, '郑州绿地JW万豪酒店', '郑州市郑东新区商务中央公园2号', 5, 4.6, 'https://example.com/hotel39.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1039, '0', NOW(), NOW()),
                                                                                                                         (40, '洛阳华阳广场国际大饭店', '洛阳市涧西区辽宁路1号', 4, 4.3, 'https://example.com/hotel40.jpg', 'WiFi,停车场,餐厅,会议室', 1040, '0', NOW(), NOW()),
                                                                                                                         (41, '太原凯宾斯基饭店', '太原市小店区长风街115号', 5, 4.5, 'https://example.com/hotel41.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1041, '0', NOW(), NOW()),
                                                                                                                         (42, '石家庄希尔顿酒店', '石家庄市长安区东大街5号', 5, 4.4, 'https://example.com/hotel42.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1042, '0', NOW(), NOW()),
                                                                                                                         (43, '天津丽思卡尔顿酒店', '天津市和平区大沽北路167号', 5, 4.8, 'https://example.com/hotel43.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1043, '0', NOW(), NOW()),
                                                                                                                         (44, '沈阳君悦酒店', '沈阳市和平区青年大街288号', 5, 4.6, 'https://example.com/hotel44.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1044, '0', NOW(), NOW()),
                                                                                                                         (45, '大连君悦酒店', '大连市沙河口区星海广场C3区33号', 5, 4.7, 'https://example.com/hotel45.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,海景房', 1045, '0', NOW(), NOW()),
                                                                                                                         (46, '长春香格里拉大酒店', '长春市朝阳区西安大路569号', 5, 4.5, 'https://example.com/hotel46.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1046, '0', NOW(), NOW()),
                                                                                                                         (47, '哈尔滨香格里拉大酒店', '哈尔滨市道里区友谊路555号', 5, 4.6, 'https://example.com/hotel47.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,江景房', 1047, '0', NOW(), NOW()),
                                                                                                                         (48, '呼和浩特香格里拉大酒店', '呼和浩特市回民区锡林郭勒南路5号', 5, 4.3, 'https://example.com/hotel48.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1048, '0', NOW(), NOW()),
                                                                                                                         (49, '银川凯宾斯基饭店', '银川市金凤区北京中路160号', 5, 4.4, 'https://example.com/hotel49.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1049, '0', NOW(), NOW()),
                                                                                                                         (50, '兰州皇冠假日酒店', '兰州市城关区北滨河东路1号', 4, 4.3, 'https://example.com/hotel50.jpg', 'WiFi,停车场,餐厅,黄河景观', 1050, '0', NOW(), NOW()),
                                                                                                                         (51, '西宁新华联索菲特大酒店', '西宁市城西区五四西路63号', 5, 4.4, 'https://example.com/hotel51.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1051, '0', NOW(), NOW()),
                                                                                                                         (52, '乌鲁木齐希尔顿酒店', '乌鲁木齐市米东区红光山路1237号', 5, 4.5, 'https://example.com/hotel52.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1052, '0', NOW(), NOW()),
                                                                                                                         (53, '拉萨瑞吉度假酒店', '拉萨市城关区江苏路22号', 5, 4.7, 'https://example.com/hotel53.jpg', 'WiFi,停车场,SPA,餐厅,藏式风格', 1053, '0', NOW(), NOW()),
                                                                                                                         (54, '成都华尔道夫酒店', '成都市武侯区天府大道北段1199号', 5, 4.8, 'https://example.com/hotel54.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1054, '0', NOW(), NOW()),
                                                                                                                         (55, '重庆尼依格罗酒店', '重庆市江北区庆云路1号', 5, 4.7, 'https://example.com/hotel55.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1055, '0', NOW(), NOW()),
                                                                                                                         (56, '武汉光谷凯悦酒店', '武汉市洪山区珞喻路1077号', 5, 4.5, 'https://example.com/hotel56.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1056, '0', NOW(), NOW()),
                                                                                                                         (57, '西安W酒店', '西安市雁塔区曲江池东路333号', 5, 4.8, 'https://example.com/hotel57.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅,酒吧', 1057, '0', NOW(), NOW()),
                                                                                                                         (58, '南京卓美亚酒店', '南京市建邺区邺城路2号', 5, 4.7, 'https://example.com/hotel58.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1058, '0', NOW(), NOW()),
                                                                                                                         (59, '杭州康莱德酒店', '杭州市江干区新业路228号', 5, 4.7, 'https://example.com/hotel59.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,钱塘江景', 1059, '0', NOW(), NOW()),
                                                                                                                         (60, '苏州W酒店', '苏州市苏州工业园区苏州中心广场7幢', 5, 4.7, 'https://example.com/hotel60.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1060, '0', NOW(), NOW()),
                                                                                                                         (61, '宁波泛太平洋大酒店', '宁波市鄞州区民安东路99号', 4, 4.4, 'https://example.com/hotel61.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1061, '0', NOW(), NOW()),
                                                                                                                         (62, '无锡君来洲际酒店', '无锡市梁溪区永和路6号', 5, 4.5, 'https://example.com/hotel62.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1062, '0', NOW(), NOW()),
                                                                                                                         (63, '常州新城希尔顿酒店', '常州市武进区虹北路68号', 5, 4.4, 'https://example.com/hotel63.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1063, '0', NOW(), NOW()),
                                                                                                                         (64, '镇江富力喜来登酒店', '镇江市京口区北府路88号', 4, 4.3, 'https://example.com/hotel64.jpg', 'WiFi,停车场,餐厅', 1064, '0', NOW(), NOW()),
                                                                                                                         (65, '扬州皇冠假日酒店', '扬州市广陵区文昌东路3号', 4, 4.4, 'https://example.com/hotel65.jpg', 'WiFi,停车场,游泳池,餐厅', 1065, '0', NOW(), NOW()),
                                                                                                                         (66, '南通绿洲国际假日酒店', '南通市港闸区北大街199号', 4, 4.2, 'https://example.com/hotel66.jpg', 'WiFi,停车场,餐厅', 1066, '0', NOW(), NOW()),
                                                                                                                         (67, '芜湖华邑酒店', '芜湖市镜湖区长江中路15号', 5, 4.5, 'https://example.com/hotel67.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1067, '0', NOW(), NOW()),
                                                                                                                         (68, '合肥洲际酒店', '合肥市政务区潜山路888号', 5, 4.6, 'https://example.com/hotel68.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1068, '0', NOW(), NOW()),
                                                                                                                         (69, '安庆碧桂园凤凰酒店', '安庆市迎江区港口路88号', 4, 4.2, 'https://example.com/hotel69.jpg', 'WiFi,停车场,餐厅', 1069, '0', NOW(), NOW()),
                                                                                                                         (70, '黄山悦榕庄', '黄山市黟县宏村镇', 5, 4.9, 'https://example.com/hotel70.jpg', 'WiFi,停车场,SPA,餐厅,徽派建筑', 1070, '0', NOW(), NOW()),
                                                                                                                         (71, '厦门艾美酒店', '厦门市湖里区南山冠军路7号', 5, 4.5, 'https://example.com/hotel71.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1071, '0', NOW(), NOW()),
                                                                                                                         (72, '福州仓山凯悦酒店', '福州市仓山区花溪南路46号', 5, 4.4, 'https://example.com/hotel72.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1072, '0', NOW(), NOW()),
                                                                                                                         (73, '泉州泰禾洲际酒店', '泉州市丰泽区丰海路1005号', 5, 4.5, 'https://example.com/hotel73.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1073, '0', NOW(), NOW()),
                                                                                                                         (74, '南昌香格里拉大酒店', '南昌市红谷滩新区翠林路669号', 5, 4.5, 'https://example.com/hotel74.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1074, '0', NOW(), NOW()),
                                                                                                                         (75, '赣州锦江国际酒店', '赣州市章贡区金东北路88号', 4, 4.2, 'https://example.com/hotel75.jpg', 'WiFi,停车场,餐厅', 1075, '0', NOW(), NOW()),
                                                                                                                         (76, '济南香格里拉大酒店', '济南市历下区泺源大街106号', 5, 4.5, 'https://example.com/hotel76.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1076, '0', NOW(), NOW()),
                                                                                                                         (77, '青岛香格里拉大酒店', '青岛市市南区香港中路9号', 5, 4.6, 'https://example.com/hotel77.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1077, '0', NOW(), NOW()),
                                                                                                                         (78, '烟台金海湾酒店', '烟台市芝罘区海岸路34号', 4, 4.3, 'https://example.com/hotel78.jpg', 'WiFi,停车场,餐厅,海景房', 1078, '0', NOW(), NOW()),
                                                                                                                         (79, '威海抱海大酒店', '威海市环翠区海滨中路29号', 4, 4.2, 'https://example.com/hotel79.jpg', 'WiFi,停车场,餐厅,海景房', 1079, '0', NOW(), NOW()),
                                                                                                                         (80, '郑州希尔顿酒店', '郑州市金水区金水路288号', 5, 4.5, 'https://example.com/hotel80.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1080, '0', NOW(), NOW()),
                                                                                                                         (81, '洛阳钼都利豪国际饭店', '洛阳市洛龙区开元大道239号', 4, 4.3, 'https://example.com/hotel81.jpg', 'WiFi,停车场,餐厅', 1081, '0', NOW(), NOW()),
                                                                                                                         (82, '太原洲际酒店', '太原市晋源区长兴南街8号', 5, 4.5, 'https://example.com/hotel82.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1082, '0', NOW(), NOW()),
                                                                                                                         (83, '石家庄富力洲际酒店', '石家庄市裕华区槐安东路119号', 5, 4.4, 'https://example.com/hotel83.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1083, '0', NOW(), NOW()),
                                                                                                                         (84, '天津四季酒店', '天津市和平区赤峰道138号', 5, 4.8, 'https://example.com/hotel84.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1084, '0', NOW(), NOW()),
                                                                                                                         (85, '沈阳香格里拉大酒店', '沈阳市沈河区青年大街115号', 5, 4.6, 'https://example.com/hotel85.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1085, '0', NOW(), NOW()),
                                                                                                                         (86, '大连香格里拉大酒店', '大连市中山区人民路66号', 5, 4.6, 'https://example.com/hotel86.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1086, '0', NOW(), NOW()),
                                                                                                                         (87, '长春凯悦酒店', '长春市朝阳区人民大街3233号', 5, 4.5, 'https://example.com/hotel87.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1087, '0', NOW(), NOW()),
                                                                                                                         (88, '哈尔滨万达嘉华酒店', '哈尔滨市松北区世茂大道99号', 5, 4.4, 'https://example.com/hotel88.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1088, '0', NOW(), NOW()),
                                                                                                                         (89, '呼和浩特万达文华酒店', '呼和浩特市赛罕区新华东街26号', 5, 4.3, 'https://example.com/hotel89.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1089, '0', NOW(), NOW()),
                                                                                                                         (90, '银川万豪酒店', '银川市金凤区北京中路166号', 5, 4.4, 'https://example.com/hotel90.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1090, '0', NOW(), NOW()),
                                                                                                                         (91, '兰州凯悦酒店', '兰州市城关区南滨河东路501号', 5, 4.4, 'https://example.com/hotel91.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1091, '0', NOW(), NOW()),
                                                                                                                         (92, '西宁富力万达嘉华酒店', '西宁市城西区西川南路76号', 5, 4.3, 'https://example.com/hotel92.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1092, '0', NOW(), NOW()),
                                                                                                                         (93, '乌鲁木齐康莱德酒店', '乌鲁木齐市沙依巴克区友好北路669号', 5, 4.5, 'https://example.com/hotel93.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1093, '0', NOW(), NOW()),
                                                                                                                         (94, '拉萨圣地天堂洲际酒店', '拉萨市城关区江苏大道1号', 5, 4.6, 'https://example.com/hotel94.jpg', 'WiFi,停车场,SPA,餐厅', 1094, '0', NOW(), NOW()),
                                                                                                                         (95, '贵阳亨特索菲特酒店', '贵阳市南明区都司高架桥路33号', 5, 4.5, 'https://example.com/hotel95.jpg', 'WiFi,停车场,游泳池,健身房,餐厅', 1095, '0', NOW(), NOW()),
                                                                                                                         (96, '南宁龙光那莲豪华精选酒店', '南宁市青秀区中柬路8号', 5, 4.7, 'https://example.com/hotel96.jpg', 'WiFi,停车场,游泳池,健身房,SPA,餐厅', 1096, '0', NOW(), NOW()),
                                                                                                                         (97, '海口华彩华邑酒店', '海口市美兰区碧海大道21号', 5, 4.5, 'https://example.com/hotel97.jpg', 'WiFi,停车场,游泳池,健身房,餐厅,海景房', 1097, '0', NOW(), NOW()),
                                                                                                                         (98, '三亚海棠湾君悦酒店', '三亚市海棠区海棠北路68号', 5, 4.8, 'https://example.com/hotel98.jpg', 'WiFi,停车场,私人海滩,游泳池,健身房,SPA,餐厅', 1098, '0', NOW(), NOW()),
                                                                                                                         (99, '北海银滩皇冠假日酒店', '北海市银海区银滩四号路8号', 4, 4.4, 'https://example.com/hotel99.jpg', 'WiFi,停车场,游泳池,餐厅,海景房', 1099, '0', NOW(), NOW()),
                                                                                                                         (100, '桂林漓江大瀑布饭店', '桂林市秀峰区杉湖北路1号', 4, 4.3, 'https://example.com/hotel100.jpg', 'WiFi,停车场,餐厅,江景房', 1100, '0', NOW(), NOW());

-- =====================================================
-- 2. 房源/房型表（每酒店3-5个房型，共约350条）
-- =====================================================
DROP TABLE IF EXISTS room;
CREATE TABLE room (
                      id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '房源ID',
                      hotel_id BIGINT(20) NOT NULL COMMENT '酒店ID',
                      room_type VARCHAR(50) NOT NULL COMMENT '房型名称',
                      area VARCHAR(50) DEFAULT NULL COMMENT '房间面积',
                      bed_type VARCHAR(50) DEFAULT NULL COMMENT '床型',
                      price DECIMAL(10,2) NOT NULL COMMENT '价格',
                      stock INT(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
                      status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                      img_url VARCHAR(255) DEFAULT NULL COMMENT '图片URL',
                      create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                      update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                      PRIMARY KEY (id),
                      KEY idx_hotel_id (hotel_id),
                      KEY idx_status (status)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='房源/房型表';

-- 插入房型数据（为每个酒店插入3-5种房型，总数约350条）
-- 这里使用存储过程批量生成，避免手工写350条
DELIMITER $$
DROP PROCEDURE IF EXISTS generate_rooms$$
CREATE PROCEDURE generate_rooms()
BEGIN
    DECLARE h_id INT DEFAULT 1;
    DECLARE room_suffix INT DEFAULT 1;

    WHILE h_id <= 100 DO
        -- 每个酒店插入3-5种房型
        -- 豪华大床房
        INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time)
        VALUES (h_id, '豪华大床房', '38平米', '1.8米大床', 599 + (h_id % 10) * 50, 15 + (h_id % 20), '0', CONCAT('https://example.com/hotel', h_id, '_room1.jpg'), NOW(), NOW());

        -- 行政双床房
INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time)
VALUES (h_id, '行政双床房', '42平米', '2张1.2米单人床', 699 + (h_id % 10) * 60, 12 + (h_id % 15), '0', CONCAT('https://example.com/hotel', h_id, '_room2.jpg'), NOW(), NOW());

-- 家庭套房
INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time)
VALUES (h_id, '家庭套房', '65平米', '1.8米大床+1.2米单人床', 999 + (h_id % 10) * 80, 8 + (h_id % 10), '0', CONCAT('https://example.com/hotel', h_id, '_room3.jpg'), NOW(), NOW());

-- 总统套房（部分酒店）
IF h_id % 3 = 0 THEN
            INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time)
            VALUES (h_id, '总统套房', '120平米', '2米特大床', 2999 + (h_id % 20) * 100, 2, '0', CONCAT('https://example.com/hotel', h_id, '_room4.jpg'), NOW(), NOW());
END IF;

        -- 景观房（部分酒店）
        IF h_id % 2 = 0 THEN
            INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time)
            VALUES (h_id, '景观房', '45平米', '1.8米大床', 799 + (h_id % 10) * 70, 10 + (h_id % 12), '0', CONCAT('https://example.com/hotel', h_id, '_room5.jpg'), NOW(), NOW());
END IF;

        SET h_id = h_id + 1;
END WHILE;
END$$
DELIMITER ;

CALL generate_rooms();
DROP PROCEDURE IF EXISTS generate_rooms;

-- 补充更多房型确保总数超过100条（实际已有约400条）
-- 再额外插入一些特色房型
INSERT INTO room (hotel_id, room_type, area, bed_type, price, stock, status, img_url, create_time, update_time) VALUES
                                                                                                                    (1, '海景套房', '80平米', '1.8米大床', 1899.00, 5, '0', 'https://example.com/hotel1_extra1.jpg', NOW(), NOW()),
                                                                                                                    (2, '日式榻榻米房', '35平米', '榻榻米', 899.00, 8, '0', 'https://example.com/hotel2_extra1.jpg', NOW(), NOW()),
                                                                                                                    (3, '亲子主题房', '50平米', '1.8米大床+儿童床', 1299.00, 6, '0', 'https://example.com/hotel3_extra1.jpg', NOW(), NOW()),
                                                                                                                    (4, '商务行政房', '55平米', '1.8米大床', 1099.00, 10, '0', 'https://example.com/hotel4_extra1.jpg', NOW(), NOW()),
                                                                                                                    (5, '湖景别墅', '150平米', '2米特大床', 3999.00, 3, '0', 'https://example.com/hotel5_extra1.jpg', NOW(), NOW());

-- =====================================================
-- 3. 订单表（至少100条）
-- =====================================================
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
                        id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
                        order_no VARCHAR(50) NOT NULL COMMENT '订单号',
                        user_id BIGINT(20) NOT NULL COMMENT '用户ID',
                        hotel_id BIGINT(20) NOT NULL COMMENT '酒店ID',
                        room_id BIGINT(20) NOT NULL COMMENT '房型ID',
                        start_date DATE NOT NULL COMMENT '入住日期',
                        end_date DATE NOT NULL COMMENT '离店日期',
                        total_price DECIMAL(10,2) NOT NULL COMMENT '总价格',
                        status CHAR(1) DEFAULT '0' COMMENT '订单状态（0待支付 1已支付 2已取消 3已完成 4退款中 5已退款）',
                        pay_time DATETIME DEFAULT NULL COMMENT '支付时间',
                        create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        PRIMARY KEY (id),
                        UNIQUE KEY uk_order_no (order_no),
                        KEY idx_user_id (user_id),
                        KEY idx_hotel_id (hotel_id),
                        KEY idx_room_id (room_id),
                        KEY idx_status (status)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 使用存储过程生成100条订单数据
DELIMITER $$
DROP PROCEDURE IF EXISTS generate_orders$$
CREATE PROCEDURE generate_orders()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE r_hotel_id INT;
    DECLARE r_room_id INT;
    DECLARE r_user_id INT;
    DECLARE r_start DATE;
    DECLARE r_end DATE;
    DECLARE r_price DECIMAL(10,2);
    DECLARE r_status CHAR(1);
    DECLARE r_pay_time DATETIME;

    WHILE i <= 150 DO
        -- 随机酒店ID (1-100)
        SET r_hotel_id = 1 + FLOOR(RAND() * 100);
        -- 随机房型ID (根据酒店范围，简化处理使用1-350)
        SET r_room_id = 1 + FLOOR(RAND() * 350);
        -- 随机用户ID (2001-2500)
        SET r_user_id = 2000 + FLOOR(RAND() * 500);
        -- 随机入住日期 (2026年5月-8月)
        SET r_start = DATE_ADD('2026-05-01', INTERVAL FLOOR(RAND() * 90) DAY);
        SET r_end = DATE_ADD(r_start, INTERVAL 1 + FLOOR(RAND() * 5) DAY);
        -- 随机价格 (300-5000)
        SET r_price = 300 + RAND() * 4700;
        -- 随机状态 (0待支付 1已支付 2已取消 3已完成 4退款中 5已退款)
        SET r_status = ELT(1 + FLOOR(RAND() * 6), '0', '1', '2', '3', '4', '5');

        -- 支付时间
        IF r_status IN ('1', '3', '4', '5') THEN
            SET r_pay_time = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY);
ELSE
            SET r_pay_time = NULL;
END IF;

INSERT INTO orders (order_no, user_id, hotel_id, room_id, start_date, end_date, total_price, status, pay_time, create_time, update_time)
VALUES (
           CONCAT('ORD', DATE_FORMAT(NOW(), '%Y%m%d'), LPAD(i, 6, '0')),
           r_user_id, r_hotel_id, r_room_id, r_start, r_end, ROUND(r_price, 2), r_status, r_pay_time,
           DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 60) DAY), NOW()
       );

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

CALL generate_orders();
DROP PROCEDURE IF EXISTS generate_orders;

-- =====================================================
-- 4. 评价表（至少100条）
-- =====================================================
DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
                         id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
                         user_id BIGINT(20) NOT NULL COMMENT '用户ID',
                         hotel_id BIGINT(20) NOT NULL COMMENT '酒店ID',
                         room_id BIGINT(20) DEFAULT NULL COMMENT '房型ID',
                         score INT(11) NOT NULL COMMENT '评分（1-5星）',
                         content TEXT NOT NULL COMMENT '评价内容',
                         img_url VARCHAR(255) DEFAULT NULL COMMENT '图片URL',
                         create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         reply_content TEXT DEFAULT NULL COMMENT '回复内容',
                         reply_time DATETIME DEFAULT NULL COMMENT '回复时间',
                         PRIMARY KEY (id),
                         KEY idx_user_id (user_id),
                         KEY idx_hotel_id (hotel_id),
                         KEY idx_room_id (room_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='评价表';

-- 生成100条评价数据
DELIMITER $$
DROP PROCEDURE IF EXISTS generate_comments$$
CREATE PROCEDURE generate_comments()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE r_user_id INT;
    DECLARE r_hotel_id INT;
    DECLARE r_room_id INT;
    DECLARE r_score INT;
    DECLARE r_content VARCHAR(500);

    DECLARE content_list TEXT DEFAULT '非常满意，服务很好！,位置便利，干净卫生，值得推荐。,房间宽敞舒适，早餐丰富。,性价比高，下次还会来。,设施齐全，环境优雅。,前台服务热情，停车方便。,床很舒服，睡得很好。,景观很棒，视野开阔。,卫生间干净，热水充足。,隔音效果不错，很安静。,空调给力，温度适宜。,WiFi信号稳定，速度快。,周边购物吃饭都很方便。,酒店很新，装修时尚。,服务态度很好，有求必应。,儿童设施齐全，适合亲子。,泳池干净，健身房设备好。,早餐种类多，味道不错。,性价比很高，超出预期。,还会再来的！';

    WHILE i <= 150 DO
        SET r_user_id = 2000 + FLOOR(RAND() * 500);
        SET r_hotel_id = 1 + FLOOR(RAND() * 100);
        SET r_room_id = 1 + FLOOR(RAND() * 350);
        SET r_score = 3 + FLOOR(RAND() * 3); -- 3-5星
        SET r_content = ELT(1 + FLOOR(RAND() * 20),
            '非常满意，服务很好！', '位置便利，干净卫生，值得推荐。', '房间宽敞舒适，早餐丰富。', '性价比高，下次还会来。',
            '设施齐全，环境优雅。', '前台服务热情，停车方便。', '床很舒服，睡得很好。', '景观很棒，视野开阔。',
            '卫生间干净，热水充足。', '隔音效果不错，很安静。', '空调给力，温度适宜。', 'WiFi信号稳定，速度快。',
            '周边购物吃饭都很方便。', '酒店很新，装修时尚。', '服务态度很好，有求必应。', '儿童设施齐全，适合亲子。',
            '泳池干净，健身房设备好。', '早餐种类多，味道不错。', '性价比很高，超出预期。', '还会再来的！');

INSERT INTO comment (user_id, hotel_id, room_id, score, content, img_url, create_time, reply_content, reply_time)
VALUES (
           r_user_id, r_hotel_id, r_room_id, r_score, r_content,
           CASE WHEN RAND() > 0.7 THEN CONCAT('https://example.com/comment', i, '.jpg') ELSE NULL END,
           DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 60) DAY),
           CASE WHEN RAND() > 0.5 THEN '感谢您的评价，我们会继续努力！' ELSE NULL END,
           CASE WHEN RAND() > 0.5 THEN DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY) ELSE NULL END
       );

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

CALL generate_comments();
DROP PROCEDURE IF EXISTS generate_comments;

-- =====================================================
-- 5. 支付表（至少100条，与订单对应）
-- =====================================================
DROP TABLE IF EXISTS payment;
CREATE TABLE payment (
                         id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '支付ID',
                         order_id BIGINT(20) NOT NULL COMMENT '订单ID',
                         pay_amount DECIMAL(10,2) NOT NULL COMMENT '支付金额',
                         pay_type CHAR(1) DEFAULT NULL COMMENT '支付类型（1微信 2支付宝 3银行卡）',
                         pay_status CHAR(1) DEFAULT '0' COMMENT '支付状态（0待支付 1已支付 2支付失败 3退款中 4已退款）',
                         pay_time DATETIME DEFAULT NULL COMMENT '支付时间',
                         transaction_id VARCHAR(100) DEFAULT NULL COMMENT '交易号',
                         create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         PRIMARY KEY (id),
                         KEY idx_order_id (order_id),
                         KEY idx_pay_status (pay_status)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

-- 为订单生成对应的支付记录
DELIMITER $$
DROP PROCEDURE IF EXISTS generate_payments$$
CREATE PROCEDURE generate_payments()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_order_id BIGINT;
    DECLARE v_order_no VARCHAR(50);
    DECLARE v_total_price DECIMAL(10,2);
    DECLARE v_pay_status CHAR(1);
    DECLARE v_pay_time DATETIME;
    DECLARE v_create_time DATETIME;

    DECLARE cur CURSOR FOR
SELECT id, total_price, status, pay_time, create_time
FROM orders
WHERE status IN ('1', '3', '4', '5')
ORDER BY id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;

read_loop: LOOP
        FETCH cur INTO v_order_id, v_total_price, v_pay_status, v_pay_time, v_create_time;
        IF done THEN
            LEAVE read_loop;
END IF;

        -- 支付状态映射：订单状态1->支付状态1，订单状态3->支付状态1，订单状态4->支付状态3，订单状态5->支付状态4
INSERT INTO payment (order_id, pay_amount, pay_type, pay_status, pay_time, transaction_id, create_time, update_time)
VALUES (
           v_order_id, v_total_price,
           ELT(1 + FLOOR(RAND() * 3), '1', '2', '3'),
           CASE v_pay_status
               WHEN '1' THEN '1'
               WHEN '3' THEN '1'
               WHEN '4' THEN '3'
               WHEN '5' THEN '4'
               ELSE '0'
               END,
           v_pay_time,
           CONCAT('TXN', DATE_FORMAT(v_pay_time, '%Y%m%d%H%i%s'), LPAD(v_order_id, 8, '0')),
           v_create_time,
           NOW()
       );
END LOOP;

CLOSE cur;
END$$
DELIMITER ;

CALL generate_payments();
DROP PROCEDURE IF EXISTS generate_payments;

-- 为待支付订单也添加一些支付记录（状态为待支付）
INSERT INTO payment (order_id, pay_amount, pay_type, pay_status, pay_time, transaction_id, create_time, update_time)
SELECT id, total_price, '1', '0', NULL, NULL, create_time, NOW()
FROM orders
WHERE status = '0'
    LIMIT 30;

-- =====================================================
-- 验证数据量
-- =====================================================
SELECT 'hotel表数据量' as tablename, COUNT(*) as count FROM hotel
UNION ALL
SELECT 'room表数据量', COUNT(*) FROM room
UNION ALL
SELECT 'orders表数据量', COUNT(*) FROM orders
UNION ALL
SELECT 'comment表数据量', COUNT(*) FROM comment
UNION ALL
SELECT 'payment表数据量', COUNT(*) FROM payment;