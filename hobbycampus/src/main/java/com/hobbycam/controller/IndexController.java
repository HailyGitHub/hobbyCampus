package com.hobbycam.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.index.model.*;

@Controller
public class IndexController {
	
	@Autowired
	private IndexDAO indexDao;
	
	
	@RequestMapping("/index.do")
	public ModelAndView index() {
		
		List cateOneList = indexDao.getCateOneList(); //GET CategoryOne List
		List cateTwoList = indexDao.getCateTwoList(); //GET CategoryTwo List
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cateOneList", cateOneList);
		mav.addObject("cateTwoList", cateTwoList);
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/temp.do")
	public ModelAndView temp() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/teacher/temp");
		return mav;
	}
	
	@RequestMapping("/mpage.do")
	public ModelAndView mypage() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/teacher/mypage");
		return mav;
	}

}
