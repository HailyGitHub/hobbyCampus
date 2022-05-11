package com.hobbycam.controller;

import java.io.File;
import java.io.FileOutputStream;

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
	
	@RequestMapping(value="/resume.do", method = RequestMethod.GET)
	public String resumeForm() {
		return "resume/resumeForm";
	}
	
	@RequestMapping(value="/resume.do", method = RequestMethod.POST)
	public ModelAndView insertResume(ResumeDTO dto, @RequestParam("resumeImg")MultipartFile resumeImg) {
		
		String fileName = resumeImg.getOriginalFilename();
		String fileExtension = fileName.substring(fileName.length()-4, fileName.length());
		
		String savePathFolder ="C:\\hobbyImg\\resumeImg\\"; 
		
		ImgUplod iu = new ImgUplod();
		String savePathImg = iu.copyInto(resumeImg, ""+dto.getU_idx(), savePathFolder, fileExtension) ;
		dto.setResume_img(savePathImg);
		ModelAndView mav = new ModelAndView();
		int result = dao.resumeInsert(dto);
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
