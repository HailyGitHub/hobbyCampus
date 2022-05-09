package com.hobbycam.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbycam.DAO.CouponDAO;
import com.hobbycam.VO.CouponVO;

@Service
public class CouponSerivceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDAO;

	@Override
	public List<CouponVO> getCoupons() {
		return couponDAO.getCoupons();
	}

	@Override
	public List<CouponVO> getCouponsByUser(int uIdx,boolean stat) {
		return couponDAO.getCouponsByUser(uIdx, stat);
	}
}
