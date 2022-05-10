package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping("/index.do")
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
		
	}
	
	@RequestMapping("/temp.do")
	public ModelAndView temp() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/teacher/temp");
		return mav;
	}
	
	@RequestMapping("/mypage.do")
	public ModelAndView mypage() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/teacher/mypage");
		return mav;
	}
	
}
