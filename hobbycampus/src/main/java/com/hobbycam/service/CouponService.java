package com.hobbycam.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbycam.DAO.CouponDAO;
import com.hobbycam.VO.CouponVO;


public interface CouponService {	
	List<CouponVO> getCoupons();
	List<CouponVO> getCouponsByUser(int uIdx, boolean stat);	
	
}
