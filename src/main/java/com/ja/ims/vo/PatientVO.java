package com.ja.ims.vo;

/**
 * @author user
 *
 */
public class PatientVO {
	private String v_idx;
	private String ps_idx;
	private String member_chemist_idx;
	private String v_pre;
	private String v_date;
	private String member_patient_idx;
	private String howtotake;
	
	public PatientVO() {
		
	}

	public PatientVO(String v_idx, String ps_idx, String member_chemist_idx, String v_pre, String v_date,
			String member_patient_idx, String howtotake) {
		super();
		this.v_idx = v_idx;
		this.ps_idx = ps_idx;
		this.member_chemist_idx = member_chemist_idx;
		this.v_pre = v_pre;
		this.v_date = v_date;
		this.member_patient_idx = member_patient_idx;
		this.howtotake = howtotake;
	}

	public String getV_idx() {
		return v_idx;
	}

	public void setV_idx(String v_idx) {
		this.v_idx = v_idx;
	}

	public String getPs_idx() {
		return ps_idx;
	}

	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}

	public String getMember_chemist_idx() {
		return member_chemist_idx;
	}

	public void setMember_chemist_idx(String member_chemist_idx) {
		this.member_chemist_idx = member_chemist_idx;
	}

	public String getV_pre() {
		return v_pre;
	}

	public void setV_pre(String v_pre) {
		this.v_pre = v_pre;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}

	public String getMember_patient_idx() {
		return member_patient_idx;
	}

	public void setMember_patient_idx(String member_patient_idx) {
		this.member_patient_idx = member_patient_idx;
	}

	public String getHowtotake() {
		return howtotake;
	}

	public void setHowtotake(String howtotake) {
		this.howtotake = howtotake;
	}

	@Override
	public String toString() {
		return "PatientVO [v_idx=" + v_idx + ", ps_idx=" + ps_idx + ", member_chemist_idx=" + member_chemist_idx
				+ ", v_pre=" + v_pre + ", v_date=" + v_date + ", member_patient_idx=" + member_patient_idx
				+ ", howtotake=" + howtotake + "]";
	}
		
	}
