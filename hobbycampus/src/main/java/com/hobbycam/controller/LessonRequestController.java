package com.hobbycam.controller;

import java.time.LocalDateTime;
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

import com.hobbycam.DAO.LessonScheduleDAO;
import com.hobbycam.DAO.PostDAO;
import com.hobbycam.VO.CouponVO;
import com.hobbycam.VO.LessonScheduleVO;
import com.hobbycam.VO.PostVO;
import com.hobbycam.VO.UserVO;
import com.hobbycam.coupon.model.CouponDAO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;
import com.hobbycam.users.model.UsersDAO;

@Controller
public class LessonRequestController {

	@Autowired
	private LessonScheduleDAO lessonScheduleDAO;

	@Autowired
	private CouponDAO couponDAO;

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private UsersDAO userDAO;

	@Autowired
	private LessonRecordDAO lessonRecordDao;

	@RequestMapping("/lessonRequest.do")
<<<<<<< HEAD
	public ModelAndView mypage(@RequestParam Map<String, String> param, HttpServletRequest req) {
		HttpSession session = req.getSession();
=======
	public ModelAndView mypage(@RequestParam Map<String, String> param) {

		
		int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
		LessonScheduleVO lessonScheduleVO = lessonScheduleService.getLessonSchedule(lessonScheduleIdx);
		
		
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);
		
		List<CouponVO> couponList = couponService.getCouponsByUser(uIdx, true);

>>>>>>> teacher_kdw
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("u_idx") == null) {
			mav.setViewName("redirect:/index.do");
			return mav;
		}

	
		int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
		LessonScheduleVO lessonScheduleVO = lessonScheduleDAO.getLessonSchedule(lessonScheduleIdx);

		int uIdx = (int) session.getAttribute("u_idx");
		UserVO userVO = userDAO.getUser(uIdx);

		List<CouponVO> couponList = couponDAO.getCouponsByUser(uIdx, true);

		mav.setViewName("payment/lessonRequest");

<<<<<<< HEAD
		// kit
		if ("??????".equals(lessonScheduleVO.getLessonKit())) {
=======
		
		if("??????".equals(lessonScheduleVO.getLessonKit())) {
>>>>>>> teacher_kdw
			PostVO postVO = postDAO.getPost(uIdx);
			// not post .
			if (postVO == null) {
				mav.addObject("postSaved", "N");
			}

			mav.addObject("postVO", postVO);
		}

<<<<<<< HEAD
		// set todo info 
=======
		
>>>>>>> teacher_kdw
		mav.addObject("lessonScheduleIdx", lessonScheduleIdx);
		mav.addObject("userVO", userVO);
		mav.addObject("lessonVO", lessonScheduleVO);
		mav.addObject("couponList", couponList);

		return mav;
	}

	// move page
	@RequestMapping("/lessonComplete.do")
	public ModelAndView lessonComplete(@RequestParam Map<String, String> param, HttpServletRequest req) {
		HttpSession session = req.getSession();

		int uIdx = (int) session.getAttribute("u_idx");

		// save post 
		
		String postReceiver = param.get("postReceiver");
		String postTel = param.get("postTel");
		String postAddr = param.get("postAddr");
		String postEtc = param.get("postEtc");
		
		// postReceiver  
		if (postReceiver != null) {
	
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("postReceiver", postReceiver);
			map.put("postTel", postTel);
			map.put("postAddr", postAddr);
			map.put("postEtc", postEtc);
			postDAO.insert(map);
		}

		// add mylesson
		try {
			
			int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
			int pricePoint = Integer.valueOf(param.get("pricePoint"));
			String lessonRecordState = "??????";
			String lessonExchangeState = "?????????";
			Map<String, Object> map = new HashMap<>();
			map.put("uIdx", uIdx);
			map.put("lessonScheduleIdx", lessonScheduleIdx);
			map.put("pricePoint", pricePoint);
			map.put("lessonBuyDate", LocalDateTime.now());
			map.put("lessonRecordState", lessonRecordState);
			map.put("lessonExchangeState", lessonExchangeState);

			lessonRecordDao.insert(map);
			
			userDAO.subUPoint(uIdx, pricePoint);
		} catch (Exception e) {
		}
		
		
		

		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/lessonComplete");
		return mav;
	}
}
