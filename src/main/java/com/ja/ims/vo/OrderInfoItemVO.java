package com.ja.ims.vo;

public class OrderInfoItemVO {
	private String st_idx;
	private String m_path;
	private String m_name;
	private String m_idx;
	private String ps_price;
	private String itemNum;
	public OrderInfoItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderInfoItemVO(String st_idx, String m_path, String m_name, String m_idx, String ps_price, String itemNum) {
		super();
		this.st_idx = st_idx;
		this.m_path = m_path;
		this.m_name = m_name;
		this.m_idx = m_idx;
		this.ps_price = ps_price;
		this.itemNum = itemNum;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
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
	public String getM_idx() {
		return m_idx;
	}
	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}
	public String getPs_price() {
		return ps_price;
	}
	public void setPs_price(String ps_price) {
		this.ps_price = ps_price;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	@Override
	public String toString() {
		return "OrderInfoItemVO [st_idx=" + st_idx + ", m_path=" + m_path + ", m_name=" + m_name + ", m_idx=" + m_idx
				+ ", ps_price=" + ps_price + ", itemNum=" + itemNum + "]";
	}
	
	
	

}
