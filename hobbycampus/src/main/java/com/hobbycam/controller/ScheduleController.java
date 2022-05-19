package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.schedule.model.*;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleDAO scheduleDao;
	
	@RequestMapping("/scheduleInfoList.do")
	public ModelAndView scheduleInfoList(int lesson_idx) {
		
		List lists = scheduleDao.getscheduleList(lesson_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/scheduleSubmit.do")
	public ModelAndView scheduleSubmit(ScheduleDTO dto) {
		
		//Input Schedule List
		int count = scheduleDao.scheduleSubmit(dto);
		String msg = count>0? "등록 성공하였습니다." : "등록 실패하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/scheduleDelete.do")
	public ModelAndView scheduleDelete(int lesson_schedule_idx) {
		
		//Delete schedule
		int count = scheduleDao.scheduleDelete(lesson_schedule_idx);
		String msg = count>0? "삭제 성공하였습니다." : "삭제 실패하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
}
