package com.hobbycam.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CouponVO> getCoupons() {
		return sqlSessionTemplate.selectList("couponMapper.getCoupons");
	}

	@Override
	public List<CouponVO> getCouponsByUser(int uIdx, boolean stat) {
		Map<String, Object> param = new HashMap<>();
		param.put("uIdx", uIdx);
		param.put("stat", stat);
		return sqlSessionTemplate.selectList("couponMapper.getCouponsByUser", param);
	}

}
