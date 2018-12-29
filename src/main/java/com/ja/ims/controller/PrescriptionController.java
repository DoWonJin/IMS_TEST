package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.ims.service.MemberService;
import com.ja.ims.service.PrescriptionService;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.PatientVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Ps_LocationVO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vopoket.PrescriptionVO;
import com.ja.ims.vopoket.VisitPharmVO_InDay;

@Controller
public class PrescriptionController {
	@Autowired
	PrescriptionService prescriptionService;

		//Home Button 로그인후 보이는 첫화면
		@RequestMapping("/myPrescriptionAll")
		public String myPrescriptionAll(HttpSession session, Model model) {
			SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
			String member_idx = SUD.getMember_idx();
			ArrayList<VisitPharmVO_InDay> prescriptionVO_AllDay = prescriptionService.prescriptionAllList(member_idx);
			System.out.println(prescriptionVO_AllDay);
			model.addAttribute("prescriptionVO_AllDay", prescriptionVO_AllDay);
			return "/myPrescriptionAll";
		}
		
		//처방전 자세히보기
		@RequestMapping("/prescription")
		public String prescription(HttpServletRequest request, Model model) {
			String v_idx = request.getParameter("v_idx");
			String p_name= request.getParameter("p_name");
			
			String[] diseaseList= request.getParameterValues("disease");
			model.addAttribute("diseaseList", diseaseList);
			PrescriptionVO prescriptionVO= prescriptionService.prescriptionDetail(v_idx);
			int total = 0;
			for(MedicineVO medicineVO : prescriptionVO.getMedicineVOList()) {
				String v_count = prescriptionService.getV_count(medicineVO,v_idx);
				int m_price = Integer.parseInt(medicineVO.getM_price());
				int v_count2 = Integer.parseInt(v_count);
				total += m_price * v_count2;
			}
			String totalPrice = Integer.toString(total);
			
			model.addAttribute("prescriptionVO", prescriptionVO);
			model.addAttribute("totalPrice",totalPrice);
			//약국위치가져오기
			System.out.println("약국이름 : " + p_name);
			PharmacySellerVO  pharmacySellerVO= prescriptionService.viewPharmacyLocation(p_name);
			model.addAttribute("pharmacySellerVO", pharmacySellerVO);
			return "/prescription";
		}
		@RequestMapping("/map")
		@ResponseBody
		public Ps_LocationVO map(HttpServletRequest request) {
			String ps_idx= request.getParameter("ps_idx");
			
			//ps_idx로 ps_location테이블의 위도, 경도 가지고있는 ps_locationVO모델 add
			Ps_LocationVO ps_LocationVO= prescriptionService.viewPs_Location(ps_idx);
			
			return ps_LocationVO;
		}
		
	
}
