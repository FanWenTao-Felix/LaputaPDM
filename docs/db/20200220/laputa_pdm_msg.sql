/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.105.72.237:3306
 Source Schema         : laputa_pdm_msg

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2020 15:41:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg_group
-- ----------------------------
DROP TABLE IF EXISTS `msg_group`;
CREATE TABLE `msg_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` tinyblob NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` tinyblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKrtbsj7fl3wdej4i0eu4c9ibhd`(`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_group_member
-- ----------------------------
DROP TABLE IF EXISTS `msg_group_member`;
CREATE TABLE `msg_group_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` tinyblob NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `notify_level` int(11) NOT NULL,
  `permission_type` int(11) NOT NULL,
  `update_time` tinyblob NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKm5kf4r0jy3ylr4l4dct1wtn5s`(`group_id`) USING BTREE,
  INDEX `FKse9g3x3lnnpv4nm7d0koa8eqy`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_mail_account
-- ----------------------------
DROP TABLE IF EXISTS `msg_mail_account`;
CREATE TABLE `msg_mail_account`  (
  `mail_account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail_create_time` datetime(0) NULL DEFAULT NULL,
  `mail_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mail_type` bigint(20) NULL DEFAULT NULL,
  `mail_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` bigint(20) NULL DEFAULT NULL,
  `mail_account_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`mail_account_id`) USING BTREE,
  INDEX `FKn9qg20uba4xn2k5m62jrcyc6c`(`mail_account_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_message
-- ----------------------------
DROP TABLE IF EXISTS `msg_message`;
CREATE TABLE `msg_message`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` tinyblob NOT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `receiver_id` bigint(20) NULL DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `update_time` tinyblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpgus4s7b1xdcyb6pjp04fx53o`(`group_id`) USING BTREE,
  INDEX `FKbh3xx1seh45d4e6650hun3ynp`(`receiver_id`) USING BTREE,
  INDEX `FKh6s5s8xm6evisj8tor69l80nt`(`sender_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_push_history
-- ----------------------------
DROP TABLE IF EXISTS `msg_push_history`;
CREATE TABLE `msg_push_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `arrival_time` tinyblob NULL,
  `create_time` tinyblob NOT NULL,
  `entity` blob NOT NULL,
  `entity_type` int(11) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `receiver_push_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sender_id` bigint(20) NULL DEFAULT NULL,
  `update_time` tinyblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfdc1km51ddx9dmcl98a99x3bg`(`receiver_id`) USING BTREE,
  INDEX `FKboxjs96eg8bup0b9dpsobmk5l`(`sender_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_user
-- ----------------------------
DROP TABLE IF EXISTS `msg_user`;
CREATE TABLE `msg_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `lock_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '锁定状态',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `tenant_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属租户',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `push_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_idx1_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_user_contacts
-- ----------------------------
DROP TABLE IF EXISTS `msg_user_contacts`;
CREATE TABLE `msg_user_contacts`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` tinyblob NOT NULL,
  `origin_id` bigint(20) NOT NULL,
  `target_id` bigint(20) NOT NULL,
  `update_at` tinyblob NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `FKg7504omlxaxetx46exn2xsimm`(`origin_id`) USING BTREE,
  INDEX `FK8ys94a4iqru1jyngk05862gfy`(`target_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
