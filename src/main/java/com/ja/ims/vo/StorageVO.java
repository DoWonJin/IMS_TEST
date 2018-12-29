package com.ja.ims.vo;

public class StorageVO {
	private String st_idx;
	private String ps_idx;
	private String m_idx;
	private String m_name;
	private String m_storage;
	private String ps_price;
	public StorageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StorageVO(String st_idx, String ps_idx, String m_idx, String m_name, String m_storage, String ps_price) {
		super();
		this.st_idx = st_idx;
		this.ps_idx = ps_idx;
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.m_storage = m_storage;
		this.ps_price = ps_price;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}
	public String getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
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
	public String getM_storage() {
		return m_storage;
	}
	public void setM_storage(String m_storage) {
		this.m_storage = m_storage;
	}
	public String getPs_price() {
		return ps_price;
	}
	public void setPs_price(String ps_price) {
		this.ps_price = ps_price;
	}
	@Override
	public String toString() {
		return "StorageVO [st_idx=" + st_idx + ", ps_idx=" + ps_idx + ", m_idx=" + m_idx + ", m_name=" + m_name
				+ ", m_storage=" + m_storage + ", ps_price=" + ps_price + "]";
	}
	
}
