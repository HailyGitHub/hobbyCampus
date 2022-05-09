package com.hobbycam.coupon.model;

import java.util.List;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class CouponDAOImple implements CouponDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public CouponDTO getCouponInfo(int idx) {
		CouponDTO dto = sqlMap.selectOne("selectCouponInfo",idx);
		return dto;
	}
	@Override
	public List getCouponList(Map map) {
		List a = sqlMap.selectList("selectCouponList",map);
		return a;
	}
	@Override
	public void setCoupon() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateCoupon() {
		// TODO Auto-generated method stub
		
	}

}
