package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointController {
	
	@RequestMapping("/lessonPayment.do")
	public ModelAndView lessonPayment() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/users/lessonPayment");
		return mav;
	}
	

}
