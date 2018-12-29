package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.ProductWithSellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vopoket.ProductDetail_And_QA;

@Service
public interface BuyService {
	public ArrayList<Product_Category1VO> getProductCategory1();  
	
	//Ajax에 필요한 메소드
	public ArrayList<ProductWithSellerVO> getProductAllByOption(String orderOption);
	
	public ProductDetail_And_QA getProductDetailBySt_idx(String st_idx);
	
	public ArrayList<Product_Category2VO> getProductCategory2(String p1_idx);  
	
	public ArrayList<ProductWithSellerVO> getProductC1FilterByOption(String orderOption, String p1_idx);
	
	public String getProductFinalCategoryName(String p2_idx);
	
	public ArrayList<ProductWithSellerVO> getProductC2FilterByOption(String orderOption, String p2_idx);
	
	public void insertQuestion(String st_idx,String writer_idx,String content);
	
	//결제할 때, 배송지 주소불러오기
	public MemberVO getAddressAll(String member_idx);
}
