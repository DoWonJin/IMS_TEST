package com.ja.ims.vo;

public class OrderInfoVO {
	private String o_idx;
	private String st_idx;
	private String m_name;
	private String itemNum;
	private String member_address;
	
	
	public OrderInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getO_idx() {
		return o_idx;
	}


	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}


	public String getSt_idx() {
		return st_idx;
	}


	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
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


	public String getMember_address() {
		return member_address;
	}


	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}


	@Override
	public String toString() {
		return "OrderInfoVO [o_idx=" + o_idx + ", st_idx=" + st_idx + ", m_name=" + m_name + ", itemNum=" + itemNum
				+ ", member_address=" + member_address + "]";
	}


	public OrderInfoVO(String o_idx, String st_idx, String m_name, String itemNum, String member_address) {
		super();
		this.o_idx = o_idx;
		this.st_idx = st_idx;
		this.m_name = m_name;
		this.itemNum = itemNum;
		this.member_address = member_address;
	}



}
