package com.hobbycam.coupon.model;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CouponDAOImple implements CouponDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public CouponDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List getCouponList(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end= cp*listSize;
		Map map= new HashMap();
		map.put("start",start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectCouponList",map); 
		return lists;
	}
	@Override
	public int setCoupon(CouponDTO dto) {
		int count = sqlMap.insert("insertCoupon",dto);
		return count;
		
	}
	@Override
	public CouponDTO getCouponInfo(int coupon_idx) {
		CouponDTO dto = sqlMap.selectOne("selectCouponInfo",coupon_idx);
		return dto;
	}
	@Override
	public int updateCoupon(CouponDTO dto) {
		int count = sqlMap.insert("updateCoupon",dto);
		return count;
	}
	@Override
	public int getTotalCnt() {
		int cnt= sqlMap.selectOne("totalCouponCnt");
		cnt=cnt==0?1:cnt;
		
		return cnt;
	}

}
