package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;

import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.StorageVO;

public interface SellerSQLMapper {
	
	
	@Select("SELECT *FROM MEDICINE where p2_idx is not null ORDER BY M_NAME")
	public ArrayList<MedicineVO> selectAllMedicineVO();
	
	@Select("SELECT *FROM STORAGE WHERE PS_IDX=#{ps_idx }")
	public ArrayList<StorageVO> selectStorageVOByPsIdx(String ps_idx);
	
	@Select("Select m_name from Medicine where m_idx=#{m_idx}")
	public String selectM_name(String m_idx);
	
	@Select("INSERT INTO STORAGE VALUES(seq_STORAGE_idx.nextval,#{ps_idx },#{m_idx },#{m_storage },#{ps_price })")
	public void enrollItem(@Param("ps_idx")String ps_idx,@Param("m_idx")String m_idx, @Param("m_storage")String m_storage, @Param("ps_price")String ps_price);

	@Select("DELETE STORAGE WHERE st_idx=#{st_idx}")
	public void deleteStorage(String st_idx);
	
}
