/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 39.105.72.237:3306
 Source Schema         : laputa_pdm_config

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/02/2020 15:40:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `c_schema` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'jasypt:\n  encryptor:\n    password: laputa\n    \nspring:\n  redis:\n    host: laputa-redis\n    password: yvonne78\n  servlet:\n    multipart:\n      max-file-size: 100MB\n      max-request-size: 100MB\n  cloud:\n    sentinel:\n      transport:\n        dashboard: laputa-sentinel:5020\n                \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n\nmybatis-plus:\n  tenant-enable: ture\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      field-strategy: NOT_EMPTY\n  type-handlers-package:  com.laputa.pdm.common.data.handler\n\nswagger:\n  title: Laputa PDM Swagger API\n  license: Powered By Laputa \n  licenseUrl: https://www.laputapdm.com/\n  terms-of-service-url: https://laputapdm.com/\n  contact:\n    email: sommer_jiang@163.com\n    url: https://laputapdm.com/about.html\n  authorization:\n    name: Laputa PDM OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY-HOST:laputa-gateway}:${GATEWAY-PORT:10000}/auth/oauth/token\n\nsecurity:\n  oauth2:\n    client:\n      ignore-urls:\n        - /actuator/**\n        - /v2/api-docs\n    resource:\n      loadBalanced: true\n      token-info-uri: http://laputa-auth/oauth/check_token', '371ef97ef49385e9d2ca26711ff204dd', '2019-04-18 02:10:20', '2020-01-17 10:53:00', NULL, '0:0:0:0:0:0:0:1', '', '', '通用配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (2, 'laputa-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', 'a6674e6747c1a0bb6c6d78e13706f8f0', '2019-04-18 02:11:32', '2019-08-27 18:24:04', NULL, '127.0.0.1', '', '', '认证中心配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (3, 'laputa-codegen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_codegen}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\nlaputa:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_datasource_conf', '61ba28b8a6c3a09b35c3f2378ab6acd1', '2019-04-18 02:12:10', '2020-01-21 09:44:44', NULL, '222.191.229.234', '', '', '代码生成', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (4, 'laputa-daemon-elastic-job-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n## 定时任务\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  elasticjob:\n    # 分布式任务协调依赖zookeeper\n    zookeeper:\n      server-lists: ${ZOOKEEPER-HOST:laputa-zookeeper}:${ZOOKEEPER-PORT:2181}\n      namespace: laputa-daemon\n    # 普通任务\n    simples:\n      spring-simple-job:\n        job-class: com.laputa.pdm.daemon.elastic.job.PigxSimpleJob\n        cron: 0 0 0/1 * * ?\n        sharding-total-count: 3\n        sharding-item-parameters: 0=service1,1=service2,2=service3\n        eventTraceRdbDataSource: \'dataSource\'\n        listener:\n          listener-class: com.laputa.pdm.daemon.elastic.listener.PigxElasticJobListener\n      spring-simple-job2:\n        job-class: com.laputa.pdm.daemon.elastic.job.PigxSimpleJob2\n        cron: 0 0 0/1 * * ?\n        sharding-total-count: 3\n        sharding-item-parameters: 0=service1,1=service2,2=service3\n        eventTraceRdbDataSource: \'dataSource\'\n        listener:\n          listener-class: com.laputa.pdm.daemon.elastic.listener.PigxElasticJobListener\n    # 简单任务\n    dataflows:\n      spring-dataflow-job:\n        job-class: com.laputa.pdm.daemon.elastic.job.PigxDataflowJob\n        cron: 0 0 0/1 * * ?\n        sharding-total-count: 3\n        sharding-item-parameters: 0=service1,1=service2,2=service3\n        streaming-process: true\n        eventTraceRdbDataSource: \'dataSource\'\n        listener:\n          distributed-listener-class: com.laputa.pdm.daemon.elastic.listener.PigxDistributeElasticJobListener\n          started-timeout-milliseconds: 5000\n          completed-timeout-milliseconds: 10000\n\nxxl:\n  job:\n    admin:\n      addresses: http://${XXL-HOST:laputa-xxl}:${XXL-HOST:9080}/xxl-job-admin\n    executor:\n      port: 9988\n      appName: test-xxl', '6ef3b7f3c16b5b044875c995a7e0c96d', '2019-04-18 02:12:57', '2020-01-17 10:09:44', NULL, '0:0:0:0:0:0:0:1', '', '', '定时任务-elastic-job配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (5, 'laputa-gateway-dev.yml', 'DEFAULT_GROUP', 'security:\n  encode:\n    key: \'laputapdmslaputa\'\n\nignore:\n  clients:\n    - test\n  swagger-providers:\n    - laputa-auth\n    - laputa-tx-manager\n\nribbon:\n  rule:\n    gray-enabled: true', '3719a6e60e93a0320954a01a17a78fc1', '2019-04-18 02:13:52', '2020-01-17 10:43:40', NULL, '0:0:0:0:0:0:0:1', '', '', '网关配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (6, 'laputa-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      password: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n  boot:\n    admin:\n      ui:\n        title: \'Laputa PDM 服务状态监控\'\n        brand: \'Laputa PDM  服务状态监控\'\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS  #显示详细信息', '01c3fd420654fff4d33ee2fe88e4f75d', '2019-04-18 02:14:17', '2020-01-17 09:41:50', NULL, '0:0:0:0:0:0:0:1', '', '', '监控配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (7, 'laputa-upms-biz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n      ignore-urls:\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\nminio:\n  url: http://129.211.7.213:9000\n  access-key: sommer78\n  secret-key: Yvonne@1227\n\n# Logger Config\nlogging:\n  level:\n    com.laputa.pdm.admin.mapper: debug\n\n# 租户表维护\nlaputa:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file\n  sms:\n    accessKeyId: LTAIQYowl1zz8gzf\n    accessKeySecret: VphoHmcNQF8aaxpa330Re2zJLIgQX0\n    signName: 龙猫的个人空间\n    verifyCodeTemplate: SMS_168415576', '80b5edd25cb1018b59eb723264f6446b', '2019-04-18 02:32:44', '2020-02-14 13:52:07', NULL, '222.191.229.234', '', '', 'admin 服务配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'laputa-tx-manager-dev.yml', 'DEFAULT_GROUP', '# 页面配置\nspring:\n  mvc:\n    static-path-pattern: /**\n  resources:\n    static-locations: classpath:/static/\n\n\n# LCN 配置\ntm:\n  transaction:\n    netty:\n      delaytime: 5   # 客户端链接最大通讯时间 （秒）\n      hearttime: 15  # 客户端心跳时间   （秒）\n  redis:\n    savemaxtime: 30  # redis 保存时间  （秒）\n  socket:\n    port: 9998       # 通讯端口\n    maxconnection: 1000  #最大链接数\n  compensate:\n    auto: false   #是否自动补偿\n    notifyUrl: http://ip:port/path #补偿结果通知（配消息总线里面）\n    tryTime: 30     # z再次重试时间间隔\n    maxWaitTime: 5000   # 请求超时的最大时间 (毫秒)', '885f5c125f2df7a08692929ccce154be', '2019-04-18 02:54:03', '2019-04-18 02:54:03', NULL, '127.0.0.1', '', '', '分布式事务协调模块', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (9, 'laputa-daemon-quartz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n  quartz:\n    #相关属性配置\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: clusteredScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.quartz.impl.jdbcjobstore.JobStoreTX\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            clusterCheckinInterval: 10000\n            useProperties: false\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 50\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n    #数据库方式\n    job-store-type: jdbc\n    #初始化表结构\n    #jdbc:\n    #initialize-schema: never\n\n', '9e533f94464fb4ad359da2b7da19245e', '2019-04-18 03:08:34', '2020-01-17 10:08:53', NULL, '0:0:0:0:0:0:0:1', '', '', 'quartz 配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (10, 'laputa-pay-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_pay}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\nlaputa:\n  pay:\n    test: lengleng\n    aliPayConfig:\n      expire-time: 30\n      return-url: http://pig4cloud.com\n      notify-url: https://admin.pig4cloud.com/pay/notify/ali/callbak\n    wxPayConfig:\n      notify-url: https://admin.pig4cloud.com/pay/notify/wx/callbak\n  xsequence:    #发号器相关配置\n    db:\n      retry-times: 3\n      table-name: pay_sequence\n  tenant:\n    column: tenant_id\n    tables:\n      - pay_channel\n      - pay_trade_order\n      - pay_goods_order\n      - pay_notify_record', '4536f0e3c3e1a0413fe0e7fca14f3885', '2019-05-28 11:46:27', '2020-01-21 09:46:03', NULL, '222.191.229.234', '', '', '支付模块配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (11, 'laputa-oa-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n      ignore-urls:\n        - \'/actuator/**\'\n        - \'/v2/api-docs\'\n        - \'/editor-app/**\'\n        - \'/modeler.html\'\n        - \'/ws/**\'\nspring:\n  autoconfigure:\n    exclude: org.activiti.spring.boot.SecurityAutoConfiguration\n  activiti:\n    check-process-definitions: false\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_ac}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\nlaputa:\n  tenant:\n    column: tenant_id\n    tables:\n      - oa_leave_bill', 'be57ab29ac79c7e28cac2603ddb5a676', '2019-10-16 16:38:52', '2020-01-21 09:46:19', NULL, '222.191.229.234', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (12, 'laputa-mp-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_mp}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n\n# 租户表维护\nlaputa:\n  tenant:\n    column: tenant_id\n    tables:\n      - wx_mp_menu\n      - wx_account\n      - wx_account_fans\n      - wx_fans_msg_res', 'b0ba030a3c1e280288a14b5f7cfb38ad', '2019-10-21 08:58:24', '2020-01-21 09:46:33', NULL, '222.191.229.234', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (34, 'laputa-message-biz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.admin.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file', 'fd391be821795d3d355f52b7781a5dbd', '2020-02-10 13:54:52', '2020-02-17 15:54:29', NULL, '222.191.229.234', '', '', 'laputa pdm message ', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (36, 'laputa-doc-biz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_doc}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.doc.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - doc_vault\r\n      \r\n', 'ed5f61131a56d5d9c29a91020e44ba40', '2020-02-17 15:52:17', '2020-02-18 09:13:34', NULL, '222.191.229.234', '', '', 'null', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `datum_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `src_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 26, 'laputa-message-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.admin.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file', '25f4f0467262bf36b21c32fb0f9da981', '2010-05-05 00:00:00', '2020-02-10 13:54:52', NULL, '222.191.229.234', 'I', '');
INSERT INTO `his_config_info` VALUES (7, 27, 'laputa-upms-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\n      scope: server\n      ignore-urls:\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:Yvonne@1227}\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\nminio:\n  url: http://129.211.7.213:9000\n  access-key: sommer78\n  secret-key: Yvonne@1227\n\n# Logger Config\nlogging:\n  level:\n    com.laputa.pdm.admin.mapper: debug\n\n# 租户表维护\nlaputa:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file', '8856d2d8f13c012f9233c3b80593a2b3', '2010-05-05 00:00:00', '2020-02-14 13:52:07', NULL, '222.191.229.234', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 28, 'laputa-doc-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.admin.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file\r\n', 'b722e07fada1a218c4eeed6ac014fe61', '2010-05-05 00:00:00', '2020-02-17 15:52:17', NULL, '222.191.229.234', 'I', '');
INSERT INTO `his_config_info` VALUES (34, 29, 'laputa-message-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.admin.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file', '25f4f0467262bf36b21c32fb0f9da981', '2010-05-05 00:00:00', '2020-02-17 15:54:29', NULL, '222.191.229.234', 'U', '');
INSERT INTO `his_config_info` VALUES (36, 30, 'laputa-doc-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.admin.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file\r\n', 'b722e07fada1a218c4eeed6ac014fe61', '2010-05-05 00:00:00', '2020-02-18 08:45:52', NULL, '222.191.229.234', 'U', '');
INSERT INTO `his_config_info` VALUES (36, 31, 'laputa-doc-biz-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      client-secret: ENC(Tf+S6vqHdTOCkcT749FGmQ==)     # laputa\r\n      scope: server\r\n      ignore-urls:\r\n        - /druid/**\r\n        - /actuator/**\r\n        - /v2/api-docs\r\n\r\n# 数据源\r\nspring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      username: ${MYSQL-USER:root}\r\n      password: ${MYSQL-PWD:Yvonne@1227}\r\n      url: jdbc:mysql://${MYSQL-HOST:laputa-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:laputa_pdm_doc}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          enabled: true\r\n          log-slow-sql: true\r\n          slow-sql-millis: 10000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n# 文件系统 (提供测试环境，不要乱传)\r\nminio:\r\n  url: http://129.211.7.213:9000\r\n  access-key: sommer78\r\n  secret-key: Yvonne@1227\r\n\r\n# Logger Config\r\nlogging:\r\n  level:\r\n    com.laputa.pdm.doc.mapper: debug\r\n\r\n# 租户表维护\r\nlaputa:\r\n  tenant:\r\n    column: tenant_id\r\n    tables:\r\n      - sys_user\r\n      - sys_role\r\n      - sys_dept\r\n      - sys_log\r\n      - sys_social_details\r\n      - sys_dict\r\n      - sys_dict_item\r\n      - sys_public_param\r\n      - sys_log\r\n      - sys_file\r\n', '6e27c00b3e50793c8bfdaaad7f6fc581', '2010-05-05 00:00:00', '2020-02-18 09:13:34', NULL, '222.191.229.234', 'U', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '3bd14074-1dc5-4afc-ad04-506230b73923', 'SENTINEL_GROUP', 'sentinel 相关', 'nacos', 1570872049054, 1570872049054);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$1fXDf9q5CKAA.Fe4rjTzzONGDI4cXFvMfPx9Yribr9OQC2.JDe/wK', 1);

SET FOREIGN_KEY_CHECKS = 1;
