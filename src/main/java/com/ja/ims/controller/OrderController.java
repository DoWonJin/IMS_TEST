package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.ims.mapper.OrderSQLMapper;
import com.ja.ims.service.OrderService;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.OrderInfoVO;
import com.ja.ims.vo.OrderListVO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vopoket.OrderInfoBoardVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderSQLMapper orderSQLMapper;
	
	//장바구니에서 결제하기-> order_patient_list에 insert 또 order_patient_info에 insert
	@RequestMapping("/payComplete") 
	public String addOrderList(HttpServletRequest request, HttpSession session){
		//order_list테이블에 member_idx와 total_price를 넣고
		SessionUserData SUD= (SessionUserData) session.getAttribute("SUD");
		String member_idx= SUD.getMember_idx();
		String member_address = request.getParameter("address");
		
		String total_price= request.getParameter("total_price");
		orderService.addOrderList(member_idx, total_price);
		
		//o_idx와 주소 가져오기
		OrderInfoVO orderInfoVO= orderService.viewO_idx(member_idx);
		
		//o_idx를 가지고 order_info테이블에 넣어야함
		String[] st_idxList=request.getParameterValues("st_idx");
		String[] itemNumList=request.getParameterValues("itemNum");
		String o_idx=orderInfoVO.getO_idx();
		
		orderService.updateStorage(st_idxList,itemNumList);
		orderService.addOrderInfo(o_idx, st_idxList, itemNumList, member_address);
		
		//insert다 되면 basket삭제 
		orderService.removeBasket(member_idx, st_idxList);
		
		return "payComplete";
	}
	
	//viewOrderList
	@RequestMapping("/orderList") 
	public String orderList(HttpSession session,HttpServletRequest request, Model model) {
		SessionUserData SUD= (SessionUserData)session.getAttribute("SUD");
		String member_idx= SUD.getMember_idx();
		String total_price = request.getParameter("total_price");
		ArrayList<OrderListVO> orderListVOList= orderService.viewOrderList(member_idx);
		model.addAttribute("total_price", total_price);
		model.addAttribute("orderListVOList", orderListVOList);
		
		return "/orderList";
	}
	
	@RequestMapping("/orderInfo")
	public String orderInfo(String o_idx, HttpSession session, Model model) {
		
		//orderInfoBoardVO리턴
		OrderInfoBoardVO orderInfoBoardVO= orderService.viewOrderInfo(o_idx);
		System.out.println(orderInfoBoardVO);

		//세션의 member_idx로 memberVO리턴(orderInfo화면의 맨밑 받는사람, 연락처, 받는주소)
		SessionUserData SUD= (SessionUserData)session.getAttribute("SUD");
		MemberVO memberVO= orderService.viewMemberVO(SUD.getMember_idx());
		
		//out_date
		String out_date= orderService.viewOutDateByO_idx(o_idx);
		model.addAttribute("orderInfoBoardVO", orderInfoBoardVO);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("SUD", SUD);
		model.addAttribute("out_date", out_date);
		
		
		return "/orderInfo";
	}
	
	@RequestMapping("/order")
	public String order(HttpServletRequest request, HttpSession session) {
		//order_list테이블에 member_idx와 total_price를 넣고
				SessionUserData SUD= (SessionUserData) session.getAttribute("SUD");
				String member_idx= SUD.getMember_idx();
				String ps_price = request.getParameter("ps_price");
				String itemNum = request.getParameter("itemNum");
				String member_address= orderSQLMapper.selectAddressByMember_idx(member_idx); 
				int temp = Integer.parseInt(ps_price) * Integer.parseInt(itemNum);
				String total_price = String.valueOf(temp); 
				orderService.addOrderList(member_idx, total_price);
				//o_idx와 주소 가져오기
				
				OrderInfoVO orderInfoVO = orderService.viewO_idx(member_idx);
				//o_idx를 가지고 order_info테이블에 넣어야함
				String st_idx=request.getParameter("st_idx");
				String o_idx=orderInfoVO.getO_idx();
				orderService.addOrderListDirectly(o_idx, st_idx, itemNum, member_address);
				return "redirect:/orderList";
	}
	
	
	
	
	
	
	

}
