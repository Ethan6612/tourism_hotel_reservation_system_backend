-- =====================================================
-- 旅游酒店预订系统 - 角色表更新脚本
-- 更新日期: 2026-06-01
-- 更新说明: 根据前端页面需求，将角色分为管理员、用户和商户三种
-- =====================================================

-- 1. 清空现有角色数据（可选，根据实际情况决定是否执行）
-- TRUNCATE TABLE sys_role;
-- TRUNCATE TABLE sys_user_role;

-- 2. 删除原有角色数据（如果存在）
DELETE FROM sys_role WHERE role_id IN (1, 2, 3, 4);
DELETE FROM sys_user_role WHERE role_id IN (1, 2, 3, 4);

-- 3. 插入新的三种角色
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `remark`) VALUES
(1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', NOW(), '系统超级管理员，拥有所有权限'),
(2, '普通用户', 'customer', 2, '5', 1, 1, '0', '0', 'admin', NOW(), '前台普通用户，可以浏览酒店、预订房间'),
(3, '商户', 'merchant', 3, '3', 1, 1, '0', '0', 'admin', NOW(), '酒店商家，可以管理自己的酒店和房源');

-- 4. 为已有用户分配角色（根据实际情况调整）
-- admin 用户 -> 超级管理员
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1) ON DUPLICATE KEY UPDATE role_id = 1;

-- customer01 用户 -> 普通用户
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2) ON DUPLICATE KEY UPDATE role_id = 2;

-- merchant01 用户 -> 商户
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (100, 3) ON DUPLICATE KEY UPDATE role_id = 3;

-- 5. 添加角色类型字典（可选，用于前端展示）
-- 检查字典类型是否存在，不存在则插入
INSERT INTO `sys_dict_type` (`dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `remark`) 
SELECT '用户角色类型', 'sys_user_role_type', '0', 'admin', NOW(), '系统用户角色分类'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'sys_user_role_type');

-- 添加角色类型的字典数据
INSERT INTO `sys_dict_data` (`dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `remark`) VALUES
(1, '管理员', 'admin', 'sys_user_role_type', '', 'danger', 'N', '0', 'admin', NOW(), '系统管理员角色'),
(2, '普通用户', 'customer', 'sys_user_role_type', '', 'primary', 'Y', '0', 'admin', NOW(), '前台普通用户角色'),
(3, '商户', 'merchant', 'sys_user_role_type', '', 'success', 'N', '0', 'admin', NOW(), '酒店商家角色')
ON DUPLICATE KEY UPDATE dict_label = VALUES(dict_label), update_time = NOW();

-- 6. 更新 sys_config 表，开启用户注册功能（如果需要）
UPDATE sys_config SET config_value = 'true', update_time = NOW() 
WHERE config_key = 'sys.account.registerUser';

-- 7. 创建示例商户用户（可选）
-- 如果需要创建默认的商户测试账号，可以取消下面的注释
/*
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(101, NULL, 'merchant01', '测试商户01', '01', 'merchant01@test.com', '13800000001', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, NOW(), 'admin', NOW(), '', NULL, '测试商户账号，密码：admin123');

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (101, 3);
*/

-- =====================================================
-- 执行完成提示
-- =====================================================
SELECT '角色表更新完成！' AS message;
SELECT '已创建三种角色：' AS info;
SELECT role_id, role_name, role_key, remark FROM sys_role WHERE role_id IN (1, 2, 3);
