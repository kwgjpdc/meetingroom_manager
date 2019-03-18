/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2019-03-18 15:33:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_c_contract`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_contract`;
CREATE TABLE `t_c_contract` (
  `contractid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contractname` varchar(200) DEFAULT NULL COMMENT '合同名称',
  `contractnum` varchar(200) DEFAULT NULL COMMENT '合同编码',
  `amount` double DEFAULT NULL COMMENT '合同金额',
  `durationtime` varchar(20) DEFAULT NULL COMMENT '合同工期',
  `signtime` datetime DEFAULT NULL COMMENT '签订日期',
  `contractpartyb` varchar(200) DEFAULT NULL COMMENT '合同乙方',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT '0' COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `isdisabled` varchar(20) DEFAULT '0' COMMENT '是否禁用',
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  `subofficeid` bigint(11) NOT NULL COMMENT '所属分局ID',
  PRIMARY KEY (`contractid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contract
-- ----------------------------
INSERT INTO `t_c_contract` VALUES ('1', '大理Ⅱ段进场道路施工3标', 'DZYS-DLⅡ-GCBF-SG-DL003', '3271.069711', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '1', '9', 'false', 'admin', null, '2');
INSERT INTO `t_c_contract` VALUES ('2', '云南省滇中引水工程施工准备工程龙泉倒虹吸始发井和接收井施工', 'DZYS-ZHBF-JSGL-FLFW-004', '9293.94', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '2', '9', 'false', 'admin', null, '4');
INSERT INTO `t_c_contract` VALUES ('3', '大理Ⅱ段进场道路3标施工监理', 'DZYS-DLⅡ-GCBF-JL-008', '64.1487', '自合同签订之日起至缺陷责任期满止', '2019-02-03 00:00:00', '云南伟德工程监理有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:20:48', '2');
INSERT INTO `t_c_contract` VALUES ('4', '玉溪段进场道路施工1标', 'DZYS-YX-GCBF-SG-DL001', '1177.761026', '180日历天', '2019-02-15 00:00:00', '云南昊滇建设工程集团有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:22:31', '5');
INSERT INTO `t_c_contract` VALUES ('5', '玉溪段进场道路施工2标', 'DZYS-YX-GCBF-SG-DL002', '3182.822905', '300日历天', '2019-02-15 00:00:00', '云南恩途建设工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:52:18', '5');
INSERT INTO `t_c_contract` VALUES ('6', '玉溪段进场道路施工3标', 'DZYS-YX-GCBF-SG-DL003', '7164.867295', '365日历天', '2019-02-15 00:00:00', '云南交通建设工程公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:53:00', '5');
INSERT INTO `t_c_contract` VALUES ('7', '红河段进场道路施工1标', 'DZYS-HH-GCBF-SG-DL001', '6587.799056', '365日历天', '2019-02-22 00:00:00', '中铁十二局集团有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:53:49', '6');
INSERT INTO `t_c_contract` VALUES ('8', '云南省滇中引水工程施工准备工程昆明段进场道路施工1标', 'DZYS-KM-GCBF-SG-DL001', '5267.02', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 17:06:07', '4');
INSERT INTO `t_c_contract` VALUES ('9', '云南省滇中引水工程施工准备工程昆明段进场道路施工2标', 'DZYS-KM-GCBF-SG-DL002', '4234.95', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 17:07:01', '4');
INSERT INTO `t_c_contract` VALUES ('10', '滇中引水工程勘察试验性工程03标：香炉山隧洞2#施工支洞工程施工', 'DZYS-XL-SG-001', '3913.25', '1365日历天', '2015-09-09 00:00:00', '.', '', '0', '9', 'false', 'admin', '2019-03-18 12:23:34', '1');
INSERT INTO `t_c_contract` VALUES ('11', '滇中引水工程扩大勘察试验性工程水源及香炉山隧洞（丽江段）施工供电工程施工', 'DZYS-XL-YD-004', '7486.66', '365日历天', '2018-01-01 00:00:00', '。', '', '0', '9', 'false', 'admin', '2019-03-18 12:24:25', '1');

-- ----------------------------
-- Table structure for `t_c_contractexecute`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_contractexecute`;
CREATE TABLE `t_c_contractexecute` (
  `contractexecuteid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contractid` bigint(11) NOT NULL COMMENT '合同ID',
  `monthamount` double DEFAULT NULL COMMENT '当月结算',
  `year` int(4) DEFAULT NULL COMMENT '所属年份',
  `month` int(2) DEFAULT NULL COMMENT '所属月份',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT '0' COMMENT '排序',
  `isdisabled` varchar(20) DEFAULT NULL,
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`contractexecuteid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contractexecute
-- ----------------------------
INSERT INTO `t_c_contractexecute` VALUES ('1', '1', '376.18', '2019', '2', null, '1', 'false', 'admin', '2019-03-13 17:11:22');
INSERT INTO `t_c_contractexecute` VALUES ('2', '1', '234.98', '2019', '1', null, '1', 'false', 'admin', '2019-03-13 17:16:10');
INSERT INTO `t_c_contractexecute` VALUES ('3', '2', '121.52', '2019', '1', null, '1', 'false', 'admin', '2019-03-13 17:16:49');
INSERT INTO `t_c_contractexecute` VALUES ('4', '2', '458.31', '2019', '2', null, '1', 'false', 'admin', '2019-03-13 17:19:52');

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(200) NOT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '访问地址',
  `ismenu` int(10) DEFAULT NULL COMMENT '是否菜单',
  `pid` int(10) DEFAULT NULL COMMENT '上级菜单ID',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `isdisabled` varchar(20) DEFAULT NULL COMMENT '是否禁用',
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', '填报管理', null, '1', '0', '2019-03-14 21:20:12', null, '1', '1', '0', '1', '2019-03-14 21:20:35');
INSERT INTO `t_sys_menu` VALUES ('2', '分局填报', 'subofficewrite/subofficewriteList.web', '0', '1', '2019-03-14 21:21:18', null, '2', '1', '0', '1', '2019-03-14 21:21:28');
INSERT INTO `t_sys_menu` VALUES ('3', '财务填报', 'financing/financingList.web', '0', '1', '2019-03-14 21:22:05', null, '3', '1', '0', '1', '2019-03-14 21:22:15');
INSERT INTO `t_sys_menu` VALUES ('4', '合同管理', null, '1', '0', '2019-03-14 21:23:43', null, '4', '1', '0', '1', '2019-03-14 21:23:35');
INSERT INTO `t_sys_menu` VALUES ('5', '合同签订', 'contract/contractSignedList.web', '0', '4', '2019-03-14 21:24:55', null, '5', '1', '0', '1', '2019-03-14 21:25:00');
INSERT INTO `t_sys_menu` VALUES ('6', '合同执行', 'contract/contractExecuteList.web', '0', '4', '2019-03-14 21:42:11', null, '6', '1', '0', '1', '2019-03-14 21:42:08');
INSERT INTO `t_sys_menu` VALUES ('10', '系统管理', '', '1', '0', '2019-03-15 11:00:48', '', '10', '1', '0', '1', '2019-03-15 11:00:48');
INSERT INTO `t_sys_menu` VALUES ('11', '用户管理', 'user/userList.web', '0', '10', '2019-03-15 11:02:50', '', '11', '1', '0', '1', '2019-03-15 11:02:50');
INSERT INTO `t_sys_menu` VALUES ('12', '角色管理', 'role/roleList.web', '0', '10', '2019-03-15 11:03:14', '', '12', '1', '0', '1', '2019-03-15 11:03:14');
INSERT INTO `t_sys_menu` VALUES ('13', '菜单管理', 'menu/menuList.web', '0', '10', '2019-03-15 11:03:38', '', '13', '1', '0', '1', '2019-03-15 11:03:38');
INSERT INTO `t_sys_menu` VALUES ('14', '统计报表', '', '1', '0', '2019-03-18 14:00:19', '', '7', '1', '0', '1', '2019-03-18 14:00:19');
INSERT INTO `t_sys_menu` VALUES ('15', '合同执行月统计', 'contract/contractExecuteMonthTotalList.web', '0', '14', '2019-03-18 14:01:03', '', '8', '1', '0', '1', '2019-03-18 14:01:03');
INSERT INTO `t_sys_menu` VALUES ('16', '财务数据统计', 'financing/financingReport.web', '0', '14', '2019-03-18 14:01:24', '', '9', '1', '0', '1', '2019-03-18 14:01:24');

-- ----------------------------
-- Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL COMMENT '角色名称',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `isdisabled` varchar(20) DEFAULT NULL COMMENT '是否禁用',
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '超级管理员', '2019-03-14 17:12:45', null, '0', '1', '0', '1', '2019-03-14 17:13:02');
INSERT INTO `t_sys_role` VALUES ('2', '分局用户', '2019-03-14 17:17:20', null, '0', '1', '0', '1', '2019-03-14 17:17:34');
INSERT INTO `t_sys_role` VALUES ('10', '测试角色', '2019-03-15 10:28:52', '', '0', '1', '0', '1', '2019-03-15 10:28:52');

-- ----------------------------
-- Table structure for `t_sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE `t_sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  `menuid` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------
INSERT INTO `t_sys_role_menu` VALUES ('72', '1', '1');
INSERT INTO `t_sys_role_menu` VALUES ('73', '1', '2');
INSERT INTO `t_sys_role_menu` VALUES ('74', '1', '3');
INSERT INTO `t_sys_role_menu` VALUES ('75', '1', '4');
INSERT INTO `t_sys_role_menu` VALUES ('76', '1', '5');
INSERT INTO `t_sys_role_menu` VALUES ('77', '1', '6');
INSERT INTO `t_sys_role_menu` VALUES ('78', '1', '14');
INSERT INTO `t_sys_role_menu` VALUES ('79', '1', '15');
INSERT INTO `t_sys_role_menu` VALUES ('80', '1', '16');
INSERT INTO `t_sys_role_menu` VALUES ('81', '1', '10');
INSERT INTO `t_sys_role_menu` VALUES ('82', '1', '11');
INSERT INTO `t_sys_role_menu` VALUES ('83', '1', '12');
INSERT INTO `t_sys_role_menu` VALUES ('84', '1', '13');
INSERT INTO `t_sys_role_menu` VALUES ('90', '2', '1');
INSERT INTO `t_sys_role_menu` VALUES ('91', '2', '2');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subofficeid` int(11) DEFAULT NULL COMMENT '所属分局',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `realname` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `sex` varchar(20) NOT NULL COMMENT '性别',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `createdate` datetime NOT NULL COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `isdisabled` varchar(20) DEFAULT NULL COMMENT '是否禁用',
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', null, 'admin', '管理员', '1', 'M', 'admin@admin.com', '2019-03-14 17:12:01', null, '0', '1', '0', 'admin', '2019-03-14 17:12:21');
INSERT INTO `t_sys_user` VALUES ('10', '1', 'tangxian', '唐显', '123456', 'M', 'tangxianmail@vip.qq.com', '2019-03-15 10:28:31', '', '0', '1', '0', '1', '2019-03-15 10:28:31');
INSERT INTO `t_sys_user` VALUES ('11', '2', 'xiaohong', '小红', '1', 'F', 'chenhao@node.com', '2019-03-15 10:51:31', '', '0', '1', '0', '1', '2019-03-15 10:51:31');
INSERT INTO `t_sys_user` VALUES ('12', null, 'lijiang', '丽江分局用户', '1', 'M', '', '2019-03-18 12:10:09', '', '0', '1', '0', '1', '2019-03-18 12:10:09');
INSERT INTO `t_sys_user` VALUES ('13', null, 'dali', '大理分局用户', '1', 'M', '', '2019-03-18 12:10:26', '', '0', '1', '0', '1', '2019-03-18 12:10:26');
INSERT INTO `t_sys_user` VALUES ('14', null, 'chuxiong', '楚雄分局用户', '1', 'M', '', '2019-03-18 12:10:41', '', '0', '1', '0', '1', '2019-03-18 12:10:41');
INSERT INTO `t_sys_user` VALUES ('15', null, 'kunming', '昆明分局用户', '1', 'M', '', '2019-03-18 12:10:56', '', '0', '1', '0', '1', '2019-03-18 12:10:56');
INSERT INTO `t_sys_user` VALUES ('16', null, 'yuxi', '玉溪分局用户', '1', 'M', '', '2019-03-18 12:11:09', '', '0', '1', '0', '1', '2019-03-18 12:11:09');
INSERT INTO `t_sys_user` VALUES ('17', null, 'honghe', '红河分局用户', '1', 'M', '', '2019-03-18 12:11:42', '', '0', '1', '0', '1', '2019-03-18 12:11:42');

-- ----------------------------
-- Table structure for `t_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES ('45', '12', '2');
INSERT INTO `t_sys_user_role` VALUES ('46', '1', '1');
INSERT INTO `t_sys_user_role` VALUES ('47', '13', '2');
INSERT INTO `t_sys_user_role` VALUES ('48', '17', '2');
INSERT INTO `t_sys_user_role` VALUES ('49', '16', '2');
INSERT INTO `t_sys_user_role` VALUES ('50', '15', '2');
INSERT INTO `t_sys_user_role` VALUES ('51', '14', '2');

-- ----------------------------
-- Table structure for `t_s_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_code`;
CREATE TABLE `t_s_code` (
  `codetype` varchar(50) DEFAULT NULL COMMENT '字典类型',
  `codedescribe` varchar(100) DEFAULT NULL COMMENT '字典描述备注',
  `key` varchar(5) DEFAULT NULL COMMENT '字典值',
  `value` varchar(200) DEFAULT NULL COMMENT '字典显示',
  `maintype` varchar(2) DEFAULT NULL COMMENT '大类归类',
  `maintypedescribe` varchar(50) DEFAULT NULL COMMENT '大类备注',
  `orderby` varchar(5) DEFAULT NULL COMMENT '排序列'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_s_code
-- ----------------------------
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '01', '工程款', '1', '合同款项', '01');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '02', '监理费', '1', '合同款项', '02');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '03', '施工供电费', '1', '合同款项', '03');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '04', '勘察设计费', '2', '其他款项', '04');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '05', '征地拆迁安置补偿', '2', '其他款项', '05');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '06', '环境影响', '2', '其他款项', '06');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '07', '耕地占用税', '2', '其他款项', '07');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '08', '水土保持补偿费', '2', '其他款项', '08');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '09', '金中公司清算费用', '2', '其他款项', '09');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '10', '印花税', '2', '其他款项', '10');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '11', '其他技术服务合同款', '2', '其他款项', '11');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '12', '建设管理费', '2', '其他款项', '12');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '13', '临时用地复垦保证金', '2', '其他款项', '13');


-- ----------------------------
-- Table structure for `t_s_suboffice`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_suboffice`;
CREATE TABLE `t_s_suboffice` (
  `subofficeid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subofficename` varchar(20) DEFAULT NULL COMMENT '分局名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `isonlysubo` varchar(1) DEFAULT NULL COMMENT '仅为分局标记',
  `isdisabled` varchar(20) DEFAULT NULL,
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`subofficeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_suboffice
-- ----------------------------
INSERT INTO `t_s_suboffice` VALUES ('1', '丽江分局', null, '1', '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('2', '大理分局', null, '2', '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('3', '楚雄分局', null, '3', '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('4', '昆明分局', null, '4', '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('5', '玉溪分局', null, '5', '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('6', '红河分局', null, '6', '1', 'false', 'admin', null);

-- ----------------------------
-- Table structure for `t_s_subofficewrite`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_subofficewrite`;
CREATE TABLE `t_s_subofficewrite` (
  `subofficewriteid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `contractid` bigint(11) NOT NULL COMMENT '合同ID',
  `constructioncontent` longtext COMMENT '主要建设内容',
  `begindate` datetime DEFAULT NULL COMMENT '开工时间',
  `planfinishdate` datetime DEFAULT NULL COMMENT '计划完工时间',
  `budgetinvest` double DEFAULT NULL COMMENT '概算投资',
  `finishinvest` double DEFAULT NULL COMMENT '自开工以来累计完成投资',
  `surplusinvest` double DEFAULT NULL COMMENT '剩余投资',
  `yearplaninvest` double DEFAULT NULL COMMENT '本年度计划完成投资',
  `monthplaninvest` double DEFAULT NULL COMMENT '本月计划完成投资',
  `yearrealityinvest` double DEFAULT NULL COMMENT '本年度实际完成投资',
  `monthrealityinvest` double DEFAULT NULL COMMENT '本月实际完成投资',
  `tendayrealityinvest` double DEFAULT NULL COMMENT '本旬实际完成投资',
  `earthwork` double DEFAULT NULL COMMENT '土方',
  `stonework` double DEFAULT NULL COMMENT '石方',
  `beton` double DEFAULT NULL COMMENT '混凝土',
  `overallimageprogress` longtext COMMENT '总体形象进度',
  `nextmonthplaninvest` double DEFAULT NULL COMMENT '下一月度计划完成投资',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `year` int(4) DEFAULT NULL COMMENT '所属年份',
  `month` int(2) DEFAULT NULL COMMENT '所属月份',
  `priority` int(11) DEFAULT '0' COMMENT '排序',
  `isdisabled` varchar(20) DEFAULT NULL,
  `operuser` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`subofficewriteid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_subofficewrite
-- ----------------------------
INSERT INTO `t_s_subofficewrite` VALUES ('1', '2', '龙泉倒虹吸始发井围护结构和主体结构施工，接收井围护结构和主体结构施工', '2017-11-30 00:00:00', '2020-06-30 00:00:00', '9787', '7367.76', '1926.18', '1662.61', '115.08', '152.08', '36.76', '10.35', '2.11', '0.48', '1.33', '龙泉倒虹吸始发井本旬进行基坑开挖及钢支撑安装施工，始发井基坑开挖共计19155.5m³，本旬完成610m³，累计完成9776m³，占比51%，剩余9379.5m³，分三区开挖，西侧第一区（1号井）已开挖至基底，深度17.5m，中部第二区（2号井西侧）已开挖至第三道砼支撑，深度13m，东侧第三区（2号井东侧）已开挖至第二道钢支撑，深度8m。第二道钢支撑本旬完成1榀直撑安装，已累计完成2榀角撑、2榀斜撑及7榀直撑安装，第三道钢支撑本旬完成2榀直撑安装，已累计完成2榀角撑、2榀斜撑、5榀直撑安装。\r\n龙泉倒虹吸接收井本旬进行降水井施工及冠梁基础面清理施工，降水井共计632m，本旬完成155m，累计完成365m，完成率57.7%，剩余267m。', '183.06', '', '2019', '2', '0', 'false', 'admin', '2019-03-14 15:17:12');
INSERT INTO `t_s_subofficewrite` VALUES ('2', '8', '路基土石方开挖、防护工程、路基路面等', '2018-08-20 00:00:00', '2019-12-31 00:00:00', '6085.51', '3731.64', '1535.38', '2348.47', '420.28', '813.09', '265.21', '105.07', '8.3138', '46.0165', '0.5028', '进场道路总长11.419公里，累计完成毛路开挖9.695公里，占84.90%，其中路基开挖完成8.289公里，占72.58%。', '654.58', '', '2019', '2', '0', 'false', 'admin', '2019-03-14 15:17:12');
INSERT INTO `t_s_subofficewrite` VALUES ('3', '9', '路基土石方开挖、防护工程、路基路面等', '2019-01-07 00:00:00', '2019-12-31 00:00:00', '7250', '873.41', '3361.54', '160', '3584.95', '223.41', '23.41', '0.41', '2.16', '8.64', '2.9', '进场道路完成松林1#支洞和龙庆1#支洞进场道路复测放线，龙庆1#支洞毛路开挖完成1.5公里，土方开挖完成2.16万方，石方开挖完成8.64万方。', '180', '', '2019', '2', '0', 'false', 'admin', '2019-03-14 15:17:12');
INSERT INTO `t_s_subofficewrite` VALUES ('4', '3', '55', '2019-02-24 00:00:00', '2019-03-02 00:00:00', '43', '33', '33', '23', '333', '33', '33', '33', '3', '3', '3', '333334', '3', '', '2019', '2', '0', 'false', 'admin', '2019-03-14 15:17:12');
