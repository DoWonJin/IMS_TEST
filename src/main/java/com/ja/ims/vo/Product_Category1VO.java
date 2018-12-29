package com.ja.ims.vo;

public class Product_Category1VO {
	String p1_idx;
	String p1_name;
	public Product_Category1VO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_Category1VO(String p1_idx, String p1_name) {
		super();
		this.p1_idx = p1_idx;
		this.p1_name = p1_name;
	}
	public String getP1_idx() {
		return p1_idx;
	}
	public void setP1_idx(String p1_idx) {
		this.p1_idx = p1_idx;
	}
	public String getP1_name() {
		return p1_name;
	}
	public void setP1_name(String p1_name) {
		this.p1_name = p1_name;
	}
	@Override
	public String toString() {
		return "Product_Category1VO [p1_idx=" + p1_idx + ", p1_name=" + p1_name + "]";
	}
	
	
	
}
