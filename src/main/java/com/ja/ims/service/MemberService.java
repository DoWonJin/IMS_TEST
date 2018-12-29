package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.AddressMemberVO;
import com.ja.ims.vo.CitizenVO;
import com.ja.ims.vo.FindUserVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.SessionUserData;

@Service
public interface MemberService {
	
	public CitizenVO confirmCitizen(CitizenVO requestCitizenVO);
	
	public boolean confirmNick(MemberVO requestMemberVO);
	
	public boolean confirmEmail(MemberVO requestMemberVO);
	
	public void joinMember(MemberVO requestMemberVO);
	
	public SessionUserData login(MemberVO requestMemberVO);
	
	public ArrayList<String> findID(FindUserVO requestuserVO);
	
	public String findPW(FindUserVO requestuserVO);
	
	public MemberVO viewMemberVO(String member_idx);
	
	public void uploadPicture(MemberVO fileData, SessionUserData user);

	
	public void modifyMember(MemberVO requestMemberVO);
	
}