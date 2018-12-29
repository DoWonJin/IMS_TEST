package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.OrderInfoVO;
import com.ja.ims.vo.OrderListVO;
import com.ja.ims.vopoket.OrderInfoBoardVO;

@Service
public interface OrderService {
	
	public void addOrderList(String member_idx, String total_price);
	
	public OrderInfoVO viewO_idx(String member_idx);
	
	public void addOrderInfo(String o_idx, String[] st_idxList, String[] itemNumList, String member_address);
	
	public void updateStorage(String[] st_idxList,String[] itemNumList);
	
	public void removeBasket(String member_idx, String[] st_idxList);
	
	public ArrayList<OrderListVO> viewOrderList(String member_idx);
	
	public OrderInfoBoardVO viewOrderInfo(String o_idx);
	
	public MemberVO viewMemberVO(String member_idx);
	
	public String viewOutDateByO_idx(String o_idx);
	
	public void addOrderListDirectly(String o_idx, String st_idx, String itemNum, String member_address);

}
