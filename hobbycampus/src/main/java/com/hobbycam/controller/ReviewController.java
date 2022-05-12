package com.hobbycam.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView review(HttpServletRequest req) {
		
		
		ModelAndView mav=new ModelAndView();
		List list=reviewDao.review(req);
		
		
		mav.setViewName("/review/review");
		return mav;
	}
	
}
