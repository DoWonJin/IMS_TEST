package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.BuySQLMapper;
import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.ProductWithSellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vopoket.ProductDetailVO;
import com.ja.ims.vopoket.ProductDetail_And_QA;
import com.ja.ims.vopoket.QuestionAndAnswerVO;
@Service
public class BuyServiceImpl implements BuyService{
	@Autowired
	BuySQLMapper buySQLMapper;
	
	ArrayList<ProductWithSellerVO> productWithSellerVOList;
	ArrayList<String> unsorted_IdxList;
	ArrayList<String> sorted_IdxList;
	
	
	String statement;

	@Override
	public ArrayList<Product_Category1VO> getProductCategory1() {
		// TODO Auto-generated method stub
		return buySQLMapper.selectProductCategory1();
	}

	@Override
	public ArrayList<ProductWithSellerVO> getProductAllByOption(String orderOption) {
		// TODO Auto-generated method stub
		 
		productWithSellerVOList= new ArrayList<ProductWithSellerVO>();		//모든 게시물을 담을 그릇세팅
		
		unsorted_IdxList = buySQLMapper.selectST_IdxList();
		if(unsorted_IdxList.size() == 0 || unsorted_IdxList == null) {
			System.out.println("재고가 없음.");
			return null;
		}
		makeString(unsorted_IdxList);
		judgeOrderOptionAddProductList(orderOption);
		System.out.println("검색된 총 게시물 갯수 : " + productWithSellerVOList.size());
		return productWithSellerVOList;
	}

	//카테고리2리스트 밑 productWithSellerVO리스트 리턴
		public ArrayList<ProductWithSellerVO> getProductC1FilterByOption(String orderOption, String p1_idx) {
			// TODO Auto-generated method stub

			productWithSellerVOList= new ArrayList<ProductWithSellerVO>();		//모든 게시물을 담을 그릇세팅
			
			unsorted_IdxList = buySQLMapper.selectST_IdxByC1FilterList(p1_idx);
			if(unsorted_IdxList.size() == 0 || unsorted_IdxList == null) {
				System.out.println("재고가 없음.");
				return null;
			}
			makeString(unsorted_IdxList);
			judgeOrderOptionAddProductList(orderOption);
			System.out.println("\n카테고리2 상품들");	
			System.out.println("검색된 총 게시물 갯수 : " + productWithSellerVOList.size());
			return productWithSellerVOList;
		}
		
		public ArrayList<ProductWithSellerVO> getProductC2FilterByOption(String orderOption, String p2_idx) {
			// TODO Auto-generated method stub

			productWithSellerVOList= new ArrayList<ProductWithSellerVO>();		//모든 게시물을 담을 그릇세팅
			
			unsorted_IdxList = buySQLMapper.selectST_IdxByC2FilterList(p2_idx); //재고명단에 있는 정렬되지 않은 번호들
			if(unsorted_IdxList.size() == 0 || unsorted_IdxList == null) {
				System.out.println("재고가 없음.");
				return null;
			}
			makeString(unsorted_IdxList);
			judgeOrderOptionAddProductList(orderOption);
			System.out.println("\n카테고리2 상품들");
			System.out.println("검색된 총 게시물 갯수 : " + productWithSellerVOList.size());
			return productWithSellerVOList;
		}	
	
	@Override
	public ProductDetail_And_QA getProductDetailBySt_idx(String st_idx) {
		
		//상품정보
		ProductDetailVO productDetailVO = buySQLMapper.selectProductDetailBySt_idx(st_idx);
		System.out.println(productDetailVO);
		String seller_nick = buySQLMapper.selectSellerNickBySt_idx(st_idx);
		productDetailVO.setPs_name(seller_nick);
		//질문답변정보
		ArrayList<QuestionAndAnswerVO> questionAndAnswerVO = new ArrayList<QuestionAndAnswerVO>();//질문답변 전체그릇
		ArrayList<QuestionVO> questionVOList = buySQLMapper.selectQuestionAll(st_idx); //질문리스트만 뽑기
		
		
		
		
		AnswerVO answerVO;
		for(QuestionVO questionVO : questionVOList ) {//답변얻기
			answerVO = buySQLMapper.selectAnswerVOByQ_idx(questionVO.getQ_idx());
			questionAndAnswerVO.add(new QuestionAndAnswerVO(questionVO, answerVO));
		}
		
		return new ProductDetail_And_QA(productDetailVO, questionAndAnswerVO);
	}
	
	@Override
	public void insertQuestion(String st_idx, String writer_idx, String content) {
		// TODO Auto-generated method stub
		
		buySQLMapper.insertQuestion(st_idx,writer_idx,content);
		
	}
	
	@Override
	public MemberVO getAddressAll(String member_idx) {
		// TODO Auto-generated method stub
		MemberVO addressVOList = buySQLMapper.selectAddressAll(member_idx);
		return addressVOList;
	}

	//카테고리2리스트만
	public ArrayList<Product_Category2VO> getProductCategory2(String p1_idx) {
		ArrayList<Product_Category2VO> product_Category2VOList= buySQLMapper.selectProductCategory2(p1_idx);
		return product_Category2VOList;
	}
	
	
	
	public String getProductFinalCategoryName(String p2_idx) {
		return buySQLMapper.selectFinalCategoryName(p2_idx);
	}
	
	
	
	

	//이 줄 이후로 모두 공통코드
	public void judgeOrderOptionAddProductList(String orderOption) {
		if(orderOption.equals("best")) {
			System.out.println("best순");
			sorted_IdxList = buySQLMapper.selectBestSortedST_IdxList(statement);
			System.out.println("sorted_IdxList" + sorted_IdxList + "size : " + sorted_IdxList.size());
		}else if(orderOption.equals("name")) {
			System.out.println("name순");
			sorted_IdxList = buySQLMapper.selectNameSortedST_IdxList(statement);
			System.out.println("sorted_IdxList" + sorted_IdxList + "size : " + sorted_IdxList.size());
		}else if(orderOption.equals("lowprice")) {
			System.out.println("값 싼 순서");
			sorted_IdxList = buySQLMapper.selectLowPriceSortedST_IdxList(statement);
			System.out.println("sorted_IdxList" + sorted_IdxList + "size : " + sorted_IdxList.size());
		}else if(orderOption.equals("highprice")) {
			System.out.println("비싼 순서");
			sorted_IdxList = buySQLMapper.selectHighPriceSortedST_IdxList(statement);
			System.out.println("sorted_IdxList" + sorted_IdxList + "size : " + sorted_IdxList.size());
		}
		else {
			sorted_IdxList = null;
			System.out.println("sorted_IdxList : 어떤 기준에도 만족하는 sorted idx가 없음");
			return;
		}
		if(sorted_IdxList == null) {
			return;
		}
		getProduct();
	}
	
	public void getProduct() {
		for(String st_idx : sorted_IdxList) {
			productWithSellerVOList.add(buySQLMapper.selectProduct(st_idx));
		}		
	}
	
	public void makeString(ArrayList<String> st_IdxList) {
		statement = null;
		if(st_IdxList.size() > 0) {
			statement = "";
			for(String st_Idx : st_IdxList) {
				statement += st_Idx;
				statement += ",";
			}
			statement = statement.substring(0, statement.length()-1);
		}
	}
}
