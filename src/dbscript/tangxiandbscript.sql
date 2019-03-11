/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2019-03-11 12:51:11
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_c_contract
-- ----------------------------
INSERT INTO `t_c_contract` VALUES ('1', '大理Ⅱ段进场道路施工3标', 'DZYS-DLⅡ-GCBF-SG-DL003\r\nDZYS-DLⅡ-GCBF-SG-DL003', '3271.069711', '365日历天', '2019-02-22 00:00:00', '中铁二十四局集团南昌铁路工程有限公司', null, '1', '9', 'false', 'admin', null, '2');

-- ----------------------------
-- Table structure for `t_c_suboffice`
-- ----------------------------
DROP TABLE IF EXISTS `t_c_suboffice`;
CREATE TABLE `t_c_suboffice` (
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
-- Records of t_c_suboffice
-- ----------------------------
INSERT INTO `t_c_suboffice` VALUES ('1', '丽江分局', null, '1', 'false', 'admin', null);
INSERT INTO `t_c_suboffice` VALUES ('2', '大理分局', null, '2', 'false', 'admin', null);
INSERT INTO `t_c_suboffice` VALUES ('3', '楚雄分局', null, '3', 'false', 'admin', null);
INSERT INTO `t_c_suboffice` VALUES ('4', '昆明分局', null, '4', 'false', 'admin', null);
INSERT INTO `t_c_suboffice` VALUES ('5', '玉溪分局', null, '5', 'false', 'admin', null);
INSERT INTO `t_c_suboffice` VALUES ('6', '红河分局', null, '6', 'false', 'admin', null);
