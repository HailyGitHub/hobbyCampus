package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.notice.model.NoticeDAO;
import com.hobbycam.notice.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@RequestMapping("/noticeList.do")
	public ModelAndView notice(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt = noticeDao.getTotalCntS();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("noticeList.do", totalCnt, listSize, pageSize, cp);
		List lists= noticeDao.getNoticeList(cp,listSize);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	@RequestMapping("/noticeListTeacher.do")
	public ModelAndView noticeTeacher(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt = noticeDao.getTotalCntT();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("noticeListTeacher.do", totalCnt, listSize, pageSize, cp);
		
		List lists= noticeDao.getTeacherNoticeList(cp,listSize);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	@RequestMapping("/noticeListAll.do")
	public ModelAndView noticeAll(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt = noticeDao.getTotalCntA();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("noticeListAll.do", totalCnt, listSize, pageSize, cp);
				
		
		List lists= noticeDao.getAllNoticeList(cp,listSize);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("notice/noticeList");
		return mav;
	}

	@RequestMapping("/noticeExposeList.do")
	public ModelAndView noticeExposeList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt = noticeDao.getTotalCntEx();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("noticeExposeList.do", totalCnt, listSize, pageSize, cp);
		
		
		List lists= noticeDao.noticeExposeList(cp,listSize);
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	@RequestMapping("/noticeInfo.do")
	public ModelAndView noticInfo(int notice_idx) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = noticeDao.getNoticeInfo(notice_idx);
		System.out.println(dto.getNotice_idx());
		mav.addObject("dto",dto);
		mav.setViewName("hobbyJson");
		
		return mav;
	}
	@RequestMapping("/noticeMake.do")
	public ModelAndView noticeMake(NoticeDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller notice_idx :"+dto.notice_idx);
		int count = noticeDao.setNotice(dto);
		if(count>0) {
			mav.addObject("msg","완료");
		}else {
			mav.addObject("msg","실패");
		}
		mav.setViewName("hobbyJson");
		return mav;
	}
	@RequestMapping("/noticeUpdate.do")
	public ModelAndView noticeUpdate(NoticeDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller notice_idx :"+dto.notice_idx);
		int count = noticeDao.updateNotice(dto);
		if(count>0) {
			mav.addObject("msg","완료");
		}else {
			mav.addObject("msg","실패");
		}
		mav.setViewName("hobbyJson");
		return mav;
	}
	@RequestMapping("/getNoticeExpose.do")
	public ModelAndView getNoticeExpose() {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = noticeDao.getNoticeExpose();
		System.out.println(dto.getNotice_idx());
		mav.addObject("dto",dto);
		mav.setViewName("hobbyJson");
		
		return mav;
	}
	
	
	
}
