SET FOREIGN_KEY_CHECKS=0;

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


/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-13 10:42:24
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `maintypedescribe` varchar(50) DEFAULT NULL COMMENT '大类备注'
  `orderby` varchar(5) DEFAULT NULL COMMENT '排序列',
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of t_s_code
-- ----------------------------
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '1', '工程款', '1', '合同款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '2', '监理费', '1', '合同款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '3', '施工供电费', '1', '合同款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '4', '勘察设计费', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '5', '征地拆迁安置补偿', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '6', '环境影响', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '7', '耕地占用税', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '8', '水土保持补偿费', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '9', '金中公司清算费用', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '10', '印花税', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '11', '其他技术服务合同款', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '12', '建设管理费', '2', '其他款项');
INSERT INTO `t_s_code` VALUES ('costtype', '费用类型', '13', '临时用地复垦保证金', '2', '其他款项');


