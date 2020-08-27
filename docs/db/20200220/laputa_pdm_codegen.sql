/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.105.72.237:3306
 Source Schema         : laputa_pdm_codegen

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2020 15:40:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_datasource_conf
-- ----------------------------
DROP TABLE IF EXISTS `gen_datasource_conf`;
CREATE TABLE `gen_datasource_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_datasource_conf
-- ----------------------------
INSERT INTO `gen_datasource_conf` VALUES (1, 'laputa_pdm', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true', 'root', '1WirD1hsrdgEa4Zilk9+9PkE4Gp2qvms', '2019-03-31 16:40:43', '2020-01-17 10:05:08', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (2, 'laputa_pdm_ac', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_ac?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', '1WirD1hsrdgEa4Zilk9+9PkE4Gp2qvms', '2019-03-31 17:53:25', '2020-01-17 10:05:10', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (3, 'laputa_pdm_job', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', '1WirD1hsrdgEa4Zilk9+9PkE4Gp2qvms', '2019-03-31 17:53:25', '2020-01-17 10:05:12', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (4, 'laputa_pdm_mp', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_mp?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', '1WirD1hsrdgEa4Zilk9+9PkE4Gp2qvms', '2019-03-31 17:53:25', '2020-01-17 10:05:14', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (5, 'laputa_pdm_pay', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_pay?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'SEd9qkbrxR/mFJ863Ka8/EL4GD0HTqVZ', '2019-03-31 17:53:25', '2020-01-17 10:05:17', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (6, 'laputa_pdm_codegen', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_codegen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true', 'root', '1WirD1hsrdgEa4Zilk9+9PkE4Gp2qvms', '2019-08-12 15:47:39', '2020-01-17 10:05:20', '0', 1);
INSERT INTO `gen_datasource_conf` VALUES (7, 'laputa_pdm_doc', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_doc?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'ssG6HKrpCSY+u6Hc06QGKNL9wqGE/kwA', '2020-01-20 14:35:53', '2020-01-20 14:35:53', '0', NULL);
INSERT INTO `gen_datasource_conf` VALUES (8, '消息记录', 'jdbc:mysql://laputa-mysql:3306/laputa_pdm_msg?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'vVpPdxYXvnysbSGxkB2JKBK03LfPf/a1', '2020-02-12 09:49:57', '2020-02-12 09:49:57', '0', NULL);

-- ----------------------------
-- Table structure for gen_form_conf
-- ----------------------------
DROP TABLE IF EXISTS `gen_form_conf`;
CREATE TABLE `gen_form_conf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `form_info` json NOT NULL COMMENT '表单信息',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_name`(`table_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表单配置' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
