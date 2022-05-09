package com.hobbycam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.VO.CouponVO;
import com.hobbycam.VO.LessonVO;
import com.hobbycam.service.CouponService;
import com.hobbycam.service.LessonService;

@Controller
public class LessonRequestController {

	@Autowired
	private LessonService lessonService;

	@Autowired
	private CouponService couponService;

	@RequestMapping("/lessonRequest.do")
	public ModelAndView mypage(@RequestParam Map<String, String> param) {

		// lessonIdx를 int로 변환하는 와중 오류 체크 해야함(param.get("lessonIdx")가 없거나 숫자가 아닌 경우)
		int lessonIdx = Integer.valueOf(param.get("lessonIdx"));
		LessonVO lessonVO = lessonService.getLesson(lessonIdx);
		System.out.print(lessonVO);

		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;
		List<CouponVO> couponList = couponService.getCouponsByUser(uIdx, true);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/lessonRequest");

		// todo 정보 set
		mav.addObject("lessonVO", lessonVO);
		mav.addObject("couponList", couponList);

		return mav;
	}
}
