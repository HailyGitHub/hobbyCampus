package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mylessonContoller {

	@RequestMapping("/mylessonList.do")
	public ModelAndView myreviewList() {	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/users/mylesson");
		return mav;
	}
	
}
