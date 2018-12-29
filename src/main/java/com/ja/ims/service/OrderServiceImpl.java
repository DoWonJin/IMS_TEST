package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.OrderSQLMapper;
import com.ja.ims.vo.BasketVO;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.OrderInfoItemVO;
import com.ja.ims.vo.OrderInfoVO;
import com.ja.ims.vo.OrderListVO;
import com.ja.ims.vo.StorageVO;
import com.ja.ims.vopoket.OrderInfoBoardVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderSQLMapper orderSQLMapper;

	@Override
	public void addOrderList(String member_idx, String total_price) {
		// TODO Auto-generated method stub
		orderSQLMapper.insertOrderList(member_idx, total_price);
		
		
	}

	@Override
	public OrderInfoVO viewO_idx(String member_idx) {
		// TODO Auto-generated method stub
		String o_idx= orderSQLMapper.selectO_idxByMember_idx(member_idx);
		String member_address=orderSQLMapper.selectAddressByMember_idx(member_idx);
		OrderInfoVO orderInfoVO= new OrderInfoVO(); //o_idx와 member_idx를 같이 리턴하기 위해서
		orderInfoVO.setO_idx(o_idx);
		orderInfoVO.setMember_address(member_address);
		return orderInfoVO;
	}

	@Override
	public void addOrderInfo(String o_idx, String[] st_idxList, String[] itemNumList, String member_address) {
		// TODO Auto-generated method stub
		for(int i=0;i<st_idxList.length;i++) {
			OrderInfoVO orderInfoVO = new OrderInfoVO();
			orderInfoVO.setO_idx(o_idx);
			orderInfoVO.setSt_idx(st_idxList[i]);
			orderInfoVO.setItemNum(itemNumList[i]);
			orderInfoVO.setMember_address(member_address);
			orderSQLMapper.insertOrderInfo(orderInfoVO);
		}
	}

	@Override
	public void updateStorage(String[] st_idxList, String[] itemNumList) {
		// TODO Auto-generated method stub

		ArrayList<StorageVO> storageVOList = new ArrayList<StorageVO>(); 
		for(String st_idx: st_idxList) {
			 storageVOList.add(orderSQLMapper.selectStorageVOBySt_idx(st_idx));
		}
		int i = 0;
		for(StorageVO storageVO : storageVOList ) {
			int orderCount = Integer.parseInt(st_idxList[i]);
			
			String prevstorage= storageVO.getM_storage();
			int prevStorage = Integer.parseInt(prevstorage);
			
			int newstorage = prevStorage - orderCount;
			String newStorage = Integer.toString(newstorage);
			
			orderSQLMapper.updateStorage(storageVO.getSt_idx(), newStorage);
		}
		
		
		
		
		
	}

	@Override
	public void removeBasket(String member_idx, String[] st_idxList) {
		// TODO Auto-generated method stub
		BasketVO basketVO= new BasketVO();
		basketVO.setMember_idx(member_idx);
		for(int i=0;i<st_idxList.length;i++) {
			
			basketVO.setSt_idx(st_idxList[i]);
			orderSQLMapper.deleteFromBasket(basketVO);
		}
		
		
	}

	@Override
	public ArrayList<OrderListVO> viewOrderList(String member_idx) {
		// TODO Auto-generated method stub
		ArrayList<OrderListVO> orderListVOList= orderSQLMapper.selectOrder_Patient_ListByMember_Idx(member_idx);
		return orderListVOList;
	}
		
	@Override
	public OrderInfoBoardVO viewOrderInfo(String o_idx) {
		// TODO Auto-generated method stub
		OrderInfoBoardVO orderInfoBoardVO= new OrderInfoBoardVO();
		ArrayList<OrderInfoItemVO> orderInfoItemVOList = new ArrayList<OrderInfoItemVO>();
		
		
		
		//리턴받은 orderListVO에서 o_date, total_price뽑아서 orderInfoVBoardVO의 o_date, total_price에 넣기
		OrderListVO orderListVO =orderSQLMapper.selectOrderListVO(o_idx);
		orderInfoBoardVO.setO_date(orderListVO.getO_date());
		orderInfoBoardVO.setTotal_price(orderListVO.getTotal_price());
		
		//orderInfoBoardVO의 ArrayList<OrderInfoItemVO> 채우기
		//o_idx로 st_idx와 itemNum의 리스트 가져오기
		ArrayList<OrderInfoVO> orderInfoVOList= orderSQLMapper.selectOrderInfoVOByO_idx(o_idx);
		
		for(OrderInfoVO orderInfoVO: orderInfoVOList) {
				OrderInfoItemVO orderInfoItemVO= new OrderInfoItemVO();
		
				
					String st_idx= orderInfoVO.getSt_idx();
					String itemNum= orderInfoVO.getItemNum();
					//1.orderInfoItemVO에 채워진 st_idx로 orderInfo테이블의 st_idx와 itemNum가져옴
					orderInfoItemVO.setSt_idx(st_idx);//채워진 st_idx
					orderInfoItemVO.setItemNum(itemNum);
					
					//2.orderInfoItemVO에 채워진 st_idx로 storage테이블의 ps_price와 m_idx리스트 가져옴
					st_idx= orderInfoItemVO.getSt_idx();
					
					StorageVO storageVO= orderSQLMapper.selectStorageVOBySt_idx(st_idx);
					
						String ps_price= storageVO.getPs_price();
						String m_idx= storageVO.getM_idx();
						orderInfoItemVO.setPs_price(ps_price);
						orderInfoItemVO.setM_idx(m_idx);//채워진 m_idx
						
						//3.orderInfoItemVO에 채워진 m_idx로 medicine테이블의 m_name, m_path리스트 가져옴
				
						m_idx= orderInfoItemVO.getM_idx();
						MedicineVO medicineVO = orderSQLMapper.selectMedicineVOByM_idx(m_idx);
						
							String m_name= medicineVO.getM_name();
							String m_path= medicineVO.getM_path();
							orderInfoItemVO.setM_name(m_name);
							orderInfoItemVO.setM_path(m_path);
					
						//orderInfoItemVO는 다 채움 
						
							orderInfoItemVOList.add(orderInfoItemVO);
						
						
						
				}
			orderInfoBoardVO.setOrderInfoItemVOList(orderInfoItemVOList);
			
			return orderInfoBoardVO;
	
}

	@Override
	public MemberVO viewMemberVO(String member_idx) {
		return orderSQLMapper.selectMemberVO(member_idx);
		
	}

	@Override
	public String viewOutDateByO_idx(String o_idx) {
		// TODO Auto-generated method stub
		OrderListVO orderListVO= orderSQLMapper.selectOrderListVO(o_idx);
		return orderListVO.getOut_date();
	}

	@Override
	public void addOrderListDirectly(String o_idx, String st_idx, String itemNum, String member_address) {
		// TODO Auto-generated method stub
		OrderInfoVO orderInfoVO = new OrderInfoVO();
		orderInfoVO.setO_idx(o_idx);
		orderInfoVO.setSt_idx(st_idx);
		orderInfoVO.setItemNum(itemNum);
		orderInfoVO.setMember_address(member_address);
		orderSQLMapper.insertOrderInfoDirectly(orderInfoVO);
		
	}


}
