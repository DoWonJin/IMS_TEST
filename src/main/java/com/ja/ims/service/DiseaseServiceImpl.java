package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.DiseaseSQLMapper;
import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;
import com.ja.ims.vopoket.DiseaseDetailVO;

@Service
public class DiseaseServiceImpl implements DiseaseService {
	@Autowired
	DiseaseSQLMapper diseaseSQLMapper;
	
		
		//질병카테고리 모두가져오기
		@Override
		public ArrayList<DiseaseCategoryVO> getDiseaseCategory() {
			// TODO Auto-generated method stub
			return diseaseSQLMapper.selectDiseaseCategoryAll();
		}
		@Override
		public DiseaseDetailVO viewDiease(String c_idx) {
			// TODO Auto-generated method stub
			String diseaseCategoryName = diseaseSQLMapper.selectDiseaseCategoryByIdx(c_idx);
			ArrayList<DiseaseVO> diseaseList = diseaseSQLMapper.selectDiseaseAll(c_idx);
			
			DiseaseDetailVO diseaseDetailVO = new DiseaseDetailVO(diseaseCategoryName, diseaseList);
			return diseaseDetailVO; 
		}
		@Override
		public DiseaseVO diseaseInfo(String d_idx) {
			// TODO Auto-generated method stub
			DiseaseVO diseaseVO = diseaseSQLMapper.selectDiseaseByIdx(d_idx);
			
			return diseaseVO;
		}
		
	
	
}
