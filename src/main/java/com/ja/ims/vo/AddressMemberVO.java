package com.ja.ims.vo;

public class AddressMemberVO {
	final static String home = "1";
	final static String work = "2";
	final static String etc  = "3";
	
	private String address_idx;
	private String member_idx;
	private MemberVO memberVO;
	private String address_type;
	private String address;
	
	public AddressMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddressMemberVO(String address_idx, String member_idx,
			MemberVO memberVO, String address_type, String address) {
		super();
		this.address_idx = address_idx;
		this.member_idx = member_idx;
		this.memberVO = memberVO;
		this.address_type = address_type;
		this.address = address;
	}

	public String getAddress_idx() {
		return address_idx;
	}

	public void setAddress_idx(String address_idx) {
		this.address_idx = address_idx;
	}

	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getAddress_type() {
		return address_type;
	}

	public void setAddress_type(String address_type) {
		this.address_type = address_type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public static String getHome() {
		return home;
	}

	public static String getWork() {
		return work;
	}

	public static String getEtc() {
		return etc;
	}

	@Override
	public String toString() {
		return "AddressMemberVO [address_idx=" + address_idx
				+ ", member_idx=" + member_idx + ", memberVO=" + memberVO
				+ ", address_type=" + address_type + ", address=" + address
				+ "]";
	}
		
}
