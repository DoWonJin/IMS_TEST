package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.ims.mapper.OrderSQLMapper;
import com.ja.ims.mapper.SellerSQLMapper;
import com.ja.ims.service.MemberService;
import com.ja.ims.service.QuestionService;
import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.OrderInfoVO;
import com.ja.ims.vo.OrderListVO;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vo.StorageVO;
import com.ja.ims.vopoket.OrderInfoBoardVO;

@Controller
public class SellerController {
	
	@Autowired 
	SellerSQLMapper sellerSQLMapper;
	@Autowired
	OrderSQLMapper orderSQLMapper;
	@Autowired
	MemberService memberService;
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("/sellerMain")
	public String enrollMain(HttpSession session){
		return "/sellerMain";
	}
	
	@RequestMapping("/storage")
	public String storage(HttpSession session, Model model){
		SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
		ArrayList<MedicineVO> medicineVOList =  sellerSQLMapper.selectAllMedicineVO();
		model.addAttribute("medicineVOList",medicineVOList);
		
		ArrayList<StorageVO> storageVOList = sellerSQLMapper.selectStorageVOByPsIdx(SUD.getPs_idx());
		for(StorageVO storage: storageVOList) {
			storage.setM_name(sellerSQLMapper.selectM_name(storage.getM_idx()));
		}
		model.addAttribute("storageVOList",storageVOList);
		return "/updateData/storage";
	}
	
	@RequestMapping("/storageInputAction")
	public String storageInputAction(HttpSession session,HttpServletRequest request) {
		SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
		String m_idx  = request.getParameter("m_idx");
		String m_storage  = request.getParameter("m_storage");
		String ps_price  = request.getParameter("ps_price");
		sellerSQLMapper.enrollItem(SUD.getPs_idx(),m_idx, m_storage, ps_price);
		return "redirect:/storage";
	}

	@RequestMapping("/storageDeleteAction")
	public String enrollItemsDeleteAction(HttpServletRequest request) {
		String st_idx  = request.getParameter("st_idx");
		sellerSQLMapper.deleteStorage(st_idx);
		return "redirect:/storage";
	}	
	
	@RequestMapping("/showOrderList")
	public String showOrderList(HttpSession session, Model model){
		SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
		
		return "/showOrderList";
	}
	
	@RequestMapping("/showOrderDetail")
	public String showOrderDetail(HttpSession session, Model model){
		SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
		String ps_idx = SUD.getPs_idx();
		ArrayList<OrderInfoVO> orderInfoVOList= orderSQLMapper.selectOrderListVOByPs_idx(ps_idx);
		for(OrderInfoVO orderInfoVO : orderInfoVOList) {
			String m_name = orderSQLMapper.selectM_name(orderInfoVO.getSt_idx());
			orderInfoVO.setM_name(m_name);
		}
		model.addAttribute("orderInfoVOList", orderInfoVOList);
		return "/showOrderDetail";
	}
	
	//답변 컨트롤(약사,판매자,관리자용)
		@RequestMapping("/questionListForSeller")
		public String questionListForSeller(HttpSession session,Model model) {
			SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
			String member_idx = SUD.getMember_idx();
			System.out.println("member_idx:"+member_idx);
			ArrayList<QuestionVO> myQuestionList = questionService.selectQuentionForSeller(member_idx);
			System.out.println(myQuestionList);
			model.addAttribute("myQuestionList", myQuestionList);
			
			return "/updateData/questionListForSeller";
		}
		
		@RequestMapping("/answerForQuestion")
		public String answerForQuestion(HttpSession session, String q_idx,Model model) {
			SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
			QuestionVO question= questionService.QuestionForSeller(q_idx);
			model.addAttribute("SUD", SUD);
			model.addAttribute("question", question);
			
			
			return "/updateData/answerForQuestion";
		}

		@RequestMapping("/answerForQuestionAction")
		public String answerForQuestionAction(HttpSession session,String q_idx,AnswerVO answerVO) {
			SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
			answerVO.setA_identity(SUD.getMember_idx());
			answerVO.setQ_idx(q_idx);
			//System.out.println(answerVO);
			questionService.insertAnswerForQ(answerVO);
			
			return "redirect:/questionListForSeller";
		}
}
