package com.hobbycam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.DAO.PostDAO;
import com.hobbycam.DAO.UserDAO;
import com.hobbycam.VO.CouponVO;
import com.hobbycam.VO.LessonScheduleVO;
import com.hobbycam.VO.PostVO;
import com.hobbycam.VO.UserVO;
import com.hobbycam.service.CouponService;
import com.hobbycam.service.LessonScheduleService;

@Controller
public class LessonRequestController {

	@Autowired
	private LessonScheduleService lessonScheduleService;

	@Autowired
	private CouponService couponService;
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/lessonRequest.do")
	public ModelAndView mypage(@RequestParam Map<String, String> param) {

		
		int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
		LessonScheduleVO lessonScheduleVO = lessonScheduleService.getLessonSchedule(lessonScheduleIdx);
		
		
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);
		
		List<CouponVO> couponList = couponService.getCouponsByUser(uIdx, true);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/lessonRequest");

		
		if("있음".equals(lessonScheduleVO.getLessonKit())) {
			PostVO postVO = postDAO.getPost(uIdx);
			// 기존에 저장되어있지 않음.
			if(postVO == null) {
				mav.addObject("postSaved", "N");
			}
			
			mav.addObject("postVO", postVO);
		}

		
		mav.addObject("lessonScheduleIdx", lessonScheduleIdx);
		mav.addObject("userVO", userVO);
		mav.addObject("lessonVO", lessonScheduleVO);
		mav.addObject("couponList", couponList);
		
		return mav;
	}
	
	//수강신청 완료 페이지 이동
	@RequestMapping("/lessonComplete.do")
	public ModelAndView lessonComplete() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("payment/lessonComplete");
		return mav;
	}
}
