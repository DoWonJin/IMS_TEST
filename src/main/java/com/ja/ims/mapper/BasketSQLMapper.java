package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.*;

import com.ja.ims.vo.BasketVO;

public interface BasketSQLMapper {
	//Detail에서 수량변경Ajax처리
	@Select("select st_idx from storage where st_idx = #{st_idx} and m_storage >= #{num}")
	public String selectStorageItemCount(@Param("num")String num, @Param("st_idx")String st_idx);
	
	//장바구니에 있는 상품인지 체크
	@Select("select st_idx from basket where st_idx=#{st_idx} and member_idx=#{member_idx}")
	public String selectOverlapItemBySt_idx(@Param("st_idx")String st_idx, @Param("member_idx")String member_idx);
	
	@Insert("insert into basket values(#{member_idx}, #{st_idx}, #{itemNum})")
	public void insertBasket(BasketVO basketVO);
	
	//같은 st_idx를 여러번 장바구니에 넣은경우 itemnum들의 합계를 구함
	/*@Select("select member_idx, st_idx, sum(itemnum) as itemNum from basket " + 
			"where member_idx=#{member_idx} " + 
			"group by st_idx, member_idx")
	public ArrayList<BasketVO> selectItemNumSumByMember_idx(String member_idx);*/
	
	@Select("select * from basket, medicine, storage " + 
			"where basket.member_idx=#{member_idx} and storage.st_idx=basket.st_idx " + 
			"and storage.m_idx=medicine.m_idx")
	public ArrayList<BasketVO> selectBasketVOByMember_idx(String member_idx);
	
	
	@Select("select storage.m_storage from storage where st_idx=#{st_idx}")
	public String selectStorageBySt_idx(String st_idx);
	
	@Delete("delete from basket where member_idx=#{member_idx} and st_idx=#{st_idx}")
	public void deleteFromBasket(@Param("member_idx")String member_idx, @Param("st_idx")String st_idx);

}
