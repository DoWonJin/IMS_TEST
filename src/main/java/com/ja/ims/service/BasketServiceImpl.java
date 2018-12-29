package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.BasketSQLMapper;
import com.ja.ims.mapper.OrderSQLMapper;
import com.ja.ims.vo.BasketVO;
import com.ja.ims.vo.StorageVO;

@Service
public class BasketServiceImpl implements BasketService {
	
	@Autowired
	BasketSQLMapper basketSQLMapper;
	@Autowired
	OrderSQLMapper orderSQLMapper;
	@Override
	public String checkCount(String num, String st_idx) {
		
		String result = basketSQLMapper.selectStorageItemCount(num,st_idx);
		return result;
	}
	
	@Override
	public String checkOverlap(String st_idx, String member_idx) {
		
		String resultSt_idx = basketSQLMapper.selectOverlapItemBySt_idx(st_idx, member_idx);
		return resultSt_idx;
	}
	
	@Override
	public void addBasket(BasketVO basketVO) {
		
		/*String requestItemNum=basketVO.getItemNum();
		String requestSt_idx= basketVO.getSt_idx();
		basketSQLMapper.selectStorageBySt_idx(requestSt_idx);*/
		
		basketSQLMapper.insertBasket(basketVO);
	}
	
	@Override
	public ArrayList<BasketVO> viewBasket(String member_idx) {
		
		//select
		ArrayList<BasketVO> basketVOList=basketSQLMapper.selectBasketVOByMember_idx(member_idx);
		
		return basketVOList;
		
	}
	
	@Override
	public String checkOrderCount(String st_idx) {
		// TODO Auto-generated method stub
		StorageVO storageVO = orderSQLMapper.selectStorageVOBySt_idx(st_idx);
		return storageVO.getM_storage();
	}

	@Override
	public void removeBasket(String member_idx, String st_idx) {
		//delete
		basketSQLMapper.deleteFromBasket(member_idx, st_idx);
		
	}
}
