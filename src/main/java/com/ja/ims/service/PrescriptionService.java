package com.ja.ims.service;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ja.ims.vo.MedicineVO;
import com.ja.ims.vo.PharmacySellerVO;
import com.ja.ims.vo.Ps_LocationVO;
import com.ja.ims.vopoket.PrescriptionVO;
import com.ja.ims.vopoket.VisitPharmVO_InDay;

@Service
public interface PrescriptionService {
	public ArrayList<VisitPharmVO_InDay> prescriptionAllList(String member_patient_idx);
	
	public String getV_count(MedicineVO medicineVO,String v_idx);

	
	public PrescriptionVO  prescriptionDetail(String v_idx);
	
	public PharmacySellerVO viewPharmacyLocation(String p_name);
	
	public Ps_LocationVO viewPs_Location(String ps_idx);

	
}
