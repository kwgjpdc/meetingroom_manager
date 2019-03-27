package com.lion.echart.system.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 菜单表
 * @author TANGXIAN
 *
 */
public class MenuEntity implements Serializable {
	private Long id;
	private String menuname;	//菜单名称  
	private String url;			//访问地址  
	private int ismenu;			//是否菜单  
	private Long pid;			//上级菜单ID
	private Date createdate;	//
	private String remark;		//
	private int priority;		//
	private int status;			//
	private String isdisabled;	//
	private String operuser;	//
	private Date operdate;		//
	
	public MenuEntity(){
		
	}
	public MenuEntity(Long id, String menuname, String url, int ismenu, Long pid, Date createdate, String remark, int priority,
			int status, String isdisabled, String operuser, Date operdate) {
		super();
		this.id = id;
		this.menuname = menuname;
		this.url = url;
		this.ismenu = ismenu;
		this.pid = pid;
		this.createdate = createdate;
		this.remark = remark;
		this.priority = priority;
		this.status = status;
		this.isdisabled = isdisabled;
		this.operuser = operuser;
		this.operdate = operdate;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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
	public Long getPid() {
		return pid;
	}
	public void setPid(Long pid) {
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