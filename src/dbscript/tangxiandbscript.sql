/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2019-03-12 09:06:38
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contract
-- ----------------------------
INSERT INTO `t_c_contract` VALUES ('1', '大理Ⅱ段进场道路施工3标', 'DZYS-DLⅡ-GCBF-SG-DL003\r\nDZYS-DLⅡ-GCBF-SG-DL003', '3271.069711', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '1', '9', 'false', 'admin', null, '2');
INSERT INTO `t_c_contract` VALUES ('2', '云南省滇中引水工程施工准备工程龙泉倒虹吸始发井和接收井施工', 'DZYS-ZHBF-JSGL-FLFW-004', '9293.94', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '2', '9', 'false', 'admin', null, '4');

-- ----------------------------
-- Table structure for `t_p_monthtotal`
-- ----------------------------
DROP TABLE IF EXISTS `t_p_monthtotal`;
CREATE TABLE `t_p_monthtotal` (
  `id` int(11) NOT NULL COMMENT '主键',
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
