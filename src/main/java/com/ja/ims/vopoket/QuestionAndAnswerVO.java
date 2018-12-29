package com.ja.ims.vopoket;

import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.QuestionVO;

public class QuestionAndAnswerVO {
	
	private QuestionVO questionVO;
	private AnswerVO answerVO;
	public QuestionAndAnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionAndAnswerVO(QuestionVO questionVO, AnswerVO answerVO) {
		super();
		this.questionVO = questionVO;
		this.answerVO = answerVO;
	}
	public QuestionVO getQuestionVO() {
		return questionVO;
	}
	public void setQuestionVO(QuestionVO questionVO) {
		this.questionVO = questionVO;
	}
	public AnswerVO getAnswerVO() {
		return answerVO;
	}
	public void setAnswerVO(AnswerVO answerVO) {
		this.answerVO = answerVO;
	}
	@Override
	public String toString() {
		return "QuestionAndAnswerVO [questionVO=" + questionVO + ", answerVO=" + answerVO + "]";
	}
	
}
