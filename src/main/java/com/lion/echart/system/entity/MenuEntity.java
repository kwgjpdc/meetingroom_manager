package com.lion.echart.system.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 菜单表
 * @author TANGXIAN
 *
 */
public class MenuEntity implements Serializable {
	private long id;
	private String menuname;
	private String url;
	private int ismenu;
	private long pid;
	private Date createdate;
	private String remark;
	private int priority;
	private int status;
	private String isdisabled;
	private String operuser;
	private Date operdate;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIsmenu() {
		return ismenu;
	}
	public void setIsmenu(int ismenu) {
		this.ismenu = ismenu;
	}
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
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