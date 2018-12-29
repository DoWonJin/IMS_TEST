package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ja.ims.vo.BasketVO;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.OrderInfoVO;
import com.ja.ims.vo.OrderListVO;
import com.ja.ims.vo.StorageVO;

public interface OrderSQLMapper {
	
	@Insert("insert into order_patient_list values(seq_order_patient_list_idx.nextval, #{member_idx}, sysdate, null, #{total_price})")
	public void insertOrderList(@Param("member_idx")String member_idx, @Param("total_price")String total_price);

	@Select("SELECT o_idx FROM " + 
			"(SELECT * FROM ORDER_PATIENT_LIST WHERE member_idx=#{member_idx} ORDER BY o_idx DESC) " + 
			"WHERE ROWNUM = 1")
	public String selectO_idxByMember_idx(String member_idx);
	
	//member_idx로 member테이블에서 배송지가져오기
	@Select("select member_address from member where member_idx= #{member_idx}")
	public String selectAddressByMember_idx(String member_idx);
	
	@Insert("insert into order_patient_info values(#{o_idx}, #{st_idx}, #{itemNum}, #{member_address})")
	public void insertOrderInfo(OrderInfoVO orderInfoVO);
	
	@Delete("delete from basket where member_idx=#{member_idx} and st_idx=#{st_idx}")
	public void deleteFromBasket(BasketVO basketVO);
	
	@Select("select * from order_patient_list where member_idx=#{member_idx} order by o_idx desc")
	public ArrayList<OrderListVO> selectOrder_Patient_ListByMember_Idx(String member_idx);
	
	//o_idx를 통해 orderListVO리턴
	@Select("select * from order_patient_list where o_idx=#{o_idx}")
	public OrderListVO selectOrderListVO(String o_idx);
	
	@Select("SELECT * FROM(Select * from ORDER_PATIENT_LIST A left join ORDER_PATIENT_INFO B ON A.O_IDX = B.O_IDX) C LEFT JOIN STORAGE S ON C.st_idx = S.st_idx WHERE S.ps_idx = #{ps_idx} order by A.o_idx")
	public ArrayList<OrderInfoVO> selectOrderListVOByPs_idx(String ps_idx);
	
	//o_idx로 st_idx와 itemNum의 리스트 가져오기
	@Select("select * from order_patient_info where o_idx=#{o_idx} order by o_idx")
	public ArrayList<OrderInfoVO> selectOrderInfoVOByO_idx(String o_idx); 
	
	/*//2.orderInfoItemVO에 채워진 st_idx로 storage테이블의 ps_price와 m_idx
	@Select("select * from storage where st_idx=#{st_idx}")
	public ArrayList<StorageVO> selectStorageVOBySt_idx(String st_idx);
	
	//3.orderInfoItemVO에 채워진 m_idx로 medicine테이블의 m_name, m_path리스트 가져옴
	@Select("select * from medicine where m_idx=#{m_idx}")
	public ArrayList<MedicineVO> selectMedicineVOByM_idx(String m_idx);*/
	
	//2.orderInfoItemVO에 채워진 st_idx로 storage테이블의 ps_price와 m_idx
	@Select("select * from storage where st_idx=#{st_idx}")
	public StorageVO selectStorageVOBySt_idx(String st_idx);
	
	//3.orderInfoItemVO에 채워진 m_idx로 medicine테이블의 m_name, m_path리스트 가져옴
	@Select("select * from medicine where m_idx=#{m_idx}")
	public MedicineVO selectMedicineVOByM_idx(String m_idx);
	
	@Select("SELECT m_name FROM STORAGE S LEFT JOIN MEDICINE M ON S.m_idx = M.m_idx WHERE S.st_idx = #{st_idx }")
	public String selectM_name(String st_idx);
	
	@Select("select * from member where member_idx=#{member_idx}")
	public MemberVO selectMemberVO(String member_idx);
	
	@Insert("insert into order_patient_info values(#{o_idx}, #{st_idx}, #{itemNum}, #{member_address})")
	public void insertOrderInfoDirectly(OrderInfoVO orderInfoVO);

	@Update("UPDATE STORAGE SET m_storage=#{newStorage} WHERE st_idx=#{st_idx}")
	public void updateStorage(@Param("st_idx")String st_idx,@Param("newStorage")String newStorage);
}
