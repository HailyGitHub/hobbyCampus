package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResumeController {

	@RequestMapping("/resumeList.do")
	public ModelAndView resumeList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resume/resumeList");
		return mav;
	}
	
}
