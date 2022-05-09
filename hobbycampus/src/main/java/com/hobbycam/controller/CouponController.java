package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CouponController {
	
	@RequestMapping("/coupon.do")
	public ModelAndView coupon() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponList.do")
	public ModelAndView couponList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponMakeForm.do")
	public ModelAndView couponMakeForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponMake.do")
	public ModelAndView couponMake() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponUpdateForm.do")
	public ModelAndView couponUpdateForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponUpdate.do")
	public ModelAndView couponUpdate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
}