package com.hobbycam.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.resume.model.ResumeDAO;
import com.hobbycam.resume.model.ResumeDTO;

@Controller
public class ResumeController {
	
	@Autowired
	private ResumeDAO dao;
	
	@RequestMapping(value="/resume.do", method = RequestMethod.GET)
	public String resumeForm() {
		return "resume/resumeForm";
	}
	
	@RequestMapping(value="/resume.do", method = RequestMethod.POST)
	public ModelAndView resumeInsert(ResumeDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = dao.resumeInsert(dto);
		System.out.println(result);
		String msg = result>0?"강사 신청 성공!":"강사 신청 실패!";
		mav.addObject("msg", result);
		mav.setViewName("teacher/msg");
		return mav;
		
	}
	
	
	
//	@RequestMapping(value="/resume.do", method = RequestMethod.POST)
//	public ModelAndView resumeTemp(String resume_name, String interview_date) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("name",resume_name);
//		mav.addObject("date",interview_date);
//		mav.setViewName("resume/temp");
//		return mav;
//	} 
}
