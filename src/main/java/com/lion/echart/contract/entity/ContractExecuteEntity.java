package com.lion.echart.contract.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 合同签订表
 * @author TANGXIAN
 *
 */
public class ContractExecuteEntity implements Serializable {
	private int contractExecuteId;
	private int contractId;
	private Double monthamount;
	private String remark;
	private String year;//所属年份
	private String month;//所属月份
	private int priority;
	private String isDisabled;
	private String operUser;
	private Date operDate;
	
	public ContractExecuteEntity(int contractId, Double monthamount, String remark, String year, String month,
			int priority, String isDisabled, String operUser, Date operDate) {
		super();
		this.contractId = contractId;
		this.monthamount = monthamount;
		this.remark = remark;
		this.year = year;
		this.month = month;
		this.priority = priority;
		this.isDisabled = isDisabled;
		this.operUser = operUser;
		this.operDate = operDate;
	}

	public int getContractExecuteId() {
		return contractExecuteId;
	}

	public void setContractExecuteId(int contractExecuteId) {
		this.contractExecuteId = contractExecuteId;
	}

	public int getContractId() {
		return contractId;
	}
	public void setContractId(int contractId) {
		this.contractId = contractId;
	}
	public Double getMonthamount() {
		return monthamount;
	}
	public void setMonthamount(Double monthamount) {
		this.monthamount = monthamount;
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