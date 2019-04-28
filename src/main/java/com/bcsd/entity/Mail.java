package com.bcsd.entity;
import java.io.Serializable;
import java.util.Date;

public class Mail implements Serializable {
    private Integer id;
    private String receivemailaccount;
    private String mailtitle;
    private String mailsubject;
    private String mailcontent;
    private Date createdate;
    private String remark;
    private Integer status;
    private Integer isdisabled;
    private  Date senddate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReceivemailaccount() {
		return receivemailaccount;
	}
	public void setReceivemailaccount(String receivemailaccount) {
		this.receivemailaccount = receivemailaccount;
	}
	public String getMailtitle() {
		return mailtitle;
	}
	public void setMailtitle(String mailtitle) {
		this.mailtitle = mailtitle;
	}
	public String getMailsubject() {
		return mailsubject;
	}
	public void setMailsubject(String mailsubject) {
		this.mailsubject = mailsubject;
	}
	public String getMailcontent() {
		return mailcontent;
	}
	public void setMailcontent(String mailcontent) {
		this.mailcontent = mailcontent;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIsdisabled() {
		return isdisabled;
	}
	public void setIsdisabled(Integer isdisabled) {
		this.isdisabled = isdisabled;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
    
}
