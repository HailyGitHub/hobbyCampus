package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.level.model.LevelDAO;


@Controller
public class LevelController {

	@Autowired
	LevelDAO levelDao;
	
	@RequestMapping("/levelList.do")
	public ModelAndView levelList() {
		ModelAndView mav = new ModelAndView();
		
		
		List lists=levelDao.getLevelList();
		
		mav.addObject("lists",lists);
		mav.setViewName("level/levelList");
		
		return mav;
	}

}
