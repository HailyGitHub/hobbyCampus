package com.hobbycam.member.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int getUserTotalCnt() {
		int count = sqlMap.selectOne("selectMemberUserTotalCnt"); //Get Users total count
		return count;
	}
	
	@Override
	public int getTeacherTotalCnt() {
		int count = sqlMap.selectOne("selectMemberTeacherTotalCnt"); //Get Teacher total count
		return count;
	}
	
	@Override
	public int getWithdrawTotalCnt() {
		int count = sqlMap.selectOne("selectMemberWithdrawTotalCnt"); //Get Withdraw account total count
		return count;
	}
	
	@Override
	public List getUserList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		
		List lists = sqlMap.selectList("selectMemberUserList", map);
		return lists;
	}
	
	@Override
	public List getTeacherList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		
		List lists =  sqlMap.selectList("selectMemberTeacherList", map);
		return lists;
	}
	
	@Override
	public List getWithdrawList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		
		List lists = sqlMap.selectList("selectMemberWithdrawList", map);
		return lists;
	}
	
	@Override
	public int switchUserState(int u_idx, String u_state) {
		Map map = new HashMap();
		map.put("u_idx", u_idx);
		map.put("u_state",u_state);
	
		int count = sqlMap.update("updateUserState", map); //Switch user state
		return count;
	}
	
	@Override
	public List searchUser(String keyWord) {
		List lists = sqlMap.selectList("selectSearchUser", keyWord);
		return lists;
	}
	
	@Override
	public List searchTeacher(String keyWord) {
		List lists = sqlMap.selectList("selectSearchTeacher", keyWord);
		return lists;
	}

}
