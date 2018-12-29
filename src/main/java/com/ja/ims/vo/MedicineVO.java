package com.ja.ims.vo;

public class MedicineVO {
	private String m_idx;
	private String m_name;
	private String m_pre;
	private String m_price;
	private String m_path;
	private String p2_idx;
	private String d_idx;
	private String m_description;
	private String m_duration;
	private String m_howtotake;
	
	public MedicineVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicineVO(String m_idx, String m_name, String m_pre, String m_price, String m_path, String p2_idx,
			String d_idx, String m_description, String m_duration, String m_howtotake) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.m_pre = m_pre;
		this.m_price = m_price;
		this.m_path = m_path;
		this.p2_idx = p2_idx;
		this.d_idx = d_idx;
		this.m_description = m_description;
		this.m_duration = m_duration;
		this.m_howtotake = m_howtotake;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_pre() {
		return m_pre;
	}

	public void setM_pre(String m_pre) {
		this.m_pre = m_pre;
	}

	public String getM_price() {
		return m_price;
	}

	public void setM_price(String m_price) {
		this.m_price = m_price;
	}

	public String getM_path() {
		return m_path;
	}

	public void setM_path(String m_path) {
		this.m_path = m_path;
	}

	public String getP2_idx() {
		return p2_idx;
	}

	public void setP2_idx(String p2_idx) {
		this.p2_idx = p2_idx;
	}

	public String getD_idx() {
		return d_idx;
	}

	public void setD_idx(String d_idx) {
		this.d_idx = d_idx;
	}

	public String getM_description() {
		return m_description;
	}

	public void setM_description(String m_description) {
		this.m_description = m_description;
	}

	public String getM_duration() {
		return m_duration;
	}

	public void setM_duration(String m_duration) {
		this.m_duration = m_duration;
	}

	public String getM_howtotake() {
		return m_howtotake;
	}

	public void setM_howtotake(String m_howtotake) {
		this.m_howtotake = m_howtotake;
	}

	@Override
	public String toString() {
		return "MedicineVO [m_idx=" + m_idx + ", m_name=" + m_name + ", m_pre=" + m_pre + ", m_price=" + m_price
				+ ", m_path=" + m_path + ", p2_idx=" + p2_idx + ", d_idx=" + d_idx + ", m_description=" + m_description
				+ ", m_duration=" + m_duration + ", m_howtotake=" + m_howtotake + "]";
	}
		
}
