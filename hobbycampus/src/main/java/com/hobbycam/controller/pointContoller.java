package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class pointContoller {
	
	@RequestMapping("/pointShop.do")
	public ModelAndView pointShop() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/pointShop");
		return mav;
		
	}
	
	@RequestMapping("/myPointList.do")
	public ModelAndView myPointList() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myPoint");
		return mav;
	}

}
