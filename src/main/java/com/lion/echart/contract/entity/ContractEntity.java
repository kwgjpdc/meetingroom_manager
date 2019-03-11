package com.lion.echart.contract.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 合同表
 * @author TANGXIAN
 *
 */
public class ContractEntity implements Serializable {
	private int contractId;//合同ID
	private String contractName;//合同名称
	private String contractNum;//合同编码
	private Double amount;//合同金额
	private String durationTime;//工期
	private Date signTime;//合同签订日期
	private String contractPartyB;//合同乙方
	private String remark;//备注
	private int priority;//排序
	private int status;//状态
	private String isDisabled;//是否禁用
	private String operUser;//修改人
	private Date operDate;//修改时间
	private int subofficeId;//所属分局
	
	public ContractEntity(int contractId, String contractName, String contractNum, Double amount, String durationTime,
			Date signTime, String contractPartyB, String remark, int priority, int status, String isDisabled,
			String operUser, Date operDate, int subofficeId) {
		super();
		this.contractId = contractId;
		this.contractName = contractName;
		this.contractNum = contractNum;
		this.amount = amount;
		this.durationTime = durationTime;
		this.signTime = signTime;
		this.contractPartyB = contractPartyB;
		this.remark = remark;
		this.priority = priority;
		this.status = status;
		this.isDisabled = isDisabled;
		this.operUser = operUser;
		this.operDate = operDate;
		this.subofficeId = subofficeId;
	}
	public int getContractId() {
		return contractId;
	}
	public void setContractId(int contractId) {
		this.contractId = contractId;
	}
	public String getContractName() {
		return contractName;
	}
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	public String getContractNum() {
		return contractNum;
	}
	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getDurationTime() {
		return durationTime;
	}
	public void setDurationTime(String durationTime) {
		this.durationTime = durationTime;
	}
	public Date getSignTime() {
		return signTime;
	}
	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}
	public String getContractPartyB() {
		return contractPartyB;
	}
	public void setContractPartyB(String contractPartyB) {
		this.contractPartyB = contractPartyB;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public int getSubofficeId() {
		return subofficeId;
	}
	public void setSubofficeId(int subofficeId) {
		this.subofficeId = subofficeId;
	}
	
}