package com.ja.ims.vopoket;

import java.util.ArrayList;

import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.PatientVO;

public class PrescriptionVO {
//	String v_date;
	PatientVO patientVO;
	ArrayList<MedicineVO> medicineVOList;
	
	public PrescriptionVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PrescriptionVO(PatientVO patientVO, ArrayList<MedicineVO> medicineVOList) {
		super();
		this.patientVO = patientVO;
		this.medicineVOList = medicineVOList;
	}

	public PatientVO getPatientVO() {
		return patientVO;
	}

	public void setPatientVO(PatientVO patientVO) {
		this.patientVO = patientVO;
	}

	public ArrayList<MedicineVO> getMedicineVOList() {
		return medicineVOList;
	}

	public void setMedicineVOList(ArrayList<MedicineVO> medicineVOList) {
		this.medicineVOList = medicineVOList;
	}

	@Override
	public String toString() {
		return "PrescriptionVO [patientVO=" + patientVO + ", medicineVOList=" + medicineVOList + "]";
	}
	
	
}
