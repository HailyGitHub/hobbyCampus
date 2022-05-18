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
	public ModelAndView mylessonList(@RequestParam Map<String, String> param) {

		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;

		// 주소지 저장
		String postReceiver = param.get("postReceiver");
		String postTel = param.get("postTel");
		String postAddr = param.get("postAddr");
		String postEtc = param.get("postEtc");
		// postReceiver 관련된 정보가 있을 때
		if (postReceiver != null) {
			// 저장 로직
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("postReceiver", postReceiver);
			map.put("postTel", postTel);
			map.put("postAddr", postAddr);
			map.put("postEtc", postEtc);
			postDAO.insert(map);
		}

		// 수강이력에 추가
		try {
			// 만약 하위 정보 없이 그냥 내 이력 보려고 들어온거라면 error try catch 후 건너뛰기
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

			lessonRecordDao.insert(map);
		} catch (Exception e) {
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/mylesson");
		
		
		String lessonRecordState = param.get("lessonRecordState");
		List<LessonRecordVO> lessonRecordList = lessonRecordDao.getLessonRecords(uIdx, lessonRecordState);
		mav.addObject("lessonRecordList", lessonRecordList);
		
		
		return mav;
	}

}
