package com.hobbycam.coupon.model;

import java.util.List;
import java.util.Map;

public interface CouponDAO {

	public CouponDTO getCouponInfo(int idx);
	public List getCouponList(Map map);
	public void setCoupon();
	public void updateCoupon();
}
