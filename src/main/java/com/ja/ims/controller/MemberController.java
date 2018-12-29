package com.ja.ims.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.ims.mapper.MemberSQLMapper;
import com.ja.ims.mapper.PrescriptionSQLMapper;
import com.ja.ims.service.MemberService;
import com.ja.ims.vo.AddressMemberVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.SessionUserData;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	MemberSQLMapper memberSQLMapper;
	@Autowired
	PrescriptionSQLMapper prescriptionSQLMapper;
		//단순 맵핑 메소드
		
		
		@RequestMapping("/joinMemberForm")
		public String joinMemberForm() {
			return "/joinMemberForm";
		}
		
		@RequestMapping("/joinMemberClassification")
		public String joinMemberClassification() {
			return "/joinMemberClassification";
		}
		
		
		@RequestMapping("/joinGeneralMemberForm1")
		public String joinGeneralMemberForm1(HttpServletRequest request,Model model) {
			String userType = request.getParameter("userType");
			model.addAttribute("userType", userType);
			return "/joinGeneralMemberForm1";
		}
		
		@RequestMapping("/joinGeneralMemberForm2")
		public String joinGeneralMemberForm2(HttpServletRequest request,Model model) {
			String userType = request.getParameter("userType");
			String userName = request.getParameter("citi_name");
			String citi_idx = request.getParameter("citi_idx");
			ArrayList<PharmacySellerVO> pharmacySellerVOList = prescriptionSQLMapper.selectPharmacyVOAll(); 
			model.addAttribute("pharmacySellerVOList", pharmacySellerVOList);
			model.addAttribute("userType", userType);
			model.addAttribute("userName", userName);
			model.addAttribute("citi_idx", citi_idx);
			System.out.println("userType="+userType);
			if(userType.equals("1"))return "/joinGeneralMemberForm2";
			else return "/joinGeneralMemberForm2_manager";
		}
		
		
		//회원가입양식 전송후 처리할 작업
		@RequestMapping("/joinMemberFormAction")
		public String joinMemberFormAction(MemberVO requestMemberVO, HttpServletRequest request, Model model) {
			
			String member_id1 = request.getParameter("member_id1");
			String member_id2 = request.getParameter("member_id2");
			String member_id = member_id1 + "@" + member_id2;
			requestMemberVO.setMember_id(member_id);
			System.out.println(requestMemberVO);
			memberService.joinMember(requestMemberVO);
			String m_nick = requestMemberVO.getMember_nick();
			model.addAttribute("m_nick", m_nick);
			return "/joinSuccess";
		}
		
		@RequestMapping("/joinMemberFormAction_manager")
		public String joinMemberFormAction_Seller(MemberVO requestMemberVO,AddressMemberVO addressMemberVO, HttpServletRequest request, Model model) {
			String member_identity = request.getParameter("member_identity");
			String member_idx = memberSQLMapper.selectMember_seq();
			String ps_idx = memberSQLMapper.selectPs_seq();
			System.out.println(ps_idx);
			String member_id1 = request.getParameter("member_id1");
			String member_id2 = request.getParameter("member_id2");
			String member_id = member_id1 + "@" + member_id2;
			requestMemberVO.setMember_idx(member_idx);
			requestMemberVO.setMember_id(member_id);
			requestMemberVO.setPs_idx(ps_idx);
			addressMemberVO.setMember_idx(member_idx);
			memberService.joinMember(requestMemberVO);
			if(member_identity.equals(MemberVO.seller)) {
				memberSQLMapper.insertPS(ps_idx, requestMemberVO.getMember_idx(),null);
			}
			
			String m_nick = requestMemberVO.getMember_nick();
			model.addAttribute("m_nick", m_nick);
			return "/joinSuccess";
		}
		
		@RequestMapping("/loginForm")
		public String loginForm(HttpSession session) {
			SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
			if(SUD != null) {
				String m_identity = SUD.getMember_identity(); 
				if(m_identity.equals("1"))return "redirect:/myPrescriptionAll";
				else if(m_identity.equals("4")) return "redirect:/sellerMain";
				else if(m_identity.equals("2"))return "redirect:/chemistMain";
				else if(m_identity.equals("5"))return "redirect:/adminMain";
				else return null;
			}
			return "/loginForm";
		}
		
		
		@RequestMapping("/loginFormAction")
		public String loginFormAction(MemberVO requestMemberVO,HttpSession session) {
			SessionUserData SUD =  memberService.login(requestMemberVO);
			if(SUD != null) {
				session.setAttribute("SUD", SUD);
				String m_identity = SUD.getMember_identity(); 
				if(m_identity.equals("1"))return "redirect:/myPrescriptionAll";
				else if(m_identity.equals("4")) return "redirect:/sellerMain";
				else if(m_identity.equals("2"))return "redirect:/chemistMain";
				else if(m_identity.equals("5"))return "redirect:/adminMain";
				else return null;
			}else {
				return "/loginFail";
			}
			
		}
		@RequestMapping("/findMemberIDPW")
		public String findMemberIDPW() {
			return "/findMemberIDPW";
		}
		
		@RequestMapping("/logout")
		public String logout(HttpSession sessionUserData) {
			sessionUserData.invalidate();
			
			return "redirect:/loginForm";
		}
		
		@RequestMapping("/myInfo") 
		public String myInfo(HttpSession session, Model model) {
			SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
			MemberVO memberVO= memberService.viewMemberVO(SUD.getMember_idx());
			
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("SUD", SUD);
			return "/myInfo";
		}
		
		@RequestMapping("/uploadPatientPicture")
		public String uploadPatientPictue(MultipartFile file,HttpSession session) {
			/*String uploadRootPath = 
					"C:\\prod\\apache-tomcat-8.0.53\\wtpwebapps\\IMS_TEST\\uploadimg";*/
			String uploadRootPath = 
					new File("/upload/memberPic").getAbsolutePath();
			//날짜별 폴더 확인 및 생성...
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String dateFolder = sdf.format(date);
			dateFolder = dateFolder.replace("-", File.separator);
			File uploadPath = new File(uploadRootPath,dateFolder); 		
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			MemberVO fileData = null;
			if(!file.isEmpty())  {
				//파일명 변경...시간 / 랜덤.
				UUID uuid = UUID.randomUUID();
				String uploadFileName = uuid.toString();
				
				String oriFileName = file.getOriginalFilename();
				uploadFileName += 
						oriFileName.substring(oriFileName.indexOf("."));
				
				//파일 저장...
				File saveFile = new File(uploadPath,uploadFileName);
				try {
					file.transferTo(saveFile);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				//DB 넣을 값 세팅...
				fileData = new MemberVO();
				String tempString = "/upload/";
				tempString += dateFolder.replace(File.separator, "/");
				tempString += "/";
				tempString += uploadFileName;
				fileData.setMember_pic_root(tempString);
			}
			
			SessionUserData user = 
					(SessionUserData)session.getAttribute("SUD");
			
			memberService.uploadPicture(fileData, user);
			
			return "redirect:/myInfo";
		}
		
		
		@RequestMapping("/modifyMemberForm")
		public String modifyMemberForm(HttpSession session, Model model) {
			SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
			MemberVO memberVO= memberService.viewMemberVO(SUD.getMember_idx());
			
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("SUD", SUD);
			
			return "/modifyMemberForm";
		}
		
		@RequestMapping("/modifyMemberAction")
		public String modifyMemberAction(MemberVO requestMemberVO) {
			memberService.modifyMember(requestMemberVO);
			
			return "redirect:/myInfo";
		}
		
		
		

}
