package com.lion.echart.project.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 月度统计表
 * @author lion-y
 *
 */
public class MonthTotalEntity implements Serializable {
	private Long id;
	private String depart;//分局
	private String departStr;
	private String year;//年份
	private String month;//月份
	private Double contractTotal;//合同总金额
	private String contractTotalStr;
	private Double thisYearPlan;//本年计划完成投资
	private String thisYearPlanStr;
	private Double thisMonthInvest;//当月完成投资
	private String thisMonthInvestStr;
	private Double thisYtmTotal;//本年至当月实际完成投资
	private String thisYtmTotalStr;
	private Double investTotal;//开工以来累计完成投资
	private String investTotalStr;
	private Double balanceTotal;//累计结算工程款
	private String balanceTotalStr;
	private Double payforTotal;//累计支付情况
	private String payforTotalStr;
	private String describe;//工程形象进度描述
	private String comment;//备注
	private Long operUser;//操作人
	private Date operDate;//操作时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Double getContractTotal() {
		return contractTotal;
	}
	public void setContractTotal(Double contractTotal) {
		this.contractTotal = contractTotal;
	}
	public String getContractTotalStr() {
		return contractTotalStr;
	}
	public void setContractTotalStr(String contractTotalStr) {
		this.contractTotalStr = contractTotalStr;
	}
	public Double getThisYearPlan() {
		return thisYearPlan;
	}
	public void setThisYearPlan(Double thisYearPlan) {
		this.thisYearPlan = thisYearPlan;
	}
	public String getThisYearPlanStr() {
		return thisYearPlanStr;
	}
	public void setThisYearPlanStr(String thisYearPlanStr) {
		this.thisYearPlanStr = thisYearPlanStr;
	}
	public Double getThisMonthInvest() {
		return thisMonthInvest;
	}
	public void setThisMonthInvest(Double thisMonthInvest) {
		this.thisMonthInvest = thisMonthInvest;
	}
	public String getThisMonthInvestStr() {
		return thisMonthInvestStr;
	}
	public void setThisMonthInvestStr(String thisMonthInvestStr) {
		this.thisMonthInvestStr = thisMonthInvestStr;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Double getInvestTotal() {
		return investTotal;
	}
	public void setInvestTotal(Double investTotal) {
		this.investTotal = investTotal;
	}
	public String getInvestTotalStr() {
		return investTotalStr;
	}
	public void setInvestTotalStr(String investTotalStr) {
		this.investTotalStr = investTotalStr;
	}
	public Double getThisYtmTotal() {
		return thisYtmTotal;
	}
	public void setThisYtmTotal(Double thisYtmTotal) {
		this.thisYtmTotal = thisYtmTotal;
	}
	public String getThisYtmTotalStr() {
		return thisYtmTotalStr;
	}
	public void setThisYtmTotalStr(String thisYtmTotalStr) {
		this.thisYtmTotalStr = thisYtmTotalStr;
	}
	public Double getBalanceTotal() {
		return balanceTotal;
	}
	public void setBalanceTotal(Double balanceTotal) {
		this.balanceTotal = balanceTotal;
	}
	public String getBalanceTotalStr() {
		return balanceTotalStr;
	}
	public void setBalanceTotalStr(String balanceTotalStr) {
		this.balanceTotalStr = balanceTotalStr;
	}
	public Double getPayforTotal() {
		return payforTotal;
	}
	public void setPayforTotal(Double payforTotal) {
		this.payforTotal = payforTotal;
	}
	public String getPayforTotalStr() {
		return payforTotalStr;
	}
	public void setPayforTotalStr(String payforTotalStr) {
		this.payforTotalStr = payforTotalStr;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Long getOperUser() {
		return operUser;
	}
	public void setOperUser(Long operUser) {
		this.operUser = operUser;
	}
	public Date getOperDate() {
		return operDate;
	}
	public void setOperDate(Date operDate) {
		this.operDate = operDate;
	}
}