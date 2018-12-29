package com.ja.ims.vo;

import java.util.ArrayList;

public class PageVO {
	private int startPage;
	private int endPage;
	private ArrayList<ProductWithSellerVO> productWithSellerVOList;
	public PageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageVO(int startPage, int endPage, ArrayList<ProductWithSellerVO> productWithSellerVOList) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.productWithSellerVOList = productWithSellerVOList;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public ArrayList<ProductWithSellerVO> getProductWithSellerVOList() {
		return productWithSellerVOList;
	}
	public void setProductWithSellerVOList(ArrayList<ProductWithSellerVO> productWithSellerVOList) {
		this.productWithSellerVOList = productWithSellerVOList;
	}
	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", productWithSellerVOList="
				+ productWithSellerVOList + "]";
	} 
	
}
