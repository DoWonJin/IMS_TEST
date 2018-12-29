package com.ja.ims.vopoket;

import java.util.ArrayList;

public class ProductDetail_And_QA {
	ProductDetailVO productDetailVO;
	ArrayList<QuestionAndAnswerVO> questionAndAnswerVO;

	public ProductDetail_And_QA() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetail_And_QA(ProductDetailVO productDetailVO, ArrayList<QuestionAndAnswerVO> questionAndAnswerVO) {
		super();
		this.productDetailVO = productDetailVO;
		this.questionAndAnswerVO = questionAndAnswerVO;
	}
	public ProductDetailVO getProductDetailVO() {
		return productDetailVO;
	}
	public void setProductDetailVO(ProductDetailVO productDetailVO) {
		this.productDetailVO = productDetailVO;
	}
	public ArrayList<QuestionAndAnswerVO> getQuestionAndAnswerVO() {
		return questionAndAnswerVO;
	}
	public void setQuestionAndAnswerVO(ArrayList<QuestionAndAnswerVO> questionAndAnswerVO) {
		this.questionAndAnswerVO = questionAndAnswerVO;
	}
	@Override
	public String toString() {
		return "ProductDetail_And_QA [productDetailVO=" + productDetailVO + ", questionAndAnswerVO="
				+ questionAndAnswerVO + "]";
	}
	
}
