package com.lion.echart.system.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 角色表
 * @author TANGXIAN
 *
 */
public class RoleEntity implements Serializable {
	private long id;
	private String rolename;
	private Date createdate;
	private String remark;
	private int priority;
	private int status;
	private String isdisabled;
	private String operuser;
	private Date operdate;
	
	public RoleEntity(String rolename, Date createdate, String remark, int priority, int status, String isdisabled,
			String operuser, Date operdate) {
		super();
		this.rolename = rolename;
		this.createdate = createdate;
		this.remark = remark;
		this.priority = priority;
		this.status = status;
		this.isdisabled = isdisabled;
		this.operuser = operuser;
		this.operdate = operdate;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
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