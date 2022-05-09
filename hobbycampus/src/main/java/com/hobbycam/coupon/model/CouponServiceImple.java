package com.hobbycam.coupon.model;

public class CouponServiceImple implements CouponService {

	private CouponDAO couponDao;
	
	@Override
	public CouponDTO getCouponInfo(int idx) {
		CouponDTO dto = couponDao.getCouponInfo(idx); 
		return dto;
	}

}
