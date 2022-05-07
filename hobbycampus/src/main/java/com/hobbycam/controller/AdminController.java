package com.hobbycam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.admin.model.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDAO adminDao;
	

	@RequestMapping("/adminLoginForm.do")
	public ModelAndView adminLoginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminLogin");
		return mav;
	}
	
	
	@RequestMapping("/adminSignUp.do")
	public ModelAndView adminSignUp(AdminDTO dto) {
		
		int result = adminDao.signUpAdmin(dto);
		String msg = result>0? "관리자 회원가입 성공하였습니다." : "관리자 회원가입 실패하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "adminLoginForm.do");
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	
	
	
}