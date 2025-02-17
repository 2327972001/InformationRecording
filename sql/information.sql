/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : information

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2022-06-03 14:42:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'zym_info', '信息记录管理', '', null, 'ZymInfo', 'crud', 'com.ruoyi', 'information', 'manager', '信息记录管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"产品管理\",\"treeCode\":\"\"}', 'admin', '2022-06-02 15:02:53', '', '2022-06-02 15:10:25', '');
INSERT INTO `gen_table` VALUES ('2', 'zym_product', '产品列表', '', null, 'ZymProduct', 'crud', 'com.ruoyi', 'product', 'manager', '产品列表', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"产品管理\",\"treeCode\":\"\"}', 'admin', '2022-06-02 15:02:53', '', '2022-06-02 16:33:33', '');
INSERT INTO `gen_table` VALUES ('4', 'zym_classification', '分类列表', '', null, 'ZymClassification', 'crud', 'com.ruoyi', 'classification', 'manager', '分类列表', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"产品管理\",\"treeCode\":\"\"}', 'admin', '2022-06-02 15:46:28', '', '2022-06-02 15:47:45', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '信息id', 'int(10)', 'Integer', 'id', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'userinfo', '客户信息', 'varchar(50)', 'String', 'userinfo', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'note', '备注', 'varchar(50)', 'String', 'note', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'wechat', '微信', 'varchar(20)', 'String', 'wechat', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'qq', 'QQ', 'varchar(20)', 'String', 'qq', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'number', '数量', 'int(10)', 'Integer', 'number', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 15:10:25');
INSERT INTO `gen_table_column` VALUES ('7', '2', 'id', '商品id', 'int(10)', 'Integer', 'id', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('8', '2', 'cid', '项目类别id', 'int(10)', 'Integer', 'cid', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '2', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('9', '2', 'uid', '用户id', 'int(10)', 'Integer', 'uid', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '3', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('10', '2', 'elasticip', '弹性IP', 'varchar(20)', 'String', 'elasticip', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('11', '2', 'note', '备注', 'varchar(50)', 'String', 'note', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('12', '2', 'bandwidth', '带宽', 'varchar(10)', 'String', 'bandwidth', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'region', '地区', 'varchar(10)', 'String', 'region', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'category', '项目类别', 'varchar(20)', 'String', 'category', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'username', '账号', 'varchar(20)', 'String', 'username', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '10', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'starttime', '开始时间', 'datetime', 'Date', 'starttime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'endtime', '到期时间', 'datetime', 'Date', 'endtime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('18', '2', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'zym_cp_status', '8', 'admin', '2022-06-02 15:02:53', null, '2022-06-02 16:33:33');
INSERT INTO `gen_table_column` VALUES ('23', '4', 'id', '分类id', 'int(10)', 'Integer', 'id', '1', '1', null, null, null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-06-02 15:46:28', null, '2022-06-02 15:47:45');
INSERT INTO `gen_table_column` VALUES ('24', '4', 'name', '项目类别', 'varchar(10)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-06-02 15:46:28', null, '2022-06-02 15:47:45');
INSERT INTO `gen_table_column` VALUES ('25', '4', 'note', '备注', 'varchar(50)', 'String', 'note', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-06-02 15:46:28', null, '2022-06-02 15:47:45');
INSERT INTO `gen_table_column` VALUES ('26', '4', 'number', '数量', 'int(10)', 'Integer', 'number', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-06-02 15:46:28', null, '2022-06-02 15:47:45');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-blue', 'Y', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:35:39', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:37:19', '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.footer', 'false', 'Y', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:37:30', '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES ('10', '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-06-02 14:11:47', '', null, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '信息记录平台', '0', '', '', '', '0', '0', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 15:50:46');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('103', '100', '0,100', '管理部门', '1', '', '', '', '0', '0', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 15:51:59');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-06-02 14:11:47', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-06-02 14:11:47', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-06-02 14:11:47', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '1', '正常', '0', 'zym_cp_status', null, null, 'Y', '0', 'admin', '2022-06-02 15:32:47', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('101', '2', '到期', '1', 'zym_cp_status', null, null, 'Y', '0', 'admin', '2022-06-02 15:32:58', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('102', '3', '停用', '22', 'zym_cp_status', null, null, 'Y', '0', 'admin', '2022-06-02 15:33:15', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('103', '1', '男', '0', 'zym_sex', null, null, 'Y', '0', 'admin', '2022-06-03 13:42:52', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('104', '2', '女', '1', 'zym_sex', null, null, 'Y', '0', 'admin', '2022-06-03 13:43:01', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('105', '1', '未使用', '0', 'zym_free_status', '', '', 'Y', '0', 'admin', '2022-06-04 00:02:33', 'admin', '2022-06-04 00:18:36', '');
INSERT INTO `sys_dict_data` VALUES ('106', '2', '已使用', '1', 'zym_free_status', '', '', 'Y', '0', 'admin', '2022-06-04 00:02:42', 'admin', '2022-06-04 00:18:41', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-06-02 14:11:47', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-06-02 14:11:47', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-06-02 14:11:47', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-06-02 14:11:47', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-06-02 14:11:47', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-06-02 14:11:47', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-06-02 14:11:47', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-06-02 14:11:47', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-06-02 14:11:47', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-06-02 14:11:47', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '产品状态', 'zym_cp_status', '0', 'admin', '2022-06-02 15:32:12', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('101', '客户性别', 'zym_sex', '0', 'admin', '2022-06-03 13:42:40', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('102', '空闲状态', 'zym_free_status', '0', 'admin', '2022-06-04 00:02:19', '', null, null);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_job` VALUES ('4', '检测到期', 'DEFAULT', 'timingTask.start', '0 */1 * * * ?', '1', '1', '0', 'admin', '2022-06-04 15:20:43', '', '2022-06-04 15:20:46', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2021 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-06-02 14:11:47', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-06-02 14:11:47', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'menuItem', 'M', '1', '1', '', 'fa fa-bars', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:38:39', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-06-02 14:11:47', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'menuItem', 'C', '1', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:34:41', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-06-02 14:11:47', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'menuItem', 'C', '1', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:34:50', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'menuItem', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:34:56', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'menuItem', 'C', '1', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:35:04', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-06-02 14:11:47', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'menuItem', 'C', '1', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 23:35:14', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-06-02 14:11:47', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-06-02 14:11:47', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-06-02 14:11:47', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-06-02 14:11:47', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-06-02 14:11:47', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-06-02 14:11:47', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-06-02 14:11:47', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-06-02 14:11:47', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-06-02 14:11:47', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-06-02 14:11:47', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-06-02 14:11:47', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-06-02 14:11:47', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '产品管理', '0', '5', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-cube', 'admin', '2022-06-02 15:06:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '信息列表', '2000', '3', '/information/manager', 'menuItem', 'C', '0', '1', 'information:manager:view', '#', 'admin', '2022-06-02 15:12:08', 'admin', '2022-06-02 15:49:24', '信息记录管理菜单');
INSERT INTO `sys_menu` VALUES ('2002', '信息记录管理查询', '2001', '1', '#', '', 'F', '0', '1', 'information:manager:list', '#', 'admin', '2022-06-02 15:12:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '信息记录管理新增', '2001', '2', '#', '', 'F', '0', '1', 'information:manager:add', '#', 'admin', '2022-06-02 15:12:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '信息记录管理修改', '2001', '3', '#', '', 'F', '0', '1', 'information:manager:edit', '#', 'admin', '2022-06-02 15:12:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '信息记录管理删除', '2001', '4', '#', '', 'F', '0', '1', 'information:manager:remove', '#', 'admin', '2022-06-02 15:12:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '信息记录管理导出', '2001', '5', '#', '', 'F', '0', '1', 'information:manager:export', '#', 'admin', '2022-06-02 15:12:08', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '产品列表', '2000', '2', '/product/manager', 'menuItem', 'C', '0', '1', 'product:manager:view', '#', 'admin', '2022-06-02 15:40:04', 'admin', '2022-06-02 15:49:18', '产品列表菜单');
INSERT INTO `sys_menu` VALUES ('2008', '产品列表查询', '2007', '1', '#', '', 'F', '0', '1', 'product:manager:list', '#', 'admin', '2022-06-02 15:40:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '产品列表新增', '2007', '2', '#', '', 'F', '0', '1', 'product:manager:add', '#', 'admin', '2022-06-02 15:40:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '产品列表修改', '2007', '3', '#', '', 'F', '0', '1', 'product:manager:edit', '#', 'admin', '2022-06-02 15:40:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '产品列表删除', '2007', '4', '#', '', 'F', '0', '1', 'product:manager:remove', '#', 'admin', '2022-06-02 15:40:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '产品列表导出', '2007', '5', '#', '', 'F', '0', '1', 'product:manager:export', '#', 'admin', '2022-06-02 15:40:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '分类列表', '2000', '1', '/classification/manager', '', 'C', '0', '1', 'classification:manager:view', '#', 'admin', '2022-06-02 15:48:33', '', null, '分类列表菜单');
INSERT INTO `sys_menu` VALUES ('2014', '分类列表查询', '2013', '1', '#', '', 'F', '0', '1', 'classification:manager:list', '#', 'admin', '2022-06-02 15:48:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '分类列表新增', '2013', '2', '#', '', 'F', '0', '1', 'classification:manager:add', '#', 'admin', '2022-06-02 15:48:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '分类列表修改', '2013', '3', '#', '', 'F', '0', '1', 'classification:manager:edit', '#', 'admin', '2022-06-02 15:48:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '分类列表删除', '2013', '4', '#', '', 'F', '0', '1', 'classification:manager:remove', '#', 'admin', '2022-06-02 15:48:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '分类列表导出', '2013', '5', '#', '', 'F', '0', '1', 'classification:manager:export', '#', 'admin', '2022-06-02 15:48:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '信息记录显示产品列表', '2001', '6', '#', 'menuItem', 'F', '0', '1', 'information:manager:productlist', '#', 'admin', '2022-06-02 18:41:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '产品列表导入', '2007', '6', '#', 'menuItem', 'F', '0', '1', 'system:manager:import', '#', 'admin', '2022-06-02 22:11:25', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-06-02 14:11:47', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-06-02 14:11:47', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'op', '管理员', '1', '0', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 15:52:37', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', 'admin', '2022-06-02 14:11:47', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '2', 'admin', '2022-06-02 14:11:47', 'admin', '2022-06-02 15:07:08', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `password_m` varchar(50) DEFAULT NULL COMMENT '明文密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '你的明明呐丶', '00', '123456@qq.com', '15211111111', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-06-03 00:01:23', '2022-06-02 14:11:47', 'admin', '2022-06-02 14:11:47', '', '2022-06-03 00:01:23', '管理员', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('87f3fd87-87ec-4f7c-a54e-07ae0f242e47', 'admin', '管理部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2022-06-02 23:34:10', '2022-06-03 00:02:25', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for zym_classification
-- ----------------------------
DROP TABLE IF EXISTS `zym_classification`;
CREATE TABLE `zym_classification` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(10) DEFAULT NULL COMMENT '项目类别',
  `note` varchar(50) DEFAULT NULL COMMENT '备注',
  `number` int(10) DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='分类列表';

-- ----------------------------
-- Records of zym_classification
-- ----------------------------
INSERT INTO `zym_classification` VALUES ('1', '穿越火线', '', '12');
INSERT INTO `zym_classification` VALUES ('2', '大话西游', '', '2');
INSERT INTO `zym_classification` VALUES ('3', '英雄联盟', '', '0');
INSERT INTO `zym_classification` VALUES ('4', '测试1', '', '0');
INSERT INTO `zym_classification` VALUES ('5', '测试2', '', '0');
INSERT INTO `zym_classification` VALUES ('6', '测试3', '', '0');
INSERT INTO `zym_classification` VALUES ('7', '测试4', '', '0');
INSERT INTO `zym_classification` VALUES ('8', '测试5', '', '0');
INSERT INTO `zym_classification` VALUES ('9', '测试6', '', '0');
INSERT INTO `zym_classification` VALUES ('10', '测试7', '', '0');
INSERT INTO `zym_classification` VALUES ('11', '测试8', '', null);
INSERT INTO `zym_classification` VALUES ('12', '测试9', '', null);
INSERT INTO `zym_classification` VALUES ('13', '测试10', '', null);

-- ----------------------------
-- Table structure for zym_info
-- ----------------------------
DROP TABLE IF EXISTS `zym_info`;
CREATE TABLE `zym_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `userinfo` varchar(50) DEFAULT NULL COMMENT '客户信息',
  `note` varchar(50) DEFAULT NULL COMMENT '备注',
  `wechat` varchar(20) DEFAULT NULL COMMENT '微信',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `number` int(10) DEFAULT NULL COMMENT '数量',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `idcard` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `idisimg` varchar(100) DEFAULT NULL COMMENT '身份证正面',
  `idbackimg` varchar(100) DEFAULT NULL COMMENT '身份证反面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='信息记录管理';

-- ----------------------------
-- Records of zym_info
-- ----------------------------
INSERT INTO `zym_info` VALUES ('1', '123', '', 'z2327972001', '2327972001', '4', null, null, null, null, null, null);
INSERT INTO `zym_info` VALUES ('2', '456', '', '17318062706', '3355691290', '2', null, null, null, null, null, null);
INSERT INTO `zym_info` VALUES ('4', '456', '', '456', '456', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for zym_product
-- ----------------------------
DROP TABLE IF EXISTS `zym_product`;
CREATE TABLE `zym_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cid` int(10) DEFAULT NULL COMMENT '项目类别id',
  `uid` int(10) DEFAULT '0' COMMENT '用户id',
  `elasticip` varchar(20) DEFAULT NULL COMMENT '弹性ip',
  `note` varchar(50) DEFAULT NULL COMMENT '备注',
  `bandwidth` varchar(10) DEFAULT NULL COMMENT '带宽',
  `region` varchar(10) DEFAULT NULL COMMENT '地区',
  `category` varchar(20) DEFAULT NULL COMMENT '项目类别',
  `username` varchar(50) DEFAULT NULL COMMENT '账号/密码',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '到期时间',
  `status` char(1) DEFAULT '0' COMMENT '状态 0=正常 1=到期 2=停用',
  `free` char(1) DEFAULT '0' COMMENT '空闲状态',
  `httpport` varchar(10) DEFAULT NULL COMMENT '端口HTTP',
  `skport` varchar(10) DEFAULT NULL COMMENT 'sk5端口',
  `ltpport` varchar(10) DEFAULT NULL COMMENT '端口L2TP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='产品列表';

-- ----------------------------
-- Records of zym_product
-- ----------------------------
INSERT INTO `zym_product` VALUES ('14', '2', '1', '123.123.111.111', '备注', '10M', '广东', '大话西游', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('15', '1', '0', '123.123.111.112', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('16', '1', '2', '123.123.111.113', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('17', '1', '2', '123.123.111.114', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('18', '1', '0', '123.123.111.115', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('19', '1', '0', '123.123.111.116', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('20', '1', '0', '123.123.111.117', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('21', '1', '1', '123.123.111.118', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('22', '1', '0', '123.123.111.119', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('23', '1', '0', '123.123.111.120', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('24', '1', '0', '123.123.111.121', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('25', '1', '1', '123.123.111.122', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('26', '1', '1', '123.123.111.123', '备注', '10M', '广东', '穿越火线', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
INSERT INTO `zym_product` VALUES ('31', '2', '0', '127.0.0.1', '无', '20M', '山东', '大话西游', '2327972001/123456', '2022-06-23 12:06:00', '2022-06-24 12:06:00', '0', '0', '80', '80', '80');
