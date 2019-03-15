package com.lion.echart.system.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户角色表
 * @author TANGXIAN
 *
 */
public class UserRoleEntity implements Serializable {
	private long id;
	private long userid;
	private long roleid;
	public UserRoleEntity(long userid, long roleid) {
		super();
		this.userid = userid;
		this.roleid = roleid;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public long getRoleid() {
		return roleid;
	}
	public void setRoleid(long roleid) {
		this.roleid = roleid;
	}
	
}