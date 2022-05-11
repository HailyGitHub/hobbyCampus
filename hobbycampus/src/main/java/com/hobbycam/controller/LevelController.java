package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.level.model.LevelDAO;
import com.hobbycam.level.model.LevelDTO;


@Controller
public class LevelController {
	
	@Autowired
	LevelDAO levelDao;

	@RequestMapping("/levelList.do")
	public ModelAndView levelList() {
		ModelAndView mav = new ModelAndView();
		List lists = levelDao.getLevelList();
		mav.addObject("lists",lists);
		mav.setViewName("level/levelList");
		
		return mav;
		
	}
	
	@RequestMapping("/levelUpdateForm.do")
	public ModelAndView levelUpdateForm(int idx) {
		ModelAndView mav = new ModelAndView();
		LevelDTO dto = levelDao.getUpdateLevelInfo(idx);
		if(dto!=null) {
			mav.addObject("dto",dto);
		}else {
			
			mav.addObject("msg","문제 발생");
			
		}
		mav.setViewName("evel/levelList");
		
		return mav;
		
	}
	
	@RequestMapping("/levelUpdate.do")
	public ModelAndView levelUpdate(LevelDTO dto) {
		ModelAndView mav = new ModelAndView();
		int state = levelDao.updateLevel(dto);
		if(state==1) {
			mav.addObject("msg","완료");
		}else {
			
			mav.addObject("msg","문제 발생");
			
		}
		mav.setViewName("evel/levelList");
		
		return mav;
		
		
		
	}
	

}
