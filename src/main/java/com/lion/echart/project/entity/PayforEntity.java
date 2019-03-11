package com.lion.echart.project.entity;

import java.io.Serializable;

/**
 * 支付情况统计视图
 * @author lion-y
 *
 */
public class PayforEntity implements Serializable {
	private String id;
	private String payType;//支付类型
	private String payTypeStr;
	private String moneyyi;
	private String moneyer;
	private String moneysa;
	private String moneysi;
	private String moneywu;
	private String moneyhj;//费用合计
	
	public PayforEntity(String payType, String payTypeStr, String moneyyi, String moneyer, String moneysa,
			String moneysi, String moneyhj) {
		super();
		this.payType = payType;
		this.payTypeStr = payTypeStr;
		this.moneyyi = moneyyi;
		this.moneyer = moneyer;
		this.moneysa = moneysa;
		this.moneysi = moneysi;
		this.moneyhj = moneyhj;
	}
	
	public PayforEntity(String id, String payType, String payTypeStr, String moneyyi, String moneyer, String moneysa,
			String moneysi, String moneywu, String moneyhj) {
		super();
		this.id = id;
		this.payType = payType;
		this.payTypeStr = payTypeStr;
		this.moneyyi = moneyyi;
		this.moneyer = moneyer;
		this.moneysa = moneysa;
		this.moneysi = moneysi;
		this.moneywu = moneywu;
		this.moneyhj = moneyhj;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPayTypeStr() {
		return payTypeStr;
	}
	public void setPayTypeStr(String payTypeStr) {
		this.payTypeStr = payTypeStr;
	}
	public String getMoneyyi() {
		return moneyyi;
	}
	public void setMoneyyi(String moneyyi) {
		this.moneyyi = moneyyi;
	}
	public String getMoneyer() {
		return moneyer;
	}
	public void setMoneyer(String moneyer) {
		this.moneyer = moneyer;
	}
	public String getMoneysa() {
		return moneysa;
	}
	public void setMoneysa(String moneysa) {
		this.moneysa = moneysa;
	}
	public String getMoneysi() {
		return moneysi;
	}
	public void setMoneysi(String moneysi) {
		this.moneysi = moneysi;
	}
	public String getMoneywu() {
		return moneywu;
	}
	public void setMoneywu(String moneywu) {
		this.moneywu = moneywu;
	}
	public String getMoneyhj() {
		return moneyhj;
	}
	public void setMoneyhj(String moneyhj) {
		this.moneyhj = moneyhj;
	}
}