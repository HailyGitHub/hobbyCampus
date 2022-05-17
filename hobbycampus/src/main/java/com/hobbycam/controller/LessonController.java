package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.email.HobbyEmailGoogle;
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
	
	
	/**get lesson Content by lesson_idx*/
	@RequestMapping("/lessonCont.do")
	public ModelAndView lessonCont(int lesson_idx) {
		ModelAndView mav=new ModelAndView();
		
		String type=ldao.lessonContIndentify(lesson_idx);
		
		//get review list
		List lists=null;
		List review=ldao.lessonReview(lesson_idx);
		
		//get like cnt
		int like=ldao.lessonLike(lesson_idx);
		
		//get lesson date
		List scheduleDate = ldao.scheduleDate(lesson_idx);
		
		//get t_email
		String tEmail = ldao.teacherEmail(lesson_idx);
		
		//whether the like button
		int u_idx=2;
		boolean likeCheck = ldao.checkLike(lesson_idx, u_idx);
		
		//get content 
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
		mav.addObject("tEmail",tEmail);		
		mav.addObject("scheduleDate",scheduleDate);
		mav.addObject("likeCheck",likeCheck);
		mav.setViewName("lesson/lessonCont");
		return mav;
		
	}
	
	/**send email to teacher*/
	@RequestMapping("/sendEmail.do")
	public ModelAndView sendEmail(@RequestParam("teacherEmail")String tEmail, @RequestParam("userMail")String uEmail,@RequestParam("mailSubject")String subject, @RequestParam("mailContent")String content ) {
		ModelAndView mav=new ModelAndView();
		HobbyEmailGoogle heg = new HobbyEmailGoogle();
		boolean result = false;
		subject = "[hobbycampus/수업 문의]"+subject;
		content = "[답변 받을 학생 이메일]  "+uEmail+"\r\n[문의 내용]"+content;
		try {
			heg.emailSend(tEmail, subject, content);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		mav.addObject("result", result);
		mav.setViewName("lesson/lessonContEmailOk");
		return mav;
		
	}
	
	
	/**get lesson time by specific lesson date*/
	@RequestMapping("/lessonTime.do")
	public ModelAndView getLessonTime(String lessonDate) {
		List scheduleTime = ldao.scheduleTime(lessonDate);
		ModelAndView mav=new ModelAndView();
		mav.addObject("scheduleTime",scheduleTime);
		mav.setViewName("hobbyJson");
		return mav;
	}
	

}
