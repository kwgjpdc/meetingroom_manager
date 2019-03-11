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
