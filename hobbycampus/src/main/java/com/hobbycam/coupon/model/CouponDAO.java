package com.hobbycam.coupon.model;

import java.util.List;
import java.util.Map;

import com.hobbycam.VO.CouponVO;

public interface CouponDAO {

	public List getCouponList(int cp, int listSize);
	public int setCoupon(CouponDTO dto);
	public CouponDTO getCouponInfo(int coupon_idx);
	public int updateCoupon(CouponDTO dto);
	public int getTotalCnt();
	List<CouponVO> getCoupons();
	List<CouponVO> getCouponsByUser(int uIdx, boolean stat);
}