/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.105.72.237:3306
 Source Schema         : laputa_pdm

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2020 15:38:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `parent_id` int(11) NULL DEFAULT NULL,
  `tenant_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '无锡公司', 1, '2018-01-22 19:00:23', '2019-10-19 09:44:30', '0', 0, 1);
INSERT INTO `sys_dept` VALUES (2, '深圳公司', 2, '2018-01-22 19:00:38', '2019-12-21 09:07:41', '0', 0, 1);
INSERT INTO `sys_dept` VALUES (3, '设计所', 1, '2018-01-22 19:00:44', '2019-11-30 13:15:40', '0', 1, 1);
INSERT INTO `sys_dept` VALUES (4, '模拟设计部', 1, '2018-01-22 19:00:52', '2019-11-30 09:37:07', '0', 3, 1);
INSERT INTO `sys_dept` VALUES (5, '电源设计组', 1, '2018-01-22 19:00:57', '2019-12-02 14:22:09', '0', 4, 1);
INSERT INTO `sys_dept` VALUES (6, '信源公司', 6, '2018-01-22 19:01:06', '2019-05-18 14:56:16', '1', 5, 1);
INSERT INTO `sys_dept` VALUES (7, '销售部', 7, '2018-01-22 19:01:57', '2019-11-30 09:10:56', '0', 2, 1);
INSERT INTO `sys_dept` VALUES (8, '设计所', 8, '2018-01-22 19:02:03', '2019-11-30 09:11:06', '1', 7, 1);
INSERT INTO `sys_dept` VALUES (9, '模拟设计组', 9, '2018-01-22 19:02:14', '2019-05-18 14:12:22', '1', 8, 1);
INSERT INTO `sys_dept` VALUES (10, '上海公司', 3, '2018-11-18 13:27:11', '2019-10-19 09:55:11', '0', 0, 2);
INSERT INTO `sys_dept` VALUES (11, '电源设计组', 2, '2018-12-10 21:19:26', '2019-11-30 09:11:06', '1', 8, 1);
INSERT INTO `sys_dept` VALUES (12, '数字设计部', 3, '2019-04-28 17:33:31', '2019-11-30 09:11:06', '1', 11, 1);
INSERT INTO `sys_dept` VALUES (13, '设计部', 1, '2019-10-18 08:58:36', '2019-10-18 13:08:06', '0', 10, 1);
INSERT INTO `sys_dept` VALUES (14, '默认部门', 0, '2019-10-18 09:47:23', '2019-10-28 16:40:52', '0', 0, 1);
INSERT INTO `sys_dept` VALUES (15, '产品所', 2, '2019-11-30 09:11:57', '2019-11-30 13:15:44', '0', 1, 1);
INSERT INTO `sys_dept` VALUES (16, '项目部', 1, '2019-11-30 09:25:27', NULL, '0', 15, 1);
INSERT INTO `sys_dept` VALUES (17, '应用部', 2, '2019-11-30 09:25:57', '2019-11-30 09:26:20', '0', 15, 1);
INSERT INTO `sys_dept` VALUES (18, '测试部', 3, '2019-11-30 09:26:13', NULL, '0', 15, 1);
INSERT INTO `sys_dept` VALUES (19, '数字设计部', 2, '2019-11-30 09:36:53', NULL, '0', 3, 1);
INSERT INTO `sys_dept` VALUES (20, '系统集成部', 3, '2019-11-30 09:37:25', NULL, '0', 3, 1);
INSERT INTO `sys_dept` VALUES (21, '质量部', 3, '2019-11-30 09:39:55', NULL, '0', 1, 1);
INSERT INTO `sys_dept` VALUES (22, '销售部', 4, '2019-11-30 09:40:06', NULL, '0', 1, 1);
INSERT INTO `sys_dept` VALUES (23, '财务部', 5, '2019-11-30 09:40:22', NULL, '0', 1, 1);
INSERT INTO `sys_dept` VALUES (24, '运维部', 6, '2019-11-30 09:40:33', NULL, '0', 1, 1);
INSERT INTO `sys_dept` VALUES (25, '综合部', 7, '2019-11-30 09:40:44', NULL, '0', 1, 1);
INSERT INTO `sys_dept` VALUES (26, '测试工厂', 1, '2019-11-30 09:40:59', NULL, '0', 24, 1);
INSERT INTO `sys_dept` VALUES (27, '外协办公室', 2, '2019-11-30 09:41:14', NULL, '0', 24, 1);
INSERT INTO `sys_dept` VALUES (28, '显示驱动组', 1, '2019-12-02 14:20:28', NULL, '0', 19, 1);
INSERT INTO `sys_dept` VALUES (29, '马达驱动组', 2, '2019-12-02 14:20:50', NULL, '0', 19, 1);
INSERT INTO `sys_dept` VALUES (30, '通用芯片组', 1, '2019-12-02 14:21:21', NULL, '0', 20, 1);
INSERT INTO `sys_dept` VALUES (31, 'SOC芯片组', 2, '2019-12-02 14:21:48', NULL, '0', 20, 1);
INSERT INTO `sys_dept` VALUES (32, '保护电路组', 2, '2019-12-02 14:22:04', NULL, '0', 4, 1);
INSERT INTO `sys_dept` VALUES (33, '上海公司', 3, '2019-12-21 09:06:18', NULL, '0', 0, 1);
INSERT INTO `sys_dept` VALUES (34, '西安公司', 4, '2019-12-21 09:08:15', NULL, '0', 0, 1);
INSERT INTO `sys_dept` VALUES (35, '韩国公司', 5, '2019-12-21 09:08:25', NULL, '0', 0, 1);
INSERT INTO `sys_dept` VALUES (36, '销售部', 1, '2019-12-21 09:08:43', NULL, '0', 33, 1);
INSERT INTO `sys_dept` VALUES (37, '应用支持部', 2, '2019-12-21 09:08:58', NULL, '0', 33, 1);
INSERT INTO `sys_dept` VALUES (38, '销售部', 1, '2019-12-21 09:09:12', NULL, '0', 35, 1);
INSERT INTO `sys_dept` VALUES (39, '中测组', 1, '2019-12-22 11:01:31', NULL, '0', 18, 1);
INSERT INTO `sys_dept` VALUES (40, '成测组', 2, '2019-12-22 11:01:42', NULL, '0', 18, 1);

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation`  (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`, `descendant`) USING BTREE,
  INDEX `idx1`(`ancestor`) USING BTREE,
  INDEX `idx2`(`descendant`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
INSERT INTO `sys_dept_relation` VALUES (1, 1);
INSERT INTO `sys_dept_relation` VALUES (1, 3);
INSERT INTO `sys_dept_relation` VALUES (1, 4);
INSERT INTO `sys_dept_relation` VALUES (1, 5);
INSERT INTO `sys_dept_relation` VALUES (1, 15);
INSERT INTO `sys_dept_relation` VALUES (1, 16);
INSERT INTO `sys_dept_relation` VALUES (1, 17);
INSERT INTO `sys_dept_relation` VALUES (1, 18);
INSERT INTO `sys_dept_relation` VALUES (1, 19);
INSERT INTO `sys_dept_relation` VALUES (1, 20);
INSERT INTO `sys_dept_relation` VALUES (1, 21);
INSERT INTO `sys_dept_relation` VALUES (1, 22);
INSERT INTO `sys_dept_relation` VALUES (1, 23);
INSERT INTO `sys_dept_relation` VALUES (1, 24);
INSERT INTO `sys_dept_relation` VALUES (1, 25);
INSERT INTO `sys_dept_relation` VALUES (1, 26);
INSERT INTO `sys_dept_relation` VALUES (1, 27);
INSERT INTO `sys_dept_relation` VALUES (1, 28);
INSERT INTO `sys_dept_relation` VALUES (1, 29);
INSERT INTO `sys_dept_relation` VALUES (1, 30);
INSERT INTO `sys_dept_relation` VALUES (1, 31);
INSERT INTO `sys_dept_relation` VALUES (1, 32);
INSERT INTO `sys_dept_relation` VALUES (1, 39);
INSERT INTO `sys_dept_relation` VALUES (1, 40);
INSERT INTO `sys_dept_relation` VALUES (2, 2);
INSERT INTO `sys_dept_relation` VALUES (2, 7);
INSERT INTO `sys_dept_relation` VALUES (3, 3);
INSERT INTO `sys_dept_relation` VALUES (3, 4);
INSERT INTO `sys_dept_relation` VALUES (3, 5);
INSERT INTO `sys_dept_relation` VALUES (3, 19);
INSERT INTO `sys_dept_relation` VALUES (3, 20);
INSERT INTO `sys_dept_relation` VALUES (3, 28);
INSERT INTO `sys_dept_relation` VALUES (3, 29);
INSERT INTO `sys_dept_relation` VALUES (3, 30);
INSERT INTO `sys_dept_relation` VALUES (3, 31);
INSERT INTO `sys_dept_relation` VALUES (3, 32);
INSERT INTO `sys_dept_relation` VALUES (4, 4);
INSERT INTO `sys_dept_relation` VALUES (4, 5);
INSERT INTO `sys_dept_relation` VALUES (4, 32);
INSERT INTO `sys_dept_relation` VALUES (5, 5);
INSERT INTO `sys_dept_relation` VALUES (7, 7);
INSERT INTO `sys_dept_relation` VALUES (10, 10);
INSERT INTO `sys_dept_relation` VALUES (10, 13);
INSERT INTO `sys_dept_relation` VALUES (13, 13);
INSERT INTO `sys_dept_relation` VALUES (14, 14);
INSERT INTO `sys_dept_relation` VALUES (15, 15);
INSERT INTO `sys_dept_relation` VALUES (15, 16);
INSERT INTO `sys_dept_relation` VALUES (15, 17);
INSERT INTO `sys_dept_relation` VALUES (15, 18);
INSERT INTO `sys_dept_relation` VALUES (15, 39);
INSERT INTO `sys_dept_relation` VALUES (15, 40);
INSERT INTO `sys_dept_relation` VALUES (16, 16);
INSERT INTO `sys_dept_relation` VALUES (17, 17);
INSERT INTO `sys_dept_relation` VALUES (18, 18);
INSERT INTO `sys_dept_relation` VALUES (18, 39);
INSERT INTO `sys_dept_relation` VALUES (18, 40);
INSERT INTO `sys_dept_relation` VALUES (19, 19);
INSERT INTO `sys_dept_relation` VALUES (19, 28);
INSERT INTO `sys_dept_relation` VALUES (19, 29);
INSERT INTO `sys_dept_relation` VALUES (20, 20);
INSERT INTO `sys_dept_relation` VALUES (20, 30);
INSERT INTO `sys_dept_relation` VALUES (20, 31);
INSERT INTO `sys_dept_relation` VALUES (21, 21);
INSERT INTO `sys_dept_relation` VALUES (22, 22);
INSERT INTO `sys_dept_relation` VALUES (23, 23);
INSERT INTO `sys_dept_relation` VALUES (24, 24);
INSERT INTO `sys_dept_relation` VALUES (24, 26);
INSERT INTO `sys_dept_relation` VALUES (24, 27);
INSERT INTO `sys_dept_relation` VALUES (25, 25);
INSERT INTO `sys_dept_relation` VALUES (26, 26);
INSERT INTO `sys_dept_relation` VALUES (27, 27);
INSERT INTO `sys_dept_relation` VALUES (28, 28);
INSERT INTO `sys_dept_relation` VALUES (29, 29);
INSERT INTO `sys_dept_relation` VALUES (30, 30);
INSERT INTO `sys_dept_relation` VALUES (31, 31);
INSERT INTO `sys_dept_relation` VALUES (32, 32);
INSERT INTO `sys_dept_relation` VALUES (33, 33);
INSERT INTO `sys_dept_relation` VALUES (33, 36);
INSERT INTO `sys_dept_relation` VALUES (33, 37);
INSERT INTO `sys_dept_relation` VALUES (34, 34);
INSERT INTO `sys_dept_relation` VALUES (35, 35);
INSERT INTO `sys_dept_relation` VALUES (35, 38);
INSERT INTO `sys_dept_relation` VALUES (36, 36);
INSERT INTO `sys_dept_relation` VALUES (37, 37);
INSERT INTO `sys_dept_relation` VALUES (38, 38);
INSERT INTO `sys_dept_relation` VALUES (39, 39);
INSERT INTO `sys_dept_relation` VALUES (40, 40);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `system` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'log_type', '日志类型', '2019-03-19 11:06:44', '2019-03-19 11:06:44', '异常、正常', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (2, 'social_type', '社交登录', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '微信、QQ', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (3, 'leave_status', '请假状态', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '未提交、审批中、完成、驳回', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (4, 'job_type', '定时任务类型', '2019-03-19 11:22:21', '2019-03-19 11:22:21', 'quartz', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '定时任务状态', '2019-03-19 11:24:57', '2019-03-19 11:24:57', '发布状态、运行状态', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (6, 'job_execute_status', '定时任务执行状态', '2019-03-19 11:26:15', '2019-03-19 11:26:15', '正常、异常', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (7, 'misfire_policy', '定时任务错失执行策略', '2019-03-19 11:27:19', '2019-03-19 11:27:19', '周期', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (8, 'gender', '性别', '2019-03-27 13:44:06', '2019-03-27 13:44:06', '微信用户性别', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (9, 'subscribe', '订阅状态', '2019-03-27 13:48:33', '2019-03-27 13:48:33', '公众号订阅状态', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (10, 'response_type', '回复', '2019-03-28 21:29:21', '2019-03-28 21:29:21', '微信消息是否已回复', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (11, 'param_type', '参数配置', '2019-04-29 18:20:47', '2019-04-29 18:20:47', '检索、原文、报表、安全、文档、消息、其他', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (12, 'tenant_status_type', '租户状态', '2019-05-15 16:31:08', '2019-05-15 16:31:08', '租户状态', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (13, 'dict_type', '字典类型', '2019-05-16 14:16:20', '2019-05-16 14:20:16', '系统类不能修改', '1', '0', 1);
INSERT INTO `sys_dict` VALUES (14, 'channel_status', '支付渠道状态', '2019-05-30 16:14:43', '2019-05-30 16:14:43', '支付渠道状态（0-正常，1-冻结）', '0', '0', 1);
INSERT INTO `sys_dict` VALUES (15, 'channel_id', '渠道编码ID', '2019-05-30 18:59:12', '2019-05-30 18:59:12', '不同的支付方式', '0', '0', 1);
INSERT INTO `sys_dict` VALUES (16, 'order_status', '订单状态', '2019-06-27 08:17:40', '2019-06-27 08:17:40', '支付订单状态', '0', '0', 1);
INSERT INTO `sys_dict` VALUES (17, 'grant_types', '授权类型', '2019-08-13 07:34:10', '2019-08-13 07:34:10', NULL, '0', '0', 1);
INSERT INTO `sys_dict` VALUES (18, 'log_type', '日志类型', '2019-03-19 11:06:44', '2019-03-19 11:06:44', '异常、正常', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (19, 'social_type', '社交登录', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '微信、QQ', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (20, 'leave_status', '请假状态', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '未提交、审批中、完成、驳回', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (21, 'job_type', '定时任务类型', '2019-03-19 11:22:21', '2019-03-19 11:22:21', 'quartz', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (22, 'job_status', '定时任务状态', '2019-03-19 11:24:57', '2019-03-19 11:24:57', '发布状态、运行状态', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (23, 'job_execute_status', '定时任务执行状态', '2019-03-19 11:26:15', '2019-03-19 11:26:15', '正常、异常', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (24, 'misfire_policy', '定时任务错失执行策略', '2019-03-19 11:27:19', '2019-03-19 11:27:19', '周期', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (25, 'gender', '性别', '2019-03-27 13:44:06', '2019-03-27 13:44:06', '微信用户性别', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (26, 'subscribe', '订阅状态', '2019-03-27 13:48:33', '2019-03-27 13:48:33', '公众号订阅状态', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (27, 'response_type', '回复', '2019-03-28 21:29:21', '2019-03-28 21:29:21', '微信消息是否已回复', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (28, 'param_type', '参数配置', '2019-04-29 18:20:47', '2019-04-29 18:20:47', '检索、原文、报表、安全、文档、消息、其他', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (29, 'tenant_status_type', '租户状态', '2019-05-15 16:31:08', '2019-05-15 16:31:08', '租户状态', '1', '0', 2);
INSERT INTO `sys_dict` VALUES (30, 'dict_type', '字典类型', '2019-05-16 14:16:20', '2019-05-16 14:20:16', '系统类不能修改', '1', '0', 2);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序（升序）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 1, '9', '异常', 'log_type', '日志异常', 1, '2019-03-19 11:08:59', '2019-03-25 12:49:13', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (2, 1, '0', '正常', 'log_type', '日志正常', 0, '2019-03-19 11:09:17', '2019-03-25 12:49:18', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (3, 2, 'WX', '微信', 'social_type', '微信登录', 0, '2019-03-19 11:10:02', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (4, 2, 'QQ', 'QQ', 'social_type', 'QQ登录', 1, '2019-03-19 11:10:14', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (5, 3, '0', '未提交', 'leave_status', '未提交', 0, '2019-03-19 11:18:34', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (6, 3, '1', '审批中', 'leave_status', '审批中', 1, '2019-03-19 11:18:45', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (7, 3, '2', '完成', 'leave_status', '完成', 2, '2019-03-19 11:19:02', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (8, 3, '9', '驳回', 'leave_status', '驳回', 9, '2019-03-19 11:19:20', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (9, 4, '1', 'java类', 'job_type', 'java类', 1, '2019-03-19 11:22:37', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (10, 4, '2', 'spring bean', 'job_type', 'spring bean容器实例', 2, '2019-03-19 11:23:05', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (11, 4, '9', '其他', 'job_type', '其他类型', 9, '2019-03-19 11:23:31', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (12, 4, '3', 'Rest 调用', 'job_type', 'Rest 调用', 3, '2019-03-19 11:23:57', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (13, 4, '4', 'jar', 'job_type', 'jar类型', 4, '2019-03-19 11:24:20', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (14, 5, '1', '未发布', 'job_status', '未发布', 1, '2019-03-19 11:25:18', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (15, 5, '2', '运行中', 'job_status', '运行中', 2, '2019-03-19 11:25:31', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (16, 5, '3', '暂停', 'job_status', '暂停', 3, '2019-03-19 11:25:42', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (17, 6, '0', '正常', 'job_execute_status', '正常', 0, '2019-03-19 11:26:27', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (18, 6, '1', '异常', 'job_execute_status', '异常', 1, '2019-03-19 11:26:41', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (19, 7, '1', '错失周期立即执行', 'misfire_policy', '错失周期立即执行', 1, '2019-03-19 11:27:45', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (20, 7, '2', '错失周期执行一次', 'misfire_policy', '错失周期执行一次', 2, '2019-03-19 11:27:57', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (21, 7, '3', '下周期执行', 'misfire_policy', '下周期执行', 3, '2019-03-19 11:28:08', '2019-03-25 12:49:36', '', '0', 1);
INSERT INTO `sys_dict_item` VALUES (22, 8, '1', '男', 'gender', '微信-男', 0, '2019-03-27 13:45:13', '2019-03-27 13:45:13', '微信-男', '0', 1);
INSERT INTO `sys_dict_item` VALUES (23, 8, '2', '女', 'gender', '女-微信', 1, '2019-03-27 13:45:34', '2019-03-27 13:45:34', '女-微信', '0', 1);
INSERT INTO `sys_dict_item` VALUES (24, 8, '0', '未知', 'gender', 'x性别未知', 3, '2019-03-27 13:45:57', '2019-03-27 13:45:57', 'x性别未知', '0', 1);
INSERT INTO `sys_dict_item` VALUES (25, 9, '0', '未关注', 'subscribe', '公众号-未关注', 0, '2019-03-27 13:49:07', '2019-03-27 13:49:07', '公众号-未关注', '0', 1);
INSERT INTO `sys_dict_item` VALUES (26, 9, '1', '已关注', 'subscribe', '公众号-已关注', 1, '2019-03-27 13:49:26', '2019-03-27 13:49:26', '公众号-已关注', '0', 1);
INSERT INTO `sys_dict_item` VALUES (27, 10, '0', '未回复', 'response_type', '微信消息-未回复', 0, '2019-03-28 21:29:47', '2019-03-28 21:29:47', '微信消息-未回复', '0', 1);
INSERT INTO `sys_dict_item` VALUES (28, 10, '1', '已回复', 'response_type', '微信消息-已回复', 1, '2019-03-28 21:30:08', '2019-03-28 21:30:08', '微信消息-已回复', '0', 1);
INSERT INTO `sys_dict_item` VALUES (29, 11, '1', '检索', 'param_type', '检索', 0, '2019-04-29 18:22:17', '2019-04-29 18:22:17', '检索', '0', 1);
INSERT INTO `sys_dict_item` VALUES (30, 11, '2', '原文', 'param_type', '原文', 0, '2019-04-29 18:22:27', '2019-04-29 18:22:27', '原文', '0', 1);
INSERT INTO `sys_dict_item` VALUES (31, 11, '3', '报表', 'param_type', '报表', 0, '2019-04-29 18:22:36', '2019-04-29 18:22:36', '报表', '0', 1);
INSERT INTO `sys_dict_item` VALUES (32, 11, '4', '安全', 'param_type', '安全', 0, '2019-04-29 18:22:46', '2019-04-29 18:22:46', '安全', '0', 1);
INSERT INTO `sys_dict_item` VALUES (33, 11, '5', '文档', 'param_type', '文档', 0, '2019-04-29 18:22:56', '2019-04-29 18:22:56', '文档', '0', 1);
INSERT INTO `sys_dict_item` VALUES (34, 11, '6', '消息', 'param_type', '消息', 0, '2019-04-29 18:23:05', '2019-04-29 18:23:05', '消息', '0', 1);
INSERT INTO `sys_dict_item` VALUES (35, 11, '9', '其他', 'param_type', '其他', 0, '2019-04-29 18:23:16', '2019-04-29 18:23:16', '其他', '0', 1);
INSERT INTO `sys_dict_item` VALUES (36, 11, '0', '默认', 'param_type', '默认', 0, '2019-04-29 18:23:30', '2019-04-29 18:23:30', '默认', '0', 1);
INSERT INTO `sys_dict_item` VALUES (37, 12, '0', '正常', 'status_type', '状态正常', 0, '2019-05-15 16:31:34', '2019-05-16 22:30:46', '状态正常', '0', 1);
INSERT INTO `sys_dict_item` VALUES (38, 12, '9', '冻结', 'status_type', '状态冻结', 1, '2019-05-15 16:31:56', '2019-05-16 22:30:50', '状态冻结', '0', 1);
INSERT INTO `sys_dict_item` VALUES (39, 13, '1', '系统类', 'dict_type', '系统类字典', 0, '2019-05-16 14:20:40', '2019-05-16 14:20:40', '不能修改删除', '0', 1);
INSERT INTO `sys_dict_item` VALUES (40, 13, '0', '业务类', 'dict_type', '业务类字典', 0, '2019-05-16 14:20:59', '2019-05-16 14:20:59', '可以修改', '0', 1);
INSERT INTO `sys_dict_item` VALUES (41, 14, '0', '正常', 'channel_status', '支付渠道状态正常', 0, '2019-05-30 16:16:51', '2019-05-30 16:16:51', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (42, 14, '1', '冻结', 'channel_status', '支付渠道冻结', 0, '2019-05-30 16:17:08', '2019-05-30 16:17:08', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (43, 15, 'ALIPAY_WAP', '支付宝wap支付', 'channel_id', '支付宝扫码支付', 0, '2019-05-30 19:03:16', '2019-06-18 13:51:42', '支付宝wap支付', '0', 1);
INSERT INTO `sys_dict_item` VALUES (44, 15, 'WEIXIN_MP', '微信公众号支付', 'channel_id', '微信公众号支付', 1, '2019-05-30 19:08:08', '2019-06-18 13:51:53', '微信公众号支付', '0', 1);
INSERT INTO `sys_dict_item` VALUES (45, 16, '1', '支付成功', 'order_status', '支付成功', 1, '2019-06-27 08:18:26', '2019-06-27 08:18:26', '订单支付成功', '0', 1);
INSERT INTO `sys_dict_item` VALUES (46, 16, '2', '支付完成', 'order_status', '订单支付完成', 2, '2019-06-27 08:18:44', '2019-06-27 08:18:44', '订单支付完成', '0', 1);
INSERT INTO `sys_dict_item` VALUES (47, 16, '0', '待支付', 'order_status', '订单待支付', 0, '2019-06-27 08:19:02', '2019-06-27 08:19:02', '订单待支付', '0', 1);
INSERT INTO `sys_dict_item` VALUES (48, 16, '-1', '支付失败', 'order_status', '订单支付失败', 3, '2019-06-27 08:19:37', '2019-06-27 08:19:37', '订单支付失败', '0', 1);
INSERT INTO `sys_dict_item` VALUES (49, 2, 'GITEE', '码云', 'social_type', '码云', 2, '2019-06-28 09:59:12', '2019-06-28 09:59:12', '码云', '0', 1);
INSERT INTO `sys_dict_item` VALUES (50, 2, 'OSC', '开源中国', 'social_type', '开源中国登录', 0, '2019-06-28 10:04:32', '2019-06-28 10:04:32', 'http://gitee.huaxiadaowei.com/#/authredirect', '0', 1);
INSERT INTO `sys_dict_item` VALUES (51, 17, 'password', '密码模式', 'grant_types', '支持oauth密码模式', 0, '2019-08-13 07:35:28', '2019-08-13 07:35:28', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (52, 17, 'authorization_code', '授权码模式', 'grant_types', 'oauth2 授权码模式', 1, '2019-08-13 07:36:07', '2019-08-13 07:36:07', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (53, 17, 'client_credentials', '客户端模式', 'grant_types', 'oauth2 客户端模式', 2, '2019-08-13 07:36:30', '2019-08-13 07:36:30', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (54, 17, 'refresh_token', '刷新模式', 'grant_types', 'oauth2 刷新token', 3, '2019-08-13 07:36:54', '2019-08-13 07:36:54', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (55, 17, 'implicit', '简化模式', 'grant_types', 'oauth2 简化模式', 4, '2019-08-13 07:39:32', '2019-08-13 07:39:32', NULL, '0', 1);
INSERT INTO `sys_dict_item` VALUES (56, 18, '9', '异常', 'log_type', '日志异常', 1, '2019-03-19 11:08:59', '2019-03-25 12:49:13', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (57, 18, '0', '正常', 'log_type', '日志正常', 0, '2019-03-19 11:09:17', '2019-03-25 12:49:18', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (58, 19, 'WX', '微信', 'social_type', '微信登录', 0, '2019-03-19 11:10:02', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (59, 19, 'QQ', 'QQ', 'social_type', 'QQ登录', 1, '2019-03-19 11:10:14', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (60, 19, 'GITEE', '码云', 'social_type', '码云', 2, '2019-06-28 09:59:12', '2019-06-28 09:59:12', '码云', '0', 2);
INSERT INTO `sys_dict_item` VALUES (61, 19, 'OSC', '开源中国', 'social_type', '开源中国登录', 0, '2019-06-28 10:04:32', '2019-06-28 10:04:32', 'http://gitee.huaxiadaowei.com/#/authredirect', '0', 2);
INSERT INTO `sys_dict_item` VALUES (62, 20, '0', '未提交', 'leave_status', '未提交', 0, '2019-03-19 11:18:34', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (63, 20, '1', '审批中', 'leave_status', '审批中', 1, '2019-03-19 11:18:45', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (64, 20, '2', '完成', 'leave_status', '完成', 2, '2019-03-19 11:19:02', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (65, 20, '9', '驳回', 'leave_status', '驳回', 9, '2019-03-19 11:19:20', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (66, 21, '1', 'java类', 'job_type', 'java类', 1, '2019-03-19 11:22:37', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (67, 21, '2', 'spring bean', 'job_type', 'spring bean容器实例', 2, '2019-03-19 11:23:05', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (68, 21, '9', '其他', 'job_type', '其他类型', 9, '2019-03-19 11:23:31', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (69, 21, '3', 'Rest 调用', 'job_type', 'Rest 调用', 3, '2019-03-19 11:23:57', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (70, 21, '4', 'jar', 'job_type', 'jar类型', 4, '2019-03-19 11:24:20', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (71, 22, '1', '未发布', 'job_status', '未发布', 1, '2019-03-19 11:25:18', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (72, 22, '2', '运行中', 'job_status', '运行中', 2, '2019-03-19 11:25:31', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (73, 22, '3', '暂停', 'job_status', '暂停', 3, '2019-03-19 11:25:42', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (74, 23, '0', '正常', 'job_execute_status', '正常', 0, '2019-03-19 11:26:27', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (75, 23, '1', '异常', 'job_execute_status', '异常', 1, '2019-03-19 11:26:41', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (76, 24, '1', '错失周期立即执行', 'misfire_policy', '错失周期立即执行', 1, '2019-03-19 11:27:45', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (77, 24, '2', '错失周期执行一次', 'misfire_policy', '错失周期执行一次', 2, '2019-03-19 11:27:57', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (78, 24, '3', '下周期执行', 'misfire_policy', '下周期执行', 3, '2019-03-19 11:28:08', '2019-03-25 12:49:36', NULL, '0', 2);
INSERT INTO `sys_dict_item` VALUES (79, 25, '1', '男', 'gender', '微信-男', 0, '2019-03-27 13:45:13', '2019-03-27 13:45:13', '微信-男', '0', 2);
INSERT INTO `sys_dict_item` VALUES (80, 25, '2', '女', 'gender', '女-微信', 1, '2019-03-27 13:45:34', '2019-03-27 13:45:34', '女-微信', '0', 2);
INSERT INTO `sys_dict_item` VALUES (81, 25, '0', '未知', 'gender', 'x性别未知', 3, '2019-03-27 13:45:57', '2019-03-27 13:45:57', 'x性别未知', '0', 2);
INSERT INTO `sys_dict_item` VALUES (82, 26, '0', '未关注', 'subscribe', '公众号-未关注', 0, '2019-03-27 13:49:07', '2019-03-27 13:49:07', '公众号-未关注', '0', 2);
INSERT INTO `sys_dict_item` VALUES (83, 26, '1', '已关注', 'subscribe', '公众号-已关注', 1, '2019-03-27 13:49:26', '2019-03-27 13:49:26', '公众号-已关注', '0', 2);
INSERT INTO `sys_dict_item` VALUES (84, 27, '0', '未回复', 'response_type', '微信消息-未回复', 0, '2019-03-28 21:29:47', '2019-03-28 21:29:47', '微信消息-未回复', '0', 2);
INSERT INTO `sys_dict_item` VALUES (85, 27, '1', '已回复', 'response_type', '微信消息-已回复', 1, '2019-03-28 21:30:08', '2019-03-28 21:30:08', '微信消息-已回复', '0', 2);
INSERT INTO `sys_dict_item` VALUES (86, 28, '1', '检索', 'param_type', '检索', 0, '2019-04-29 18:22:17', '2019-04-29 18:22:17', '检索', '0', 2);
INSERT INTO `sys_dict_item` VALUES (87, 28, '2', '原文', 'param_type', '原文', 0, '2019-04-29 18:22:27', '2019-04-29 18:22:27', '原文', '0', 2);
INSERT INTO `sys_dict_item` VALUES (88, 28, '3', '报表', 'param_type', '报表', 0, '2019-04-29 18:22:36', '2019-04-29 18:22:36', '报表', '0', 2);
INSERT INTO `sys_dict_item` VALUES (89, 28, '4', '安全', 'param_type', '安全', 0, '2019-04-29 18:22:46', '2019-04-29 18:22:46', '安全', '0', 2);
INSERT INTO `sys_dict_item` VALUES (90, 28, '5', '文档', 'param_type', '文档', 0, '2019-04-29 18:22:56', '2019-04-29 18:22:56', '文档', '0', 2);
INSERT INTO `sys_dict_item` VALUES (91, 28, '6', '消息', 'param_type', '消息', 0, '2019-04-29 18:23:05', '2019-04-29 18:23:05', '消息', '0', 2);
INSERT INTO `sys_dict_item` VALUES (92, 28, '9', '其他', 'param_type', '其他', 0, '2019-04-29 18:23:16', '2019-04-29 18:23:16', '其他', '0', 2);
INSERT INTO `sys_dict_item` VALUES (93, 28, '0', '默认', 'param_type', '默认', 0, '2019-04-29 18:23:30', '2019-04-29 18:23:30', '默认', '0', 2);
INSERT INTO `sys_dict_item` VALUES (94, 30, '1', '系统类', 'dict_type', '系统类字典', 0, '2019-05-16 14:20:40', '2019-05-16 14:20:40', '不能修改删除', '0', 2);
INSERT INTO `sys_dict_item` VALUES (95, 30, '0', '业务类', 'dict_type', '业务类字典', 0, '2019-05-16 14:20:59', '2019-05-16 14:20:59', '可以修改', '0', 2);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bucket_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `original` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_size` bigint(50) NULL DEFAULT NULL COMMENT '文件大小',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (2, 'a9d91dce02de40739d2ea62897c579ef.jpg', 'laputa', 'TIM图片20191208131752.jpg', 'jpg', 43892, 'admin', '2020-01-16 14:59:35', NULL, '2020-01-16 14:59:35', '0', 1);
INSERT INTO `sys_file` VALUES (3, '5eeca7fae5174cfeae525a35f749cac2.jpg', 'laputa', 'TIM图片20191208131752.jpg', 'jpg', 43892, 'admin', '2020-01-17 16:02:21', NULL, '2020-01-17 16:02:21', '0', 1);
INSERT INTO `sys_file` VALUES (4, '762617e37e634c4490bd6a2256479084.jpg', 'laputa', '5eeca7fae5174cfeae525a35f749cac2.jpg', 'jpg', 43892, 'admin', '2020-02-18 13:17:37', NULL, '2020-02-18 13:17:37', '0', 1);
INSERT INTO `sys_file` VALUES (5, '7b6e6d7f3d1b45c7af23c3387fc24282.docx', 'laputa', 'ETEK物料编码(V1.4)20191107.docx', 'docx', 30278, 'admin', '2020-02-18 13:21:04', NULL, '2020-02-18 13:21:04', '0', 1);
INSERT INTO `sys_file` VALUES (6, 'c797976947364ae49d540112c3241b70.zip', 'laputa', 'doc_vault.zip', 'zip', 9842, 'admin', '2020-02-18 13:21:40', NULL, '2020-02-18 13:21:40', '0', 1);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tenant_id` int(11) NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, '0', '修改个人信息', 'pig', 'admin', '2020-01-16 10:10:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '214', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (2, '0', '修改数据源表', 'pig', 'admin', '2020-01-16 10:24:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/dsconf', 'PUT', '', '436', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (3, '0', '新增定时任务', 'pig', 'admin', '2020-01-16 12:26:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-job', 'POST', '', '136', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (4, '0', '启动定时任务', 'pig', 'admin', '2020-01-16 12:26:51', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-job/start-job/1', 'POST', '', '615', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (5, '0', '暂停定时任务', 'pig', 'admin', '2020-01-16 12:27:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-job/shutdown-job/1', 'POST', '', '553', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (6, '0', '立刻执行定时任务', 'pig', 'admin', '2020-01-16 12:28:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-job/run-job/1', 'POST', '', '423', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (7, '0', '删除定时任务', 'pig', 'admin', '2020-01-16 12:28:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-job/1', 'DELETE', '', '698', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (8, '0', '修改个人信息', 'pig', 'admin', '2020-01-16 13:48:23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '183', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (9, '0', '修改个人信息', 'pig', 'admin', '2020-01-16 14:47:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '171', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (10, '0', '修改个人信息', 'pig', 'admin', '2020-01-16 14:57:42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '317', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (11, '0', '修改个人信息', 'pig', 'admin', '2020-01-16 14:59:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '179', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (12, '0', '删除文件管理', 'pig', 'admin', '2020-01-16 18:54:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/sys-file/1', 'DELETE', '', '316', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (13, '0', '修改个人信息', 'laputa', 'admin', '2020-01-17 16:02:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user/edit', 'PUT', '', '207', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (14, '0', '添加用户', 'laputa', 'admin', '2020-01-19 09:08:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'POST', '', '422', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (15, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 09:23:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '168', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (16, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 09:23:44', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '123', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (17, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:23:17', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '269', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (18, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:23:25', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '135', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (19, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:38:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '165', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (20, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:39:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '155', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (21, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:40:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '175', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (22, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:41:20', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '123', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (23, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:41:48', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '166', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (24, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:42:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '133', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (25, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:42:43', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '128', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (26, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:43:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '123', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (27, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:43:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '137', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (28, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:43:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '163', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (29, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:44:05', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '139', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (30, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:44:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '141', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (31, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:45:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '130', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (32, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 10:45:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '88', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (33, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 10:46:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '84', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (34, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 10:47:09', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '83', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (35, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 10:47:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '86', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (36, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:48:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '126', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (37, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:48:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '134', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (38, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:49:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '133', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (39, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:50:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '158', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (40, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:50:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '125', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (41, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:50:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '131', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (42, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:51:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '132', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (43, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:51:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '129', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (44, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:51:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '125', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (45, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:52:04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '135', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (46, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:52:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '129', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (47, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:53:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '171', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (48, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:53:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '189', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (49, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:54:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '128', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (50, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:55:24', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '180', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (51, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:55:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '151', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (52, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:56:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '138', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (53, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:57:02', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '125', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (54, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 10:57:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '120', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (55, '0', '更新角色菜单', 'laputa', 'admin', '2020-01-19 11:39:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C3630%2C3600%2C3601%2C3620%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C5000%2C5200%2C5100%2C5110%2C5120%2C5130%2C5300%2C5310%2C5320%2C5330%2C5400%2C5410%2C5420%2C5430%2C5500%2C5510%2C5520%2C5530%2C6000%2C6400%2C6401%2C6402%2C6500%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6305%2C6303%2C6304%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C%5D', '5839', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (56, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:07:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '94', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (57, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:08:26', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '174', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (58, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:08:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '130', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (59, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:09:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '158', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (60, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:09:41', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '211', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (61, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:09:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '129', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (62, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:11:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '86', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (63, '0', '删除菜单', 'laputa', 'admin', '2020-01-19 13:11:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu/10014', 'DELETE', '', '372', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (64, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:12:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '86', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (65, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:13:40', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '91', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (66, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:16:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '99', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (67, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:20:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '134', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (68, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:20:56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '157', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (69, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:21:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '139', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (70, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:21:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '161', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (71, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:21:55', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '130', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (72, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 13:22:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '128', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (73, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:23:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '104', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (74, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:33:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '189', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (75, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:34:19', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '88', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (76, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:35:59', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '127', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (77, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:37:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '116', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (78, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:38:10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '87', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (79, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:39:33', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '86', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (80, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:40:34', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '87', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (81, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:43:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '127', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (82, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:50:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '144', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (83, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:51:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '90', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (84, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:54:05', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '134', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (85, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 13:58:11', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '125', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (86, '0', '更新角色菜单', 'laputa', 'admin', '2020-01-19 14:00:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C3630%2C3600%2C3601%2C3620%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C10013%2C10015%2C10016%2C10019%2C10020%2C10017%2C10021%2C10022%2C10023%2C10024%2C10025%2C10026%2C10027%2C10018%2C10028%2C10029%2C10030%2C10031%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C5000%2C5200%2C5100%2C5110%2C5120%2C5130%2C5300%2C5310%2C5320%2C5330%2C5400%2C5410%2C5420%2C5430%2C5500%2C5510%2C5520%2C5530%2C6000%2C6400%2C6401%2C6402%2C6500%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6305%2C6303%2C6304%2C%5D', '6483', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (87, '0', '添加用户', 'laputa', 'admin', '2020-01-19 14:06:28', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'POST', '', '658', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (88, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 14:14:45', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '177', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (89, '0', '更新菜单', 'laputa', 'admin', '2020-01-19 14:22:52', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '209', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (90, '0', '更新角色菜单', 'laputa', 'admin', '2020-01-19 14:37:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C10013%2C10015%2C10016%2C10019%2C10020%2C10017%2C10021%2C10022%2C10023%2C10024%2C10025%2C10026%2C10027%2C10018%2C10028%2C10029%2C10030%2C10031%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C3000%5D', '4180', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (91, '0', '新增菜单', 'laputa', 'admin', '2020-01-19 16:08:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '106', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (92, '0', '更新角色菜单', 'laputa', 'admin', '2020-01-19 16:09:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C10013%2C10015%2C10016%2C10019%2C10020%2C10017%2C10021%2C10022%2C10023%2C10024%2C10025%2C10026%2C10027%2C10018%2C10028%2C10029%2C10030%2C10031%2C10032%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C3000%5D', '8259', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (93, '0', '更新菜单', 'laputa', 'admin', '2020-01-20 10:01:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'PUT', '', '179', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (94, '0', '新增菜单', 'laputa', 'admin', '2020-01-20 10:05:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/menu', 'POST', '', '410', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (95, '0', '更新角色菜单', 'laputa', 'admin', '2020-01-20 10:07:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C10033%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C10013%2C10015%2C10016%2C10019%2C10020%2C10017%2C10021%2C10022%2C10023%2C10024%2C10025%2C10026%2C10027%2C10018%2C10028%2C10029%2C10030%2C10031%2C10032%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C3000%5D', '7125', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (96, '0', '修改数据源表', 'laputa', 'admin', '2020-01-20 14:32:47', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/dsconf', 'PUT', '', '479', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (97, '0', '新增数据源表', 'laputa', 'admin', '2020-01-20 14:35:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/dsconf', 'POST', '', '453', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (98, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:05:15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '462', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (99, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:08:16', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '432', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (100, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:36:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '504', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (101, '0', '添加用户', 'laputa', 'admin', '2020-01-21 12:41:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'POST', '', '341', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (102, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:41:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '440', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (103, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:54:35', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '410', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (104, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:54:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '692', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (105, '0', '添加角色', 'laputa', 'admin', '2020-01-21 12:56:32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role', 'POST', '', '115', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (106, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:56:50', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '348', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (107, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 12:59:55', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '405', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (108, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:00:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '404', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (109, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:00:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '361', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (110, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:01:31', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '347', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (111, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:01:37', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '381', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (112, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:09:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '394', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (113, '0', '更新用户信息', 'laputa', 'admin', '2020-01-21 13:09:44', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/user', 'PUT', '', '616', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (114, '0', '添加角色', 'laputa', 'admin', '2020-01-21 13:10:29', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role', 'POST', '', '87', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (115, '0', '添加角色', 'laputa', 'admin', '2020-01-21 13:11:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/role', 'POST', '', '81', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (116, '0', '新增数据源表', 'laputa', 'admin', '2020-02-12 09:49:58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/dsconf', 'POST', '', '551', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (117, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:06:58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '771', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (118, '0', '更新菜单', 'laputa', 'admin', '2020-02-12 11:07:30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'PUT', '', '1036', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (119, '0', '更新菜单', 'laputa', 'admin', '2020-02-12 11:07:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'PUT', '', '615', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (120, '0', '更新菜单', 'laputa', 'admin', '2020-02-12 11:08:00', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'PUT', '', '817', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (121, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:12:27', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '563', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (122, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:13:22', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '518', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (123, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:14:38', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '672', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (124, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:21:57', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '104', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (125, '0', '更新菜单', 'laputa', 'admin', '2020-02-12 11:22:12', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'PUT', '', '152', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (126, '0', '新增菜单', 'laputa', 'admin', '2020-02-12 11:38:13', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'POST', '', '116', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (127, '0', '更新角色菜单', 'laputa', 'admin', '2020-02-12 11:38:36', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1500%2C1501%2C1502%2C1503%2C10009%2C10010%2C10011%2C10012%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C10000%2C10001%2C2210%2C2211%2C2212%2C2213%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C2870%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3110%2C3200%2C3500%2C3300%2C3400%2C10033%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C10013%2C10015%2C10016%2C10019%2C10020%2C10017%2C10021%2C10022%2C10023%2C10024%2C10025%2C10026%2C10027%2C10018%2C10028%2C10029%2C10030%2C10031%2C10032%2C10006%2C10007%2C2300%2C10008%2C10002%2C10003%2C10004%2C10005%2C10034%2C10035%2C10036%2C10037%2C10038%2C10039%2C3000%5D', '5103', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (128, '0', '更新菜单', 'laputa', 'admin', '2020-02-12 16:46:01', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36', '/menu', 'PUT', '', '205', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (129, '0', '修改路由', 'laputa', 'admin', '2020-02-18 09:31:54', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '/route', 'PUT', '', '1691', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (130, '0', '修改路由', 'laputa', 'admin', '2020-02-18 09:35:49', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '/route', 'PUT', '', '1531', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (131, '0', '修改路由', 'laputa', 'admin', '2020-02-18 09:36:08', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '/route', 'PUT', '', '1630', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (132, '0', '修改路由', 'laputa', 'admin', '2020-02-18 09:42:06', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '/route', 'PUT', '', '1643', '0', NULL, 1);
INSERT INTO `sys_log` VALUES (133, '0', '修改路由', 'laputa', 'admin', '2020-02-19 10:44:46', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36', '/route/update', 'PUT', '', '15747', '0', NULL, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序值',
  `keep_alive` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '基础管理', NULL, '/user', -1, 'tachometer', 0, '1', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0');
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, '/admin/user/index', 1000, 'user-o', 1, '1', '0', '2017-11-02 22:24:37', '2019-06-24 14:36:36', '0');
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys_user_add', NULL, 1100, NULL, NULL, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0');
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys_user_edit', NULL, 1100, NULL, NULL, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0');
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys_user_del', NULL, 1100, NULL, NULL, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0');
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, '/admin/menu/index', 1000, 'navicon', 2, '0', '0', '2017-11-08 09:57:27', '2019-06-24 14:42:07', '0');
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys_menu_add', NULL, 1200, NULL, NULL, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0');
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys_menu_edit', NULL, 1200, NULL, NULL, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0');
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys_menu_del', NULL, 1200, NULL, NULL, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0');
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, '/admin/role/index', 1000, 'street-view', 3, '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0');
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys_role_add', NULL, 1300, NULL, NULL, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0');
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys_role_edit', NULL, 1300, NULL, NULL, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0');
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys_role_del', NULL, 1300, NULL, NULL, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0');
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys_role_perm', NULL, 1300, NULL, NULL, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0');
INSERT INTO `sys_menu` VALUES (1400, '组织管理', NULL, '/admin/dept/index', 1000, 'address-card-o', 4, '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0');
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys_dept_add', NULL, 1400, NULL, NULL, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0');
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys_dept_edit', NULL, 1400, NULL, NULL, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0');
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys_dept_del', NULL, 1400, NULL, NULL, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0');
INSERT INTO `sys_menu` VALUES (1500, '租户管理', '', '/admin/tenant/index', 1000, 'user-circle-o', 5, '1', '0', '2018-01-20 13:17:19', '2019-05-17 15:36:11', '0');
INSERT INTO `sys_menu` VALUES (1501, '租户新增', 'admin_systenant_add', NULL, 1500, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:36:34', '0');
INSERT INTO `sys_menu` VALUES (1502, '租户修改', 'admin_systenant_edit', NULL, 1500, '1', 1, '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:36:53', '0');
INSERT INTO `sys_menu` VALUES (1503, '租户删除', 'admin_systenant_del', NULL, 1500, '1', 2, '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:37:00', '0');
INSERT INTO `sys_menu` VALUES (2000, '系统管理', NULL, '/admin', -1, 'cogs', 1, '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0');
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, '/admin/log/index', 2000, 'newspaper-o', 5, '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0');
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys_log_del', NULL, 2100, NULL, NULL, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0');
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, '/admin/dict/index', 2000, 'book', 6, '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0');
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys_dict_del', NULL, 2200, NULL, NULL, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0');
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys_dict_add', NULL, 2200, NULL, NULL, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0');
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys_dict_edit', NULL, 2200, NULL, NULL, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0');
INSERT INTO `sys_menu` VALUES (2210, '参数管理', NULL, '/admin/param/index', 2000, 'cog', 7, '1', '0', '2019-04-29 22:16:50', '2019-06-24 14:52:00', '0');
INSERT INTO `sys_menu` VALUES (2211, '参数新增', 'admin_syspublicparam_add', NULL, 2210, NULL, 1, '0', '1', '2019-04-29 22:17:36', NULL, '0');
INSERT INTO `sys_menu` VALUES (2212, '参数删除', 'admin_syspublicparam_del', NULL, 2210, NULL, 1, '0', '1', '2019-04-29 22:17:55', NULL, '0');
INSERT INTO `sys_menu` VALUES (2213, '参数编辑', 'admin_syspublicparam_edit', NULL, 2210, NULL, 1, '0', '1', '2019-04-29 22:18:14', '2019-04-29 22:19:25', '0');
INSERT INTO `sys_menu` VALUES (2300, '代码生成', '', '/gen/index', 10006, 'sign-language', 1, '0', '0', '2018-01-20 13:17:19', '2019-08-12 10:28:44', '0');
INSERT INTO `sys_menu` VALUES (2400, '终端管理', '', '/admin/client/index', 2000, 'object-group', 9, '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0');
INSERT INTO `sys_menu` VALUES (2401, '客户端新增', 'sys_client_add', NULL, 2400, '1', NULL, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:10:25', '0');
INSERT INTO `sys_menu` VALUES (2402, '客户端修改', 'sys_client_edit', NULL, 2400, NULL, NULL, '0', '1', '2018-05-15 21:37:06', '2018-09-28 09:10:27', '0');
INSERT INTO `sys_menu` VALUES (2403, '客户端删除', 'sys_client_del', NULL, 2400, NULL, NULL, '0', '1', '2018-05-15 21:39:16', '2018-09-28 09:10:30', '0');
INSERT INTO `sys_menu` VALUES (2500, '密钥管理', '', '/admin/social/index', 2000, 'key', 10, '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:41', '0');
INSERT INTO `sys_menu` VALUES (2501, '密钥新增', 'sys_social_details_add', NULL, 2500, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:52:18', '0');
INSERT INTO `sys_menu` VALUES (2502, '密钥修改', 'sys_social_details_edit', NULL, 2500, '1', 1, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:36', '0');
INSERT INTO `sys_menu` VALUES (2503, '密钥删除', 'sys_social_details_del', NULL, 2500, '1', 2, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:30', '0');
INSERT INTO `sys_menu` VALUES (2600, '令牌管理', NULL, '/admin/token/index', 2000, 'filter', 11, '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0');
INSERT INTO `sys_menu` VALUES (2601, '令牌删除', 'sys_token_del', NULL, 2600, NULL, 1, '0', '1', '2018-09-04 05:59:50', '2018-09-28 09:11:24', '0');
INSERT INTO `sys_menu` VALUES (2700, '动态路由', NULL, '/admin/route/index', 2000, 'code-fork', 12, '0', '0', '2018-09-04 05:58:41', '2019-06-24 15:14:28', '0');
INSERT INTO `sys_menu` VALUES (2800, '定时任务管理', '', '/daemon/job-manage/index', 2000, 'hourglass-half', 8, '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:14', '0');
INSERT INTO `sys_menu` VALUES (2810, '任务新增', 'job_sys_job_add', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:23', '0');
INSERT INTO `sys_menu` VALUES (2820, '任务修改', 'job_sys_job_edit', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:26', '0');
INSERT INTO `sys_menu` VALUES (2830, '任务删除', 'job_sys_job_del', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:30', '0');
INSERT INTO `sys_menu` VALUES (2840, '任务暂停', 'job_sys_job_shutdown_job', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:18', '0');
INSERT INTO `sys_menu` VALUES (2850, '任务开始', 'job_sys_job_start_job', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:35', '0');
INSERT INTO `sys_menu` VALUES (2860, '任务刷新', 'job_sys_job_refresh_job', NULL, 2800, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:39', '0');
INSERT INTO `sys_menu` VALUES (2870, '执行任务', 'job_sys_job_run_job', NULL, 2800, '1', 0, '0', '1', '2019-08-08 15:35:18', '2019-08-08 15:50:35', '0');
INSERT INTO `sys_menu` VALUES (3000, '系统监控', NULL, '/daemon', -1, 'bar-chart-o', 2, '1', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0');
INSERT INTO `sys_menu` VALUES (3100, '服务监控', NULL, '/governance/monitor/index', 3000, 'industry', 0, '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:54:05', '0');
INSERT INTO `sys_menu` VALUES (3110, '缓存监控', NULL, '/governance/redis/index', 3000, 'area-chart', 1, '1', '0', '2019-05-08 23:51:27', '2019-06-24 15:17:45', '0');
INSERT INTO `sys_menu` VALUES (3200, '接口文档', NULL, 'http://laputa-gateway:10000/swagger-ui.html', 3000, 'code', 1, '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:57:11', '0');
INSERT INTO `sys_menu` VALUES (3300, '事务监控', NULL, '/tx/index', 3000, 'laptop', 5, '0', '0', '2018-08-19 11:02:39', '2019-06-24 15:18:04', '0');
INSERT INTO `sys_menu` VALUES (3400, '在线事务', NULL, '/tx/model', 3000, 'hashtag', 6, '0', '0', '2018-08-19 11:32:04', '2019-06-24 15:18:13', '0');
INSERT INTO `sys_menu` VALUES (3500, '文档扩展', NULL, 'http://127.0.0.1:10000/doc.html', 3000, 'file-code-o', 2, '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:57:42', '0');
INSERT INTO `sys_menu` VALUES (3600, '任务轨迹', '', '/daemon/status-trace-log/index', 3000, 'icon-guiji', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:18:41', '0');
INSERT INTO `sys_menu` VALUES (3601, '删除轨迹', 'daemon_status_trace_log_del', NULL, 3600, '1', 2, '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:31:06', '0');
INSERT INTO `sys_menu` VALUES (3620, 'Quartz日志', '', '/daemon/job-log/index', 3000, 'icon-gtsquanjushiwufuwuGTS', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:18:54', '0');
INSERT INTO `sys_menu` VALUES (3630, '任务日志', '', '/daemon/execution-log/index', 3000, 'icon-wendang', 7, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:19:07', '0');
INSERT INTO `sys_menu` VALUES (3631, '删除日志', 'daemon_execution_log_del', NULL, 3900, '1', 2, '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:30:45', '0');
INSERT INTO `sys_menu` VALUES (3700, '注册配置', NULL, '', 3000, 'icon-line', 10, '0', '0', '2018-01-25 11:08:52', '2019-06-24 15:35:10', '1');
INSERT INTO `sys_menu` VALUES (4000, '流程管理', NULL, '/activti', -1, 'refresh', 3, '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0');
INSERT INTO `sys_menu` VALUES (4100, '模型管理', NULL, '/activiti/index', 4000, 'inbox', 1, '0', '0', '2018-09-26 01:39:07', '2019-06-24 15:20:00', '0');
INSERT INTO `sys_menu` VALUES (4101, '模型管理', 'act_model_manage', NULL, 4100, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4200, '流程管理', '/activiti/process', '/activiti/process', 4000, 'history', 2, '0', '0', '2018-09-26 06:41:05', '2019-06-24 08:31:07', '0');
INSERT INTO `sys_menu` VALUES (4201, '流程管理', 'act_process_manage', NULL, 4200, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4300, '审批管理', '/activiti/leave', '/activiti/leave', 4000, 'gg', 3, '0', '0', '2018-01-20 13:17:19', '2019-06-24 08:31:11', '0');
INSERT INTO `sys_menu` VALUES (4301, '请假新增', 'act_leavebill_add', NULL, 4300, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (4302, '请假修改', 'act_leavebill_edit', NULL, 4300, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0');
INSERT INTO `sys_menu` VALUES (4303, '请假删除', 'act_leavebill_del', NULL, 4300, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0');
INSERT INTO `sys_menu` VALUES (4400, '待办任务', '/activiti/task', '/activiti/task', 4000, 'list-ol', 4, '0', '0', '2018-09-27 09:52:31', '2019-06-24 08:31:18', '0');
INSERT INTO `sys_menu` VALUES (4401, '流程管理', 'act_task_manage', NULL, 4400, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0');
INSERT INTO `sys_menu` VALUES (5000, '支付管理', NULL, '/pay', -1, 'paypal', 11, '1', '0', '2019-05-30 15:28:03', '2019-06-20 16:13:23', '0');
INSERT INTO `sys_menu` VALUES (5100, '渠道管理', NULL, '/pay/paychannel/index', 5000, 'icon-zhifuqudaoguanli', 1, '1', '0', '2019-05-30 15:32:17', '2019-05-30 19:43:27', '0');
INSERT INTO `sys_menu` VALUES (5110, '增加渠道', 'pay_paychannel_add', NULL, 5100, NULL, 1, '0', '1', '2019-05-30 15:46:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (5120, '编辑渠道', 'pay_paychannel_edit', NULL, 5100, NULL, 1, '0', '1', '2019-05-30 15:46:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (5130, '删除渠道', 'pay_paychannel_del', NULL, 5100, NULL, 1, '0', '1', '2019-05-30 15:47:08', NULL, '0');
INSERT INTO `sys_menu` VALUES (5200, '收银台', NULL, '/pay/cd/index', 5000, 'icon-shouyintai', 0, '1', '0', '2019-05-30 19:44:00', '2019-05-30 19:45:05', '0');
INSERT INTO `sys_menu` VALUES (5300, '商品订单', '', '/pay/goods/index', 5000, 'icon-dingdan', 2, '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:02:21', '0');
INSERT INTO `sys_menu` VALUES (5310, '商品订单新增', 'generator_paygoodsorder_add', NULL, 5300, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5320, '商品订单修改', 'generator_paygoodsorder_edit', NULL, 5300, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5330, '商品订单删除', 'generator_paygoodsorder_del', NULL, 5300, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5400, '支付订单', '', '/pay/orders/index', 5000, 'icon-zhifu', 3, '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:02:06', '0');
INSERT INTO `sys_menu` VALUES (5410, '支付订单新增', 'generator_paytradeorder_add', NULL, 5400, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5420, '支付订单修改', 'generator_paytradeorder_edit', NULL, 5400, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5430, '支付订单删除', 'generator_paytradeorder_del', NULL, 5400, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5500, '回调记录', '', '/pay/notify/index', 5000, 'icon-huitiao', 4, '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:01:49', '0');
INSERT INTO `sys_menu` VALUES (5510, '记录新增', 'generator_paynotifyrecord_add', NULL, 5500, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5520, '记录修改', 'generator_paynotifyrecord_edit', NULL, 5500, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (5530, '记录删除', 'generator_paynotifyrecord_del', NULL, 5500, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6000, '微信管理', NULL, '/mp', -1, 'weixin', 12, '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0');
INSERT INTO `sys_menu` VALUES (6100, '账号管理', '', '/mp/wxaccount/index', 6000, 'icon-weixincaidan', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:36', '0');
INSERT INTO `sys_menu` VALUES (6101, '公众号新增', 'mp_wxaccount_add', '', 6100, '1', 0, '0', '1', '2018-05-15 21:35:18', '2019-06-24 15:24:33', '0');
INSERT INTO `sys_menu` VALUES (6102, '公众号修改', 'mp_wxaccount_edit', NULL, 6100, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6103, '公众号删除', 'mp_wxaccount_del', NULL, 6100, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6200, '粉丝管理', '', '/mp/wxaccountfans/index', 6000, 'icon-fensiguanli', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:46', '0');
INSERT INTO `sys_menu` VALUES (6201, '粉丝新增', 'mp_wxaccountfans_add', NULL, 6200, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6202, '粉丝修改', 'mp_wxaccountfans_edit', NULL, 6200, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6203, '粉丝删除', 'mp_wxaccountfans_del', NULL, 6200, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6300, '消息管理', '', '/mp/wxfansmsg/index', 6000, 'icon-xiaoxiguanli', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:57', '0');
INSERT INTO `sys_menu` VALUES (6301, '消息新增', 'mp_wxfansmsg_add', NULL, 6300, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6302, '消息修改', 'mp_wxfansmsg_edit', NULL, 6300, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6303, '消息删除', 'mp_wxfansmsg_del', NULL, 6300, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6304, '消息回复', 'mp_wxfansmsgres_add', NULL, 6300, '1', 3, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (6305, '回复删除', 'mp_wxfansmsgres_del', NULL, 6300, NULL, 1, '0', '1', '2019-03-28 22:53:49', NULL, '0');
INSERT INTO `sys_menu` VALUES (6400, '菜单设置', NULL, '/mp/wxmenu/index', 6000, 'icon-anniu_weixincaidanlianjie', 6, '1', '0', '2019-03-29 15:20:12', '2019-06-24 15:25:07', '0');
INSERT INTO `sys_menu` VALUES (6401, '保存', 'mp_wxmenu_add', NULL, 6400, NULL, 1, '0', '1', '2019-03-29 15:43:22', '2019-03-29 15:43:30', '0');
INSERT INTO `sys_menu` VALUES (6402, '发布', 'mp_wxmenu_push', NULL, 6400, NULL, 1, '0', '1', '2019-03-29 15:43:54', NULL, '0');
INSERT INTO `sys_menu` VALUES (6500, '运营数据', NULL, '/mp/wxstatistics/index', 6000, 'icon-zhexiantu', 7, '1', '0', '2019-04-14 00:15:35', '2019-06-24 15:25:15', '0');
INSERT INTO `sys_menu` VALUES (10000, '文件管理', NULL, '/admin/file/index', 2000, 'file', 6, '1', '0', '2019-06-25 12:44:46', '2020-01-19 10:50:44', '0');
INSERT INTO `sys_menu` VALUES (10001, '删除文件', 'sys_file_del', NULL, 10000, NULL, 1, '0', '1', '2019-06-25 13:41:41', NULL, '0');
INSERT INTO `sys_menu` VALUES (10002, '表单管理', '', '/gen/form', 10006, 'calculator', 3, '0', '0', '2018-01-20 13:17:19', '2019-08-12 09:36:09', '0');
INSERT INTO `sys_menu` VALUES (10003, '表单新增', 'gen_form_add', NULL, 10002, '1', 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (10004, '表单修改', 'gen_form_edit', NULL, 10002, '1', 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (10005, '表单删除', 'gen_form_del', NULL, 10002, '1', 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `sys_menu` VALUES (10006, '开发平台', NULL, '/gen', -1, 'caret-square-o-down', 9, '1', '0', '2019-08-12 09:35:16', '2019-08-12 10:28:35', '0');
INSERT INTO `sys_menu` VALUES (10007, '数据源管理', NULL, '/gen/datasource', 10006, 'database', 0, '1', '0', '2019-08-12 09:42:11', '2019-08-12 10:33:30', '0');
INSERT INTO `sys_menu` VALUES (10008, '表单设计', NULL, '/gen/design', 10006, 'table', 2, '1', '0', '2019-08-16 10:08:56', '2020-01-19 13:09:41', '0');
INSERT INTO `sys_menu` VALUES (10009, '用户组管理', NULL, '/admin/group/index', 1000, 'users', 5, '1', '0', '2020-01-19 10:45:55', NULL, '0');
INSERT INTO `sys_menu` VALUES (10010, '用户组增加', 'admin_sysgroup_add', NULL, 10009, NULL, 1, '0', '1', '2020-01-19 10:46:47', NULL, '0');
INSERT INTO `sys_menu` VALUES (10011, '用户组修改', 'admin_sysgroup_edit', NULL, 10009, NULL, 1, '0', '1', '2020-01-19 10:47:09', NULL, '0');
INSERT INTO `sys_menu` VALUES (10012, '用户组删除', 'admin_sysgroup_del', NULL, 10009, NULL, 1, '0', '1', '2020-01-19 10:47:32', NULL, '0');
INSERT INTO `sys_menu` VALUES (10013, '文档管理', NULL, '/document', -1, 'file-text-o', 4, '1', '0', '2020-01-19 13:07:41', '2020-01-19 13:21:49', '0');
INSERT INTO `sys_menu` VALUES (10014, '产品管理', NULL, '/product', 10013, 'product-hunt', 9, '1', '0', '2020-01-19 13:11:10', '2020-01-19 13:11:30', '1');
INSERT INTO `sys_menu` VALUES (10015, '文档列表', NULL, '/document/index', 10013, 'align-justify', 1, '1', '0', '2020-01-19 13:12:14', NULL, '0');
INSERT INTO `sys_menu` VALUES (10016, '类目管理', NULL, '/document/catalog', 10013, 'folder-open-o', 2, '1', '0', '2020-01-19 13:13:40', NULL, '0');
INSERT INTO `sys_menu` VALUES (10017, '产品管理', NULL, '/product', -1, 'product-hunt', 5, '1', '0', '2020-01-19 13:16:32', '2020-01-19 13:21:55', '0');
INSERT INTO `sys_menu` VALUES (10018, '项目管理', NULL, '/project', -1, 'list', 6, '1', '0', '2020-01-19 13:20:14', '2020-01-19 13:22:00', '0');
INSERT INTO `sys_menu` VALUES (10019, '文档预览', NULL, '/document/previewer', 10013, 'file-picture-o', 3, '1', '0', '2020-01-19 13:23:01', NULL, '0');
INSERT INTO `sys_menu` VALUES (10020, '权限配置', NULL, '/document/authority', 10013, 'adn', 4, '1', '0', '2020-01-19 13:33:12', NULL, '0');
INSERT INTO `sys_menu` VALUES (10021, '产品列表', NULL, '/product/index', 10017, 'list-alt', 1, '1', '0', '2020-01-19 13:34:19', NULL, '0');
INSERT INTO `sys_menu` VALUES (10022, '配置管理', NULL, '/product/diagram', 10017, 'sitemap', 2, '1', '0', '2020-01-19 13:35:59', '2020-01-19 14:22:52', '0');
INSERT INTO `sys_menu` VALUES (10023, '结构管理', NULL, '/product/construct', 10017, 'file-powerpoint-o', 3, '1', '0', '2020-01-19 13:37:13', '2020-01-19 14:14:45', '0');
INSERT INTO `sys_menu` VALUES (10024, '工艺库管理', NULL, '/product/technology', 10017, 'bank', 4, '1', '0', '2020-01-19 13:38:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (10025, 'IP管理', NULL, '/product/ip', 10017, 'file-code-o', 5, '1', '0', '2020-01-19 13:39:33', NULL, '0');
INSERT INTO `sys_menu` VALUES (10026, '封装管理', NULL, '/product/package', 10017, 'microchip', 6, '1', '0', '2020-01-19 13:40:34', NULL, '0');
INSERT INTO `sys_menu` VALUES (10027, '供应商管理', NULL, '/product/supplier', 10017, 'shopping-cart', 7, '1', '0', '2020-01-19 13:43:13', NULL, '0');
INSERT INTO `sys_menu` VALUES (10028, '项目列表', NULL, '/project/list', 10018, 'cubes', 1, '1', '0', '2020-01-19 13:50:27', NULL, '0');
INSERT INTO `sys_menu` VALUES (10029, '项目查看', NULL, '/project/gantt', 10018, 'th-list', 2, '1', '0', '2020-01-19 13:51:49', NULL, '0');
INSERT INTO `sys_menu` VALUES (10030, '资源管理', NULL, '/project/resource', 10018, 'th', 3, '1', '0', '2020-01-19 13:54:04', NULL, '0');
INSERT INTO `sys_menu` VALUES (10031, '项目日志', NULL, '/project/log', 10018, 'inbox', 4, '1', '0', '2020-01-19 13:58:11', NULL, '0');
INSERT INTO `sys_menu` VALUES (10032, '创建项目', NULL, '/project/new', 10018, 'plus', 5, '1', '0', '2020-01-19 16:08:46', NULL, '0');
INSERT INTO `sys_menu` VALUES (10033, 'Sentinel监控', NULL, 'http://laputa-sentinel:5020/', 3000, 'cubes', 10, '1', '0', '2020-01-20 10:05:54', NULL, '0');
INSERT INTO `sys_menu` VALUES (10034, '邮件管理', NULL, '/mail', -1, 'inbox', 10, '1', '0', '2020-02-12 11:06:57', '2020-02-12 11:07:29', '0');
INSERT INTO `sys_menu` VALUES (10035, '收件箱', NULL, '/mail/inbox', 10034, 'indent', 1, '1', '0', '2020-02-12 11:12:26', NULL, '0');
INSERT INTO `sys_menu` VALUES (10036, '已发箱', NULL, '/mail/sended', 10034, 'dedent', 2, '1', '0', '2020-02-12 11:13:22', '2020-02-12 11:22:12', '0');
INSERT INTO `sys_menu` VALUES (10037, '草稿箱', NULL, '/mail/draft', 10034, 'dropbox', 3, '1', '0', '2020-02-12 11:14:37', NULL, '0');
INSERT INTO `sys_menu` VALUES (10038, '回收箱', NULL, '/mail/recycle', 10034, 'recycle', 4, '1', '0', '2020-02-12 11:21:57', NULL, '0');
INSERT INTO `sys_menu` VALUES (10039, '通讯录', NULL, '/mail/contacts', 10034, 'address-book-o', 5, '1', '0', '2020-02-12 11:38:13', '2020-02-12 16:46:01', '0');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '终端信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token,authorization_code,client_credentials,implicit', NULL, NULL, 43200, 2592001, NULL, 'true', 1);
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', 1);
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', 1);
INSERT INTO `sys_oauth_client_details` VALUES ('laputa', NULL, 'laputa', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login,http://localhost:8080/renren-admin/sys/oauth2-sso,http://localhost:8090/sys/oauth2-sso', NULL, NULL, NULL, NULL, 'false', 1);
INSERT INTO `sys_oauth_client_details` VALUES ('mp', NULL, 'mp', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', 1);
INSERT INTO `sys_oauth_client_details` VALUES ('qwe', NULL, 'qwe', 'qwe', 'implicit', NULL, NULL, NULL, NULL, NULL, 'false', 0);
INSERT INTO `sys_oauth_client_details` VALUES ('test', NULL, 'test', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', 1);

-- ----------------------------
-- Table structure for sys_public_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_public_param`;
CREATE TABLE `sys_public_param`  (
  `public_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `public_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `public_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `public_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `validate_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `public_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `system` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`public_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公共参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ds_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2',
  `ds_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `role_idx1_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员', '3', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0', 1);
INSERT INTO `sys_role` VALUES (5, '模拟设计师', 'ROLE_DESINGER_A', '设计部模拟电路设计师', '0', '2', '2019-12-02 14:18:57', '2020-01-19 09:52:32', '0', 1);
INSERT INTO `sys_role` VALUES (6, '硬件主管', 'ROLE_HARDWARE_SUPERVIOR', '硬件部主管', '0', '2', '2019-12-09 09:42:24', '2020-01-19 09:52:33', '0', 1);
INSERT INTO `sys_role` VALUES (7, '验证工程师', 'ROLE_VERIFY', '芯片数字部分验证设计师', '1', '2', '2019-12-21 08:54:39', '2020-01-19 09:52:35', '0', 1);
INSERT INTO `sys_role` VALUES (8, '质量工程师', 'QUALITY_ENGINEER', '质量工程师', '2', '2', '2019-12-21 10:02:07', '2020-01-19 09:52:36', '0', 1);
INSERT INTO `sys_role` VALUES (9, '质量部经理', 'QUALITY_MANAGER', '质量部的经理', '1', '2', '2019-12-21 10:02:42', '2020-01-19 09:52:38', '0', 1);
INSERT INTO `sys_role` VALUES (10, '测试部经理', 'TEST_MANAGER', '测试部经理', '0', '2', '2019-12-21 10:03:40', '2020-01-19 09:52:39', '0', 1);
INSERT INTO `sys_role` VALUES (11, '测试工程师', 'TEST_ENGINEER', '测试部工程师', '1', '2', '2019-12-21 10:04:47', '2020-01-19 09:52:41', '0', 1);
INSERT INTO `sys_role` VALUES (12, '应用工程师', 'APPLICATION_ENGINEER', '产品应用实施工程师', '6', NULL, '2020-01-21 12:56:32', NULL, '0', 1);
INSERT INTO `sys_role` VALUES (13, '项目经理', 'PROJECT_MANAGER', '项目管理经理', '8', NULL, '2020-01-21 13:10:29', NULL, '0', 1);
INSERT INTO `sys_role` VALUES (14, '项目工程师', 'PROJECT_ENGINEER', '项目 实施工程师', '9', NULL, '2020-01-21 13:11:00', NULL, '0', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1100);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1102);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1200);
INSERT INTO `sys_role_menu` VALUES (1, 1201);
INSERT INTO `sys_role_menu` VALUES (1, 1202);
INSERT INTO `sys_role_menu` VALUES (1, 1203);
INSERT INTO `sys_role_menu` VALUES (1, 1300);
INSERT INTO `sys_role_menu` VALUES (1, 1301);
INSERT INTO `sys_role_menu` VALUES (1, 1302);
INSERT INTO `sys_role_menu` VALUES (1, 1303);
INSERT INTO `sys_role_menu` VALUES (1, 1304);
INSERT INTO `sys_role_menu` VALUES (1, 1400);
INSERT INTO `sys_role_menu` VALUES (1, 1401);
INSERT INTO `sys_role_menu` VALUES (1, 1402);
INSERT INTO `sys_role_menu` VALUES (1, 1403);
INSERT INTO `sys_role_menu` VALUES (1, 1500);
INSERT INTO `sys_role_menu` VALUES (1, 1501);
INSERT INTO `sys_role_menu` VALUES (1, 1502);
INSERT INTO `sys_role_menu` VALUES (1, 1503);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2100);
INSERT INTO `sys_role_menu` VALUES (1, 2101);
INSERT INTO `sys_role_menu` VALUES (1, 2200);
INSERT INTO `sys_role_menu` VALUES (1, 2201);
INSERT INTO `sys_role_menu` VALUES (1, 2202);
INSERT INTO `sys_role_menu` VALUES (1, 2203);
INSERT INTO `sys_role_menu` VALUES (1, 2210);
INSERT INTO `sys_role_menu` VALUES (1, 2211);
INSERT INTO `sys_role_menu` VALUES (1, 2212);
INSERT INTO `sys_role_menu` VALUES (1, 2213);
INSERT INTO `sys_role_menu` VALUES (1, 2300);
INSERT INTO `sys_role_menu` VALUES (1, 2400);
INSERT INTO `sys_role_menu` VALUES (1, 2401);
INSERT INTO `sys_role_menu` VALUES (1, 2402);
INSERT INTO `sys_role_menu` VALUES (1, 2403);
INSERT INTO `sys_role_menu` VALUES (1, 2500);
INSERT INTO `sys_role_menu` VALUES (1, 2501);
INSERT INTO `sys_role_menu` VALUES (1, 2502);
INSERT INTO `sys_role_menu` VALUES (1, 2503);
INSERT INTO `sys_role_menu` VALUES (1, 2600);
INSERT INTO `sys_role_menu` VALUES (1, 2601);
INSERT INTO `sys_role_menu` VALUES (1, 2700);
INSERT INTO `sys_role_menu` VALUES (1, 2800);
INSERT INTO `sys_role_menu` VALUES (1, 2810);
INSERT INTO `sys_role_menu` VALUES (1, 2820);
INSERT INTO `sys_role_menu` VALUES (1, 2830);
INSERT INTO `sys_role_menu` VALUES (1, 2840);
INSERT INTO `sys_role_menu` VALUES (1, 2850);
INSERT INTO `sys_role_menu` VALUES (1, 2860);
INSERT INTO `sys_role_menu` VALUES (1, 2870);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3100);
INSERT INTO `sys_role_menu` VALUES (1, 3110);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3300);
INSERT INTO `sys_role_menu` VALUES (1, 3400);
INSERT INTO `sys_role_menu` VALUES (1, 3500);
INSERT INTO `sys_role_menu` VALUES (1, 4000);
INSERT INTO `sys_role_menu` VALUES (1, 4100);
INSERT INTO `sys_role_menu` VALUES (1, 4101);
INSERT INTO `sys_role_menu` VALUES (1, 4200);
INSERT INTO `sys_role_menu` VALUES (1, 4201);
INSERT INTO `sys_role_menu` VALUES (1, 4300);
INSERT INTO `sys_role_menu` VALUES (1, 4301);
INSERT INTO `sys_role_menu` VALUES (1, 4302);
INSERT INTO `sys_role_menu` VALUES (1, 4303);
INSERT INTO `sys_role_menu` VALUES (1, 4400);
INSERT INTO `sys_role_menu` VALUES (1, 4401);
INSERT INTO `sys_role_menu` VALUES (1, 10000);
INSERT INTO `sys_role_menu` VALUES (1, 10001);
INSERT INTO `sys_role_menu` VALUES (1, 10002);
INSERT INTO `sys_role_menu` VALUES (1, 10003);
INSERT INTO `sys_role_menu` VALUES (1, 10004);
INSERT INTO `sys_role_menu` VALUES (1, 10005);
INSERT INTO `sys_role_menu` VALUES (1, 10006);
INSERT INTO `sys_role_menu` VALUES (1, 10007);
INSERT INTO `sys_role_menu` VALUES (1, 10008);
INSERT INTO `sys_role_menu` VALUES (1, 10009);
INSERT INTO `sys_role_menu` VALUES (1, 10010);
INSERT INTO `sys_role_menu` VALUES (1, 10011);
INSERT INTO `sys_role_menu` VALUES (1, 10012);
INSERT INTO `sys_role_menu` VALUES (1, 10013);
INSERT INTO `sys_role_menu` VALUES (1, 10015);
INSERT INTO `sys_role_menu` VALUES (1, 10016);
INSERT INTO `sys_role_menu` VALUES (1, 10017);
INSERT INTO `sys_role_menu` VALUES (1, 10018);
INSERT INTO `sys_role_menu` VALUES (1, 10019);
INSERT INTO `sys_role_menu` VALUES (1, 10020);
INSERT INTO `sys_role_menu` VALUES (1, 10021);
INSERT INTO `sys_role_menu` VALUES (1, 10022);
INSERT INTO `sys_role_menu` VALUES (1, 10023);
INSERT INTO `sys_role_menu` VALUES (1, 10024);
INSERT INTO `sys_role_menu` VALUES (1, 10025);
INSERT INTO `sys_role_menu` VALUES (1, 10026);
INSERT INTO `sys_role_menu` VALUES (1, 10027);
INSERT INTO `sys_role_menu` VALUES (1, 10028);
INSERT INTO `sys_role_menu` VALUES (1, 10029);
INSERT INTO `sys_role_menu` VALUES (1, 10030);
INSERT INTO `sys_role_menu` VALUES (1, 10031);
INSERT INTO `sys_role_menu` VALUES (1, 10032);
INSERT INTO `sys_role_menu` VALUES (1, 10033);
INSERT INTO `sys_role_menu` VALUES (1, 10034);
INSERT INTO `sys_role_menu` VALUES (1, 10035);
INSERT INTO `sys_role_menu` VALUES (1, 10036);
INSERT INTO `sys_role_menu` VALUES (1, 10037);
INSERT INTO `sys_role_menu` VALUES (1, 10038);
INSERT INTO `sys_role_menu` VALUES (1, 10039);

-- ----------------------------
-- Table structure for sys_route_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `predicates` json NULL COMMENT '断言',
  `filters` json NULL COMMENT '过滤器',
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(2) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '路由配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_route_conf
-- ----------------------------
INSERT INTO `sys_route_conf` VALUES (1, '工作流管理模块', 'laputa-oa-platform', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-oa-platform', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (2, '认证中心', 'laputa-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://laputa-auth', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (3, '代码生成模块', 'laputa-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-codegen', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (4, 'elastic-job定时任务模块', 'laputa-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-daemon-elastic-job', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (5, 'quartz定时任务模块', 'laputa-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-daemon-quartz', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (6, '分布式事务模块', 'laputa-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-tx-manager', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:20', '0');
INSERT INTO `sys_route_conf` VALUES (7, '通用权限模块', 'laputa-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"1000\", \"redis-rate-limiter.replenishRate\": \"1000\"}, \"name\": \"RequestRateLimiter\"}]', 'lb://laputa-upms-biz', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:21', '0');
INSERT INTO `sys_route_conf` VALUES (8, '工作流长链接支持1', 'laputa-oa-platform-ws-1', '[{\"args\": {\"_genkey_0\": \"/act/ws/info/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-oa-platform', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:21', '0');
INSERT INTO `sys_route_conf` VALUES (9, '工作流长链接支持2', 'laputa-oa-platform-ws-2', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://laputa-oa-platform', 100, '2019-10-16 16:44:41', '2020-02-19 08:35:21', '0');
INSERT INTO `sys_route_conf` VALUES (10, '微信公众号管理', 'laputa-mp-platform', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-mp-platform', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:21', '0');
INSERT INTO `sys_route_conf` VALUES (11, '支付管理', 'laputa-pay-platform', '[{\"args\": {\"_genkey_0\": \"/pay/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-pay-platform', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:22', '0');
INSERT INTO `sys_route_conf` VALUES (12, '监控管理', 'laputa-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-monitor', 0, '2019-10-16 16:44:41', '2020-02-19 08:35:22', '0');
INSERT INTO `sys_route_conf` VALUES (13, '文档管理', 'laputa-doc', '[{\"args\": {\"_genkey_0\": \"/doc/**\"}, \"name\": \"Path\"}]', '[]', 'lb://laputa-doc-biz', 0, '2020-02-18 09:30:57', '2020-02-19 10:03:16', '0');

-- ----------------------------
-- Table structure for sys_social_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `redirect_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统社交登录账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_social_details
-- ----------------------------
INSERT INTO `sys_social_details` VALUES (1, 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2019-03-02 09:43:13', '0', 1);
INSERT INTO `sys_social_details` VALUES (2, 'GITEE', '码云登录', '8fc54e0e76e7842cf767c3ae3b9fdc48c03cefed27aa565ff7b2a39d142d9892', 'c544469ce78a67d9fcf9b28cd9f310b73f5cbc46a1b993e0802ad61517deb221', 'http://gitee.huaxiadaowei.com/#/authredirect', '2019-06-28 09:59:55', '2019-06-28 09:59:55', '0', 1);
INSERT INTO `sys_social_details` VALUES (3, 'OSC', '开源中国', 'neIIqlwGsjsfsA6uxNqD', 'aOPhRuOOJNXV1x7JrTJ9qIyRCAPXoO0l', 'http://gitee.huaxiadaowei.com/#/authredirect', '2019-06-28 10:05:37', '2019-06-28 10:05:37', '0', 1);
INSERT INTO `sys_social_details` VALUES (4, 'MINI', '小程序', 'wx6832be859d0e1cf5', '08036aef810dcb2f8ae31510910ba631', NULL, '2019-11-02 22:08:03', '2019-11-02 22:10:53', '0', 1);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '北京分公司', '1', '2019-05-15 00:00:00', '2020-05-15 00:00:00', '0', '0', '2019-05-15 15:44:57', '2019-05-18 14:47:30');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `lock_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '锁定状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `wx_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `mini_openid` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'mini号',
  `qq_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '腾讯号',
  `gitee_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '码云号',
  `osc_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OS号',
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_wx_openid`(`wx_openid`) USING BTREE,
  INDEX `user_qq_openid`(`qq_openid`) USING BTREE,
  INDEX `user_idx1_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', NULL, '13812520155', 'laputa/0a6b9175f00e40e184ea45e10d4a2efb.png', 1, '2018-04-20 07:15:18', '2020-02-14 13:39:02', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', NULL, NULL, 'kongkong78', '2303656', 1, NULL, '蒋晟');
INSERT INTO `sys_user` VALUES (2, 'qianye', 'qianye', '$2a$10$zK6HfhGPfze1j8hyQJtZMeTISYjpEgRbfKeUxtUF7EkjKh8xPDsXW', NULL, '135****0627', 'laputa/02b732d20bcb4486bf9225345446fa83.png', 4, '2019-10-18 09:47:23', '2020-01-21 12:10:06', '0', '0', NULL, NULL, NULL, 'sommer78', NULL, 1, 'qianye@etek.com.cn', '钱晔');
INSERT INTO `sys_user` VALUES (6, 'zhouqing', 'zhouqing', '$2a$10$ONTMZ8JjrPm7W2F5.I8FS.RLz9r93WVVUMvTEZ2PhO9VCb.QhAkMC', NULL, '13499990000', NULL, 5, '2019-10-26 15:41:31', '2020-01-19 10:36:23', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '周庆');
INSERT INTO `sys_user` VALUES (7, 'shiliangjun', 'shiliangjun', '$2a$10$xdce32Uf0mJ.2kMLKUW0m.FYNqCL.HKtKL5NGF8p3Jsl1BegBeIZS', NULL, '13915270372', NULL, 5, '2019-11-30 14:22:42', '2020-01-19 10:36:23', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '史良俊');
INSERT INTO `sys_user` VALUES (8, 'xuhuayue', 'xuhuayue', '$2a$10$ipZA3j815uPTK/L9ynhss.Ia.jNMQ3ba2eOsKXMJAG0.HgqEqL6D6', NULL, '13914128260', NULL, 21, '2019-12-01 10:45:06', '2020-01-19 10:36:24', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '徐华玥');
INSERT INTO `sys_user` VALUES (9, 'shengyuan', 'shengyuan', '$2a$10$WP89P0zrBdIzhc6KT.HsceGoHnK1mWAUT4YED73Zvf6UXDziT0qMi', NULL, '13915355430', NULL, 23, '2019-12-01 10:51:46', '2020-01-19 10:36:24', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '盛渊');
INSERT INTO `sys_user` VALUES (10, 'zhumengting', 'baichi', '$2a$10$G9Ub5wOcFqSlAwNAsl0cAufrX3.A8/UB1O8QCkrRi26.3cm9vCIZy', NULL, '18306210856', NULL, 28, '2019-12-01 12:38:48', '2020-01-21 13:09:44', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'baichi@etek.com.cn', '天泰安');
INSERT INTO `sys_user` VALUES (11, 'sunsibing', 'sunsibing', '$2a$10$whbu7ghRTTj/g2LgnYVx0e1fZwixGzGQts6KI3Z4PQWJN8GqJNgXC', NULL, '15852764352', NULL, 20, '2019-12-01 12:39:57', '2020-01-19 10:36:25', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '孙思兵');
INSERT INTO `sys_user` VALUES (12, 'yangshouqin', 'yangshouqin', '$2a$10$jwPTT3JS5Wz0Vwmu9oMjSuMOC6V.SsxDprBrDQslG6KlV3qxYO3Dm', NULL, '13921103801', NULL, 19, '2019-12-01 12:44:13', '2020-01-19 10:36:25', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '杨守芹');
INSERT INTO `sys_user` VALUES (13, 'caochunlei', 'caochunlei', '$2a$10$z980s4qy8xXArz8yB2SvvOthHCnWUpEwUODqojQY/L1dx6eKXFrkG', NULL, '15609671058', NULL, 17, '2019-12-02 13:51:16', '2020-01-19 10:36:26', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, NULL, '曹春磊');
INSERT INTO `sys_user` VALUES (14, 'fangyi', 'fangyi', '$2a$10$/iNdk1Ux9rFfeENf4hne3O0tAN47NTt3cHf89ILSWnzn/TxoMTzKO', NULL, '159****9866', NULL, 15, '2019-12-02 13:55:19', '2020-01-21 12:36:32', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'fangyi@etek.com.cn', '方怡');
INSERT INTO `sys_user` VALUES (15, 'yingpeng', 'yingpeng', '$2a$10$puUBmIzANOfYA.kuvAQ9OOjQ3LpyGy4mPcmTiYJH7XFWLkCHsnIo2', NULL, '15961898188', NULL, 17, '2019-12-21 10:26:46', '2020-01-21 12:56:50', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'yingpeng@etek.com.cn', '殷鹏');
INSERT INTO `sys_user` VALUES (16, 'zhenglixia', 'zhenglixia', '$2a$10$ao5bKa.9dVrS1Y3/kRut6OogBB4j1kDpTDBmHSOaIcmapJEU.7TrW', NULL, '15895353225', NULL, 30, '2019-12-22 10:58:35', '2020-01-21 13:00:27', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'zhenglixia@etek.com.cn', '郑丽霞');
INSERT INTO `sys_user` VALUES (17, 'luxiaojie', 'luxiaojie', '$2a$10$G2jj1wvV5/q3tbaGuOajv.lV6B.Df.0erpX.Pv8oB3lw9KFlLsi5a', NULL, '13825201553', NULL, 40, '2020-01-19 09:08:09', '2020-01-21 12:59:55', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'luxiaojie@etek.com.cn', '陆小杰');
INSERT INTO `sys_user` VALUES (18, 'baichi', 'baichi', '$2a$10$VvvKOGrmY99UkH/A.GCtBegQBAkhyMI4f72dg7z3M.g701Jkyleai', NULL, '138****1200', NULL, 28, '2020-01-19 14:06:28', '2020-02-12 09:26:59', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'baichi@etek.com.cn', '天泰安');
INSERT INTO `sys_user` VALUES (20, 'zhuzhu', 'zhuzhu', '$2a$10$JUsnBYeApHo1ijoEKNe77eL6O161HqKEoAIQt39WnOPjnR/rVNVJm', NULL, '13809929933', NULL, 21, '2020-01-21 12:41:37', '2020-02-12 09:27:06', '0', '0', NULL, NULL, NULL, NULL, NULL, 1, 'zhuzhu@etek.com.cn', '朱珠');

-- ----------------------------
-- Table structure for sys_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_bind`;
CREATE TABLE `sys_user_bind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user_bind id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方登录类型',
  `account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方登录账号',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_contact
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_contact`;
CREATE TABLE `sys_user_contact`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `area_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '座机号码',
  `wechat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信OpenID',
  `qq_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQID',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `zip_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户联系方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_education
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_education`;
CREATE TABLE `sys_user_education`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `last_education` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `last_school` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后毕业院校',
  `study_profession` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校专业',
  `graduation_time` date NULL DEFAULT NULL COMMENT '毕业时间',
  `work_start_time` date NULL DEFAULT NULL COMMENT '开始工作时间',
  `work_profession` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从事专业',
  `work_resume` blob NULL COMMENT '工作简历',
  `graduation_certificate` blob NULL COMMENT '毕业证书影印件',
  `political_status` int(11) NULL DEFAULT NULL COMMENT '政治面貌',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学历信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (6, 1);
INSERT INTO `sys_user_role` VALUES (7, 3);
INSERT INTO `sys_user_role` VALUES (8, 3);
INSERT INTO `sys_user_role` VALUES (9, 3);
INSERT INTO `sys_user_role` VALUES (10, 5);
INSERT INTO `sys_user_role` VALUES (11, 3);
INSERT INTO `sys_user_role` VALUES (12, 3);
INSERT INTO `sys_user_role` VALUES (13, 2);
INSERT INTO `sys_user_role` VALUES (13, 3);
INSERT INTO `sys_user_role` VALUES (14, 5);
INSERT INTO `sys_user_role` VALUES (14, 7);
INSERT INTO `sys_user_role` VALUES (15, 12);
INSERT INTO `sys_user_role` VALUES (16, 7);
INSERT INTO `sys_user_role` VALUES (17, 11);
INSERT INTO `sys_user_role` VALUES (18, 5);
INSERT INTO `sys_user_role` VALUES (20, 9);

SET FOREIGN_KEY_CHECKS = 1;
