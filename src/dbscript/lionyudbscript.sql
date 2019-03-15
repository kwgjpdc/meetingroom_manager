/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-14 16:56:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_f_financingwrite`
-- ----------------------------
DROP TABLE IF EXISTS `t_f_financingwrite`;
CREATE TABLE `t_f_financingwrite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `payfordate` date DEFAULT NULL COMMENT '付款日期',
  `writeyear` int(4) DEFAULT NULL COMMENT '填报年',
  `writemonth` int(2) DEFAULT NULL COMMENT '填报月',
  `costtype` varchar(5) DEFAULT NULL COMMENT '费用类型',
  `maintype` varchar(2) DEFAULT NULL COMMENT '大类归类',
  `contractid` int(11) DEFAULT NULL COMMENT '所属合同',
  `subofficeid` int(11) DEFAULT NULL COMMENT '所属分局',
  `money` double(19,6) DEFAULT NULL COMMENT '金额',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  `operuser` int(11) DEFAULT NULL COMMENT '操作人',
  `cashierno` varchar(50) DEFAULT NULL COMMENT '出纳编号',
  `voucherno` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `isdisabled` varchar(1) DEFAULT '0' COMMENT '是否删除（1为删除,0为正常）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='财务填报';

-- ----------------------------
-- Records of t_f_financingwrite
-- ----------------------------
INSERT INTO `t_f_financingwrite` VALUES ('4', '2019-01-07', '2019', '1', '02', '1', '1', '2', '31122321.000000', '2019-03-14 13:36:17', null, '', '', 0);
INSERT INTO `t_f_financingwrite` VALUES ('6', '2019-01-13', '2019', '1', '02', '1', '1', '2', '42211321.000000', '2019-03-14 13:36:17', '1', 'nnn', 'ccc', 0);
INSERT INTO `t_f_financingwrite` VALUES ('10', '2019-03-14', '2019', '3', '12', '2', null, null, '1111123.000000', '2019-03-14 16:42:33', null, '', '', 0);
INSERT INTO `t_f_financingwrite` VALUES ('11', '2019-03-14', '2019', '3', '12', '2', null, null, '321.000000', '2019-03-14 16:42:33', null, '', '', 0);
INSERT INTO `t_f_financingwrite` VALUES ('12', '2019-03-14', '2019', '3', '12', '2', null, null, '111.000000', '2019-03-14 16:42:33', null, '', '', 0);


/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-13 23:19:20
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

/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-13 23:19:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_f_financingwrite`
-- ----------------------------
DROP TABLE IF EXISTS `t_f_financingwrite`;
CREATE TABLE `t_f_financingwrite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `payfordate` date DEFAULT NULL COMMENT '付款日期',
  `writeyear` int(4) DEFAULT NULL COMMENT '填报年',
  `writemonth` int(2) DEFAULT NULL COMMENT '填报月',
  `costtype` varchar(5) DEFAULT NULL COMMENT '费用类型',
  `maintype` varchar(2) DEFAULT NULL COMMENT '大类归类',
  `contractid` int(11) DEFAULT NULL COMMENT '所属合同',
  `subofficeid` int(11) DEFAULT NULL COMMENT '所属分局',
  `money` double(19,6) DEFAULT NULL COMMENT '金额',
  `operdate` datetime DEFAULT NULL COMMENT '操作时间',
  `operuser` int(11) DEFAULT NULL COMMENT '操作人',
  `cashierno` varchar(50) DEFAULT NULL COMMENT '出纳编号',
  `voucherno` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='财务填报';

-- ----------------------------
-- Records of t_f_financingwrite
-- ----------------------------
INSERT INTO `t_f_financingwrite` VALUES ('4', '2019-03-07', '2019', '1', '02', '1', '1', '2', '321.000000', '2019-03-13 23:12:25', null, null, null);


/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : echart

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-15 15:44:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_s_dcdysqlid`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dcdysqlid`;
CREATE TABLE `t_s_dcdysqlid` (
  `dcdytype` varchar(30) NOT NULL COMMENT '导出打印类型',
  `sqlid` varchar(50) NOT NULL COMMENT '导出类型对应的sqlid',
  `sqltype` varchar(1) DEFAULT '' COMMENT '1为内容取值sql，2为表头填充取值',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导出打印对应的sqlid';

-- ----------------------------
-- Records of t_s_dcdysqlid
-- ----------------------------
INSERT INTO `t_s_dcdysqlid` VALUES ('cwtbhzczlb', 'comle.financing.getfinancingListData', '1', '财务填报汇总操作列表');

-- ----------------------------
-- Table structure for `t_s_dcdysqlproperty`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dcdysqlproperty`;
CREATE TABLE `t_s_dcdysqlproperty` (
  `dcdytype` varchar(30) NOT NULL COMMENT '导出打印类型',
  `keyname` varchar(30) NOT NULL COMMENT '获取字段',
  `talign` varchar(10) NOT NULL COMMENT '对其方式',
  `formartstr` varchar(50) DEFAULT NULL COMMENT '格式化',
  `orderby` int(3) NOT NULL COMMENT '显示排序',
  `sepcial` varchar(5) DEFAULT NULL COMMENT '特殊处理保留字段',
  `protype` varchar(1) NOT NULL DEFAULT '' COMMENT '1为导出列表内容取值，2为表头内容对应属性',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导出打印对应sql的字段取值';

-- ----------------------------
-- Records of t_s_dcdysqlproperty
-- ----------------------------
INSERT INTO `t_s_dcdysqlproperty` VALUES ('cwtbhzczlb', 'costTypeStr', 'left', null, '1', null, '1', '款项类型');
INSERT INTO `t_s_dcdysqlproperty` VALUES ('cwtbhzczlb', 'mainTypeStr', 'center', null, '2', null, '1', '款项所属');
INSERT INTO `t_s_dcdysqlproperty` VALUES ('cwtbhzczlb', 'year', 'center', null, '3', null, '1', '所属年份');
INSERT INTO `t_s_dcdysqlproperty` VALUES ('cwtbhzczlb', 'total', 'right', 'vnd.ms-excel.numberformat:#,##0.00', '4', null, '1', '累计金额');

-- ----------------------------
-- Table structure for `t_s_dcdytitles`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_dcdytitles`;
CREATE TABLE `t_s_dcdytitles` (
  `dcdytype` varchar(30) NOT NULL COMMENT '导出打印类型',
  `tdid` varchar(30) DEFAULT NULL COMMENT '元素id',
  `showtitle` varchar(200) NOT NULL COMMENT '显示名称',
  `isdytype` varchar(1) NOT NULL DEFAULT '' COMMENT '是否为打印title，1为是',
  `isdctype` varchar(1) NOT NULL COMMENT '是否为导出title，1为是',
  `rowindex` int(2) NOT NULL COMMENT '行序号',
  `colindex` int(2) NOT NULL COMMENT '列序号',
  `mrowspan` int(2) NOT NULL COMMENT '跨行',
  `mcolspan` int(2) NOT NULL COMMENT '跨列',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印导出表头';

-- ----------------------------
-- Records of t_s_dcdytitles
-- ----------------------------
INSERT INTO `t_s_dcdytitles` VALUES ('cwtbhzczlb', null, '款项类型', '1', '1', '2', '1', '1', '1', null);
INSERT INTO `t_s_dcdytitles` VALUES ('cwtbhzczlb', null, '款项所属', '1', '1', '2', '1', '1', '1', null);
INSERT INTO `t_s_dcdytitles` VALUES ('cwtbhzczlb', null, '所属年份', '1', '1', '2', '1', '1', '1', null);
INSERT INTO `t_s_dcdytitles` VALUES ('cwtbhzczlb', null, '累计金额', '1', '1', '2', '1', '1', '1', null);
INSERT INTO `t_s_dcdytitles` VALUES ('cwtbhzczlb', 'filename', '文件名称', '1', '1', '1', '1', '1', '4', null);
