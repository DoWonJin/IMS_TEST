package com.ja.ims.vo;

public class Ps_LocationVO {
	private String ps_idx;
	private String ps_latitude;
	private String ps_longitude;
	public Ps_LocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ps_LocationVO(String ps_idx, String ps_latitude, String ps_longitude) {
		super();
		this.ps_idx = ps_idx;
		this.ps_latitude = ps_latitude;
		this.ps_longitude = ps_longitude;
	}
	public String getPs_idx() {
		return ps_idx;
	}
	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}
	public String getPs_latitude() {
		return ps_latitude;
	}
	public void setPs_latitude(String ps_latitude) {
		this.ps_latitude = ps_latitude;
	}
	public String getPs_longitude() {
		return ps_longitude;
	}
	public void setPs_longitude(String ps_longitude) {
		this.ps_longitude = ps_longitude;
	}
	@Override
	public String toString() {
		return "Ps_LocationVO [ps_idx=" + ps_idx + ", ps_latitude=" + ps_latitude + ", ps_longitude=" + ps_longitude
				+ "]";
	}
	

}
