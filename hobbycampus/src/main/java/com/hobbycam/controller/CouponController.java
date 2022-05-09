package com.hobbycam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.coupon.model.CouponDTO;
import com.hobbycam.coupon.model.CouponService;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
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
	public ModelAndView couponUpdateForm(int idx) {
		ModelAndView mav = new ModelAndView();
		CouponDTO dto = couponService.getCouponInfo(idx);
		if(dto == null){ 
			mav.addObject("msg","잘못된 접근"); 
			mav.addObject("goPage","couponList.do"); 
			mav. setViewName("coupon/couponMsg");
		}else{
			mav.addObject("dto",dto); 
			mav.setViewName("coupon/couponInfo");
		} 
		return mav;
	}
	@RequestMapping("/couponUpdate.do")
	public ModelAndView couponUpdate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponList");
		return mav;
	}
	
}