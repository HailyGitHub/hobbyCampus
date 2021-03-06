package com.hobbycam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.VO.CouponVO;
import com.hobbycam.service.CouponService;

@Controller
public class MypageController {

	@Autowired
	private CouponService couponService;

	@RequestMapping("/myUserPage.do")
	public ModelAndView mypage() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/mypage");
		return mav;
	}

	@RequestMapping("/mycoupon.do")
	public ModelAndView mycoupon(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mycoupon");
		
		int uIdx = 3;

		boolean stat = true;
		if ("N".equals(param.get("stat"))) {
			stat = false;
		}

		List<CouponVO> couponList = couponService.getCouponsByUser(uIdx, stat);
		mav.addObject("couponList", couponList);
		return mav;
	}

}
