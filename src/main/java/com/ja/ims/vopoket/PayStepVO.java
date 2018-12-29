package com.ja.ims.vopoket;

import java.util.ArrayList;
import java.util.Arrays;

import com.ja.ims.vo.AddressMemberVO;

/**
 * @author user
 *
 */
public class PayStepVO {
	private String st_idx;
	private String m_name;
	private String finalPs_price;
	private String itemNum;
	
	public PayStepVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayStepVO(String st_idx, String m_name, String finalPs_price, String itemNum) {
		super();
		this.st_idx = st_idx;
		this.m_name = m_name;
		this.finalPs_price = finalPs_price;
		this.itemNum = itemNum;
	}

	public String getSt_idx() {
		return st_idx;
	}

	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getFinalPs_price() {
		return finalPs_price;
	}

	public void setFinalPs_price(String finalPs_price) {
		this.finalPs_price = finalPs_price;
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	@Override
	public String toString() {
		return "PayStepVO [st_idx=" + st_idx + ", m_name=" + m_name + ", finalPs_price=" + finalPs_price + ", itemNum="
				+ itemNum + "]";
	}

	}
