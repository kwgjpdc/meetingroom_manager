package com.lion.echart.financing.entity;

import java.util.Date;

import com.lion.echart.base.entity.BaseEntity;

public class FinancingRepairEntity extends BaseEntity{
	private Long id;
	private Long year;//年
	private Long month;//月
	private String ctype;//款项
	private String classes;//大类
	private Double cmoney;//合同金额
	private Double summoney;//累计金额
	private Double tytmmoney;//this year to month 本年至当月完成金额
	private Double mmoney;//当月金额
	private String sourcemoney;//资金来源
	private String operuser;//修改人
	private Date operdate;//修改时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getYear() {
		return year;
	}
	public void setYear(Long year) {
		this.year = year;
	}
	public Long getMonth() {
		return month;
	}
	public void setMonth(Long month) {
		this.month = month;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public Double getCmoney() {
		return cmoney;
	}
	public void setCmoney(Double cmoney) {
		this.cmoney = cmoney;
	}
	public Double getSummoney() {
		return summoney;
	}
	public void setSummoney(Double summoney) {
		this.summoney = summoney;
	}
	public Double getTytmmoney() {
		return tytmmoney;
	}
	public void setTytmmoney(Double tytmmoney) {
		this.tytmmoney = tytmmoney;
	}
	public Double getMmoney() {
		return mmoney;
	}
	public void setMmoney(Double mmoney) {
		this.mmoney = mmoney;
	}
	public String getSourcemoney() {
		return sourcemoney;
	}
	public void setSourcemoney(String sourcemoney) {
		this.sourcemoney = sourcemoney;
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
