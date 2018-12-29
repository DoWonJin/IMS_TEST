package com.ja.ims.vo;

public class OrderListVO {
	private String o_idx;
	private String member_idx;
	private String o_date;//order_Date
	private String out_date;//출고일
	private String total_price;
	public OrderListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderListVO(String o_idx, String member_idx, String o_date, String out_date, String total_price) {
		super();
		this.o_idx = o_idx;
		this.member_idx = member_idx;
		this.o_date = o_date;
		this.out_date = out_date;
		this.total_price = total_price;
	}
	public String getO_idx() {
		return o_idx;
	}
	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	@Override
	public String toString() {
		return "OrderListVO [o_idx=" + o_idx + ", member_idx=" + member_idx + ", o_date=" + o_date + ", out_date="
				+ out_date + ", total_price=" + total_price + "]";
	}
	
	
	
	

}
