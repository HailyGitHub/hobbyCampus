package com.hobbycam.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CategoryController {
	
	@Autowired ServletContext servletContext;

	@RequestMapping("/categoryList.do")
	public ModelAndView categoryList() {
		
		//Cate1 List
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryList");
		return mav;
	}
	
	@RequestMapping("/uploadCate1.do")
	public ModelAndView uploadCate1(String cate1_name, MultipartFile upload) {
		
		//Get Save File Path
		//String path = 
		
		//System.out.println(cate1_name);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("category/categoryList");
		return mav;
	}
	
}
