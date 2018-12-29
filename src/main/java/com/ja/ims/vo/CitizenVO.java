package com.ja.ims.vo;

public class CitizenVO {
	private String citi_idx;
	private String citi_name;
	private String citi_insure;
	private String citi_identify1;
	private String citi_identify2;

	public CitizenVO() {
		
	}

	public CitizenVO(String citi_idx, String citi_name, String citi_insure,
			String citi_identify1, String citi_identify2) {
		super();
		this.citi_idx = citi_idx;
		this.citi_name = citi_name;
		this.citi_insure = citi_insure;
		this.citi_identify1 = citi_identify1;
		this.citi_identify2 = citi_identify2;
	}

	public String getCiti_idx() {
		return citi_idx;
	}

	public void setCiti_idx(String citi_idx) {
		this.citi_idx = citi_idx;
	}

	public String getCiti_name() {
		return citi_name;
	}

	public void setCiti_name(String citi_name) {
		this.citi_name = citi_name;
	}

	public String getCiti_insure() {
		return citi_insure;
	}

	public void setCiti_insure(String citi_insure) {
		this.citi_insure = citi_insure;
	}

	public String getCiti_identify1() {
		return citi_identify1;
	}

	public void setCiti_identify1(String citi_identify1) {
		this.citi_identify1 = citi_identify1;
	}

	public String getCiti_identify2() {
		return citi_identify2;
	}

	public void setCiti_identify2(String citi_identify2) {
		this.citi_identify2 = citi_identify2;
	}

	@Override
	public String toString() {
		return "CitizenVO [citi_idx=" + citi_idx + ", citi_name="
				+ citi_name + ", citi_insure=" + citi_insure
				+ ", citi_identify1=" + citi_identify1
				+ ", citi_identify2=" + citi_identify2 + "]";
	}
	
}
