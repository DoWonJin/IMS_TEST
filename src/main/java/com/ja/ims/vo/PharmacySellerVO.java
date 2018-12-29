package com.ja.ims.vo;

public class PharmacySellerVO {
	public static final String pharmacy = "1";
	public static final String seller = "2";
	private String ps_idx;
	private String member_idx;
	private String p_name;
	private String member_identity;
	private String p_lo1;
	private String p_lo2;
	public PharmacySellerVO() {
		
	}
	public PharmacySellerVO(String ps_idx, String member_idx, String p_name, String member_identity, String p_lo1,
			String p_lo2) {
		super();
		this.ps_idx = ps_idx;
		this.member_idx = member_idx;
		this.p_name = p_name;
		this.member_identity = member_identity;
		this.p_lo1 = p_lo1;
		this.p_lo2 = p_lo2;
	}
	public String getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getMember_identity() {
		return member_identity;
	}
	public void setMember_identity(String member_identity) {
		this.member_identity = member_identity;
	}
	public String getP_lo1() {
		return p_lo1;
	}
	public void setP_lo1(String p_lo1) {
		this.p_lo1 = p_lo1;
	}
	public String getP_lo2() {
		return p_lo2;
	}
	public void setP_lo2(String p_lo2) {
		this.p_lo2 = p_lo2;
	}
	public static String getPharmacy() {
		return pharmacy;
	}
	public static String getSeller() {
		return seller;
	}
	@Override
	public String toString() {
		return "PharmacySellerVO [ps_idx=" + ps_idx + ", member_idx=" + member_idx + ", p_name=" + p_name
				+ ", member_identity=" + member_identity + ", p_lo1=" + p_lo1 + ", p_lo2=" + p_lo2 + "]";
	}
}
