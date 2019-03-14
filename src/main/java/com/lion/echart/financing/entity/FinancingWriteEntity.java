package com.lion.echart.financing.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lion.echart.base.entity.BaseEntity;

/**
 * * 财务填报实体对象
 * @author lion-y
 *
 */
public class FinancingWriteEntity extends BaseEntity{
	private Long id;//自增id
	private Date payfordate;//付款时间
	private String payfordateStr;
	private String writeyear;//填报年份
	private String writemonth;//填报月份
	private String costtype;//款项类型
	private String costtypeStr;//款项类型
	private String maintype;//所属大类
	private String maintypeStr;//所属大类
	private Long contractid;//所属合同
	private Long subofficeid;//所属分局
	private Double money;//金额
	private String cashierno;//出纳编号
	private String voucherno;//凭证编号
	private Date operdate;//操作时间
	private Long operuser;//操作人
	
	@Override
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getPayfordate() {
		return payfordate;
	}
	public void setPayfordate(Date payfordate) {
		this.payfordate = payfordate;
	}
	public String getPayfordateStr() {
		if(payfordate != null) {
			this.payfordateStr = new SimpleDateFormat("yyyy-MM-dd").format(payfordate);
		}
		return payfordateStr;
	}
	public void setPayfordateStr(String payfordateStr) {
		this.payfordateStr = payfordateStr;
		try {
			if(payfordateStr != null && !payfordateStr.isEmpty()) {
				this.payfordate = new SimpleDateFormat("yyyy-MM-dd").parse(payfordateStr);
				String[] str = payfordateStr.split("-");
				writemonth = str[1];
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getWriteyear() {
		return writeyear;
	}
	public void setWriteyear(String writeyear) {
		this.writeyear = writeyear;
	}
	public String getWritemonth() {
		return writemonth;
	}
	public void setWritemonth(String writemonth) {
		this.writemonth = writemonth;
	}
	public String getCosttype() {
		return costtype;
	}
	public void setCosttype(String costtype) {
		this.costtype = costtype;
	}
	public String getCosttypeStr() {
		return costtypeStr;
	}
	public void setCosttypeStr(String costtypeStr) {
		this.costtypeStr = costtypeStr;
	}
	public String getMaintype() {
		return maintype;
	}
	public void setMaintype(String maintype) {
		this.maintype = maintype;
	}
	public String getMaintypeStr() {
		return maintypeStr;
	}
	public void setMaintypeStr(String maintypeStr) {
		this.maintypeStr = maintypeStr;
	}
	public Long getContractid() {
		return contractid;
	}
	public void setContractid(Long contractid) {
		this.contractid = contractid;
	}
	public Long getSubofficeid() {
		return subofficeid;
	}
	public void setSubofficeid(Long subofficeid) {
		this.subofficeid = subofficeid;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getCashierno() {
		return cashierno;
	}
	public void setCashierno(String cashierno) {
		this.cashierno = cashierno;
	}
	public String getVoucherno() {
		return voucherno;
	}
	public void setVoucherno(String voucherno) {
		this.voucherno = voucherno;
	}
	public Date getOperdate() {
		return operdate;
	}
	public void setOperdate(Date operdate) {
		this.operdate = operdate;
	}
	public Long getOperuser() {
		return operuser;
	}
	public void setOperuser(Long operuser) {
		this.operuser = operuser;
	}
}
