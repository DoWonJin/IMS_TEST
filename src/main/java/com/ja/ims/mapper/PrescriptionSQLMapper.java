package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.PatientVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Ps_LocationVO;
import com.ja.ims.vopoket.PrescriptionVO;

public interface PrescriptionSQLMapper {
	
	//방문한 날짜 : 중복없이
	@Select("SELECT TO_CHAR(v_date, 'YYYY/MM/DD') "
			+ "FROM PATIENT WHERE member_patient_idx =#{member_patient_idx} "
			+ "group by TO_CHAR(v_date, 'YYYY/MM/DD') "
			+ "ORDER BY TO_CHAR(v_date, 'YYYY/MM/DD')")
	public ArrayList<String> selectV_dateList(String member_patient_idx);
	
	//같은 날짜에 시간이나 약국이 다른 방문기록
	@Select("SELECT * "
			+ "FROM PATIENT "
			+ "WHERE member_patient_idx =#{member_patient_idx} "
			+ "AND TO_CHAR(v_date, 'YYYY/MM/DD') = #{v_date} ORDER BY v_date")
	public ArrayList<PatientVO> selectPatientVOList(@Param("member_patient_idx")String member_patient_idx, @Param("v_date")String v_date);
	
	//방문할 때, 가졌던 질병이름
	@Select("SELECT DISEASE.D_NAME "
			+ "FROM PRESCRIPTION, MEDICINE ,DISEASE "
			+ "WHERE PRESCRIPTION.M_IDX = MEDICINE.M_IDX "
			+ "AND MEDICINE.D_IDX = DISEASE.D_IDX "
			+ "AND PRESCRIPTION.V_IDX=#{v_idx} "
			+ "GROUP BY DISEASE.D_NAME "
			+ "ORDER BY DISEASE.D_NAME")
	public ArrayList<String> selectD_NameList(String v_idx);
	
    //PrescriptionVO 1번
	@Select("SELECT * FROM PATIENT WHERE v_idx=#{v_idx}")
	public PatientVO selectPatientVOByIdx(String v_idx);
	
	//PrescriptionVO 2번(v_idx 한개당 여러 m_idx)
	@Select("SELECT M_IDX FROM PRESCRIPTION WHERE v_idx=#{v_idx} order by m_idx")
	public ArrayList<String> selectM_IdxFromPrescription(String v_idx);
	
	//PrescriptionVO 3번
	@Select("SELECT * FROM MEDICINE WHERE m_idx=#{m_idx}")
	public MedicineVO selectFromMedicine(String m_idx);
	
	
	//질병이름
	@Select("select d_name from patient , disease  where patient.d_idx = disease.d_idx and patient.v_idx=#{v_idx}")
	public String selectFromDiseaseName(PatientVO patientVO);
	
	//약국이름
	@Select("select p_name from pharmacy_seller , patient  where pharmacy_seller.ps_idx = patient.ps_idx and patient.v_idx=#{v_idx}")
	public String selectPharmacyName(PatientVO patientVO);
	
	@Select("select m_idx from prescription where v_idx=#{v_idx} order by m_idx") 
	public ArrayList<String> selectM_idxListFromPrescription(String v_idx);
	
	//처방약의 갯수 v_count구하기
	@Select("SELECT PRESCRIPTION.v_count FROM MEDICINE,PRESCRIPTION WHERE MEDICINE.M_IDX = PRESCRIPTION.M_IDX AND PRESCRIPTION.v_idx = #{v_idx} AND MEDICINE.M_IDX = #{m_idx}")
	public String selectV_count(@Param("m_idx")String m_idx, @Param("v_idx")String v_idx);
	
	@Select("SELECT * FROM PHARMACY_SELLER where ps_identity=1 order by p_name")
	public ArrayList<PharmacySellerVO> selectPharmacyVOAll();
	
	@Select("select * from pharmacy_seller where p_name=#{p_name}")
	public PharmacySellerVO selectPharmacySellerVOByP_name(String p_name);
	
	@Select("select * from ps_location where ps_idx=#{ps_idx}")
	public Ps_LocationVO selectPs_LocationVOByPs_idx(String ps_idx);

	
}
