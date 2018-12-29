package com.ja.ims.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.ims.mapper.MemberSQLMapper;
import com.ja.ims.mapper.PrescriptionSQLMapper;
import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.PatientVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Ps_LocationVO;
import com.ja.ims.vopoket.PrescriptionVO;
import com.ja.ims.vopoket.VisitPharmVO;
import com.ja.ims.vopoket.VisitPharmVO_InDay;

@Service
public class PrescriptionServiceImpl implements PrescriptionService {

	@Autowired
	PrescriptionSQLMapper prescriptionSQLMapper;
	@Autowired
	MemberSQLMapper memberSQLMapper;
	String statement;
	@Override
	public ArrayList<VisitPharmVO_InDay> prescriptionAllList(String member_patient_idx) {
		// TODO Auto-generated method stub
		ArrayList<VisitPharmVO_InDay> prescriptionVO_AllDay = new ArrayList<VisitPharmVO_InDay>();
		ArrayList<String> v_dateList = prescriptionSQLMapper.selectV_dateList(member_patient_idx); 	//방문한 날짜 : 중복없이
		for(String v_date : v_dateList) {
			//어떤 하루에 
			//여러 약국 또는 같은 약국을 여러번 방문한  방문기록을 가지고 있음
			ArrayList<PatientVO> visitInDay = prescriptionSQLMapper.selectPatientVOList(member_patient_idx, v_date);//같은날짜에 시간이 다른 방문
			VisitPharmVO_InDay visitPharmVOList = new VisitPharmVO_InDay();
			for(PatientVO visit : visitInDay) {//약국에 방문했을 때
				//진단받은 모든 병명
				ArrayList<String> d_NameList = prescriptionSQLMapper.selectD_NameList(visit.getV_idx());
				String pharmName = prescriptionSQLMapper.selectPharmacyName(visit);
				String v_idx = visit.getV_idx(); 
				visitPharmVOList.add(new VisitPharmVO(v_date, d_NameList, pharmName, v_idx),v_date);
			}
			//위에 for문이 다돌면 하루 방문기록이 모두 저장됨.
			prescriptionVO_AllDay.add(visitPharmVOList);
			//그것을 모든 방문기록을 저장하는 배열에 넣자.
		}
		return prescriptionVO_AllDay;
	}

	@Override
	public PrescriptionVO prescriptionDetail(String v_idx) {
		// TODO Auto-generated method stub
		PrescriptionVO prescriptionVO;
		PatientVO patientVO= prescriptionSQLMapper.selectPatientVOByIdx(v_idx);
		ArrayList<String> m_idxList= prescriptionSQLMapper.selectM_IdxFromPrescription(v_idx);
		ArrayList<MedicineVO> medicineVOList= new ArrayList<MedicineVO>();
		for(String m_idx: m_idxList) {
			MedicineVO medicineVO = prescriptionSQLMapper.selectFromMedicine(m_idx);
			medicineVOList.add(medicineVO);
		}
		prescriptionVO= new PrescriptionVO(patientVO, medicineVOList);
		return prescriptionVO;
	}
	
	@Override
	public String getV_count(MedicineVO medicineVO, String v_idx) {
		// TODO Auto-generated method stub
		System.out.println(medicineVO.getM_idx());
		System.out.println(v_idx);
		String v_count = prescriptionSQLMapper.selectV_count(medicineVO.getM_idx(), v_idx);
		return v_count;
	}

	public void makeString(ArrayList<String> st_IdxList) {
		statement ="";
		for(String st_Idx : st_IdxList) {
			statement += st_Idx;
			statement += ",";
		}
		statement = statement.substring(0, statement.length()-1);
	}
	@Override
	public PharmacySellerVO viewPharmacyLocation(String p_name) {
		// TODO Auto-generated method stub
		PharmacySellerVO pharmacySellerVO= prescriptionSQLMapper.selectPharmacySellerVOByP_name(p_name);
		System.out.println(pharmacySellerVO);
		return pharmacySellerVO;
	}

	@Override
	//위도, 경도 가져오기
	public Ps_LocationVO viewPs_Location(String ps_idx) {
		// TODO Auto-generated method stub
		
		return prescriptionSQLMapper.selectPs_LocationVOByPs_idx(ps_idx);
	}
	
}
