package com.lion.echart.financing.entity;

import java.io.Serializable;

public class FinancingEntity implements Serializable{
	private String costType;//款项类型
	private String costTypeStr;//款项类型
	private String mainType;//所属大类
	private String mainTypeStr;//所属大类
	private String year;//所属年份
	private String total;//累计金额
	
	public String getCostTypeStr() {
		return costTypeStr;
	}
	public void setCostTypeStr(String costTypeStr) {
		this.costTypeStr = costTypeStr;
	}
	public String getMainTypeStr() {
		return mainTypeStr;
	}
	public void setMainTypeStr(String mainTypeStr) {
		this.mainTypeStr = mainTypeStr;
	}
	public String getCostType() {
		return costType;
	}
	public void setCostType(String costType) {
		this.costType = costType;
	}
	public String getMainType() {
		return mainType;
	}
	public void setMainType(String mainType) {
		this.mainType = mainType;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}