package com.ja.ims.vo;

/**
 * @author user
 *
 */
public class MemberVO {
	
	public final static String patient = "1";
	public final static String chemist  = "2";
	public final static String pharmacy = "3";
	public  final static String seller = "4";
	public  final static String administer = "5";
	
	private String member_idx;
	private String member_identity;
	private String member_nick;
	private String member_id;
	private String member_pw;
	private String member_phone;
	private String citi_idx;
	private String ps_idx;
	private String member_pic_root;
	private String member_address;
	public MemberVO() {
		
	}
	public MemberVO(String member_idx, String member_identity, String member_nick, String member_id, String member_pw,
			String member_phone, String citi_idx, String ps_idx, String member_pic_root, String member_address) {
		super();
		this.member_idx = member_idx;
		this.member_identity = member_identity;
		this.member_nick = member_nick;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_phone = member_phone;
		this.citi_idx = citi_idx;
		this.ps_idx = ps_idx;
		this.member_pic_root = member_pic_root;
		this.member_address = member_address;
	}
	@Override
	public String toString() {
		return "MemberVO [member_idx=" + member_idx + ", member_identity=" + member_identity + ", member_nick="
				+ member_nick + ", member_id=" + member_id + ", member_pw=" + member_pw + ", member_phone="
				+ member_phone + ", citi_idx=" + citi_idx + ", ps_idx=" + ps_idx + ", member_pic_root="
				+ member_pic_root + ", member_address=" + member_address + "]";
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_identity() {
		return member_identity;
	}
	public void setMember_identity(String member_identity) {
		this.member_identity = member_identity;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getCiti_idx() {
		return citi_idx;
	}
	public void setCiti_idx(String citi_idx) {
		this.citi_idx = citi_idx;
	}
	public String getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}
	public String getMember_pic_root() {
		return member_pic_root;
	}
	public void setMember_pic_root(String member_pic_root) {
		this.member_pic_root = member_pic_root;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public static String getPatient() {
		return patient;
	}
	public static String getChemist() {
		return chemist;
	}
	public static String getPharmacy() {
		return pharmacy;
	}
	public static String getSeller() {
		return seller;
	}
	public static String getAdminister() {
		return administer;
	}
	
}
