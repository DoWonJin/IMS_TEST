package com.ja.ims.vo;

public class ConfirmData {
	private boolean isExistCitizen;
	private String citizenIdx;
	public ConfirmData() {
		
	}
	public ConfirmData(boolean isExistCitizen, String citizenIdx) {
		super();
		this.isExistCitizen = isExistCitizen;
		this.citizenIdx = citizenIdx;
	}
	public ConfirmData(boolean isExistCitizen) {
		super();
		this.isExistCitizen = isExistCitizen;
	}

	public boolean isExistCitizen() {
		return isExistCitizen;
	}
	public void setExistCitizen(boolean isExistCitizen) {
		this.isExistCitizen = isExistCitizen;
	}
	public String getCitizenIdx() {
		return citizenIdx;
	}
	public void setCitizenIdx(String citizenIdx) {
		this.citizenIdx = citizenIdx;
	}

	
	
	

}
