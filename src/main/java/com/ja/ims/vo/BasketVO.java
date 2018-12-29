package com.ja.ims.vo;

public class BasketVO {
	
	//insert select 필요한거 다 한번에 넣음
	private String member_idx;
	private String st_idx;
	private String itemNum;
	private String m_path;
	private String m_name;
	private String m_duration;
	private String ps_price;
	
	public BasketVO() {
		super();

	}
	public BasketVO(String member_idx, String st_idx, String itemNum, String m_path, String m_name, String m_duration,
			String ps_price) {
		super();
		this.member_idx = member_idx;
		this.st_idx = st_idx;
		this.itemNum = itemNum;
		this.m_path = m_path;
		this.m_name = m_name;
		this.m_duration = m_duration;
		this.ps_price = ps_price;
	}
	
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getM_path() {
		return m_path;
	}
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_duration() {
		return m_duration;
	}
	public void setM_duration(String m_duration) {
		this.m_duration = m_duration;
	}
	public String getPs_price() {
		return ps_price;
	}
	public void setPs_price(String ps_price) {
		this.ps_price = ps_price;
	}
	
	@Override
	public String toString() {
		return "BasketVO [member_idx=" + member_idx + ", st_idx=" + st_idx + ", itemNum=" + itemNum + ", m_path="
				+ m_path + ", m_name=" + m_name + ", m_duration=" + m_duration + ", ps_price=" + ps_price + "]";
	}
	
	
	

}
