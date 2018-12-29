package com.ja.ims.vo;

public class DiseaseVO {
	private String d_idx;
	private String c_idx;
	private String d_name;
	private String d_symptom;
	private String d_prevention;
	
	public DiseaseVO() {
		
	}

	public DiseaseVO(String d_idx, String c_idx, String d_name, String d_symptom, String d_prevention) {
		super();
		this.d_idx = d_idx;
		this.c_idx = c_idx;
		this.d_name = d_name;
		this.d_symptom = d_symptom;
		this.d_prevention = d_prevention;
	}

	public String getD_idx() {
		return d_idx;
	}

	public void setD_idx(String d_idx) {
		this.d_idx = d_idx;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_symptom() {
		return d_symptom;
	}

	public void setD_symptom(String d_symptom) {
		this.d_symptom = d_symptom;
	}

	public String getD_prevention() {
		return d_prevention;
	}

	public void setD_prevention(String d_prevention) {
		this.d_prevention = d_prevention;
	}
	
	

}
