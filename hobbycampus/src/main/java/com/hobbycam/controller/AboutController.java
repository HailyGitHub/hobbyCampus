package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {
	
	@RequestMapping("/aboutUs.do")
	public ModelAndView aboutUs() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/aboutUs");
		return mav;
	}
	
	@RequestMapping("/aboutHR.do")
	public ModelAndView aboutHR() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/aboutHR");
		return mav;
	}
	
	@RequestMapping("/aboutPolicy.do")
	public ModelAndView aboutPolicy() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/aboutPolicy");
		return mav;
	}
	
	@RequestMapping("/aboutCenter.do")
	public ModelAndView aboutCenter() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/aboutCenter");
		return mav;
	}

}
