package com.hobbycam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {

	@RequestMapping("/categoryList.do")
	public ModelAndView categoryList() {
		
		//Cate1 List
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryList");
		return mav;
	}
	
	//s@RequestMapping()
	//public ModelAndView category
	
}
