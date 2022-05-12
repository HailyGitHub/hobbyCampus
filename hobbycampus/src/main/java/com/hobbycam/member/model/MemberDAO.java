package com.hobbycam.member.model;

import java.util.*;

public interface MemberDAO {
	
	public int getUserTotalCnt();
	public int getTeacherTotalCnt();
	public int getWithdrawTotalCnt();
	public List getUserList(int cp, int listSize);
	public List getTeacherList(int cp, int listSize);
	public List getWithdrawList(int cp, int listSize);
	public int switchUserState(int u_idx, String u_state);
	public List searchUser(String keyWord);
	public List searchTeacher(String keyWord);

}
