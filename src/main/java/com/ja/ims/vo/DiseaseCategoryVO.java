package com.ja.ims.vo;

public class DiseaseCategoryVO {
	String c_idx;
	String c_name;
	public DiseaseCategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiseaseCategoryVO(String c_idx, String c_name) {
		super();
		this.c_idx = c_idx;
		this.c_name = c_name;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	@Override
	public String toString() {
		return "DiseaseCategoryVO [c_idx=" + c_idx + ", c_name=" + c_name + "]";
	}
	
	
}
