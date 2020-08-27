/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.105.72.237:3306
 Source Schema         : laputa_pdm_prj

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2020 15:41:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for prj_bug
-- ----------------------------
DROP TABLE IF EXISTS `prj_bug`;
CREATE TABLE `prj_bug`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `assignUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `severity` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `priority` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dueDate` date NULL DEFAULT NULL,
  `environment` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `resolution` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `resolveddate` datetime(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `originalEstimate` double NULL DEFAULT NULL,
  `remainEstimate` double NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `milestoneId` int(11) NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `percentagecomplete` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_bug_6`(`milestoneId`) USING BTREE,
  INDEX `FK_prj_bug_4`(`projectId`) USING BTREE,
  INDEX `FK_prj_bug_5`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_bug_1`(`assignUser`) USING BTREE,
  INDEX `FK_prj_bug_2`(`createdUser`) USING BTREE,
  CONSTRAINT `FK_prj_bug_1` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_bug_2` FOREIGN KEY (`assignUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_bug_3` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_bug_4` FOREIGN KEY (`milestoneId`) REFERENCES `prj_milestone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_bug_5` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_component
-- ----------------------------
DROP TABLE IF EXISTS `prj_component`;
CREATE TABLE `prj_component`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userlead` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_component_1`(`projectId`) USING BTREE,
  INDEX `FK_prj_component_4`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_component_2`(`userlead`) USING BTREE,
  INDEX `FK_prj_component_3`(`createdUser`) USING BTREE,
  CONSTRAINT `FK_prj_component_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_component_2` FOREIGN KEY (`userlead`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_component_3` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_component_4` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_customize_view
-- ----------------------------
DROP TABLE IF EXISTS `prj_customize_view`;
CREATE TABLE `prj_customize_view`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NOT NULL,
  `displayMessage` bit(1) NOT NULL,
  `displayMilestone` bit(1) NOT NULL,
  `displayFile` bit(1) NOT NULL,
  `displayTimeLogging` bit(1) NOT NULL,
  `displayPage` bit(1) NOT NULL,
  `displayInvoice` bit(1) NOT NULL,
  `displayTicket` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_customize_view_1_idx`(`projectId`) USING BTREE,
  CONSTRAINT `FK_prj_customize_view_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_invoice
-- ----------------------------
DROP TABLE IF EXISTS `prj_invoice`;
CREATE TABLE `prj_invoice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` double NOT NULL,
  `currentId` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clientId` int(10) UNSIGNED NULL DEFAULT NULL,
  `contactUserFullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noId` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `issueDate` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_invoice_1_idx`(`currentId`) USING BTREE,
  INDEX `FK_prj_invoice_2_idx`(`clientId`) USING BTREE,
  INDEX `FK_prj_invoice_3_idx`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_invoice_4_idx`(`projectId`) USING BTREE,
  CONSTRAINT `FK_prj_invoice_2` FOREIGN KEY (`clientId`) REFERENCES `m_client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_invoice_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_invoice_4` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_kanban_board
-- ----------------------------
DROP TABLE IF EXISTS `prj_kanban_board`;
CREATE TABLE `prj_kanban_board`  (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `sAccountId` int(11) NOT NULL,
  `lead` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_kanban_board_1_idx`(`projectId`) USING BTREE,
  INDEX `FK_prj_kanban_board_2_idx`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_kanban_board_3_idx`(`lead`) USING BTREE,
  CONSTRAINT `FK_prj_kanban_board_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_kanban_board_2` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_kanban_board_3` FOREIGN KEY (`lead`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_member
-- ----------------------------
DROP TABLE IF EXISTS `prj_member`;
CREATE TABLE `prj_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `projectRoleId` int(11) UNSIGNED NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sAccountId` int(11) NOT NULL,
  `billingRate` double NULL DEFAULT NULL,
  `overtimeBillingRate` double NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_member_2`(`projectId`) USING BTREE,
  INDEX `FK_prj_member_1`(`username`) USING BTREE,
  INDEX `FK_prj_member_3_idx`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_member_4_idx`(`projectRoleId`) USING BTREE,
  CONSTRAINT `FK_prj_member_1` FOREIGN KEY (`username`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_member_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_member_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_member_4` FOREIGN KEY (`projectRoleId`) REFERENCES `prj_role` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_message
-- ----------------------------
DROP TABLE IF EXISTS `prj_message`;
CREATE TABLE `prj_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `isStick` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_message_2`(`projectId`) USING BTREE,
  INDEX `FK_prj_message_3`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_message_1_idx`(`createdUser`) USING BTREE,
  CONSTRAINT `FK_prj_message_1` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_message_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_message_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_milestone
-- ----------------------------
DROP TABLE IF EXISTS `prj_milestone`;
CREATE TABLE `prj_milestone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `assignUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `flag` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prjKey` int(11) NULL DEFAULT NULL,
  `dueDate` date NULL DEFAULT NULL,
  `color` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `priority` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PK_prj_milestone_2`(`projectId`) USING BTREE,
  INDEX `PK_prj_milestone_1`(`assignUser`) USING BTREE,
  INDEX `PK_prj_milestone_3_idx`(`sAccountId`) USING BTREE,
  INDEX `PK_prj_milestone_4_idx`(`createdUser`) USING BTREE,
  CONSTRAINT `PK_prj_milestone_1` FOREIGN KEY (`assignUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_prj_milestone_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_prj_milestone_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_prj_milestone_4` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_notifications
-- ----------------------------
DROP TABLE IF EXISTS `prj_notifications`;
CREATE TABLE `prj_notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `sAccountId` int(11) NOT NULL,
  `level` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_notifications_1_idx`(`username`) USING BTREE,
  INDEX `FK_prj_notifications_2_idx`(`projectId`) USING BTREE,
  INDEX `FK_prj_notifications_3_idx`(`sAccountId`) USING BTREE,
  CONSTRAINT `FK_prj_notifications_1` FOREIGN KEY (`username`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_notifications_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_notifications_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_project
-- ----------------------------
DROP TABLE IF EXISTS `prj_project`;
CREATE TABLE `prj_project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clientId` int(10) UNSIGNED NULL DEFAULT NULL,
  `priority` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shortName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `planStartDate` date NULL DEFAULT NULL,
  `planEndDate` date NULL DEFAULT NULL,
  `targetBudget` double NULL DEFAULT NULL,
  `homePage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `actualBudget` double NULL DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `defaultBillingRate` double NULL DEFAULT NULL,
  `defaultOvertimeBillingRate` double NULL DEFAULT NULL,
  `currencyId` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `progress` double NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `avatarId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contextAsk` tinyint(1) NULL DEFAULT 1,
  `deadline` date NULL DEFAULT NULL,
  `isPublic` tinyint(1) NULL DEFAULT NULL,
  `isTemplate` tinyint(1) NULL DEFAULT NULL,
  `memLead` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_m_project_project_1`(`clientId`) USING BTREE,
  INDEX `FK_prj_project_4`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_project_3`(`currencyId`) USING BTREE,
  INDEX `FK_prj_project_2`(`createUser`) USING BTREE,
  INDEX `FK_prj_project_5`(`memLead`) USING BTREE,
  CONSTRAINT `FK_m_project_project_1` FOREIGN KEY (`clientId`) REFERENCES `m_client` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_project_2` FOREIGN KEY (`createUser`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_project_4` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_project_5` FOREIGN KEY (`memLead`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_project_6` FOREIGN KEY (`clientId`) REFERENCES `m_client` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_risk
-- ----------------------------
DROP TABLE IF EXISTS `prj_risk`;
CREATE TABLE `prj_risk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assignUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `consequence` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `probability` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `raisedDate` date NULL DEFAULT NULL,
  `dueDate` date NULL DEFAULT NULL,
  `response` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `resolution` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `milestoneId` int(11) NULL DEFAULT NULL,
  `percentageComplete` double NULL DEFAULT NULL,
  `priority` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remainEstimate` double NULL DEFAULT NULL,
  `originalEstimate` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_risk1_1`(`projectId`) USING BTREE,
  INDEX `FK_prj_risk1_4`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_risk1_2`(`createdUser`) USING BTREE,
  INDEX `FK_prj_risk1_3`(`assignUser`) USING BTREE,
  INDEX `FK_prj_risk1_5_idx`(`milestoneId`) USING BTREE,
  CONSTRAINT `FK_prj_risk1_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_risk1_2` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_risk1_3` FOREIGN KEY (`assignUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_risk1_4` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_risk1_5` FOREIGN KEY (`milestoneId`) REFERENCES `prj_milestone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_role
-- ----------------------------
DROP TABLE IF EXISTS `prj_role`;
CREATE TABLE `prj_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sAccountId` int(11) NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `isSystemRole` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_role_2`(`projectId`) USING BTREE,
  INDEX `FK_prj_role_1`(`sAccountId`) USING BTREE,
  CONSTRAINT `FK_prj_role_1` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_role_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `prj_role_permission`;
CREATE TABLE `prj_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) UNSIGNED NOT NULL,
  `roleVal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_role_permission_2`(`projectId`) USING BTREE,
  INDEX `FK_prj_role_permission_1`(`roleId`) USING BTREE,
  CONSTRAINT `FK_prj_role_permission_1` FOREIGN KEY (`roleId`) REFERENCES `prj_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_role_permission_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_standup
-- ----------------------------
DROP TABLE IF EXISTS `prj_standup`;
CREATE TABLE `prj_standup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sAccountId` int(11) NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `whatlastday` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `whattoday` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `whatproblem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `forday` date NOT NULL,
  `logBy` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_standup_3`(`projectId`) USING BTREE,
  INDEX `FK_prj_standup_1`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_standup_2`(`logBy`) USING BTREE,
  CONSTRAINT `FK_prj_standup_1` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_standup_2` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_standup_3` FOREIGN KEY (`logBy`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_task
-- ----------------------------
DROP TABLE IF EXISTS `prj_task`;
CREATE TABLE `prj_task`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentagecomplete` double NOT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `priority` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` bigint(20) NULL DEFAULT NULL,
  `isestimated` bit(1) NULL DEFAULT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  `dueDate` date NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `assignUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `originalEstimate` double NULL DEFAULT NULL,
  `remainEstimate` double NULL DEFAULT NULL,
  `milestoneId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_task_1`(`projectId`) USING BTREE,
  INDEX `FK_prj_task_4`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_task_3`(`assignUser`) USING BTREE,
  INDEX `FK_prj_task_5`(`createdUser`) USING BTREE,
  INDEX `FK_prj_task_7_idx`(`milestoneId`) USING BTREE,
  CONSTRAINT `FK_prj_task_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_task_3` FOREIGN KEY (`assignUser`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_task_4` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_task_5` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_task_7` FOREIGN KEY (`milestoneId`) REFERENCES `prj_milestone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_ticket_hierarchy
-- ----------------------------
DROP TABLE IF EXISTS `prj_ticket_hierarchy`;
CREATE TABLE `prj_ticket_hierarchy`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentId` int(10) NOT NULL,
  `parentType` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticketId` int(10) NOT NULL,
  `ticketType` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projectId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_ticket_hierarchy_1`(`projectId`) USING BTREE,
  CONSTRAINT `FK_prj_ticket_hierarchy` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_ticket_key
-- ----------------------------
DROP TABLE IF EXISTS `prj_ticket_key`;
CREATE TABLE `prj_ticket_key`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NOT NULL,
  `ticketId` int(11) UNSIGNED NOT NULL,
  `ticketType` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticketKey` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PK_prj_ticket_id_1_idx`(`projectId`) USING BTREE,
  CONSTRAINT `PK_prj_ticket_id_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_ticket_relation
-- ----------------------------
DROP TABLE IF EXISTS `prj_ticket_relation`;
CREATE TABLE `prj_ticket_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketId` int(10) UNSIGNED NOT NULL,
  `ticketType` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeId` int(11) NOT NULL,
  `rel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_prj_ticket_relation_item_2`(`type`) USING BTREE,
  INDEX `INDEX_prj_ticket_relation_item_3`(`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_time_logging
-- ----------------------------
DROP TABLE IF EXISTS `prj_time_logging`;
CREATE TABLE `prj_time_logging`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `typeId` int(11) NULL DEFAULT NULL,
  `note` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `logValue` double NOT NULL,
  `logUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `logForDay` date NOT NULL,
  `isBillable` bit(1) NOT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isOvertime` bit(1) NULL DEFAULT NULL,
  `isApproved` bit(1) NULL DEFAULT NULL,
  `approveUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `approveTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_time_logging_1`(`projectId`) USING BTREE,
  INDEX `FK_prj_time_logging_2_idx`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_time_logging_3_idx`(`logUser`) USING BTREE,
  INDEX `FK_prj_time_logging_4_idx`(`approveUser`) USING BTREE,
  CONSTRAINT `FK_prj_time_logging_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_time_logging_2` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_time_logging_3` FOREIGN KEY (`logUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_time_logging_4` FOREIGN KEY (`approveUser`) REFERENCES `s_user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prj_version
-- ----------------------------
DROP TABLE IF EXISTS `prj_version`;
CREATE TABLE `prj_version`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `projectId` int(10) UNSIGNED NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `duedate` date NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdUser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sAccountId` int(11) NOT NULL,
  `lastUpdatedTime` datetime(0) NULL DEFAULT NULL,
  `createdTime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_prj_version_1`(`projectId`) USING BTREE,
  INDEX `FK_prj_version_3`(`sAccountId`) USING BTREE,
  INDEX `FK_prj_version_2`(`createdUser`) USING BTREE,
  CONSTRAINT `FK_prj_version_1` FOREIGN KEY (`projectId`) REFERENCES `prj_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_version_2` FOREIGN KEY (`createdUser`) REFERENCES `s_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prj_version_3` FOREIGN KEY (`sAccountId`) REFERENCES `s_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
