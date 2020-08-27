/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : okmdb

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 17/02/2020 15:35:21
*/
USE laputa_pdm_doc;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for doc_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `doc_bookmark`;
CREATE TABLE `doc_bookmark`  (
                                 `BM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                 `BM_NAME` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                 `BM_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                 `BM_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                 `BM_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                 PRIMARY KEY (`BM_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_config
-- ----------------------------
DROP TABLE IF EXISTS `doc_config`;
CREATE TABLE `doc_config`  (
                               `CFG_KEY` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `CFG_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                               `CFG_VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                               PRIMARY KEY (`CFG_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for doc_css
-- ----------------------------
DROP TABLE IF EXISTS `doc_css`;
CREATE TABLE `doc_css`  (
                            `CSS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                            `CSS_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                            `CSS_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `CSS_CONTEXT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `CSS_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`CSS_ID`) USING BTREE,
                            UNIQUE INDEX `CSS_NAME`(`CSS_NAME`, `CSS_CONTEXT`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `doc_dashboard`;
CREATE TABLE `doc_dashboard`  (
                                  `DB_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                  `DB_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `DB_SOURCE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `DB_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `DB_DATE` datetime(0) NOT NULL,
                                  PRIMARY KEY (`DB_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_dashboard_activity
-- ----------------------------
DROP TABLE IF EXISTS `doc_dashboard_activity`;
CREATE TABLE `doc_dashboard_activity`  (
                                           `DAC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                           `DAC_ACTION` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                           `DAC_DATE` datetime(0) NULL DEFAULT NULL,
                                           `DAC_ITEM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                           `DAC_PATH` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                           `DAC_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                           PRIMARY KEY (`DAC_ID`) USING BTREE,
                                           INDEX `IDX_DASH_ACTI_DATE`(`DAC_DATE`) USING BTREE,
                                           INDEX `IDX_DASH_ACTI_USRACT`(`DAC_USER`, `DAC_ACTION`) USING BTREE,
                                           INDEX `IDX_DASH_ACTI_DATACT`(`DAC_DATE`, `DAC_ACTION`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_db_metadata_sequence
-- ----------------------------
DROP TABLE IF EXISTS `doc_db_metadata_sequence`;
CREATE TABLE `doc_db_metadata_sequence`  (
                                             `DMS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                             `DMS_COLUMN` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                             `DMS_TABLE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                             `DMS_VALUE` bigint(20) NULL DEFAULT NULL,
                                             PRIMARY KEY (`DMS_ID`) USING BTREE,
                                             UNIQUE INDEX `DMS_TABLE`(`DMS_TABLE`, `DMS_COLUMN`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_db_metadata_type
-- ----------------------------
DROP TABLE IF EXISTS `doc_db_metadata_type`;
CREATE TABLE `doc_db_metadata_type`  (
                                         `DMT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                         `DMT_REAL_COLUMN` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                         `DMT_TABLE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                         `DMT_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                         `DMT_VIRTUAL_COLUMN` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                         PRIMARY KEY (`DMT_ID`) USING BTREE,
                                         UNIQUE INDEX `DMT_TABLE`(`DMT_TABLE`, `DMT_REAL_COLUMN`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_db_metadata_value
-- ----------------------------
DROP TABLE IF EXISTS `doc_db_metadata_value`;
CREATE TABLE `doc_db_metadata_value`  (
                                          `DMV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `DMV_COL00` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL01` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL02` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL03` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL04` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL05` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL06` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL07` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL08` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL09` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL10` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL11` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL12` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL13` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_COL14` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          `DMV_TABLE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          PRIMARY KEY (`DMV_ID`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL04`(`DMV_COL04`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL03`(`DMV_COL03`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL14`(`DMV_COL14`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL06`(`DMV_COL06`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL05`(`DMV_COL05`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL00`(`DMV_COL00`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL11`(`DMV_COL11`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL10`(`DMV_COL10`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL02`(`DMV_COL02`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL13`(`DMV_COL13`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL01`(`DMV_COL01`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL12`(`DMV_COL12`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL08`(`DMV_COL08`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL07`(`DMV_COL07`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_COL09`(`DMV_COL09`) USING BTREE,
                                          INDEX `IDX_DB_MD_VAL_TABLE`(`DMV_TABLE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_extension
-- ----------------------------
DROP TABLE IF EXISTS `doc_extension`;
CREATE TABLE `doc_extension`  (
                                  `EXT_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `EXT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  PRIMARY KEY (`EXT_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for doc_language
-- ----------------------------
DROP TABLE IF EXISTS `doc_language`;
CREATE TABLE `doc_language`  (
                                 `LG_ID` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                 `LG_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                 `LG_IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                 `LG_IMAGE_MIME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                 PRIMARY KEY (`LG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for doc_mime_type
-- ----------------------------
DROP TABLE IF EXISTS `doc_mime_type`;
CREATE TABLE `doc_mime_type`  (
                                  `MT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                  `MT_DESCRIPTION` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `MT_IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                  `MT_IMAGE_MIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `MT_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `MT_SEARCH` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  PRIMARY KEY (`MT_ID`) USING BTREE,
                                  UNIQUE INDEX `MT_DESCRIPTION`(`MT_DESCRIPTION`) USING BTREE,
                                  UNIQUE INDEX `MT_NAME`(`MT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_mime_type_extension
-- ----------------------------
DROP TABLE IF EXISTS `doc_mime_type_extension`;
CREATE TABLE `doc_mime_type_extension`  (
                                            `MTE_ID` bigint(20) NOT NULL,
                                            `MTE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                            INDEX `FK198BAD77C645F9B7`(`MTE_ID`) USING BTREE,
                                            CONSTRAINT `FK198BAD77C645F9B7` FOREIGN KEY (`MTE_ID`) REFERENCES `doc_mime_type` (`MT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_base
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_base`;
CREATE TABLE `doc_node_base`  (
                                  `NBS_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `NBS_AUTHOR` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NBS_CONTEXT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NBS_CREATED` datetime(0) NULL DEFAULT NULL,
                                  `NBS_NAME` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NBS_PARENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NBS_PATH` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NDC_SCRIPT_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NDC_SCRIPTING` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  PRIMARY KEY (`NBS_UUID`) USING BTREE,
                                  INDEX `IDX_NODE_BASE_PARENT`(`NBS_PARENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_category
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_category`;
CREATE TABLE `doc_node_category`  (
                                      `NCT_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NCT_CATEGORY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      INDEX `FK79CB24CD7EC0E7A2`(`NCT_NODE`) USING BTREE,
                                      CONSTRAINT `FK79CB24CD7EC0E7A2` FOREIGN KEY (`NCT_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_document
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_document`;
CREATE TABLE `doc_node_document`  (
                                      `NDC_CHECKED_OUT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NDC_CIPHER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NDC_DESCRIPTION` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NDC_ENCRYPTION` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NDC_LANGUAGE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NDC_LAST_MODIFIED` datetime(0) NULL DEFAULT NULL,
                                      `NLK_CREATED` datetime(0) NULL DEFAULT NULL,
                                      `NLK_OWNER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NLK_TOKEN` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NDC_LOCKED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NDC_MIME_TYPE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NDC_SIGNED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NDC_TEXT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                      `NDC_TEXT_EXTRACTED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NDC_TITLE` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NBS_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      PRIMARY KEY (`NBS_UUID`) USING BTREE,
                                      INDEX `FKAA2538EA4829197B`(`NBS_UUID`) USING BTREE,
                                      CONSTRAINT `FKAA2538EA4829197B` FOREIGN KEY (`NBS_UUID`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_document_version
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_document_version`;
CREATE TABLE `doc_node_document_version`  (
                                              `NDV_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                              `NDV_AUTHOR` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_CHECKSUM` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_COMMENT` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_CONTENT` longblob NULL,
                                              `NDV_CREATED` datetime(0) NULL DEFAULT NULL,
                                              `NDV_CURRENT` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                              `NDV_MIME_TYPE` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_PARENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_PREVIOUS` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `NDV_SIZE` bigint(20) NULL DEFAULT NULL,
                                              PRIMARY KEY (`NDV_UUID`) USING BTREE,
                                              UNIQUE INDEX `NDV_PARENT`(`NDV_PARENT`, `NDV_NAME`) USING BTREE,
                                              INDEX `IDX_NOD_DOC_VER_PARENT`(`NDV_PARENT`) USING BTREE,
                                              INDEX `IDX_NOD_DOC_VER_PARCUR`(`NDV_PARENT`, `NDV_CURRENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_folder
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_folder`;
CREATE TABLE `doc_node_folder`  (
                                    `NFL_DESCRIPTION` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `NBS_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    PRIMARY KEY (`NBS_UUID`) USING BTREE,
                                    INDEX `FKBE9C2FFD4829197B`(`NBS_UUID`) USING BTREE,
                                    CONSTRAINT `FKBE9C2FFD4829197B` FOREIGN KEY (`NBS_UUID`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_keyword
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_keyword`;
CREATE TABLE `doc_node_keyword`  (
                                     `NKW_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     `NKW_KEYWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     INDEX `FKD187C1A2B114B87`(`NKW_NODE`) USING BTREE,
                                     CONSTRAINT `FKD187C1A2B114B87` FOREIGN KEY (`NKW_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_note
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_note`;
CREATE TABLE `doc_node_note`  (
                                  `NNT_UUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `NNT_AUTHOR` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NNT_CREATED` datetime(0) NULL DEFAULT NULL,
                                  `NNT_PARENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `NNT_TEXT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                  PRIMARY KEY (`NNT_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_property
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_property`;
CREATE TABLE `doc_node_property`  (
                                      `NPG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `NPG_GROUP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NPG_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `NPG_VALUE` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                      `NPG_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      PRIMARY KEY (`NPG_ID`) USING BTREE,
                                      UNIQUE INDEX `NPG_NODE`(`NPG_NODE`, `NPG_GROUP`, `NPG_NAME`) USING BTREE,
                                      INDEX `FK3B9645A41842E9DC`(`NPG_NODE`) USING BTREE,
                                      CONSTRAINT `FK3B9645A41842E9DC` FOREIGN KEY (`NPG_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_role_permission`;
CREATE TABLE `doc_node_role_permission`  (
                                             `NRP_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                             `NRP_PERMISSION` int(11) NULL DEFAULT NULL,
                                             `NRP_ROLE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                             PRIMARY KEY (`NRP_NODE`, `NRP_ROLE`) USING BTREE,
                                             INDEX `FKF4FBBA89916AFDF5`(`NRP_NODE`) USING BTREE,
                                             CONSTRAINT `FKF4FBBA89916AFDF5` FOREIGN KEY (`NRP_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_subscriptor
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_subscriptor`;
CREATE TABLE `doc_node_subscriptor`  (
                                         `NSB_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                         `NSB_SUBSCRIPTOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                         INDEX `FK159C2BDFAE6D6084`(`NSB_NODE`) USING BTREE,
                                         CONSTRAINT `FK159C2BDFAE6D6084` FOREIGN KEY (`NSB_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_node_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `doc_node_user_permission`;
CREATE TABLE `doc_node_user_permission`  (
                                             `NUP_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                             `NUP_PERMISSION` int(11) NULL DEFAULT NULL,
                                             `NUP_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                             PRIMARY KEY (`NUP_NODE`, `NUP_USER`) USING BTREE,
                                             INDEX `FK68755814301DAFB8`(`NUP_NODE`) USING BTREE,
                                             CONSTRAINT `FK68755814301DAFB8` FOREIGN KEY (`NUP_NODE`) REFERENCES `doc_node_base` (`NBS_UUID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_omr
-- ----------------------------
DROP TABLE IF EXISTS `doc_omr`;
CREATE TABLE `doc_omr`  (
                            `OMR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                            `OMR_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                            `OMR_ASC_FILE_CONTENT` longblob NULL,
                            `OMR_FILE_ASC_MIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_ASC_FILENAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_CONFIG_FILE_CONTENT` longblob NULL,
                            `OMR_FILE_CONFIG_MIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_CONFIG_FILENAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_FIELDS_FILE_CONTENT` longblob NULL,
                            `OMR_FILE_FIELDS_MIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_FIELDS_FILENAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_TEMPLATE_FILE_CONTENT` longblob NULL,
                            `OMR_FILE_TEMPLATE_MIME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `OMR_TEMPLATE_FILENAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`OMR_ID`) USING BTREE,
                            UNIQUE INDEX `OMR_NAME`(`OMR_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_omr_property
-- ----------------------------
DROP TABLE IF EXISTS `doc_omr_property`;
CREATE TABLE `doc_omr_property`  (
                                     `OMP_OMR` bigint(20) NOT NULL,
                                     `OMP_PROPERTY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     INDEX `FKC29BAF0E7E82264E`(`OMP_OMR`) USING BTREE,
                                     CONSTRAINT `FKC29BAF0E7E82264E` FOREIGN KEY (`OMP_OMR`) REFERENCES `doc_omr` (`OMR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_pending_task
-- ----------------------------
DROP TABLE IF EXISTS `doc_pending_task`;
CREATE TABLE `doc_pending_task`  (
                                     `PTK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `PTK_CREATED` datetime(0) NULL DEFAULT NULL,
                                     `PTK_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `PTK_PARAMS` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `PTK_STATUS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                     `PTK_TASK` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     PRIMARY KEY (`PTK_ID`) USING BTREE,
                                     INDEX `IDX_PENDING_NODETASK`(`PTK_NODE`, `PTK_TASK`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_plugin
-- ----------------------------
DROP TABLE IF EXISTS `doc_plugin`;
CREATE TABLE `doc_plugin`  (
                               `PLG_CLASS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `PLG_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`PLG_CLASS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile`;
CREATE TABLE `doc_profile`  (
                                `PRF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                `PRF_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                `PRF_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                `PRF_MSC_ADVANCED_FILTERS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_MSC_USER_QUOTA` bigint(20) NULL DEFAULT 0,
                                `PRF_MSC_WEB_SKIN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default',
                                `PRF_MSC_PRINT_PREVIEW` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MSC_KEYWORDS_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MSC_UPLD_NOTI_USR` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MSC_NOTI_EXTERNAL_USR` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_MSC_ACRO_PLUGIN_PRE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_MSC_INCREASE_VER` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_CHT_CHAT_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_CHT_AUTO_LOGIN_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_PAG_PAGINATION_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_PAG_PAGE_LIST` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '10;25;50;100',
                                `PRF_PAG_TYPE_FILTER_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_PAG_MISC_FILTER_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_PAG_SHOW_FLDS_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_PAG_SHOW_DOCS_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_PAG_SHOW_MAILS_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_WZRD_KEYWORDS_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_WZRD_CATEGORIES_EN` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_STCK_TAXONOMY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_CATEGORIES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_THESAURUS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_TEMPLATES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_PERSONAL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_MAIL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_METADATA_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_STCK_TRASH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DEFAULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'desktop',
                                `PRF_TB_DESKTOP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_SEARCH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DASHBOARD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ADMIN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_PROPS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_SECURITY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_NOTES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_VERSIONS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_VERSION_DOWN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_PREVIEW_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOC_PROP_GRPS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_FLD_PROPS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_FLD_SECURITY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_FLD_NOTES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ML_PROPS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ML_PREVIEW_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ML_SECURITY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ML_NOTES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_USER_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_MAIL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_NEWS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_GENERAL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_WORKFLOW_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_DB_KEYWORDS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FILE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_EDIT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TOOLS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_BOOKMARKS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TEMPLATES_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HELP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_CREATE_FLD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_FIND_FLD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_FIND_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_SIMILAR_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_GO_FLD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_DOWNLOAD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_DOWNLOAD_PDF_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_ADD_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_START_WORKFLOW_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_REFRESH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_PURGE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_PURGE_TRASH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_RESTORE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_EXPORT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_CREATE_FROM_TPL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_SEND_DOC_LINK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_SEND_DOC_ATTACH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_FI_FORWARD_MAIL_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_LOCK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_UNLOCK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_CIN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_COUT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_CANCEL_COUT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_DELETE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_RENAME_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_COPY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_MOVE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_ADD_SUBS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_REM_SUBS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_ADD_PROP_GRP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_UPDATE_PROP_GRP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_REM_PROP_GRP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_ADD_NOTE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_REM_NOTE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_ADD_CATEGORY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_REM_CATEGORY_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_ADD_KEYWORD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_REM_KEYWORD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_ED_MERGE_PDF_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_BM_MNG_BOOKMARKS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_BM_ADD_BOOKMARK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_BM_SET_HOME_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_BM_GO_HOME_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_LANGS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_SKIN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_DEBUG_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_ADMIN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_PREFS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_TL_OMR_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_MN_TL_CONVERT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_BUG_TRACKING_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_SUPPORT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_FORUM_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_CHANGELOG_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MN_HLP_WEB_SITE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_MNU_HLP_ABOUT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_CREATE_FLD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_FIND_FLD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_FIND_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_SIMILAR_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOWNLOAD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DOWNLOAD_PDF_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_PRINT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_LOCK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_UNLOCK_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ADD_DOC_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_COUT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_CIN_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_CANCEL_COUT_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_DELETE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ADD_PROP_GRP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_REM_PROP_GRP_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_START_WORKFLOW_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_ADD_SUBS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_REM_SUBS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_REFRESH_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_HOME_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_SPLITTER_RS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_TB_OMR_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'F',
                                `PRF_FB_STATUS_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_MASSIVE_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_ICON_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_NAME_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_SIZE_PDF_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_LAST_MOD_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_AUTHOR_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_VERSION_VIS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'T',
                                `PRF_FB_COLUMN0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_COLUMN9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `PRF_FB_STATUS_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '60',
                                `PRF_FB_MASSIVE_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '30',
                                `PRF_FB_ICON_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '25',
                                `PRF_FB_NAME_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '250',
                                `PRF_FB_SIZE_PDF_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '60',
                                `PRF_FB_LAST_MOD_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '150',
                                `PRF_FB_AUTHOR_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '120',
                                `PRF_FB_VERSION_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '60',
                                `PRF_FB_COLUMN0_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN1_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN2_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN3_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN4_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN5_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN6_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN7_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN8_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                `PRF_FB_COLUMN9_WIDTH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100',
                                PRIMARY KEY (`PRF_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile_msc_extension
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile_msc_extension`;
CREATE TABLE `doc_profile_msc_extension`  (
                                              `PEX_ID` bigint(20) NOT NULL,
                                              `PEX_EXTENSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              INDEX `FK92E57DB9DE9B36F3`(`PEX_ID`) USING BTREE,
                                              CONSTRAINT `FK92E57DB9DE9B36F3` FOREIGN KEY (`PEX_ID`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile_msc_report
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile_msc_report`;
CREATE TABLE `doc_profile_msc_report`  (
                                           `PRP_ID` bigint(20) NOT NULL,
                                           `PRP_REPORT` bigint(20) NULL DEFAULT NULL,
                                           INDEX `FK1C67EDDADF4EC588`(`PRP_ID`) USING BTREE,
                                           CONSTRAINT `FK1C67EDDADF4EC588` FOREIGN KEY (`PRP_ID`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile_msc_workflow
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile_msc_workflow`;
CREATE TABLE `doc_profile_msc_workflow`  (
                                             `PMW_ID` bigint(20) NOT NULL,
                                             `PMW_WORKFLOW` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                             INDEX `FKBDB3DAE5DF0B7E9C`(`PMW_ID`) USING BTREE,
                                             CONSTRAINT `FKBDB3DAE5DF0B7E9C` FOREIGN KEY (`PMW_ID`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile_wzrd_prop_grp
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile_wzrd_prop_grp`;
CREATE TABLE `doc_profile_wzrd_prop_grp`  (
                                              `PPG_ID` bigint(20) NOT NULL,
                                              `PPG_PROPERTY_GROUP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              INDEX `FK86D64A8FDF2E7F2F`(`PPG_ID`) USING BTREE,
                                              CONSTRAINT `FK86D64A8FDF2E7F2F` FOREIGN KEY (`PPG_ID`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profile_wzrd_workflow
-- ----------------------------
DROP TABLE IF EXISTS `doc_profile_wzrd_workflow`;
CREATE TABLE `doc_profile_wzrd_workflow`  (
                                              `PWF_ID` bigint(20) NOT NULL,
                                              `PWF_WORKFLOW` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              INDEX `FKC4189C65DF90AF57`(`PWF_ID`) USING BTREE,
                                              CONSTRAINT `FKC4189C65DF90AF57` FOREIGN KEY (`PWF_ID`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_profiling
-- ----------------------------
DROP TABLE IF EXISTS `doc_profiling`;
CREATE TABLE `doc_profiling`  (
                                  `PRL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                  `PRL_CLAZZ` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `PRL_DATE` datetime(0) NULL DEFAULT NULL,
                                  `PRL_METHOD` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `PRL_PARAMS` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `PRL_TIME` bigint(20) NULL DEFAULT NULL,
                                  `PRL_TRACE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                  `PRL_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  PRIMARY KEY (`PRL_ID`) USING BTREE,
                                  INDEX `IDX_PROFILING_DATE`(`PRL_DATE`) USING BTREE,
                                  INDEX `IDX_PROFILING_DATCLS`(`PRL_DATE`, `PRL_CLAZZ`) USING BTREE,
                                  INDEX `IDX_PROFILING_USRCLS`(`PRL_USER`, `PRL_CLAZZ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_prop_query_received
-- ----------------------------
DROP TABLE IF EXISTS `doc_prop_query_received`;
CREATE TABLE `doc_prop_query_received`  (
                                            `PQR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                            `PQR_FROM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                            `PQR_TO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                            `PQR_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                            `PQR_COMMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                            `PQR_ACCEPTED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                            `PQR_SENT_DATE` datetime(0) NOT NULL,
                                            `PQR_SEEN_DATE` datetime(0) NULL DEFAULT NULL,
                                            `PQR_QUERY` bigint(20) NULL DEFAULT NULL,
                                            PRIMARY KEY (`PQR_ID`) USING BTREE,
                                            INDEX `FK6222C4A64847281B`(`PQR_QUERY`) USING BTREE,
                                            CONSTRAINT `FK6222C4A64847281B` FOREIGN KEY (`PQR_QUERY`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_prop_query_sent
-- ----------------------------
DROP TABLE IF EXISTS `doc_prop_query_sent`;
CREATE TABLE `doc_prop_query_sent`  (
                                        `PQS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                        `PQS_FROM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        `PQS_TO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        `PQS_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        `PQS_COMMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                        `PQS_SENT_DATE` datetime(0) NOT NULL,
                                        `PQS_QUERY` bigint(20) NULL DEFAULT NULL,
                                        PRIMARY KEY (`PQS_ID`) USING BTREE,
                                        INDEX `FKCB9DDCDD7D2D635C`(`PQS_QUERY`) USING BTREE,
                                        CONSTRAINT `FKCB9DDCDD7D2D635C` FOREIGN KEY (`PQS_QUERY`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_prop_sub_received
-- ----------------------------
DROP TABLE IF EXISTS `doc_prop_sub_received`;
CREATE TABLE `doc_prop_sub_received`  (
                                          `PSR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `PSR_FROM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_TO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_TYPE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_COMMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                          `PSR_ACCEPTED` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                          `PSR_SENT_DATE` datetime(0) NOT NULL,
                                          `PSR_SEEN_DATE` datetime(0) NULL DEFAULT NULL,
                                          PRIMARY KEY (`PSR_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_prop_sub_sent
-- ----------------------------
DROP TABLE IF EXISTS `doc_prop_sub_sent`;
CREATE TABLE `doc_prop_sub_sent`  (
                                      `PS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `PS_FROM` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `PS_TO` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `PS_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `PS_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `PS_TYPE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                      `PS_COMMENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                      `PS_SENT_DATE` datetime(0) NOT NULL,
                                      PRIMARY KEY (`PS_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_query_params
-- ----------------------------
DROP TABLE IF EXISTS `doc_query_params`;
CREATE TABLE `doc_query_params`  (
                                     `QP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `QP_QUERY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     `QP_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     `QP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_CONTENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_MIME_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_DASHBOARD` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_LAST_MODIFIED_FROM` datetime(0) NULL DEFAULT NULL,
                                     `QP_LAST_MODIFIED_TO` datetime(0) NULL DEFAULT NULL,
                                     `QP_MAIL_SUBJECT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_MAIL_FROM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_MAIL_TO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `QP_STATEMENT_QUERY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                                     `QP_STATEMENT_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     PRIMARY KEY (`QP_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_query_params_category
-- ----------------------------
DROP TABLE IF EXISTS `doc_query_params_category`;
CREATE TABLE `doc_query_params_category`  (
                                              `QPC_ID` bigint(20) NOT NULL,
                                              `QPC_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              INDEX `FKE27BE632200C4397`(`QPC_ID`) USING BTREE,
                                              CONSTRAINT `FKE27BE632200C4397` FOREIGN KEY (`QPC_ID`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_query_params_keyword
-- ----------------------------
DROP TABLE IF EXISTS `doc_query_params_keyword`;
CREATE TABLE `doc_query_params_keyword`  (
                                             `QPK_ID` bigint(20) NOT NULL,
                                             `QPK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                             INDEX `FK4A477A15200FE68F`(`QPK_ID`) USING BTREE,
                                             CONSTRAINT `FK4A477A15200FE68F` FOREIGN KEY (`QPK_ID`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_query_params_property
-- ----------------------------
DROP TABLE IF EXISTS `doc_query_params_property`;
CREATE TABLE `doc_query_params_property`  (
                                              `QPP_ID` bigint(20) NOT NULL,
                                              `QPP_VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                              `QPP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                              PRIMARY KEY (`QPP_ID`, `QPP_NAME`) USING BTREE,
                                              INDEX `FKA447070920122C6A`(`QPP_ID`) USING BTREE,
                                              CONSTRAINT `FKA447070920122C6A` FOREIGN KEY (`QPP_ID`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_query_params_shared
-- ----------------------------
DROP TABLE IF EXISTS `doc_query_params_shared`;
CREATE TABLE `doc_query_params_shared`  (
                                            `QPS_ID` bigint(20) NOT NULL,
                                            `QPS_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                            INDEX `FK20AF969920138987`(`QPS_ID`) USING BTREE,
                                            CONSTRAINT `FK20AF969920138987` FOREIGN KEY (`QPS_ID`) REFERENCES `doc_query_params` (`QP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_reg_property
-- ----------------------------
DROP TABLE IF EXISTS `doc_reg_property`;
CREATE TABLE `doc_reg_property`  (
                                     `RPR_GROUP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     `RPR_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                     `RPR_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     PRIMARY KEY (`RPR_GROUP`, `RPR_NAME`) USING BTREE,
                                     INDEX `FKB3632CCED4ABA44F`(`RPR_GROUP`) USING BTREE,
                                     CONSTRAINT `FKB3632CCED4ABA44F` FOREIGN KEY (`RPR_GROUP`) REFERENCES `doc_reg_property_group` (`RPG_NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_reg_property_group
-- ----------------------------
DROP TABLE IF EXISTS `doc_reg_property_group`;
CREATE TABLE `doc_reg_property_group`  (
                                           `RPG_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                           PRIMARY KEY (`RPG_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_report
-- ----------------------------
DROP TABLE IF EXISTS `doc_report`;
CREATE TABLE `doc_report`  (
                               `RP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                               `RP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `RP_FILE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `RP_FILE_MIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `RP_FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `RP_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               PRIMARY KEY (`RP_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_role
-- ----------------------------
DROP TABLE IF EXISTS `doc_role`;
CREATE TABLE `doc_role`  (
                             `ROL_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             `ROL_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             PRIMARY KEY (`ROL_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_staple
-- ----------------------------
DROP TABLE IF EXISTS `doc_staple`;
CREATE TABLE `doc_staple`  (
                               `ST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                               `ST_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `ST_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                               `ST_GROUPID` bigint(20) NULL DEFAULT NULL,
                               PRIMARY KEY (`ST_ID`) USING BTREE,
                               INDEX `FK45419DD7747CFA54`(`ST_GROUPID`) USING BTREE,
                               CONSTRAINT `FK45419DD7747CFA54` FOREIGN KEY (`ST_GROUPID`) REFERENCES `doc_staple_group` (`SG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_staple_group
-- ----------------------------
DROP TABLE IF EXISTS `doc_staple_group`;
CREATE TABLE `doc_staple_group`  (
                                     `SG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `SG_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                     PRIMARY KEY (`SG_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_translation
-- ----------------------------
DROP TABLE IF EXISTS `doc_translation`;
CREATE TABLE `doc_translation`  (
                                    `TR_MODULE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `TR_KEY` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `TR_LANGUAGE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `TR_TEXT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    PRIMARY KEY (`TR_MODULE`, `TR_KEY`, `TR_LANGUAGE`) USING BTREE,
                                    INDEX `FK91A2B543DE0D861E`(`TR_LANGUAGE`) USING BTREE,
                                    CONSTRAINT `FK91A2B543DE0D861E` FOREIGN KEY (`TR_LANGUAGE`) REFERENCES `doc_language` (`LG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_twitter_account
-- ----------------------------
DROP TABLE IF EXISTS `doc_twitter_account`;
CREATE TABLE `doc_twitter_account`  (
                                        `TA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
                                        `TA_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        `TA_TUSER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        `TA_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                        PRIMARY KEY (`TA_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user
-- ----------------------------
DROP TABLE IF EXISTS `doc_user`;
CREATE TABLE `doc_user`  (
                             `USR_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             `USR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             `USR_PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             `USR_EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             `USR_ACTIVE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                             PRIMARY KEY (`USR_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user_config
-- ----------------------------
DROP TABLE IF EXISTS `doc_user_config`;
CREATE TABLE `doc_user_config`  (
                                    `UC_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `UC_HOME_PATH` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `UC_HOME_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `UC_HOME_TYPE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `UC_PROFILE` bigint(20) NULL DEFAULT NULL,
                                    PRIMARY KEY (`UC_USER`) USING BTREE,
                                    INDEX `FK7798F4E88FDAFE34`(`UC_PROFILE`) USING BTREE,
                                    CONSTRAINT `FK7798F4E88FDAFE34` FOREIGN KEY (`UC_PROFILE`) REFERENCES `doc_profile` (`PRF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user_items
-- ----------------------------
DROP TABLE IF EXISTS `doc_user_items`;
CREATE TABLE `doc_user_items`  (
                                   `UI_USER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                   `UI_DOCUMENTS` bigint(20) NULL DEFAULT NULL,
                                   `UI_FOLDERS` bigint(20) NULL DEFAULT NULL,
                                   `UI_MAILS` bigint(20) NULL DEFAULT NULL,
                                   `UI_SIZE` bigint(20) NULL DEFAULT NULL,
                                   PRIMARY KEY (`UI_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user_node
-- ----------------------------
DROP TABLE IF EXISTS `doc_user_node`;
CREATE TABLE `doc_user_node`  (
                                  `UN_ID` int(11) NOT NULL AUTO_INCREMENT,
                                  `UN_NODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `UN_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  PRIMARY KEY (`UN_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user_node_keyword
-- ----------------------------
DROP TABLE IF EXISTS `doc_user_node_keyword`;
CREATE TABLE `doc_user_node_keyword`  (
                                          `UNK_ID` int(11) NOT NULL,
                                          `UNK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                          INDEX `FK37F6FDB2CD298BB8`(`UNK_ID`) USING BTREE,
                                          CONSTRAINT `FK37F6FDB2CD298BB8` FOREIGN KEY (`UNK_ID`) REFERENCES `doc_user_node` (`UN_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `doc_user_role`;
CREATE TABLE `doc_user_role`  (
                                  `UR_USER` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  `UR_ROLE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                  PRIMARY KEY (`UR_USER`, `UR_ROLE`) USING BTREE,
                                  INDEX `FK79C279CF1BE829B`(`UR_ROLE`) USING BTREE,
                                  INDEX `FK79C279CF1C15945`(`UR_USER`) USING BTREE,
                                  CONSTRAINT `FK79C279CF1BE829B` FOREIGN KEY (`UR_ROLE`) REFERENCES `doc_role` (`ROL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
                                  CONSTRAINT `FK79C279CF1C15945` FOREIGN KEY (`UR_USER`) REFERENCES `doc_user` (`USR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;




SET FOREIGN_KEY_CHECKS = 1;
