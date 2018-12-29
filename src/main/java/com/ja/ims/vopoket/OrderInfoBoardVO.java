package com.ja.ims.vopoket;

import java.util.ArrayList;

import com.ja.ims.vo.OrderInfoItemVO;

public class OrderInfoBoardVO {
	private String o_date;
	private String total_price;
	private ArrayList<OrderInfoItemVO> orderInfoItemVOList;
	public OrderInfoBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderInfoBoardVO(String o_date, String total_price, ArrayList<OrderInfoItemVO> orderInfoItemVOList) {
		super();
		this.o_date = o_date;
		this.total_price = total_price;
		this.orderInfoItemVOList = orderInfoItemVOList;
	}

	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	
	public ArrayList<OrderInfoItemVO> getOrderInfoItemVOList() {
		return orderInfoItemVOList;
	}
	public void setOrderInfoItemVOList(ArrayList<OrderInfoItemVO> orderInfoItemVOList) {
		this.orderInfoItemVOList = orderInfoItemVOList;
	}

	@Override
	public String toString() {
		return "OrderInfoBoardVO [o_date=" + o_date + ", total_price=" + total_price + ", orderInfoItemVOList="
				+ orderInfoItemVOList + "]";
	}
	
	
	
	
}
