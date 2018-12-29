package com.ja.ims.vo;

public class FindUserVO {
	private String citi_name;
	private String member_identity;
	private String member_phone;
	private String member_id;
	private String citi_identify2;
	private String member_pw;
	
	
	public FindUserVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public FindUserVO(String citi_name, String member_identity, String member_phone, String member_id,
			String citi_identify2, String member_pw) {
		super();
		this.citi_name = citi_name;
		this.member_identity = member_identity;
		this.member_phone = member_phone;
		this.member_id = member_id;
		this.citi_identify2 = citi_identify2;
		this.member_pw = member_pw;
	}


	public String getCiti_name() {
		return citi_name;
	}

	public void setCiti_name(String citi_name) {
		this.citi_name = citi_name;
	}


	public String getMember_identity() {
		return member_identity;
	}

	public void setMember_identity(String member_identity) {
		this.member_identity = member_identity;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getCiti_identify2() {
		return citi_identify2;
	}


	public void setCiti_identify2(String citi_identify2) {
		this.citi_identify2 = citi_identify2;
	}


	public String getMember_pw() {
		return member_pw;
	}


	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}


	@Override
	public String toString() {
		return "FindUserVO [citi_name=" + citi_name + ", member_identity=" + member_identity + ", member_phone="
				+ member_phone + ", member_id=" + member_id + ", citi_identify2=" + citi_identify2 + ", member_pw="
				+ member_pw + "]";
	}


	
	
	
}
