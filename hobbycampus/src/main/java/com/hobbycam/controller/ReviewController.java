package com.hobbycam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.review.model.reviewDAO;

@Controller
public class ReviewController {

	@Autowired
	reviewDAO reviewDao;
	
	@RequestMapping("/review.do")
	public ModelAndView review() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/review/review");
		return mav;
	}
	
	@RequestMapping("/myreview.do")
	public ModelAndView myreview() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/review/myreview");
		return mav;
	}
	
	
	
	
	
}
