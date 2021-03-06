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

import com.hobbycam.lessonRecord.model.LessonRecordDAO;
import com.hobbycam.page.BootstrapPageModule2;
import com.hobbycam.payList.model.PayListDAO;
import com.hobbycam.teacher.model.TeacherDAO;
import com.hobbycam.teacher.model.TeacherDTO;
import com.hobbycam.upload.ImgUplod;
import com.hobbycam.upload.getLessonImg;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherDAO tdao;
	
	@Autowired
	private LessonRecordDAO ldao;
	
	@Autowired
	private PayListDAO pdao;
	
	@Autowired ServletContext servletContext;

	/**Teacher mypage*/
	@RequestMapping("/myTeacherPage.do")
	public String teacherMypage() {
		
		return "teacher/mypage";
	}
	
	/**Get teacher information form*/
	@RequestMapping(value="/teacherInfo.do", method = RequestMethod.GET)
	public ModelAndView teacherInfoForm(HttpServletRequest req) {
		

		//get t_idx, u_idx
		HttpSession session=req.getSession();
	    int u_idx=(int)session.getAttribute("u_idx");
	    int t_idx=(int)session.getAttribute("t_idx");
		TeacherDTO dto = tdao.teacherInfoForm(t_idx);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("teacher/teacherForm");
		return mav;
	}
	
	/**Update teacher information*/
	@RequestMapping(value="/teacherInfo.do", method = RequestMethod.POST)
	public ModelAndView teacherInfoUpdate(TeacherDTO dto, @RequestParam("tImg")MultipartFile t_img, HttpServletRequest req) {
	     
		//get t_idx, u_idx
		HttpSession session=req.getSession();
	    int u_idx=(int)session.getAttribute("u_idx");
	    int t_idx=(int)session.getAttribute("t_idx");
		
		dto.setT_idx(t_idx);
		
		String fileName = t_img.getOriginalFilename();
		String savePathImg = "";
		String fileExtension="";
		if(fileName==null||fileName.equals("")) {
			 TeacherDTO tDto = tdao.teacherInfoForm(dto.getT_idx());
			savePathImg = tDto.getT_img();
		}else {
			fileExtension = fileName.substring(fileName.length()-4, fileName.length());
			

			String savePathFolder =servletContext.getRealPath("/hobbyImg/teacherImg");
				
			ImgUplod iu = new ImgUplod();
			savePathImg = iu.copyInto(t_img, ""+dto.getT_idx(), savePathFolder, fileExtension);
			
		}
		dto.setT_img(""+dto.getT_idx()+fileExtension);
		
		
		String msg = "";
		ModelAndView mav = new ModelAndView();
		int result = tdao.teacherInfoUpdate(dto);
		boolean updateResult = true;
		
		if(result>0) {
			msg = "????????? ?????????????????????.";
			
		}else {
			msg = "????????? ?????????????????????.";
			updateResult = false;
		}

		mav.addObject("msg",msg);
		mav.setViewName("teacher/teacherInfoOk");
		return mav;
	}
	
	/**Form for name Duplicate Check*/
	@RequestMapping(value="/nameCheck.do", method = RequestMethod.GET)
	public String teacherNameCheck() {
		return "teacher/nameCheck";
	}
	
	
	/**Check for duplicate names*/
	@RequestMapping(value = "/nameCheck.do", method = RequestMethod.POST)
	public ModelAndView tNameCheck(String t_name) {
		boolean result = tdao.nameCheck(t_name);
		String msg = "";
		ModelAndView mav = new ModelAndView();
		if(result) {
			msg = "?????? ?????? ?????? ??????????????????.";
		}else {
			msg = "?????? ????????? ??????????????????.";
			mav.addObject("t_name", t_name);
		}
		mav.addObject("msg",msg);
		mav.addObject("result",result);
		mav.setViewName("teacher/nameCheckOk");
		return mav;
	}
	
	/**select lesson_record list*/
	@RequestMapping("/teacherRecord.do")
	public ModelAndView teacherRecord(HttpServletRequest req, @RequestParam(value="cp", defaultValue="1")int cp) {
		ModelAndView mav = new ModelAndView();
		
	    HttpSession session=req.getSession();
	    int u_idx=(int)session.getAttribute("u_idx");
	    int t_idx=(int)session.getAttribute("t_idx");

		
		//page
		int totalCnt = ldao.teacherRecordCnt(t_idx);
		int listSize = 10;
		int pageSize = 5;
		String addParam="&t_idx="+t_idx;
		String pageStr = BootstrapPageModule2.pageMake("teacherRecord.do", totalCnt, listSize, pageSize, cp, addParam);
		
		
		//list
		List lists =  ldao.teacherRecord(t_idx, cp, listSize);
		
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("teacher/teacherRecord");
		return mav;
	}
	
	/**Select teacher point*/
	@RequestMapping("/teacherPoint.do")
	public ModelAndView pointSelect(HttpServletRequest req, @RequestParam(value="cp", defaultValue="1")int cp) {
		
		   HttpSession session=req.getSession();
		   int u_idx=(int)session.getAttribute("u_idx");
		   int t_idx=(int)session.getAttribute("t_idx");
		
		//page
				int totalCnt = pdao.teacherPointExCnt(t_idx);
				int listSize = 10;
				int pageSize = 5;
				String addParam="&t_idx="+t_idx;
				String pageStr = BootstrapPageModule2.pageMake("teacherPoint.do", totalCnt, listSize, pageSize, cp, addParam);
				
		
		ModelAndView mav = new ModelAndView();
		
		//update lesson exchange state If more than 7 days have passed since class time
		tdao.lessonExStateUpdate(t_idx);
		
		//get teacher point by t_idx
		int tPoint = tdao.pointSelect(t_idx);
		
		//get exchange record list
		List lists = pdao.teacherPayList(t_idx, cp, listSize);
		
		mav.addObject("lists",lists);
		mav.addObject("tPoint", tPoint);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("teacher/teacherPoint");
		return mav;
	}
	
	/**update t_point to u_point*/
	@RequestMapping("/exToPoint.do")
	public ModelAndView pointToPoint(String exPoint, HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		int u_idx=(int)session.getAttribute("u_idx");
		int t_idx=(int)session.getAttribute("t_idx");
		
		int tPoint = tdao.pointSelect(t_idx);//get t_point by t_idx
		int exchangePoint = Integer.parseInt(exPoint);
		int resultPoint =tPoint-exchangePoint;
		boolean pointUpdate = false;
		String location="";
		ModelAndView mav = new ModelAndView();
		
		//If the user writes a larger(or smaller) amount than the user has
		if(resultPoint>=0) {
			
			//update pay_list and teacherInformation
			pointUpdate = tdao.exchageUPoint(t_idx, exchangePoint);
			location="teacher/teacherPointOk";
			
		}else{
			mav.addObject("msg", "?????? ????????? ????????? ??????????????????.");
			mav.addObject("gopage","teacherPoint.do");
			location="teacher/msg";
		}
		
		mav.addObject("pointUpdate", pointUpdate);
		mav.setViewName(location);
		return mav;
		
	}
	
	/**update t_point to cash*/
	@RequestMapping("/exToCash.do")
	public ModelAndView pointToCash(String exPoint, HttpServletRequest req) {

		HttpSession session=req.getSession();
		int u_idx=(int)session.getAttribute("u_idx");
		int t_idx=(int)session.getAttribute("t_idx");
		
		//get t_point by t_idx
		int tPoint = tdao.pointSelect(t_idx);
		int exchangePoint = Integer.parseInt(exPoint);
		int resultPoint =tPoint-exchangePoint;
		boolean pointUpdate = false;
		String location="";
		
		ModelAndView mav = new ModelAndView();
		
		//If the user writes a larger(or smaller) amount than the user has
				if(resultPoint>=0) {
					
					//update pay_list and teacherInformation
					pointUpdate = tdao.exchageCash(t_idx, exchangePoint);
					location="teacher/teacherPointOk";
					
					
				}else { 
					mav.addObject("msg", "?????? ????????? ????????? ??????????????????.");
					mav.addObject("gopage","teacherPoint.do");
					location = "teacher/msg";
				}
				mav.addObject("pointUpdate", pointUpdate);
				mav.setViewName(location);
				return mav;
	}
	
	
	
}
