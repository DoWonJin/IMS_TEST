package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.ims.service.MemberService;
import com.ja.ims.vo.CitizenVO;
import com.ja.ims.vo.ConfirmData;
import com.ja.ims.vo.ConfirmID;
import com.ja.ims.vo.ConfirmNick;
import com.ja.ims.vo.FindUserVO;
import com.ja.ims.vo.MemberVO;

@RestController
public class RESTfulController {
	@Autowired
	MemberService memberService;
	
	//본인인증
	@RequestMapping("/confirmCitizen")
	public ConfirmData confirmCitizen(CitizenVO requestCitizenVO) {
		
		ConfirmData confirmData= null;
		CitizenVO citizenVO = memberService.confirmCitizen(requestCitizenVO);
		if(citizenVO!=null) {
			confirmData= new ConfirmData(true,citizenVO.getCiti_idx());
		}else {
			confirmData= new ConfirmData(false);
		}
	
		return confirmData;
	}
	
	//닉네임 중복확인
	@RequestMapping("/confirmNick")
	public ConfirmNick confirmNick(MemberVO requestMemberVO) {
		ConfirmNick confirmNick = null;
		if(memberService.confirmNick(requestMemberVO)==true) {
			confirmNick = new ConfirmNick(true);
			
		}else {
			confirmNick = new ConfirmNick(false);
		}
		return confirmNick;
	}
	//아이디 중복확인
	@RequestMapping("/confirmEmail")
	public ConfirmID confirmEmail(MemberVO requestMemberVO) {
		ConfirmID confirmID= null;
		if(memberService.confirmEmail(requestMemberVO)==true) {
			confirmID= new ConfirmID(true);
			return confirmID;
		}else {
			confirmID= new ConfirmID(false);
			return confirmID;
		}
	}
	
	
	
	@RequestMapping("/findID")
	public ArrayList<String> findID(HttpServletRequest request,Model model) {
		String citi_name = request.getParameter("citi_name");
		String member_identity = request.getParameter("member_identity");
		String member_phone = request.getParameter("member_phone");
		
		FindUserVO requestUserVO = new FindUserVO();
		requestUserVO.setCiti_name(citi_name);
		requestUserVO.setMember_identity(member_identity);
		requestUserVO.setMember_phone(member_phone);
		
		ArrayList<String> findIDList = 
				memberService.findID(requestUserVO);
		model.addAttribute("findIDList", findIDList);
		
		return findIDList;
	}
	
	@RequestMapping("/findPW")
	public String findPW(HttpServletRequest request) {
		String member_id = request.getParameter("member_id");
		String citi_name = request.getParameter("citi_name");
		String citi_identify = request.getParameter("citi_identify");
		
		FindUserVO requestUserVO = new FindUserVO();
		requestUserVO.setMember_id(member_id);
		requestUserVO.setCiti_name(citi_name);
		requestUserVO.setCiti_identify2(citi_identify);
		
		String pw = memberService.findPW(requestUserVO);
		
		return pw;
	}

}
