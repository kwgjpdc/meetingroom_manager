package com.lion.echart.Suboffice.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 分局填报表
 * @author TANGXIAN
 *
 */
public class SubofficeWriteEntity implements Serializable {
	private int subofficeWriteId;//分局填报ID
	private int contractId;//合同ID
	private String constructionContent;//主要建设内容
	private Date beginDate;//开工时间
	private Date planFinishDate;//计划完工时间
	private Double budgetInvest;//概算投资（万元）
	private Double contractAmount;//合同金额
	private Double finishInvest;//自开工以来累计完成投资
	private Double surplusInvest;//剩余投资（万元）
	private Double yearPlanInvest;//本年度计划完成投资
	private Double monthPlanInvest;//本月计划完成投资（万元）
	private Double yearRealityInvest;//本年度实际完成投资
	private Double monthRealityInvest;//本月实际完成投资
	private Double tendayRealityInvest;//本旬实际完成投资（万元）
	private Double earthwork;//土方（万方）
	private Double stonework;//石方（万方）
	private Double beton;//混凝土（万立方米）
	private String overallImageProgress;//总体形象进度
	private Double nextMonthPlanInvest;//下一月度计划完成投资
	private String remark;//备注
	private String year;//所属年份
	private String month;//所属月份
	private int priority;//序号
	private String isDisabled;//是否禁用
	private String operUser;//修改人
	private Date operDate;//修改时间
	
	public SubofficeWriteEntity(int subofficeWriteId, int contractId, String constructionContent, Date beginDate,
			Date planFinishDate, Double budgetInvest, Double contractAmount, Double finishInvest, Double surplusInvest,
			Double yearPlanInvest, Double monthPlanInvest, Double yearRealityInvest, Double monthRealityInvest,
			Double tendayRealityInvest, Double earthwork, Double stonework, Double beton, String overallImageProgress,
			Double nextMonthPlanInvest, String remark, String year, String month, int priority, String isDisabled,
			String operUser, Date operDate) {
		super();
		this.subofficeWriteId = subofficeWriteId;
		this.contractId = contractId;
		this.constructionContent = constructionContent;
		this.beginDate = beginDate;
		this.planFinishDate = planFinishDate;
		this.budgetInvest = budgetInvest;
		this.contractAmount = contractAmount;
		this.finishInvest = finishInvest;
		this.surplusInvest = surplusInvest;
		this.yearPlanInvest = yearPlanInvest;
		this.monthPlanInvest = monthPlanInvest;
		this.yearRealityInvest = yearRealityInvest;
		this.monthRealityInvest = monthRealityInvest;
		this.tendayRealityInvest = tendayRealityInvest;
		this.earthwork = earthwork;
		this.stonework = stonework;
		this.beton = beton;
		this.overallImageProgress = overallImageProgress;
		this.nextMonthPlanInvest = nextMonthPlanInvest;
		this.remark = remark;
		this.year = year;
		this.month = month;
		this.priority = priority;
		this.isDisabled = isDisabled;
		this.operUser = operUser;
		this.operDate = operDate;
	}
	public int getSubofficeWriteId() {
		return subofficeWriteId;
	}
	public void setSubofficeWriteId(int subofficeWriteId) {
		this.subofficeWriteId = subofficeWriteId;
	}
	public int getContractId() {
		return contractId;
	}
	public void setContractId(int contractId) {
		this.contractId = contractId;
	}
	public String getConstructionContent() {
		return constructionContent;
	}
	public void setConstructionContent(String constructionContent) {
		this.constructionContent = constructionContent;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getPlanFinishDate() {
		return planFinishDate;
	}
	public void setPlanFinishDate(Date planFinishDate) {
		this.planFinishDate = planFinishDate;
	}
	public Double getBudgetInvest() {
		return budgetInvest;
	}
	public void setBudgetInvest(Double budgetInvest) {
		this.budgetInvest = budgetInvest;
	}
	public Double getContractAmount() {
		return contractAmount;
	}
	public void setContractAmount(Double contractAmount) {
		this.contractAmount = contractAmount;
	}
	public Double getFinishInvest() {
		return finishInvest;
	}
	public void setFinishInvest(Double finishInvest) {
		this.finishInvest = finishInvest;
	}
	public Double getSurplusInvest() {
		return surplusInvest;
	}
	public void setSurplusInvest(Double surplusInvest) {
		this.surplusInvest = surplusInvest;
	}
	public Double getYearPlanInvest() {
		return yearPlanInvest;
	}
	public void setYearPlanInvest(Double yearPlanInvest) {
		this.yearPlanInvest = yearPlanInvest;
	}
	public Double getMonthPlanInvest() {
		return monthPlanInvest;
	}
	public void setMonthPlanInvest(Double monthPlanInvest) {
		this.monthPlanInvest = monthPlanInvest;
	}
	public Double getYearRealityInvest() {
		return yearRealityInvest;
	}
	public void setYearRealityInvest(Double yearRealityInvest) {
		this.yearRealityInvest = yearRealityInvest;
	}
	public Double getMonthRealityInvest() {
		return monthRealityInvest;
	}
	public void setMonthRealityInvest(Double monthRealityInvest) {
		this.monthRealityInvest = monthRealityInvest;
	}
	public Double getTendayRealityInvest() {
		return tendayRealityInvest;
	}
	public void setTendayRealityInvest(Double tendayRealityInvest) {
		this.tendayRealityInvest = tendayRealityInvest;
	}
	public Double getEarthwork() {
		return earthwork;
	}
	public void setEarthwork(Double earthwork) {
		this.earthwork = earthwork;
	}
	public Double getStonework() {
		return stonework;
	}
	public void setStonework(Double stonework) {
		this.stonework = stonework;
	}
	public Double getBeton() {
		return beton;
	}
	public void setBeton(Double beton) {
		this.beton = beton;
	}
	public String getOverallImageProgress() {
		return overallImageProgress;
	}
	public void setOverallImageProgress(String overallImageProgress) {
		this.overallImageProgress = overallImageProgress;
	}
	public Double getNextMonthPlanInvest() {
		return nextMonthPlanInvest;
	}
	public void setNextMonthPlanInvest(Double nextMonthPlanInvest) {
		this.nextMonthPlanInvest = nextMonthPlanInvest;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getIsDisabled() {
		return isDisabled;
	}
	public void setIsDisabled(String isDisabled) {
		this.isDisabled = isDisabled;
	}
	public String getOperUser() {
		return operUser;
	}
	public void setOperUser(String operUser) {
		this.operUser = operUser;
	}
	public Date getOperDate() {
		return operDate;
	}
	public void setOperDate(Date operDate) {
		this.operDate = operDate;
	}
}