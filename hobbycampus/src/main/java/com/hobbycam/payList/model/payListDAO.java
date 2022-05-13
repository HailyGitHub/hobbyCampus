package com.hobbycam.payList.model;

import java.util.List;

public interface PayListDAO {

	public List teacherPayList(int t_idx, int cp, int listSize);
	public int teacherPointExCnt(int t_idx);
	
}
