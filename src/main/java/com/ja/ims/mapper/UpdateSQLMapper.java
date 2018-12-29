package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ja.ims.vo.DiseaseCategoryVO;
import com.ja.ims.vo.DiseaseVO;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vopoket.PrescriptionVO;

public interface UpdateSQLMapper {

	// 질병분류
	@Select("SELECT *FROM DISEASE_CATEGORY ORDER BY C_IDX DESC")
	public ArrayList<DiseaseCategoryVO> selectAllDCategory();

	@Insert("INSERT INTO DISEASE_CATEGORY VALUES(seq_DEASE_CATEGORY_idx.NEXTVAL,#{C_NAME} )")
	public void insertDcategory(String c_name);

	@Delete("DELETE DISEASE_CATEGORY WHERE c_idx=#{c_idx}")
	public void deleteDcategory(String c_idx);

	// 질병
	@Select("SELECT *FROM DISEASE ORDER BY D_IDX DESC")
	public ArrayList<DiseaseVO> selectAllDisease();

	@Insert("INSERT INTO DISEASE VALUES(seq_DEASE_idx.NEXTVAL,#{c_idx},#{d_name},#{d_symptom},#{d_prevention} )")
	public void insertDisease(@Param("c_idx")String c_idx, @Param("d_name")String d_name, @Param("d_symptom")String d_symptom, @Param("d_prevention")String d_prevention);

	@Delete("DELETE DISEASE WHERE d_idx=#{d_idx}")
	public void deleteDisease(String d_idx);

	// 상품카테고리1
	@Select("SELECT *FROM PRODUCT_CATEGORY1 ORDER BY p1_idx DESC")
	public ArrayList<Product_Category1VO> selectAllProduct_Category1();

	@Insert("INSERT INTO PRODUCT_CATEGORY1 VALUES(seq_PRODUCT_CATEGORY1_idx.NEXTVAL,#{p1_name})")
	public void insertPRODUCT_CATEGORY1(String p1_name);

	@Delete("DELETE PRODUCT_CATEGORY1 WHERE p1_idx=#{p1_idx}")
	public void deletePRODUCT_CATEGORY1(String p1_idx);

	// 상품카테고리2
	@Select("SELECT *FROM PRODUCT_CATEGORY2 ORDER BY p2_idx DESC")
	public ArrayList<Product_Category2VO> selectAllProduct_Category2();

	@Insert("INSERT INTO PRODUCT_CATEGORY2 VALUES(seq_PRODUCT_CATEGORY2_idx.NEXTVAL,#{p1_idx},#{p2_name})")
	public void insertPRODUCT_CATEGORY2(@Param("p1_idx")String p1_idx, @Param("p2_name")String p2_name);

	@Delete("DELETE PRODUCT_CATEGORY2 WHERE p2_idx=#{p2_idx}")
	public void deletePRODUCT_CATEGORY2(String p2_idx);

	// 약국테이블 , 약국주소테이블
	@Select("SELECT seq_PHARMACY_SELLER_idx.NEXTVAL from dual")
	public String selectPs_idx();
	
	@Select("SELECT *FROM PHARMACY_SELLER ORDER BY P_NAME")
	public ArrayList<PharmacySellerVO> selectAllPharmacy();
	
	@Insert("INSERT INTO PHARMACY_SELLER VALUES(#{ps_idx},null,#{p_name },null)")
	public void insertPharmacy(@Param("ps_idx")String ps_idx, @Param("p_name")String p_name);

	@Insert("INSERT INTO ADDRESS_PHARMACY VALUES(seq_ADDRESS_PHARMACY_idx.nextval ,#{ps_idx},#{ps_latitude },#{ps_longitude } )")
	public void insertAddress(@Param("ps_idx")String ps_idx,@Param("ps_latitude")String ps_latitude,@Param("ps_longitude")String ps_longitude);
	
	@Delete("DELETE PHARMACY_SELLER WHERE PS_IDX=#{ps_idx}")
	public void deletePharmacy(String ps_idx);
	
	@Delete("DELETE ADDRESS_PHARMACY WHERE PS_IDX=#{ps_idx}")
	public void deleteAddress(String ps_idx);
	
	
	//약품 & 상품
	
	
	@Select("SELECT *FROM MEDICINE WHERE P2_IDX IS NULL ORDER BY m_idx DESC")
	public ArrayList<MedicineVO> selectAllMedicine();

	@Select("SELECT *FROM MEDICINE WHERE P2_IDX IS NOT NULL ORDER BY m_idx DESC")
	public ArrayList<MedicineVO> selectAllProduct();
	
	@Insert("INSERT INTO MEDICINE VALUES("
			+ ", #{m_name }, #{m_pre }, #{m_price }, #{m_path,jdbcType= VARCHAR }, #{p2_idx,jdbcType= VARCHAR}, #{d_idx,jdbcType= VARCHAR }, #{m_duration }, #{m_description }, #{m_howtotake} )")
	public void insertMEDICINE(@Param("m_name") String m_name, @Param("m_pre") String m_pre, @Param("m_price") String m_price, @Param("m_path") String m_path, @Param("p2_idx") String p2_idx,
			@Param("d_idx") String d_idx, @Param("m_duration") String m_duration, @Param("m_description") String m_description, @Param("m_howtotake") String m_howtotake);

	@Delete("DELETE MEDICINE WHERE m_idx=#{m_idx}")
	public void deleteMEDICINE(String m_idx);


	
	@Select("SELECT seq_patient_idx.nextval from dual")
	public String seq_patient_idx();
	// 방문기록     &   처방전
	
	@Select("SELECT *FROM Member m where m.m_identity = 1 ORDER BY v_idx DESC")
	public ArrayList<MemberVO> selectAllMember();
	
	@Select("SELECT *FROM MEMBER WHERE member_idx = #{member_idx}")
	public MemberVO selectChemist(String Member_idx);
	
	
	@Insert("INSERT INTO Patient VALUES(#{v_idx},#{PS_IDX },#{MEMBER_CHEMIST_IDX },#{V_PRE},#{V_DATE },#{MEMBER_PATIENT_IDX },#{HOWTOTAKE }  )")
	public void insertPatient(@Param("v_idx")String v_idx, @Param("PS_IDX")String ps_idx, @Param("MEMBER_CHEMIST_IDX")String member_chemist_idx, @Param("V_PRE")String v_pre,
			@Param("V_DATE")String v_date, @Param("MEMBER_PATIENT_IDX")String member_patient_idx, @Param("HOWTOTAKE")String howtotake);
	
	@Select("SELECT *FROM PRESCRIPTION ORDER BY v_idx DESC")
	public ArrayList<PrescriptionVO> selectAllPrescription();
	
	@Insert("INSERT INTO Prescription VALUES(#{1 },#{2 },#{3 },#{4})")
	public void insertPrescription(@Param("1")String v_idx,@Param("1")String m_idx,@Param("3")String v_count,@Param("4")String v_due);

	
}
