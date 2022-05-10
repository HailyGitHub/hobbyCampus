package com.hobbycam.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.DAO.PostDAO;
import com.hobbycam.DAO.UserDAO;
import com.hobbycam.VO.UserVO;

@Controller
public class pointContoller {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PostDAO postDAO;

	@RequestMapping("/pointShop.do")
	public ModelAndView pointShop(@RequestParam Map<String, String> param) {

		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);

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

		//충전을 마치고 돌아가야할 주소(수강신청 주소)
		String rurl = param.get("rurl");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/pointShop");
		mav.addObject("userVO", userVO);
		mav.addObject("rurl", rurl);

		return mav;

	}

	@RequestMapping("/myPointList.do")
	public ModelAndView myPointList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myPoint");
		return mav;
	}

}
