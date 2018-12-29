package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;

public interface DiseaseSQLMapper {
	@Select("SELECT * FROM DISEASE_CATEGORY ORDER BY C_NAME")
	public ArrayList<DiseaseCategoryVO> selectDiseaseCategoryAll();
	@Select("SELECT c_name FROM DISEASE_CATEGORY WHERE c_idx = #{c_idx}")
	public String selectDiseaseCategoryByIdx(String c_idx);
	@Select("SELECT * FROM DISEASE WHERE c_idx = #{c_idx}")
	public ArrayList<DiseaseVO> selectDiseaseAll (String c_idx);
	@Select("SELECT * FROM DISEASE WHERE d_idx = #{d_idx}")
	public DiseaseVO selectDiseaseByIdx(String d_idx);
	
}
