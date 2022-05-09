package com.hobbycam.DAO;

import java.util.List;
import java.util.Map;

import com.hobbycam.VO.CouponVO;

public interface CouponDAO {
	List<CouponVO> getCoupons();

	List<CouponVO> getCouponsByUser(int uIdx, boolean stat);
	
}
