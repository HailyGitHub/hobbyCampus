package com.hobbycam.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.DAO.PostDAO;
import com.hobbycam.VO.LessonRecordVO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;

@Controller
public class mylessonContoller {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private LessonRecordDAO lessonRecordDao;

	@RequestMapping("/mylessonList.do")
	public ModelAndView mylessonList
	(@RequestParam Map<String, String> param , HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		
		 HttpSession session=req.getSession();
		 if(session.getAttribute("u_idx")==null) {
			 mav.setViewName("index.do");
			 return mav;
		 }
	     int uIdx=(int)session.getAttribute("u_idx");
		
		// post save
		String postReceiver = param.get("postReceiver");
		String postTel = param.get("postTel");
		String postAddr = param.get("postAddr");
		String postEtc = param.get("postEtc");
		// postReceiver info O
		if (postReceiver != null) {
			// Logic
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("postReceiver", postReceiver);
			map.put("postTel", postTel);
			map.put("postAddr", postAddr);
			map.put("postEtc", postEtc);
			postDAO.insert(map);
		}
	
		// add lessonlist
		/*
		 * try {
		 * 
		 * int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
		 * 
		 * int pricePoint = Integer.valueOf(param.get("pricePoint")); String
		 * lessonRecordState = "예약"; String lessonExchangeState = "미정산"; Map<String,
		 * Object> map = new HashMap<>(); map.put("uIdx", uIdx);
		 * map.put("lessonScheduleIdx", lessonScheduleIdx); map.put("pricePoint",
		 * pricePoint); map.put("lessonBuyDate", LocalDateTime.now());
		 * map.put("lessonRecordState", lessonRecordState);
		 * map.put("lessonExchangeState", lessonExchangeState);
		 * 
		 * String lessonTime = lessonRecordDao.getLessonTime(lessonScheduleIdx);
		 * //System.out.println("data:"+lessonTime); mav.addObject("lessonTime",
		 * lessonTime);
		 * 
		 * System.out.println("성공"); } catch (Exception e) { e.printStackTrace();
		 * System.out.println("오류"); }
		 */
		
		
		
		
		String lessonRecordState = param.get("lessonRecordState");
		List<LessonRecordVO> lessonRecordList = lessonRecordDao.getLessonRecords(uIdx, lessonRecordState);
		
		mav.addObject("lessonRecordList", lessonRecordList);
		mav.addObject("lessonRecordState", lessonRecordState);
		mav.setViewName("/users/mylesson");

		return mav;
	}

}
