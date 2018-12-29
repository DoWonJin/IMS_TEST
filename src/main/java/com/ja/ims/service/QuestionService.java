package com.ja.ims.service;

import java.util.ArrayList;

import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.ProductQuestion;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vopoket.QuestionAndAnswerVO;

public interface QuestionService {
	public ArrayList<QuestionVO> SelectMyQuestion(String q_identity);
	
	public QuestionAndAnswerVO AnswerForMyQuestion(String q_idx);
	
	public ArrayList<ProductQuestion> getOrderInfo(String member_idx);
	
	//답변용
	public ArrayList<QuestionVO> selectQuentionForSeller(String member_idx);
	
	public QuestionVO QuestionForSeller(String q_idx);
	
	public void insertNewQuestion(QuestionVO questionVO);
	
	public void insertAnswerForQ(AnswerVO answerVO);
	
	public void deleteQuestion(String q_idx);
	
	
}
