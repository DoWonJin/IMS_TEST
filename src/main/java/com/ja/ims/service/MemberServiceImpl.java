package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.MemberSQLMapper;
import com.ja.ims.vo.AddressMemberVO;
import com.ja.ims.vo.CitizenVO;
import com.ja.ims.vo.FindUserVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.SessionUserData;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberSQLMapper memberSQLMapper;
	

	@Override
	public CitizenVO confirmCitizen(CitizenVO requestCitizenVO) {
		CitizenVO citizenVO;
		citizenVO = memberSQLMapper.selectByIdentify(requestCitizenVO);
		return citizenVO;
	}
	
	@Override
	public boolean confirmNick(MemberVO requestMemberVO) {
		
		MemberVO memberVO=memberSQLMapper.selectByNick(requestMemberVO);
		if(memberVO!=null) {
			return true;
		}else return false;
	}

	@Override
	public boolean confirmEmail(MemberVO requestMemberVO) {
		// TODO Auto-generated method stub
		MemberVO memberVO=memberSQLMapper.selectByEmail(requestMemberVO);
		if(memberVO!=null) {
			return true;
		}else return false;
	}

	@Override
	public void joinMember(MemberVO requestMemberVO) {
		// TODO Auto-generated method stub
		
		
		//requestMemberVO.setMember_identity("4");
		memberSQLMapper.insertSeller(requestMemberVO);
	}

	@Override
	public SessionUserData login(MemberVO requestMemberVO) {
		// TODO Auto-generated method stub
		MemberVO memberVO = memberSQLMapper.selectByID(requestMemberVO);
		
		//회원의 이름가져오기
		String citi_name= memberSQLMapper.selectById(requestMemberVO.getMember_id());
		if(memberVO != null && requestMemberVO.getMember_pw().equals(memberVO.getMember_pw()) 
				&& requestMemberVO.getMember_id().equals(memberVO.getMember_id())) {
			return new SessionUserData(memberVO.getMember_idx(), memberVO.getMember_nick(), citi_name,memberVO.getMember_identity(),memberVO.getPs_idx());
		}else {
			return null;
		}
		
	}
	
	@Override
	public ArrayList<String> findID(FindUserVO requestUserVO) {
		//FindUserVO userID;

		ArrayList<String> findIDList = memberSQLMapper.findID(requestUserVO);
		/*
		if(userID != null && requestUserVO.getCiti_name().equals(userID.getCiti_name()) && requestUserVO.getMember_phone().equals(userID.getMember_phone())) {
			for(String IDdata : findIDList) {
				IDdata = userID.getCiti_name();
				findIDList.add(IDdata);
			}*/
		
			
			return findIDList;
		/*}else {
			return null;
		}*/
	}
	
	@Override
	public String findPW(FindUserVO requestuserVO) {
		// TODO Auto-generated method stub
		String findPW = memberSQLMapper.findPW(requestuserVO);		
		return findPW;
	}

	@Override
	public MemberVO viewMemberVO(String member_idx) {
		// TODO Auto-generated method stub
		
		 return memberSQLMapper.selectMemberVOByMember_idx(member_idx);
		
	}
	
	

	@Override
	public void uploadPicture(MemberVO fileData, SessionUserData user) {
		// TODO Auto-generated method stub
		String member_pic_root = fileData.getMember_pic_root();
		String m_idx = user.getMember_idx();
		memberSQLMapper.insertProfilePicture(member_pic_root, m_idx);
	}

	@Override
	public void modifyMember(MemberVO requestMemberVO) {
		// TODO Auto-generated method stub
		memberSQLMapper.updateMember(requestMemberVO);
		
		
	}

}
