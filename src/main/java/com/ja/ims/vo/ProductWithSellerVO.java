package com.ja.ims.vo;

public class ProductWithSellerVO {
	private String m_path;
	private String m_idx;
	private String m_name;
	private String ps_price;
	private String m_duration;
	private String m_storage;
	private String st_idx;
	public ProductWithSellerVO(String m_path, String m_idx, String m_name, String ps_price, String m_duration,
			String m_storage, String st_idx) {
		super();
		this.m_path = m_path;
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.ps_price = ps_price;
		this.m_duration = m_duration;
		this.m_storage = m_storage;
		this.st_idx = st_idx;
	}
	public ProductWithSellerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getM_path() {
		return m_path;
	}
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	public String getM_idx() {
		return m_idx;
	}
	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getPs_price() {
		return ps_price;
	}
	public void setPs_price(String ps_price) {
		this.ps_price = ps_price;
	}
	public String getM_duration() {
		return m_duration;
	}
	public void setM_duration(String m_duration) {
		this.m_duration = m_duration;
	}
	public String getM_storage() {
		return m_storage;
	}
	public void setM_storage(String m_storage) {
		this.m_storage = m_storage;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}
	@Override
	public String toString() {
		return "ProductWithSellerVO [m_path=" + m_path + ", m_idx=" + m_idx + ", m_name=" + m_name + ", ps_price="
				+ ps_price + ", m_duration=" + m_duration + ", m_storage=" + m_storage + ", st_idx=" + st_idx + "]";
	}
	
	
	
}
