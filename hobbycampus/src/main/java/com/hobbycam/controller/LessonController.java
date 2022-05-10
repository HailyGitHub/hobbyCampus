package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.lesson.model.LessonDAO;
import com.hobbycam.lesson.model.LessonDTO;

@Controller
public class LessonController {
	
	@Autowired
	private LessonDAO ldao;

	@RequestMapping(value = "/lesson.do",method = RequestMethod.GET)
	public ModelAndView lessonForm() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/lesson/lessonForm");
		return mav;
	}
	
	@RequestMapping(value = "/lesson.do",method = RequestMethod.POST)
	public ModelAndView lessonSubmit(LessonDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=ldao.lessonInsert(dto);
		
		String msg=result>0?"강의 등록 성공":"강의 등록 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	@RequestMapping("/lessonList.do")
	public ModelAndView lessonList(String t_name) {
		
		ModelAndView mav=new ModelAndView();
		List lists=ldao.lessonList(t_name);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonList");
		return mav;
		
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.GET)
	public ModelAndView lessonUpdateForm(String lesson_idx) {
		
		
		ModelAndView mav=new ModelAndView();
		
		List lists=ldao.lessonUpdateForm(lesson_idx);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.POST)
	public ModelAndView lessonUpdateSubmit(LessonDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=ldao.lessonUpdateSubmit(dto);
		String msg=result>0?"강의 수정 성공":"강의 수정 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
}
