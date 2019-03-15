package com.lion.echart.system.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 角色菜单表
 * @author TANGXIAN
 *
 */
public class RoleMenuEntity implements Serializable {
	private long id;
	private long roleid;
	private long menuid;
	public RoleMenuEntity(long roleid, long menuid) {
		super();
		this.roleid = roleid;
		this.menuid = menuid;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getRoleid() {
		return roleid;
	}
	public void setRoleid(long roleid) {
		this.roleid = roleid;
	}
	public long getMenuid() {
		return menuid;
	}
	public void setMenuid(long menuid) {
		this.menuid = menuid;
	}
}