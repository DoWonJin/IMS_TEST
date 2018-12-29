package com.ja.ims.vo;

public class Product_Category2VO {
	String p2_idx;
	String p1_idx;
	String p2_name;
	public Product_Category2VO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product_Category2VO(String p2_idx, String p1_idx, String p2_name) {
		super();
		this.p2_idx = p2_idx;
		this.p1_idx = p1_idx;
		this.p2_name = p2_name;
	}
	public String getP2_idx() {
		return p2_idx;
	}
	public void setP2_idx(String p2_idx) {
		this.p2_idx = p2_idx;
	}
	public String getP1_idx() {
		return p1_idx;
	}
	public void setP1_idx(String p1_idx) {
		this.p1_idx = p1_idx;
	}
	public String getP2_name() {
		return p2_name;
	}
	public void setP2_name(String p2_name) {
		this.p2_name = p2_name;
	}
	@Override
	public String toString() {
		return "Product_Category2VO [p2_idx=" + p2_idx + ", p1_idx=" + p1_idx + ", p2_name=" + p2_name + "]";
	}
	
	
	
}
