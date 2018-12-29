package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.ja.ims.service.QuestionService;
import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.ProductQuestion;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vopoket.QuestionAndAnswerVO;

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("/questionList")
	public String questionList(HttpSession session, Model model) {
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		String q_identity=SUD.getMember_idx();
		ArrayList<QuestionVO> myQuestionList = questionService.SelectMyQuestion(q_identity);
		model.addAttribute("myQuestionList", myQuestionList);
		
		return "/questionList";
	}
	
	@RequestMapping("/questionAndAnswer")
	public String questionAndAnswer(HttpSession session, String q_idx, Model model) {
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		QuestionAndAnswerVO qna= questionService.AnswerForMyQuestion(q_idx);
		model.addAttribute("SUD", SUD);
		model.addAttribute("qna", qna);
		
		return "/questionAndAnswer";
	}
	
	@RequestMapping("/proposeList")
	public String proposeList(Model model,HttpSession session) {
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		ArrayList<ProductQuestion> productQuestionList = questionService.getOrderInfo(SUD.getMember_idx());
		model.addAttribute("productQuestionList", productQuestionList);
		
		return "/proposeList";
	}
	
	@RequestMapping("/noticeList")
	public String noticeList(Model model) {
		
		return "/noticeList";
	}
	
	@RequestMapping("/newQuestion")
	public String newQuestion(QuestionVO requestQuestionVO, HttpSession session) {
		System.out.println("QuestionController접근");
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		System.out.println(SUD.getMember_idx());
		requestQuestionVO.setQ_identity(SUD.getMember_idx());
		System.out.println("--------------------------------");
		System.out.println("q_identity: "+requestQuestionVO.getQ_identity());
		System.out.println("st_idx: "+requestQuestionVO.getSt_idx());
		System.out.println("q_content: "+requestQuestionVO.getQ_content());
		System.out.println("q_type: "+requestQuestionVO.getQ_type());
		System.out.println("--------------------------------");
		/*if(requestQuestionVO.getQ_type() != "1") {
				requestQuestionVO.setSt_idx(null);
			}*/
				
		questionService.insertNewQuestion(requestQuestionVO);
		return "redirect:/questionList";
	}
	
}
