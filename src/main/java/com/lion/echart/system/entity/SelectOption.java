package com.lion.echart.system.entity;

/**
 * lion
 * 2016年10月11日 下午10:23
 * version 0.1
 * comment
 */
public class SelectOption {

	public SelectOption(){}
	
	public SelectOption(String key,String value){
		this.key = key;
		this.value = value;
	}
	
	private String key;
	
	private String value;
	
	private String  haschecked;
	
	private String  specailStr;

	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}

	/**
	 * @param key the key to set
	 */
	public void setKey(String key) {
		this.key = key;
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	public String getHaschecked() {
		return haschecked;
	}

	public void setHaschecked(String haschecked) {
		this.haschecked = haschecked;
	}

	public String getSpecailStr() {
		return specailStr;
	}

	public void setSpecailStr(String specailStr) {
		this.specailStr = specailStr;
	}
	
}