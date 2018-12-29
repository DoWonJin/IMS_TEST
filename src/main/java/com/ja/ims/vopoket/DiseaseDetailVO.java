package com.ja.ims.vopoket;

import java.util.ArrayList;

import com.ja.ims.vo.DiseaseVO;

public class DiseaseDetailVO {
	
	String diseaseCategoryName;
	ArrayList<DiseaseVO> diseaseList;
	
	
	
	public DiseaseDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiseaseDetailVO(String diseaseCategoryName, ArrayList<DiseaseVO> diseaseList) {
		super();
		this.diseaseCategoryName = diseaseCategoryName;
		this.diseaseList = diseaseList;
	}
	public String getDiseaseCategoryName() {
		return diseaseCategoryName;
	}
	public void setDiseaseCategoryName(String diseaseCategoryName) {
		this.diseaseCategoryName = diseaseCategoryName;
	}
	public ArrayList<DiseaseVO> getDiseaseList() {
		return diseaseList;
	}
	public void setDiseaseList(ArrayList<DiseaseVO> diseaseList) {
		this.diseaseList = diseaseList;
	}
	
	
	
}
