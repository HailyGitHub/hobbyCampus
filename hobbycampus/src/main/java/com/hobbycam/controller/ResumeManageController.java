package com.hobbycam.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.email.HobbyEmail;
import com.hobbycam.email.HobbyEmailGoogle;
import com.hobbycam.resume.model.*;

@Controller
public class ResumeManageController {

	@Autowired
	private ResumeManageDAO resumeManageDao;
	
	
	@RequestMapping("/resumeList.do")
	public ModelAndView resumeList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int applyCnt = resumeManageDao.getApplyTotalCnt(); //Get Apply total count
		int totalCnt = resumeManageDao.getResumeTotalCnt(); //Get Resume list total count
		int listSize = 10;
		int pageSize = 10;

		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("resumeList.do", totalCnt, listSize, pageSize, cp);
		
		List lists = resumeManageDao.getResumeList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("applyCnt", applyCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("resume/resumeList");
		return mav;
	}
	
	@RequestMapping("/resumeApplyList.do")
	public ModelAndView resumeApplyList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int applyCnt = resumeManageDao.getApplyTotalCnt(); //Get Apply total count
		int listSize = 10;
		int pageSize = 10;
		
		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("resumeApplyList.do", applyCnt, listSize, pageSize, cp);
		
		List lists = resumeManageDao.getResumeApplyList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("applyCnt", applyCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("resume/resumeList");
		return mav;
	}
	
	@RequestMapping("/resumeResultList.do")
	public ModelAndView resumeResultList(
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int applyCnt = resumeManageDao.getApplyTotalCnt(); //Get Apply total count
		int totalCnt =  resumeManageDao.getResultTotalCnt(); //Get Result list total count
		int listSize = 10;
		int pageSize = 10;
		
		//Get pagination code
		String pageStr = com.hobbycam.page.BootstrapPageModule.pageMake("resumeResultList.do", totalCnt, listSize, pageSize, cp);
		
		List lists = resumeManageDao.getResumeResultList(cp, listSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("applyCnt", applyCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("resume/resumeList");
		return mav;
	}
	
	
	@RequestMapping("/resumeInfo.do")
	public ModelAndView resumeInfo(int resume_idx) {
		
		ResumeManageDTO result = resumeManageDao.getResumeInfo(resume_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/resumeChangeState.do")
	@ResponseBody
	public String resumeChangeState(
			@RequestParam(value =  "resume_idx") int resume_idx, 
			@RequestParam(value =  "u_email") String u_email, 
			@RequestParam(value =  "interview_state") String interview_state, 
			@RequestParam(value =  "interview_result") String interview_result) {
		
		try {
			interview_state = URLDecoder.decode(interview_state, "UTF-8"); //Get Parameter 
			interview_result = URLDecoder.decode(interview_result, "UTF-8"); //Get Parameter 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int count = resumeManageDao.resumeChangeState(resume_idx, interview_state, interview_result); //Update Resume State
		String msg = count>0? "??????" : "??????";
		
		//Send Email to User 
		if(!interview_result.equals("??????") && msg.equals("??????")) {
			HobbyEmail hobbymail = new HobbyEmailGoogle();
			String subject = "??????????????? ?????? ?????? ??????";
			String content = "";
			switch(interview_result) {
			case "?????????":
				try {
					content = "???????????????! <br>"
							+ "?????? ?????????????????? ????????? ???????????? ???????????????. <br>"
							+ "????????? ??????????????? <strong>?????????</strong> ?????? ???????????? ??????????????????. <br>"
							+ "??? ??????????????????.";
					hobbymail.emailSend(u_email, subject, content);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "??????":
				try {
					content = "???????????????! <br>"
							+ "?????? ?????????????????? ????????? ???????????? ???????????????. <br>"
							+ "?????? ????????? ?????????????????? ?????????????????? <br>"
							+ "????????? ????????? ?????? ???????????? ????????? ?????????. <br>"
							+ "??? ??????????????????.";
					hobbymail.emailSend(u_email, subject, content);
					int u_idx = resumeManageDao.getUserIdx(resume_idx); //GET u_idx
					resumeManageDao.setTeacher(u_idx);  //INSERT INTO teacher information
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		msg = URLEncoder.encode(msg);
		return msg;
	}
	
}
