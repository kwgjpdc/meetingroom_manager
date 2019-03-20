package com.lion.echart.Suboffice.entity;

import java.io.Serializable;
import java.util.Date;

import com.lion.echart.base.entity.BaseEntity;
/**
 * 分局填报表
 * @author TANGXIAN
 *
 */
public class SubofficeWriteEntity extends BaseEntity implements Serializable {
	private long subofficewriteid;//分局填报ID
	private long contractid;//合同ID
	private long subofficeid;//分局ID
	private String constructioncontent;//主要建设内容
	private String begindate;//开工时间
	private String planfinishdate;//计划完工时间
	private Double budgetinvest;//概算投资（万元）
	private Double finishinvest;//自开工以来累计完成投资
	private Double surplusinvest;//剩余投资（万元）
	private Double yearplaninvest;//本年度计划完成投资
	private Double monthplaninvest;//本月计划完成投资（万元）
	private Double yearrealityinvest;//本年度实际完成投资
	private Double monthrealityinvest;//本月实际完成投资
	private Double tendayrealityinvest;//本旬实际完成投资（万元）
	private Double earthwork;//土方（万方）
	private Double stonework;//石方（万方）
	private Double beton;//混凝土（万立方米）
	private String overallimageprogress;//总体形象进度
	private Double nextmonthplaninvest;//下一月度计划完成投资
	private String remark;//备注
	private String year;//所属年份
	private String month;//所属月份
	private Integer priority;//序号
	private Integer status;//状态 1已填报 2审核中 3审核通过 4审核不通过
	private Integer type;//状态 1旬报 2月报 
	private Integer tendaytype;//旬状态 1上旬 2中旬 3下旬 
	private String isdisabled;//是否禁用
	private String operuser;//修改人
	private Date operdate;//修改时间
	@Override
	public Long getId() {
		return subofficewriteid;
	}
	public long getSubofficewriteid() {
		return subofficewriteid;
	}
	public void setSubofficewriteid(long subofficewriteid) {
		this.subofficewriteid = subofficewriteid;
	}
	public long getContractid() {
		return contractid;
	}
	public void setContractid(long contractid) {
		this.contractid = contractid;
	}
	public long getSubofficeid() {
		return subofficeid;
	}
	public void setSubofficeid(long subofficeid) {
		this.subofficeid = subofficeid;
	}
	public String getConstructioncontent() {
		return constructioncontent;
	}
	public void setConstructioncontent(String constructioncontent) {
		this.constructioncontent = constructioncontent;
	}
	public String getBegindate() {
		return begindate;
	}
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	public String getPlanfinishdate() {
		return planfinishdate;
	}
	public void setPlanfinishdate(String planfinishdate) {
		this.planfinishdate = planfinishdate;
	}
	public Double getBudgetinvest() {
		return budgetinvest;
	}
	public void setBudgetinvest(Double budgetinvest) {
		this.budgetinvest = budgetinvest;
	}
	public Double getFinishinvest() {
		return finishinvest;
	}
	public void setFinishinvest(Double finishinvest) {
		this.finishinvest = finishinvest;
	}
	public Double getSurplusinvest() {
		return surplusinvest;
	}
	public void setSurplusinvest(Double surplusinvest) {
		this.surplusinvest = surplusinvest;
	}
	public Double getYearplaninvest() {
		return yearplaninvest;
	}
	public void setYearplaninvest(Double yearplaninvest) {
		this.yearplaninvest = yearplaninvest;
	}
	public Double getMonthplaninvest() {
		return monthplaninvest;
	}
	public void setMonthplaninvest(Double monthplaninvest) {
		this.monthplaninvest = monthplaninvest;
	}
	public Double getYearrealityinvest() {
		return yearrealityinvest;
	}
	public void setYearrealityinvest(Double yearrealityinvest) {
		this.yearrealityinvest = yearrealityinvest;
	}
	public Double getMonthrealityinvest() {
		return monthrealityinvest;
	}
	public void setMonthrealityinvest(Double monthrealityinvest) {
		this.monthrealityinvest = monthrealityinvest;
	}
	public Double getTendayrealityinvest() {
		return tendayrealityinvest;
	}
	public void setTendayrealityinvest(Double tendayrealityinvest) {
		this.tendayrealityinvest = tendayrealityinvest;
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
	public String getOverallimageprogress() {
		return overallimageprogress;
	}
	public void setOverallimageprogress(String overallimageprogress) {
		this.overallimageprogress = overallimageprogress;
	}
	public Double getNextmonthplaninvest() {
		return nextmonthplaninvest;
	}
	public void setNextmonthplaninvest(Double nextmonthplaninvest) {
		this.nextmonthplaninvest = nextmonthplaninvest;
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
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getTendaytype() {
		return tendaytype;
	}
	public void setTendaytype(Integer tendaytype) {
		this.tendaytype = tendaytype;
	}
	public String getIsdisabled() {
		return isdisabled;
	}
	public void setIsdisabled(String isdisabled) {
		this.isdisabled = isdisabled;
	}
	public String getOperuser() {
		return operuser;
	}
	public void setOperuser(String operuser) {
		this.operuser = operuser;
	}
	public Date getOperdate() {
		return operdate;
	}
	public void setOperdate(Date operdate) {
		this.operdate = operdate;
	}
	
}