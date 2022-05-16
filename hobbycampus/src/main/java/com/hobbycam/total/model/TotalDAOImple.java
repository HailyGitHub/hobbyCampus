package com.hobbycam.total.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class TotalDAOImple implements TotalDAO {
	
	private SqlSessionTemplate sqlMap;

	public TotalDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public TotalGenderDTO getUserGenderCnt() {
		TotalGenderDTO dto = sqlMap.selectOne("selectUserGenderTotal");
		return dto;
	}
	
	@Override
	public TotalGenderDTO getTeacherGenderCnt() {
		TotalGenderDTO dto = sqlMap.selectOne("selectTeacherGenderTotal");
		return dto;
	}
	
	@Override
	public TotalMonthDTO getUserSignUPCnt(String first, String last) {
		Map map = new HashedMap();
		map.put("first", first);
		map.put("last", last);
		TotalMonthDTO dto = sqlMap.selectOne("selectUserSignUpMonthCnt",map);
		return dto;
	}
	
	
	@Override
	public TotalMonthDTO getTeacherSignUPCnt(String first, String last) {
		Map map = new HashedMap();
		map.put("first", first);
		map.put("last", last);
		TotalMonthDTO dto = sqlMap.selectOne("selectTeacherSignUpMonthCnt",map);
		return dto;
	}

	@Override
	public List getTest() {
		List list = sqlMap.selectList("selectTestMonth");
		return list;
	}
}
