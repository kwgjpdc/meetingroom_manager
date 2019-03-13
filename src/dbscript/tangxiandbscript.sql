/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2019-03-13 18:06:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_c_contract`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_contract`;
CREATE TABLE `t_c_contract` (
  `contractid` int(11) NOT NULL AUTO_INCREMENT,
  `contractname` varchar(200) DEFAULT NULL,
  `contractnum` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `durationtime` varchar(20) DEFAULT NULL,
  `signtime` datetime DEFAULT NULL,
  `contractpartyb` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `status` int(10) NOT NULL,
  `isdisabled` varchar(20) NOT NULL,
  `operuser` varchar(20) NOT NULL,
  `operdate` datetime DEFAULT NULL,
  `subofficeid` int(11) NOT NULL,
  PRIMARY KEY (`contractid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contract
-- ----------------------------
INSERT INTO `t_c_contract` VALUES ('1', '大理Ⅱ段进场道路施工3标', 'DZYS-DLⅡ-GCBF-SG-DL003\r\nDZYS-DLⅡ-GCBF-SG-DL003', '3271.069711', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '1', '9', 'false', 'admin', null, '2');
INSERT INTO `t_c_contract` VALUES ('2', '云南省滇中引水工程施工准备工程龙泉倒虹吸始发井和接收井施工', 'DZYS-ZHBF-JSGL-FLFW-004', '9293.94', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '2', '9', 'false', 'admin', null, '4');
INSERT INTO `t_c_contract` VALUES ('3', '大理Ⅱ段进场道路3标施工监理', 'DZYS-DLⅡ-GCBF-JL-008', '64.1487', '自合同签订之日起至缺陷责任期满止', '2019-02-03 00:00:00', '云南伟德工程监理有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:20:48', '2');
INSERT INTO `t_c_contract` VALUES ('4', '玉溪段进场道路施工1标', 'DZYS-YX-GCBF-SG-DL001', '1177.761026', '180日历天', '2019-02-15 00:00:00', '云南昊滇建设工程集团有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:22:31', '5');
INSERT INTO `t_c_contract` VALUES ('5', '玉溪段进场道路施工2标', 'DZYS-YX-GCBF-SG-DL002', '3182.822905', '300日历天', '2019-02-15 00:00:00', '云南恩途建设工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:52:18', '5');
INSERT INTO `t_c_contract` VALUES ('6', '玉溪段进场道路施工3标', 'DZYS-YX-GCBF-SG-DL003', '7164.867295', '365日历天', '2019-02-15 00:00:00', '云南交通建设工程公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:53:00', '5');
INSERT INTO `t_c_contract` VALUES ('7', '红河段进场道路施工1标', 'DZYS-HH-GCBF-SG-DL001', '6587.799056', '365日历天', '2019-02-22 00:00:00', '中铁十二局集团有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 16:53:49', '6');
INSERT INTO `t_c_contract` VALUES ('8', '云南省滇中引水工程施工准备工程昆明段进场道路施工1标', 'DZYS-KM-GCBF-SG-DL001', '5267.02', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 17:06:07', '4');
INSERT INTO `t_c_contract` VALUES ('9', '云南省滇中引水工程施工准备工程昆明段进场道路施工2标', 'DZYS-KM-GCBF-SG-DL002', '4234.95', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', '', '0', '9', 'false', 'admin', '2019-03-12 17:07:01', '4');

-- ----------------------------
-- Table structure for `t_c_contractexecute`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_contractexecute`;
CREATE TABLE `t_c_contractexecute` (
  `contractexecuteid` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `monthamount` double DEFAULT NULL,
  `year` int(4) DEFAULT NULL COMMENT '所属年份',
  `month` int(2) DEFAULT NULL COMMENT '所属月份',
  `remark` varchar(200) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `isdisabled` varchar(20) NOT NULL,
  `operuser` varchar(20) NOT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`contractexecuteid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contractexecute
-- ----------------------------
INSERT INTO `t_c_contractexecute` VALUES ('1', '1', '376.18', '2019', '2', null, '1', 'false', 'admin', '2019-03-13 17:11:22');
INSERT INTO `t_c_contractexecute` VALUES ('2', '1', '234.98', '2019', '1', null, '1', 'false', 'admin', '2019-03-13 17:16:10');
INSERT INTO `t_c_contractexecute` VALUES ('3', '2', '121.52', '2019', '1', null, '1', 'false', 'admin', '2019-03-13 17:16:49');
INSERT INTO `t_c_contractexecute` VALUES ('4', '2', '458.31', '2019', '2', null, '1', 'false', 'admin', '2019-03-13 17:19:52');

-- ----------------------------
-- Table structure for `t_p_monthtotal`
-- ----------------------------
DROP TABLE IF EXISTS `t_p_monthtotal`;
CREATE TABLE `t_p_monthtotal` (
  `id` int(11) NOT NULL COMMENT '主键',
  `depart` int(11) DEFAULT NULL COMMENT '所属分局',
  `year` int(4) DEFAULT NULL COMMENT '所属年份',
  `month` int(2) DEFAULT NULL COMMENT '所属月份',
  `contracttotal` double DEFAULT NULL COMMENT '合同总金额',
  `thisyearplan` double DEFAULT NULL COMMENT '本年计划完成投资',
  `thismonthinvest` double DEFAULT NULL COMMENT '当月完成投资',
  `thisytmtotal` double DEFAULT NULL COMMENT '本年至当月实际完成投资',
  `investtotal` double DEFAULT NULL COMMENT '开工以来累计完成投资',
  `balancetotal` double DEFAULT NULL COMMENT '累计结算工程款',
  `payfortotal` double DEFAULT NULL COMMENT '累计支付情况',
  `describe` varchar(2000) DEFAULT NULL COMMENT '工程形象进度描述',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `operuser` int(11) DEFAULT NULL COMMENT '操作人',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_p_monthtotal
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_suboffice`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_suboffice`;
CREATE TABLE `t_s_suboffice` (
  `subofficeid` int(11) NOT NULL AUTO_INCREMENT,
  `subofficename` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `isdisabled` varchar(20) NOT NULL,
  `operuser` varchar(20) NOT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`subofficeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_suboffice
-- ----------------------------
INSERT INTO `t_s_suboffice` VALUES ('1', '丽江分局', null, '1', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('2', '大理分局', null, '2', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('3', '楚雄分局', null, '3', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('4', '昆明分局', null, '4', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('5', '玉溪分局', null, '5', 'false', 'admin', null);
INSERT INTO `t_s_suboffice` VALUES ('6', '红河分局', null, '6', 'false', 'admin', null);

-- ----------------------------
-- Table structure for `t_s_subofficewrite`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_subofficewrite`;
CREATE TABLE `t_s_subofficewrite` (
  `subofficewriteid` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `constructioncontent` longtext,
  `begindate` datetime DEFAULT NULL,
  `planfinishdate` datetime DEFAULT NULL,
  `budgetinvest` double DEFAULT NULL,
  `contractamount` double DEFAULT NULL,
  `finishinvest` double DEFAULT NULL,
  `surplusinvest` double DEFAULT NULL,
  `yearplaninvest` double DEFAULT NULL,
  `monthplaninvest` double DEFAULT NULL,
  `yearrealityinvest` double DEFAULT NULL,
  `monthrealityinvest` double DEFAULT NULL,
  `tendayrealityinvest` double DEFAULT NULL,
  `earthwork` double DEFAULT NULL,
  `stonework` double DEFAULT NULL,
  `beton` double DEFAULT NULL,
  `overallimageprogress` longtext,
  `nextmonthplaninvest` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `year` int(4) DEFAULT NULL COMMENT '所属年份',
  `month` int(2) DEFAULT NULL COMMENT '所属月份',
  `priority` int(11) NOT NULL,
  `isdisabled` varchar(20) NOT NULL,
  `operuser` varchar(20) NOT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`subofficewriteid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_subofficewrite
-- ----------------------------
INSERT INTO `t_s_subofficewrite` VALUES ('1', '2', '龙泉倒虹吸始发井围护结构和主体结构施工，接收井围护结构和主体结构施工', '2017-11-30 00:00:00', '2020-06-30 00:00:00', '9787', '9293.94', '7367.76', '1926.18', '1662.61', '115.08', '152.08', '36.76', '10.35', '2.11', '0.48', '1.33', '龙泉倒虹吸始发井本旬进行基坑开挖及钢支撑安装施工，始发井基坑开挖共计19155.5m³，本旬完成610m³，累计完成9776m³，占比51%，剩余9379.5m³，分三区开挖，西侧第一区（1号井）已开挖至基底，深度17.5m，中部第二区（2号井西侧）已开挖至第三道砼支撑，深度13m，东侧第三区（2号井东侧）已开挖至第二道钢支撑，深度8m。第二道钢支撑本旬完成1榀直撑安装，已累计完成2榀角撑、2榀斜撑及7榀直撑安装，第三道钢支撑本旬完成2榀直撑安装，已累计完成2榀角撑、2榀斜撑、5榀直撑安装。\r\n龙泉倒虹吸接收井本旬进行降水井施工及冠梁基础面清理施工，降水井共计632m，本旬完成155m，累计完成365m，完成率57.7%，剩余267m。', '183.06', null, '2019', '2', '1', 'false', 'admin', '2019-02-25 00:00:00');
INSERT INTO `t_s_subofficewrite` VALUES ('2', '8', '路基土石方开挖、防护工程、路基路面等', '2018-08-20 00:00:00', '2019-12-31 00:00:00', '6085.51', '5267.02', '3731.64', '1535.38', '2348.47', '420.28', '813.09', '265.21', '105.07', '8.3138', '46.0165', '0.5028', '进场道路总长11.419公里，累计完成毛路开挖9.695公里，占84.90%，其中路基开挖完成8.289公里，占72.58%。', '654.58', null, '2019', '2', '1', 'false', 'admin', '2019-02-25 00:00:00');
INSERT INTO `t_s_subofficewrite` VALUES ('3', '9', '路基土石方开挖、防护工程、路基路面等', '2019-01-07 00:00:00', '2019-12-31 00:00:00', '7250', '4234.95', '873.41', '3361.54', '160', '3584.95', '223.41', '23.41', '0.41', '2.16', '8.64', '0', '进场道路完成松林1#支洞和龙庆1#支洞进场道路复测放线，龙庆1#支洞毛路开挖完成1.5公里，土方开挖完成2.16万方，石方开挖完成8.64万方。', '180', null, '2019', '2', '1', 'false', 'admin', '2019-02-25 00:00:00');
