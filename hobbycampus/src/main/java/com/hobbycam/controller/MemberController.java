package com.hobbycam.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.member.model.*;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/memberUserList.do")
	public ModelAndView memberUserList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberDao.getUserTotalCnt(); //Get Users total count
		int listSize = 10;
		int pageSize = 10;
		
		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("memberUserList.do", totalCnt, listSize, pageSize, cp);
		
		List lists = memberDao.getUserList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("member/memberUserList");
		return mav;
	}
	
	@RequestMapping("/memberTeacherList.do")
	public ModelAndView memberTeacherList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberDao.getTeacherTotalCnt(); //Get Teacher total count
		int listSize = 10;
		int pageSize = 10;
		
		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("memberTeacherList.do", totalCnt, listSize, pageSize, cp);
		
		List lists = memberDao.getTeacherList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("member/memberTeacherList");
		return mav;
	}
	
	@RequestMapping("/memberWithdrawList.do")
	public ModelAndView memberWithdrawList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberDao.getWithdrawTotalCnt(); //Get Withdraw account total count
		int listSize = 10;
		int pageSize = 10;
		
		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("memberWithdrawList.do", totalCnt, listSize, pageSize, cp);
		
		List lists = memberDao.getWithdrawList(cp, listSize);
		
		// 2.Move to page
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("member/memberWithdrawList");
		return mav;
	}
	
	@RequestMapping("/switchUserState.do")
	public ModelAndView switchUserState(int u_idx, String u_state) {
		
		int count = memberDao.switchUserState(u_idx, u_state); //Switch u_state
		String result = count>0? "활성화 변경이 성공되었습니다." : "활성화 변경이 실패되었습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("member/memberResult");
		return mav;
	}
	
	@RequestMapping("/memberSearch.do")
	public ModelAndView memberSearch(String selectBox, String keyWord) {
		
		ModelAndView mav = new ModelAndView();
		List lists = null;
		
		switch(selectBox) {
		case "user":
			lists = memberDao.searchUser(keyWord);
			mav.addObject("lists", lists);
			mav.addObject("pageStr", "");
			mav.setViewName("member/memberUserList");
			break;
		case "teacher":
			lists = memberDao.searchTeacher(keyWord);
			mav.addObject("lists", lists);
			mav.addObject("pageStr", "");
			mav.setViewName("member/memberTeacherList");
		}
		return mav;
	}

}
