/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2019-03-11 11:56:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `contract`
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `contractName` varchar(200) DEFAULT NULL,
  `contractNum` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `durationTime` varchar(20) DEFAULT NULL,
  `signTime` varchar(20) DEFAULT NULL,
  `contractPartyB` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `status` int(10) NOT NULL,
  `is_disabled` varchar(20) NOT NULL,
  `suboffice_id` int(11) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `FK_49itf8i5vrrgk2ecw6fud0fcs` (`suboffice_id`),
  CONSTRAINT `FK_49itf8i5vrrgk2ecw6fud0fcs` FOREIGN KEY (`suboffice_id`) REFERENCES `suboffice` (`suboffice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('1', '大理Ⅱ段进场道路施工3标', 'DZYS-DLⅡ-GCBF-SG-DL003\r\nDZYS-DLⅡ-GCBF-SG-DL003', '3271.069711', '365日历天', '2019-2-22', null, null, '1','9', 'false', '2');

-- ----------------------------
-- Table structure for `suboffice`
-- ----------------------------
DROP TABLE IF EXISTS `suboffice`;
CREATE TABLE `suboffice` (
  `suboffice_id` int(11) NOT NULL AUTO_INCREMENT,
  `subofficeName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `is_disabled` varchar(20) NOT NULL,
  PRIMARY KEY (`suboffice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suboffice
-- ----------------------------
INSERT INTO `suboffice` VALUES ('1', '丽江分局', null, '1', 'false');
INSERT INTO `suboffice` VALUES ('2', '大理分局', null, '2', 'false');
INSERT INTO `suboffice` VALUES ('3', '楚雄分局', null, '3', 'false');
INSERT INTO `suboffice` VALUES ('4', '昆明分局', null, '4', 'false');
INSERT INTO `suboffice` VALUES ('5', '玉溪分局', null, '5', 'false');
INSERT INTO `suboffice` VALUES ('6', '红河分局', null, '6', 'false');
