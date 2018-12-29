package com.ja.ims.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.ims.vo.SessionUserData;

@Controller
public class EtcController {
	//메뉴화면
	@RequestMapping("/navigator")
	public String navigator(HttpSession session) {
		return "/navigator";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "popup/jusoPopup";
	}
	
	public static void fakeLogin(HttpSession session) {
		SessionUserData SUD =  new SessionUserData("2", "맹구", "정도전","1","1");
		session.setAttribute("SUD", SUD);

	}	
}
