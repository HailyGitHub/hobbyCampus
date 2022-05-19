package com.hobbycam.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/adminLogin.do")
	public ModelAndView adminLogin(String a_email, String a_pwd, HttpSession session) {
		
		//Get AdminDTO
		AdminDTO dto = adminDao.adminLogin(a_email, a_pwd);
		
		ModelAndView mav = new ModelAndView();
		if(dto==null) {  //False
			mav.addObject("url", "adminLoginForm.do");
			mav.addObject("msg", "로그인에 실패하셨습니다.");
		}else if(dto!=null) { //True -> Save session
			session.setAttribute("s_a_email", dto.getA_email());
			session.setAttribute("s_a_img", dto.getA_img());
			session.setAttribute("s_a_name", dto.getA_name());
			session.setAttribute("s_a_idx", dto.getA_idx());
			
			mav.addObject("url", "resumeList.do");
			mav.addObject("msg", dto.getA_name() + "님 환영합니다.");
		}
		
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	
	@RequestMapping("/adminLogout.do")
	public ModelAndView adminLogout(HttpSession session) {
		// Remove session data
		session.removeAttribute("s_a_email");
		session.removeAttribute("s_a_img");
		session.removeAttribute("s_a_name");
		session.removeAttribute("s_a_idx");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", "index.do");
		mav.addObject("msg", "로그아웃되었습니다.");
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	
	@RequestMapping("/adminEmailCheck.do")
	public ModelAndView adminEmailCheck(String a_email) {
		
		int count = adminDao.adminEmailCheck(a_email);
		String result = count>0? "사용 불가능한 아이디입니다." : "";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("admin/adminResult");
		return mav;
	}
	
	@RequestMapping("/adminNameCheck.do")
	public ModelAndView adminNameCheck(String a_name) {
		
		int count = adminDao.adminNameCheck(a_name);
		String result = count>0? "사용 불가능한 닉네임입니다." : "";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("admin/adminResult");
		return mav;
	}
	
	
	
}