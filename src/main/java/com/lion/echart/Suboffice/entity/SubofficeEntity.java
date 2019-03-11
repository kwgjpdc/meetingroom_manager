package com.lion.echart.Suboffice.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 分局表
 * @author TANGXIAN
 *
 */
public class SubofficeEntity implements Serializable {
	private int subofficeId;
	private String subofficeName;
	private String remark;
	private int priority;
	private String isDisabled;
	private String operUser;
	private Date operDate;
	
	public SubofficeEntity(int subofficeId, String subofficeName, String remark, int priority, String isDisabled,
			String operUser, Date operDate) {
		super();
		this.subofficeId = subofficeId;
		this.subofficeName = subofficeName;
		this.remark = remark;
		this.priority = priority;
		this.isDisabled = isDisabled;
		this.operUser = operUser;
		this.operDate = operDate;
	}
	public int getSubofficeId() {
		return subofficeId;
	}
	public void setSubofficeId(int subofficeId) {
		this.subofficeId = subofficeId;
	}
	public String getSubofficeName() {
		return subofficeName;
	}
	public void setSubofficeName(String subofficeName) {
		this.subofficeName = subofficeName;
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