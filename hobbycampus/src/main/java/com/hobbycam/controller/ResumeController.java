package com.hobbycam.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.resume.model.ResumeDAO;
import com.hobbycam.resume.model.ResumeDTO;
import com.hobbycam.upload.ImgUplod;

@Controller
public class ResumeController {
	
	@Autowired
	private ResumeDAO dao;
	
	@Autowired ServletContext servletContext;
	
	@RequestMapping(value="/resume.do", method = RequestMethod.GET)
	public ModelAndView resumeForm() {
		
		List cate1List =  dao.cate1List();
		ModelAndView mav = new ModelAndView();
		mav.addObject("cate1List", cate1List);
		mav.setViewName("resume/resumeForm");
		return mav;
	}
	
	@RequestMapping(value="/resume.do", method = RequestMethod.POST)
	public ModelAndView insertResume(ResumeDTO dto, @RequestParam("resumeImg")MultipartFile resumeImg, HttpServletRequest req) {
		

		HttpSession session=req.getSession();
		int u_idx=0;
		
		if(session.getAttribute("u_idx")==null||session.getAttribute("u_idx").equals("")) {
			u_idx=0;
		}else {
			u_idx=(int)session.getAttribute("u_idx");
		}
		
	
		
		//insert data
		ModelAndView mav = new ModelAndView();
		int resumeImgFileName = Integer.parseInt(dao.resumeInsert(dto)) ;
		
		String msg = "강사 신청이 완료되었습니다. 결과는 메일로 전달 드리겠습니다. ";
		

		//upload img
		String savePathFolder =servletContext.getRealPath("hobbyImg/resumeImg/"); 
		
		String fileName = resumeImg.getOriginalFilename();
		String fileExtension = fileName.substring(fileName.length()-4, fileName.length());
		
		
		ImgUplod iu = new ImgUplod();
		String savePathImg = iu.copyInto(resumeImg, ""+resumeImgFileName, savePathFolder, fileExtension) ;
		
		
		mav.addObject("msg", msg);
		mav.setViewName("resume/resumeMsg");
		return mav;
		
	}
	
	@RequestMapping("/cate2.do")
	public ModelAndView cate2List(@RequestParam("cate1_idx")int cate1_idx) {
		
		ModelAndView mav = new ModelAndView();
		List cate2List =  dao.cate2List(cate1_idx);
		mav.addObject("cate2List", cate2List);
		mav.setViewName("hobbyJson");
		return mav;
		
	}
	
}
