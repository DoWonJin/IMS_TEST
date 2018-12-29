package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;
import com.ja.ims.vopoket.DiseaseDetailVO;

@Service
public interface DiseaseService {
	
	
	public ArrayList<DiseaseCategoryVO> getDiseaseCategory();
	public DiseaseDetailVO viewDiease(String c_idx);
	public DiseaseVO diseaseInfo(String d_idx); 
}
