package com.ja.ims.vo;

public class SessionUserData {
	private String member_idx;
	private String member_nick;
	private String member_name;
	private String member_identity;
	private String ps_idx;
	public SessionUserData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SessionUserData(String member_idx, String member_nick, String member_name, String member_identity,
			String ps_idx) {
		super();
		this.member_idx = member_idx;
		this.member_nick = member_nick;
		this.member_name = member_name;
		this.member_identity = member_identity;
		this.ps_idx = ps_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_identity() {
		return member_identity;
	}
	public void setMember_identity(String member_identity) {
		this.member_identity = member_identity;
	}
	public String getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}
	@Override
	public String toString() {
		return "SessionUserData [member_idx=" + member_idx + ", member_nick=" + member_nick + ", member_name="
				+ member_name + ", member_identity=" + member_identity + ", ps_idx=" + ps_idx + "]";
	}
	
}
