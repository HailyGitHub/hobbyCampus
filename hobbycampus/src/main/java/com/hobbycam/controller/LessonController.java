package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.lesson.model.LessonDAO;
import com.hobbycam.lesson.model.LessonDTO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;

@Controller
public class LessonController {
	
	@Autowired
	private LessonDAO ldao;
	
	@Autowired
	private LessonRecordDAO lrdao;

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
	
	//lesson List view
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
	
	@RequestMapping("/lessonReqList.do")
	public ModelAndView lessonReqList(int t_idx) {
		ModelAndView mav=new ModelAndView();
		List lists=lrdao.lessonReqList(t_idx);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonReqList");
		return mav;
		
	}
	
	@RequestMapping("/lessonCont.do")
	public ModelAndView lessonCont(int lesson_idx) {
		ModelAndView mav=new ModelAndView();
		
		String type=ldao.lessonContIndentify(lesson_idx);
		
		List lists=null;
		
		List review=ldao.lessonReview(lesson_idx);
		int like=ldao.lessonLike(lesson_idx);
		
		switch (type) {
		case "온라인":
			lists=ldao.lessonOnlineCont(lesson_idx);
			break;
		case "오프라인":
			lists=ldao.lessonOfflineCont(lesson_idx);
			break;
		case "라이브":
			lists=ldao.lessonLiveCont(lesson_idx);
			break;
		}
		mav.addObject("lessonType", type);
		mav.addObject("like",like);
		mav.addObject("review",review);
		mav.addObject("lists",lists);
		mav.setViewName("lesson/lessonCont");
		return mav;
		
	}
	

}
