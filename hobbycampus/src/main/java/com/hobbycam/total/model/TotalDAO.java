package com.hobbycam.total.model;

import java.util.List;

public interface TotalDAO {
	
	public TotalGenderDTO getUserGenderCnt();
	public TotalGenderDTO getTeacherGenderCnt();
	public TotalMonthDTO getUserSignUPCnt(String first, String last);
	public TotalMonthDTO getTeacherSignUPCnt(String first, String last);
	
	public List getCateOne();
	public int getCateOneRate(int cate1_idx);
	public List getCateTwo();
	public int getCateTwoRate(int cate2_idx, String first, String last);
	
	public TotalMonthDTO getSalesTotal(String first, String last);
	public TotalMonthDTO getSalesRefund(String first, String last);
	public TotalMonthDTO getSalesExchange(String first, String last);
	
	
	public List getTest(String first, String last);

}
