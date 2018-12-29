package com.ja.ims.controller;

import java.util.ArrayList;

import javax.el.ArrayELResolver;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.ims.service.DiseaseService;
import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;
import com.ja.ims.vopoket.DiseaseDetailVO;

@Controller
public class DiseaseController {
	@Autowired 
	DiseaseService diseaseService;
	//단순매핑
	
		@RequestMapping("/diseaseCategoryList")
		public String diseaseCategoryList(Model model) {
			ArrayList<DiseaseCategoryVO> diseaseCategoryVOList 
				= diseaseService.getDiseaseCategory();
			model.addAttribute("diseaseCategoryVOList", diseaseCategoryVOList);
			return "/diseaseCategoryList";
		}
		
		//질병 카테고리누른 후 나오는 질병목록
		@RequestMapping("/diseaseListDetail")
		public String diseaseListDetail(HttpServletRequest request,Model model) {
			String c_idx = request.getParameter("c_idx");
			DiseaseDetailVO dieaseDetailVO = diseaseService.viewDiease(c_idx);
			model.addAttribute("c_idx",c_idx ); 
			model.addAttribute("dieaseDetailVO",dieaseDetailVO ); 
			return "/diseaseListDetail";
		}
		
		@RequestMapping("/diseaseInfo")
		public String diseaseInfo(HttpServletRequest request,Model model) {
			String c_idx = request.getParameter("c_idx");
			String c_name = request.getParameter("c_name");
			String d_idx = request.getParameter("d_idx");
			DiseaseVO diseaseInfo = diseaseService.diseaseInfo(d_idx);
			model.addAttribute("c_idx", c_idx);
			model.addAttribute("c_name", c_name);
			model.addAttribute("diseaseInfo", diseaseInfo);
			return "/diseaseInfo";
		}
	
}
