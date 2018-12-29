package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.BasketVO;

@Service
public interface BasketService {
	public String checkCount(String num, String st_idx);
	
	public String checkOverlap(String st_idx, String member_idx);
	
	public void addBasket(BasketVO basketVO);
	
	public ArrayList<BasketVO> viewBasket(String member_idx); 
	
	public void removeBasket(String member_idx, String st_idx);

	public String checkOrderCount(String st_idx);
}
