package com.hobbycam.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.DAO.LessonRecordDAO;
import com.hobbycam.DAO.PostDAO;
import com.hobbycam.VO.LessonRecordVO;

@Controller
public class mylessonContoller {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private LessonRecordDAO lessonRecordDAO;

	@RequestMapping("/mylessonList.do")
	public ModelAndView myreviewList(@RequestParam Map<String, String> param) {

		// TODO 
		int uIdx = 3;

		// 
		String postReceiver = param.get("postReceiver");
		String postTel = param.get("postTel");
		String postAddr = param.get("postAddr");
		String postEtc = param.get("postEtc");
		// postReceiver 
		if (postReceiver != null) {
			// 
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("postReceiver", postReceiver);
			map.put("postTel", postTel);
			map.put("postAddr", postAddr);
			map.put("postEtc", postEtc);
			postDAO.insert(map);
		}

		//
		try {
			// 
			int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
			int pricePoint = Integer.valueOf(param.get("pricePoint"));
			String lessonRecordState = "예약";
			String lessonExchangeState = "미정산";
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("lessonScheduleIdx", lessonScheduleIdx);
			map.put("pricePoint", pricePoint);
			map.put("lessonBuyDate", LocalDateTime.now());
			map.put("lessonRecordState", lessonRecordState);
			map.put("lessonExchangeState", lessonExchangeState);

			lessonRecordDAO.insert(map);
		} catch (Exception e) {
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/mylesson");
		
		
		String lessonRecordState = param.get("lessonRecordState");
		List<LessonRecordVO> lessonRecordList = lessonRecordDAO.getLessonRecords(uIdx, lessonRecordState);
		mav.addObject("lessonRecordList", lessonRecordList);
		
		
		
		
		
		
		
		return mav;
	}

}
