package com.ja.ims.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.QuestionSQLMapper;
import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.ProductQuestion;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vopoket.QuestionAndAnswerVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionSQLMapper questionSQLMapper;
	
	@Override
	public ArrayList<QuestionVO> SelectMyQuestion(String q_identity) {
		// TODO Auto-generated method stub
		ArrayList<QuestionVO> SelectMyQuestion = questionSQLMapper.SelectMyQuestion(q_identity);
		
		return SelectMyQuestion;
		//안소현
	}

	@Override
	public QuestionAndAnswerVO AnswerForMyQuestion(String q_idx) {
		// TODO Auto-generated method stub
		//System.out.println("QuestionServiceImpl AnswerForMyQuestion 접근");
		System.out.println("q_idx:"+q_idx);
		QuestionVO question = questionSQLMapper.SelectQuestionByQ_idx(q_idx);
		AnswerVO answer = questionSQLMapper.SelectAnswerByQ_idx(question.getQ_idx());
		System.out.println(question);
		System.out.println(answer);
		/*System.out.println(answer.getA_identity());
		System.out.println(answer.getA_content());*/
		/*if((answer.getA_identity()).equals("0")) {
			answer.setA_name("아직 답변이 없습니다.");
			answer.setA_content("아직 답변이 없습니다.");
			answer.setA_date("아직 답변이 없습니다.");
			answer.setA_idx("아직 답변이 없습니다.");
		}else {*/
			String a_name = questionSQLMapper.SearchA_name(answer.getA_identity(),q_idx);
			answer.setA_name(a_name);
		/*}*/
		//System.out.println(answer.getA_name());
		QuestionAndAnswerVO qna = new QuestionAndAnswerVO(question,answer);
		return qna;
		//안소현
	}

	@Override
	public ArrayList<ProductQuestion> getOrderInfo(String member_idx) {
		// TODO Auto-generated method stub
		ArrayList<ProductQuestion> o_idxList = questionSQLMapper.selectOrderInfo(member_idx);
		
		return o_idxList;
		//안소현
	}

	//판매자 답변용
	@Override
	public ArrayList<QuestionVO> selectQuentionForSeller(String member_idx) {
		// TODO Auto-generated method stub
		
		return questionSQLMapper.selectQandA(member_idx);
	}

	@Override
	public QuestionVO QuestionForSeller(String q_idx) {
		// TODO Auto-generated method stub
		//System.out.println("QuestionServiceImpl AnswerForMyQuestion 접근");
		QuestionVO question = questionSQLMapper.SelectQuestionByQ_idx(q_idx);
		return question;
		//안소현
	}

	@Override
	public void insertNewQuestion(QuestionVO questionVO) {
		// TODO Auto-generated method stub
		questionSQLMapper.insertQuestion(questionVO);
	}
	
	//질문에 답변
	@Override
	public void insertAnswerForQ(AnswerVO answerVO) {
		// TODO Auto-generated method stub
		questionSQLMapper.insertAnswer(answerVO);
		questionSQLMapper.updateAnswerForQ(answerVO.getA_identity(), answerVO.getQ_idx());
	}
		
	@Override
	public void deleteQuestion(String q_idx) {
		// TODO Auto-generated method stub
		questionSQLMapper.deleteQuestion(q_idx);
	}

	
	
}
