package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
	
	@RequestMapping("/errorFour.do")
	public ModelAndView errorFour() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/errorFour");
		return mav;
	}
	
	@RequestMapping("/errorFive.do")
	public ModelAndView errorFive() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/errorFive");
		return mav;
	}
}
