package com.hobbycam.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.coupon.model.CouponDAO;
import com.hobbycam.coupon.model.CouponDTO;

@Controller
public class CouponController {
	
	
	@Autowired
	private CouponDAO couponDao;
	
	@RequestMapping("/couponList.do")
	public ModelAndView couponList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt=couponDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("couponList.do", totalCnt, listSize, pageSize, cp);
		
		List lists= couponDao.getCouponList(cp,listSize);
		
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("coupon/couponList");
		return mav;
	}
	@RequestMapping("/couponMakeForm.do")
	public ModelAndView couponMakeForm(
			@RequestParam(value="coupon_idx") int coupon_idx) {
		
		ModelAndView mav = new ModelAndView();
		CouponDTO dto = couponDao.getCouponInfo(coupon_idx);
		System.out.println(dto.getCoupon_idx());
		mav.addObject("dto",dto);
		mav.setViewName("hobbyJson");
		
		return mav;
	}
	@RequestMapping("/couponMake.do")
	public ModelAndView couponMake(CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		int count = couponDao.setCoupon(dto);
		if(count>0) {
			mav.addObject("msg","완료");
		}else {
			mav.addObject("msg","실패");
		}
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/couponUpdateForm.do")
	public ModelAndView couponUpdateForm(@RequestParam(value="idx",defaultValue = "0")int coupon_idx) {
		ModelAndView mav = new ModelAndView();
		CouponDTO dto = couponDao.getCouponInfo(coupon_idx);
		if(dto == null){ 
			mav.addObject("msg","잘못된 접근"); 
			mav. setViewName("hobbyJson");
			
		}else{
			mav.addObject("dto",dto); 
			mav.setViewName("hobbyJson");
		} 
		return mav;
	}
	
	@RequestMapping("/couponUpdate.do")
	public ModelAndView couponUpdate(CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		int count = couponDao.updateCoupon(dto);
		
		if(count>0){
			mav.addObject("msg","완료");
		}else {
			mav.addObject("msg","문제발생");
		}
		
		mav.setViewName("hobbyJson");
	
		return mav;
	}
	
}