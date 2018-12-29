package com.ja.ims.vo;

public class ProductQuestion {
	private String o_idx;
	private String m_name;
	private String itemNum;
	private String o_date;
	private String st_idx;
	public ProductQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductQuestion(String o_idx, String m_name, String itemNum, String o_date, String st_idx) {
		super();
		this.o_idx = o_idx;
		this.m_name = m_name;
		this.itemNum = itemNum;
		this.o_date = o_date;
		this.st_idx = st_idx;
	}
	public String getO_idx() {
		return o_idx;
	}
	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}
	@Override
	public String toString() {
		return "ProductQuestion [o_idx=" + o_idx + ", m_name=" + m_name + ", itemNum=" + itemNum + ", o_date=" + o_date
				+ ", st_idx=" + st_idx + "]";
	}
	
	
}
