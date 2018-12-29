package com.ja.ims.vo;

public class AnswerVO {
	private String a_idx;
	private String a_identity;
	private String a_name;
	private String a_content;
	private String q_idx;
	private String a_date;
	public AnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnswerVO(String a_idx, String a_identity, String a_name, String a_content, String q_idx, String a_date) {
		super();
		this.a_idx = a_idx;
		this.a_identity = a_identity;
		this.a_name = a_name;
		this.a_content = a_content;
		this.q_idx = q_idx;
		this.a_date = a_date;
	}
	@Override
	public String toString() {
		return "AnswerVO [a_idx=" + a_idx + ", a_identity=" + a_identity + ", a_name=" + a_name + ", a_content="
				+ a_content + ", q_idx=" + q_idx + ", a_date=" + a_date + "]";
	}
	public String getA_idx() {
		return a_idx;
	}
	public void setA_idx(String a_idx) {
		this.a_idx = a_idx;
	}
	public String getA_identity() {
		return a_identity;
	}
	public void setA_identity(String a_identity) {
		this.a_identity = a_identity;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	
	
}

