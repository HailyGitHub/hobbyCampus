package com.hobbycam.controller;

import java.util.List;

import javax.servlet.ServletContext;

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
	public ModelAndView insertResume(ResumeDTO dto, @RequestParam("resumeImg")MultipartFile resumeImg) {
		
		String savePathFolder = servletContext.getRealPath("/hobbyImg/resumeImg/");
		
		
		String fileName = resumeImg.getOriginalFilename();
		String fileExtension = fileName.substring(fileName.length()-4, fileName.length());
		
		
		ImgUplod iu = new ImgUplod();
		String savePathImg = iu.copyInto(resumeImg, ""+dto.getU_idx(), savePathFolder, fileExtension) ;
		dto.setResume_img(savePathFolder+savePathImg+fileExtension);
		
		ModelAndView mav = new ModelAndView();
		int result = dao.resumeInsert(dto);
		String msg = result>0?"강사 신청이 완료되었습니다. 결과는 메일로 전달 드리겠습니다. ":"강사 신청이 실패되었습니다. 다시 제출 부탁드립니다.";
		mav.addObject("msg", msg);
		mav.setViewName("resume/resumeMsg");
		return mav;
		
	}
	
	@RequestMapping("/cate2.do")
	public ModelAndView cate2List(@RequestParam("cate1_idx")int cate1_idx) {
		
		ModelAndView mav = new ModelAndView();
		List cate2List =  dao.cate2List(cate1_idx);
		System.out.println(cate2List.size());
		mav.addObject("cate2List", cate2List);
		mav.setViewName("hobbyJson");
		return mav;
		
	}
	
}
