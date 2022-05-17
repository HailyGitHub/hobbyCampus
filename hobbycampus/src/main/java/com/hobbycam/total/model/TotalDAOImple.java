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
	public List getCateOne() {
		List lists = sqlMap.selectList("selectCateOneTotal");
		return lists;
	}
	
	@Override
	public int getCateOneRate(int cate1_idx) {
		int count = sqlMap.selectOne("selectCateOneRate", cate1_idx);
		return count;
	}
	
	@Override
	public List getCateTwo() {
		List lists = sqlMap.selectList("selectCateTwoTotal");
		return lists;
	}
	
	@Override
	public int getCateTwoRate(int cate2_idx, String first, String last) {
		Map map = new HashedMap();
		map.put("cate2_idx", cate2_idx);
		map.put("first", first);
		map.put("last", last);
		int count = sqlMap.selectOne("selectCateTwoRate", map);
		return count;
	}
	
	@Override
	public int getLiveCnt() {
		int count = sqlMap.selectOne("selectLiveTypeCnt");
		return count;
	}
	
	@Override
	public int getOnCnt() {
		int count = sqlMap.selectOne("selectOnTypeCnt");
		return count;
	}
	
	@Override
	public int getOffCnt() {
		int count = sqlMap.selectOne("selectOffTypeCnt");
		return count;
	}
	
	@Override
	public TotalMonthDTO getSalesTotal(String first, String last) {
		Map map = new HashedMap();
		map.put("first", first);
		map.put("last", last);
		TotalMonthDTO dto = sqlMap.selectOne("selectSalesTotal",map);
		return dto;
	}
	
	@Override
	public TotalMonthDTO getSalesRefund(String first, String last) {
		Map map = new HashedMap();
		map.put("first", first);
		map.put("last", last);
		TotalMonthDTO dto = sqlMap.selectOne("selectSalesRefund",map);
		return dto;
	}
	
	@Override
	public TotalMonthDTO getSalesExchange(String first, String last) {
		Map map = new HashedMap();
		map.put("first", first);
		map.put("last", last);
		TotalMonthDTO dto = sqlMap.selectOne("selectSalesExchange",map);
		return dto;
	}

}
