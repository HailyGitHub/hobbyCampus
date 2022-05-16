package com.hobbycam.total.model;

import java.util.List;

public interface TotalDAO {
	
	public TotalGenderDTO getUserGenderCnt();
	public TotalGenderDTO getTeacherGenderCnt();
	public TotalMonthDTO getUserSignUPCnt(String first, String last);
	public TotalMonthDTO getTeacherSignUPCnt(String first, String last);
	public List getTest();

}
