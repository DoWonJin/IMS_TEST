package com.ja.ims.vopoket;

import java.util.ArrayList;

public class VisitPharmVO {
	String v_date;
	ArrayList<String> disease;
	String pharmName;
	String v_idx;
	
		
	public VisitPharmVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public VisitPharmVO(String v_date, ArrayList<String> disease, String pharmName, String v_idx) {
		super();
		this.v_date = v_date;
		this.disease = disease;
		this.pharmName = pharmName;
		this.v_idx = v_idx;
	}


	public String getV_date() {
		return v_date;
	}


	public void setV_date(String v_date) {
		this.v_date = v_date;
	}


	public ArrayList<String> getDisease() {
		return disease;
	}


	public void setDisease(ArrayList<String> disease) {
		this.disease = disease;
	}


	public String getPharmName() {
		return pharmName;
	}


	public void setPharmName(String pharmName) {
		this.pharmName = pharmName;
	}


	public String getV_idx() {
		return v_idx;
	}


	public void setV_idx(String v_idx) {
		this.v_idx = v_idx;
	}


	@Override
	public String toString() {
		return "VisitPharmVO [v_date=" + v_date + ", disease=" + disease + ", pharmName=" + pharmName + ", v_idx="
				+ v_idx + "]";
	}


		
}
