package com.ja.ims.vopoket;

import java.util.ArrayList;

public class ProductDetailVO {
	private String m_path;
	private String m_name;
	private String ps_price;
	private String m_duration;
	private String ps_idx;
	private String ps_name;
	private String m_description;
	private String m_howtotake;
	
	
	private ArrayList<QuestionAndAnswerVO> questionAndAnswerVOList;

	public ProductDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDetailVO(String m_path, String m_name, String ps_price, String m_duration, String ps_idx,
			String ps_name, String m_description, String m_howtotake,
			ArrayList<QuestionAndAnswerVO> questionAndAnswerVOList) {
		super();
		this.m_path = m_path;
		this.m_name = m_name;
		this.ps_price = ps_price;
		this.m_duration = m_duration;
		this.ps_idx = ps_idx;
		this.ps_name = ps_name;
		this.m_description = m_description;
		this.m_howtotake = m_howtotake;
		this.questionAndAnswerVOList = questionAndAnswerVOList;
	}

	public String getM_path() {
		return m_path;
	}

	public void setM_path(String m_path) {
		this.m_path = m_path;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getPs_price() {
		return ps_price;
	}

	public void setPs_price(String ps_price) {
		this.ps_price = ps_price;
	}

	public String getM_duration() {
		return m_duration;
	}

	public void setM_duration(String m_duration) {
		this.m_duration = m_duration;
	}

	public String getPs_idx() {
		return ps_idx;
	}

	public void setPs_idx(String ps_idx) {
		this.ps_idx = ps_idx;
	}

	public String getPs_name() {
		return ps_name;
	}

	public void setPs_name(String ps_name) {
		this.ps_name = ps_name;
	}

	public String getM_description() {
		return m_description;
	}

	public void setM_description(String m_description) {
		this.m_description = m_description;
	}

	public String getM_howtotake() {
		return m_howtotake;
	}

	public void setM_howtotake(String m_howtotake) {
		this.m_howtotake = m_howtotake;
	}

	public ArrayList<QuestionAndAnswerVO> getQuestionAndAnswerVOList() {
		return questionAndAnswerVOList;
	}

	public void setQuestionAndAnswerVOList(ArrayList<QuestionAndAnswerVO> questionAndAnswerVOList) {
		this.questionAndAnswerVOList = questionAndAnswerVOList;
	}

	@Override
	public String toString() {
		return "ProductDetailVO [m_path=" + m_path + ", m_name=" + m_name + ", ps_price=" + ps_price + ", m_duration="
				+ m_duration + ", ps_idx=" + ps_idx + ", ps_name=" + ps_name + ", m_description=" + m_description
				+ ", m_howtotake=" + m_howtotake + ", questionAndAnswerVOList=" + questionAndAnswerVOList + "]";
	}

		
}
