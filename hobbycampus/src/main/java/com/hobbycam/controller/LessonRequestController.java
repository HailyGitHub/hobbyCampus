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

		// lessonIdx를 int로 변환하는 와중 오류 체크 해야함(param.get("lessonIdx")가 없거나 숫자가 아닌 경우)
		int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
		LessonScheduleVO lessonScheduleVO = lessonScheduleService.getLessonSchedule(lessonScheduleIdx);
		
		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);
		
		List<CouponVO> couponList = couponService.getCouponsByUser(uIdx, true);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/lessonRequest");

		//kit가 있는 경우
		if("있음".equals(lessonScheduleVO.getLessonKit())) {
			PostVO postVO = postDAO.getPost(uIdx);
			// 기존에 저장되어있지 않음.
			if(postVO == null) {
				mav.addObject("postSaved", "N");
			}
			
			mav.addObject("postVO", postVO);
		}

		// todo 정보 set
		mav.addObject("lessonScheduleIdx", lessonScheduleIdx);
		mav.addObject("userVO", userVO);
		mav.addObject("lessonVO", lessonScheduleVO);
		mav.addObject("couponList", couponList);
		
		return mav;
	}
}
