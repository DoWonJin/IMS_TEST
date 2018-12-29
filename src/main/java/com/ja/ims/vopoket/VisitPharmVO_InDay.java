package com.ja.ims.vopoket;

import java.util.ArrayList;

public class VisitPharmVO_InDay {
	
	ArrayList<VisitPharmVO> visitPharmVOList = new ArrayList<VisitPharmVO>();
	String v_date;

	
	public VisitPharmVO_InDay() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void add(VisitPharmVO visitPharmVO, String v_date) {
		visitPharmVOList.add(visitPharmVO);
		this.v_date = v_date;
	}

	public ArrayList<VisitPharmVO> getVisitPharmVOList() {
		return visitPharmVOList;
	}

	public void setVisitPharmVOList(ArrayList<VisitPharmVO> visitPharmVOList) {
		this.visitPharmVOList = visitPharmVOList;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	@Override
	public String toString() {
		return "VisitPharmVO_InDay [visitPharmVOList=" + visitPharmVOList + ", v_date=" + v_date + "]";
	}
	
	
	
}
