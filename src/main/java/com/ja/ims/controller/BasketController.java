package com.ja.ims.controller;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.ims.service.BasketService;
import com.ja.ims.vo.BasketVO;
import com.ja.ims.vo.SessionUserData;

@Controller
public class BasketController {
	
	@Autowired
	BasketService basketService;
	
	@RequestMapping("/itemCountCheck")
	@ResponseBody
	public String itemCountCheck(HttpServletRequest request) {
		
		String num = request.getParameter("num");
		String st_idx = request.getParameter("st_idx");
		
		String judge = basketService.checkCount(num,st_idx);
		
		if(judge != null)return "1";
		else return "0";
	}
	
	@RequestMapping("/checkOverlap")
	@ResponseBody
	public String checkOverlap(HttpServletRequest request, HttpSession session) {
		
		SessionUserData SUD= (SessionUserData)session.getAttribute("SUD");
		String member_idx= SUD.getMember_idx();
		String st_idx = request.getParameter("st_idx");
		String resultSt_idx = basketService.checkOverlap(st_idx, member_idx);
		
		
		if(resultSt_idx != null)return "1"; //장바구니에 이미 있는 경우
		else return "0";
	}
	
	@RequestMapping("/orderCountCheck")
	@ResponseBody
	public String orderCountCheck(HttpServletRequest request) {
		String st_idx = request.getParameter("st_idx");
		return basketService.checkOrderCount(st_idx);
	}
	
	
	@RequestMapping("/addBasket") //insert
	public String addBasket(HttpServletRequest request, HttpSession session) {
		
		String st_idx=request.getParameter("st_idx");
		String itemNum= request.getParameter("itemNum");
		
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		String member_idx = SUD.getMember_idx();
		
		
		BasketVO basketVO=new BasketVO();
		basketVO.setSt_idx(st_idx);
		basketVO.setItemNum(itemNum);
		basketVO.setMember_idx(member_idx);
		System.out.println("장바구니 담을 때:" + basketVO);
		basketService.addBasket(basketVO);
		
		return "redirect:/basketList";
	}
	
	@RequestMapping("/basketList") //select
	public String basketList(HttpSession session, Model model) {
		
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		String member_idx = SUD.getMember_idx();
		
		ArrayList<BasketVO> basketVOList = basketService.viewBasket(member_idx);
		System.out.println(basketVOList);
		model.addAttribute("basketVOList", basketVOList);
		
		return "/basketList";
	}
	
	@RequestMapping("/removeOneItem") //delete
	public String removeBasket(HttpServletRequest request, HttpSession session, Model model) {
		String st_idx= request.getParameter("st_idx");
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		String member_idx = SUD.getMember_idx();
		basketService.removeBasket(member_idx, st_idx);//해당 st_idx를 basket에서 삭제
		
		ArrayList<BasketVO> basketVOList = basketService.viewBasket(member_idx);//새로 바뀐 basket을 리턴
		
		model.addAttribute("basketVOList", basketVOList);
		
		return "redirect:/basketList";
	}
	
	@RequestMapping("/removeSelectedItems") //delete
	public String removeSelectedItems(HttpServletRequest request, HttpSession session, Model model) {
		String[] st_idxList= request.getParameterValues("st_idx");
		System.out.println("st_idxList : " + st_idxList);
		SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
		String member_idx = SUD.getMember_idx();
		for(String st_idx : st_idxList) {
			System.out.println("member_idx :" + member_idx);
			System.out.println("st_idx :" + st_idx);
			basketService.removeBasket(member_idx, st_idx);//해당 st_idx를 basket에서 삭제
		}
		ArrayList<BasketVO> basketVOList = basketService.viewBasket(member_idx);//새로 바뀐 basket을 리턴
		model.addAttribute("basketVOList", basketVOList);
		return "redirect:/basketList";
	}
}
