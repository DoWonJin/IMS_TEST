package com.ja.ims.vo;

public class QuestionVO {
	
	private String q_idx;
	private String q_identity;
	private String st_idx;
	private String q_content;
	private String a_identity;
	private String q_type;
	private String q_date;
	public QuestionVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public QuestionVO(String q_idx, String q_identity, String st_idx, String q_content,
			String a_identity, String q_type, String q_date) {
		super();
		this.q_idx = q_idx;
		this.q_identity = q_identity;
		this.st_idx = st_idx;
		this.q_content = q_content;
		this.a_identity = a_identity;
		this.q_type = q_type;
		this.q_date = q_date;
	}


	public String getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_identity() {
		return q_identity;
	}
	public void setQ_identity(String q_identity) {
		this.q_identity = q_identity;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	
	public String getA_identity() {
		return a_identity;
	}

	public void setA_identity(String a_identity) {
		this.a_identity = a_identity;
	}

	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	@Override
	public String toString() {
		return "QuestionVO [q_idx=" + q_idx + ", q_identity=" + q_identity + ", q_name="  + st_idx
				+ ", q_content=" + q_content + ", a_identity=" + a_identity + ", q_type=" + q_type + ", q_date="
				+ q_date + "]";
	}
}
