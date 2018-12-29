package com.ja.ims.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.ims.mapper.UpdateSQLMapper;
import com.ja.ims.vo.AddressPharmacyVO;
import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.PatientVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vopoket.PrescriptionVO;

@Controller
public class InsertController {
	
	@Autowired
	UpdateSQLMapper updateSQLMapper;
	
	
	//질병카테고리
	@RequestMapping("/dCategory")
	public String dCategory(Model model) {
		ArrayList<DiseaseCategoryVO> dCategoryVOList = updateSQLMapper.selectAllDCategory();
		model.addAttribute("dCategoryVOList",dCategoryVOList);
		return "/updateData/dCategory";
	}
	@RequestMapping("/dCategoryInputAction")
	public String dCategoryAction(HttpServletRequest request) {
		String c_name = request.getParameter("c_name");
		updateSQLMapper.insertDcategory(c_name);
		return "redirect:/dCategory";
	}
	@RequestMapping("/dCategoryDeleteAction")
	public String dCategoryDeleteAction(HttpServletRequest request) {
		String c_idx = request.getParameter("c_idx");
		updateSQLMapper.deleteDcategory(c_idx);
		return "redirect:/dCategory";
	}
	
	
	//질병
	@RequestMapping("/disease")
	public String disease(Model model) {
		ArrayList<DiseaseCategoryVO> dCategoryVOList = updateSQLMapper.selectAllDCategory();
		ArrayList<DiseaseVO> diseaseVOList = updateSQLMapper.selectAllDisease();
		model.addAttribute("dCategoryVOList",dCategoryVOList);
		model.addAttribute("diseaseVOList",diseaseVOList);
		
		return "/updateData/disease";
	}
	@RequestMapping("/diseaseInputAction")
	public String diseaseAction(HttpServletRequest request) {
		String c_idx = request.getParameter("c_idx");
		String d_name = request.getParameter("d_name");
		String d_symptom = request.getParameter("d_symptom");
		String d_prevention = request.getParameter("d_prevention");
		updateSQLMapper.insertDisease(c_idx, d_name, d_symptom, d_prevention);
		return "redirect:/disease";
	}

	@RequestMapping("/diseaseDeleteAction")
	public String diseaseDeleteAction(HttpServletRequest request) {
		String d_idx = request.getParameter("d_idx");
		updateSQLMapper.deleteDisease(d_idx);
		return "redirect:/disease";
	}
	
	//상품카테고리1
	@RequestMapping("/productCategory1")
	public String productCategory1(Model model) {
		ArrayList<Product_Category1VO> productCategory1VOList = updateSQLMapper.selectAllProduct_Category1();
		model.addAttribute("productCategory1VOList",productCategory1VOList);
		return "/updateData/productCategory1";
	}
	@RequestMapping("/productCategory1InputAction")
	public String productCategory1InputAction(HttpServletRequest request) {
		String p1_name = request.getParameter("p1_name");
		updateSQLMapper.insertPRODUCT_CATEGORY1(p1_name);
		return "redirect:/productCategory1";
	}

	@RequestMapping("/productCategory1DeleteAction")
	public String productCategory1deleteAction(HttpServletRequest request) {
		String p1_idx = request.getParameter("p1_idx");
		updateSQLMapper.deletePRODUCT_CATEGORY1(p1_idx); 
		return "redirect:/productCategory1";
	}	
	
	
	
	//상품카테고리2
	@RequestMapping("/productCategory2")
	public String productCategory2(Model model) {
		ArrayList<Product_Category1VO> productCategory1VOList = updateSQLMapper.selectAllProduct_Category1();
		ArrayList<Product_Category2VO> productCategory2VOList = updateSQLMapper.selectAllProduct_Category2();
		model.addAttribute("productCategory1VOList",productCategory1VOList);
		model.addAttribute("productCategory2VOList",productCategory2VOList);
		return "/updateData/productCategory2";
	}
	@RequestMapping("/productCategory2InputAction")
	public String productCategory2InputAction(HttpServletRequest request) {
		String p1_idx = request.getParameter("p1_idx");
		String p2_name = request.getParameter("p2_name");
		updateSQLMapper.insertPRODUCT_CATEGORY2(p1_idx, p2_name);
		return "redirect:/productCategory2";
	}

	@RequestMapping("/productCategory2DeleteAction")
	public String productCategory1Action(HttpServletRequest request) {
		String p2_idx = request.getParameter("p2_idx");
		updateSQLMapper.deletePRODUCT_CATEGORY2(p2_idx); 
		return "redirect:/productCategory2";
	}	
	
	//약국
		@RequestMapping("/pharmacy")
		public String pharmacy(Model model) {
			ArrayList<PharmacySellerVO> pharmacyVOList = updateSQLMapper.selectAllPharmacy();
			model.addAttribute("pharmacyVOList",pharmacyVOList);
			ArrayList<AddressPharmacyVO> addressPharmacyVOList = new ArrayList<AddressPharmacyVO>();
			System.out.println(addressPharmacyVOList);
			return "/updateData/pharmacy";
		}
		@RequestMapping("/pharmacyInputAction")
		public String pharmacyInputAction(HttpServletRequest request) {
			String ps_idx = updateSQLMapper.selectPs_idx();
			String p_name = request.getParameter("p_name"); 
			String ps_latitude = request.getParameter("ps_latitude");
			String ps_longitude = request.getParameter("ps_longitude");
			updateSQLMapper.insertPharmacy(ps_idx,p_name);
			updateSQLMapper.insertAddress(ps_idx, ps_latitude, ps_longitude);
			
			return "redirect:/pharmacy";
		}

		@RequestMapping("/pharmacyDeleteAction")
		public String pharmacyDeleteAction(HttpServletRequest request) {
			String ps_idx = request.getParameter("ps_idx");
			updateSQLMapper.deletePharmacy(ps_idx);
			updateSQLMapper.deleteAddress(ps_idx);
			return "redirect:/pharmacy";
		}	
	
	
	
	//약품 & 상품
	@RequestMapping("/medicine")
	public String medicine(Model model) {
		ArrayList<DiseaseVO> diseaseVOList = updateSQLMapper.selectAllDisease();
		ArrayList<MedicineVO> medicineVOList = updateSQLMapper.selectAllMedicine();
		model.addAttribute("diseaseVOList",diseaseVOList);
		model.addAttribute("medicineVOList",medicineVOList);
		return "/updateData/medicine";
	}
	
	@RequestMapping("/product")
	public String product(Model model) {
		ArrayList<Product_Category2VO> productCategory2VOList = updateSQLMapper.selectAllProduct_Category2();
		ArrayList<MedicineVO> medicineVOList = updateSQLMapper.selectAllProduct();
		model.addAttribute("productCategory2VOList",productCategory2VOList);
		model.addAttribute("medicineVOList",medicineVOList);
		return "/updateData/product";
	}
	
	@RequestMapping("/medicineInputAction")
	public String medicineInputAction(MultipartFile medicinePic,HttpServletRequest request) {
		String m_name = request.getParameter("m_name");
		String m_pre= request.getParameter("m_pre");
		String m_price= request.getParameter("m_price");
		String m_path;
		String p2_idx= request.getParameter("p2_idx");
		String d_idx= request.getParameter("d_idx");
		String m_duration= request.getParameter("m_duration");
		String m_description= request.getParameter("m_description");
		String m_howtotake = request.getParameter("m_howtotake");
		
		String uploadRootPath = 
				"\\var\\lib\\tomcat8\\wtpwebapps\\IMS_TEST\\";
		String uploadFolderName = "medicineImg";
		uploadRootPath += uploadFolderName; 
		File uploadPath = new File(uploadRootPath); 		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		MedicineVO fileData = null;
		if(!medicinePic.isEmpty())  {
			//파일명 변경...시간 / 랜덤.
			String oriFileName = medicinePic.getOriginalFilename();
			String uploadFileName = m_name + oriFileName.substring(oriFileName.indexOf("."));  
			//파일 저장...
			File saveFile = new File(uploadPath,uploadFileName);
			try {
				medicinePic.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			//DB 넣을 값 세팅...
			fileData = new MedicineVO();
			String tempString = "/" + uploadFolderName	+ "/";
			tempString += uploadFileName;
			fileData.setM_path(tempString);
		}
		m_path = fileData.getM_path();
		updateSQLMapper.insertMEDICINE(m_name, m_pre, m_price, m_path , p2_idx, d_idx, m_duration, m_description, m_howtotake);
		if(p2_idx == null)return "redirect:/medicine";
		return "redirect:/product";
	}

	@RequestMapping("/medicineDeleteAction")
	public String medicineDeleteAction(HttpServletRequest request) {
		String m_idx = request.getParameter("m_idx");
		updateSQLMapper.deleteMEDICINE(m_idx); 
		return "redirect:/medicine";
	}	
	
	//방문기록  & 처방전
	@RequestMapping("/prescriptionUpdate")
	public String prescription(Model model,HttpSession session) {
		SessionUserData SUD =(SessionUserData)session.getAttribute("SUD");
		ArrayList<MemberVO> patientVOList = updateSQLMapper.selectAllMember();
		MemberVO chemistVO = updateSQLMapper.selectChemist(SUD.getMember_idx());
		ArrayList<MedicineVO> medicineVOList = updateSQLMapper.selectAllMedicine();
		ArrayList<PrescriptionVO> prescriptionVOList = updateSQLMapper.selectAllPrescription();
		
		model.addAttribute("chemistVO",chemistVO);

		model.addAttribute("medicineVOList",medicineVOList);
		
		model.addAttribute("patientVOList",patientVOList);
		
		model.addAttribute("prescriptionVOList",prescriptionVOList);

		return "/updateData/prescription";
	}
	@RequestMapping("/prescriptionInputAction")
	public String prescriptionInputAction(HttpServletRequest request) {
		String v_idx = updateSQLMapper.seq_patient_idx();
		String ps_idx= request.getParameter("ps_idx");
		String member_chemist_idx= request.getParameter("member_chemist_idx");
		String v_pre= request.getParameter("v_pre");
		String v_date= request.getParameter("v_date");
		String member_patient_idx= request.getParameter("member_patient_idx");
		String howtotake= request.getParameter("howtotake");
		
		String[] m_idxList = request.getParameterValues("m_idx");
		String[] v_countList = request.getParameterValues("v_count");
		String[] v_dueList = request.getParameterValues("v_due");
		
		updateSQLMapper.insertPatient(v_idx, ps_idx, member_chemist_idx, v_pre, v_date, member_patient_idx, howtotake);
		for(int i=0; i<m_idxList.length; i++) {
			updateSQLMapper.insertPrescription(v_idx, m_idxList[i], v_countList[i], v_dueList[i]);
		}
		return "redirect:/prescription";
	}



}
