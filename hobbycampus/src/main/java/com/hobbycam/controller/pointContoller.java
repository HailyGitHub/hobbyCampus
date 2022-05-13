package com.hobbycam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.DAO.PayDAO;
import com.hobbycam.DAO.PostDAO;
import com.hobbycam.DAO.UserDAO;
import com.hobbycam.VO.PayVO;
import com.hobbycam.VO.UserVO;
import com.hobbycam.page.BootstrapPageModule;

@Controller
public class pointContoller {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private PayDAO payDAO;

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

		// 충전을 마치고 돌아가야할 주소(수강신청 주소)
		String rurl = param.get("rurl");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/pointShop");
		mav.addObject("userVO", userVO);
		mav.addObject("rurl", rurl);

		return mav;

	}

	@RequestMapping("/myPointList.do")
	public ModelAndView myPointList(@RequestParam Map<String, String> param) {

		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);

		int cp = 1;
		try {
			cp = Integer.valueOf(param.get("cp"));
		} catch (Exception e) {
		}
		int listSize = 5;

		int start = (cp - 1) * listSize + 1;
		int end = cp * listSize + 1;

		List<PayVO> payList = payDAO.getPays(uIdx, start, end);
		int totalCnt = payDAO.getPayTotalCnt(uIdx);
		int pageSize = 5;
		String pageMake = BootstrapPageModule.pageMake("myPointList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myPoint");

		mav.addObject("userVO", userVO);
		mav.addObject("payList", payList);

		mav.addObject("pageMake", pageMake);

		return mav;
	}

	// 포인트 구매 완료 페이지 이동
	@RequestMapping("/payComplete.do")
	public ModelAndView payComlete() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/payComplete");
		return mav;
	}

	@RequestMapping("/refund.do")
	@ResponseBody
	public String refund(@RequestParam Map<String, String> param) {
		int payListIdx = 0;
		try {
			payListIdx = Integer.valueOf(param.get("payListIdx"));
		} catch (Exception e) {
			return "payListIdx is not ";
		}

		// TODO 수정해야함( 유저가 3이라고 가정했을 뿐)
		int uIdx = 3;
		UserVO userVO = userDAO.getUser(uIdx);
		
		PayVO payVO = payDAO.getPay(payListIdx, uIdx);
		
		// 환불조건
		if (userVO.getuPoint() >= payVO.getPoint()) {
			try {
				int newUPoint = userVO.getuPoint() - payVO.getPoint();
				System.out.println("newUPoint : " + newUPoint);
				// user point 차감
				userDAO.updateUPoint(uIdx, newUPoint);

				// 해당 payListIdx 상태 업데이트
				int result = payDAO.updatePayValue(payListIdx, "환불");
				if(result == 0) {
					return "update fail";
				}
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				return "db error";
			}
		}

		// 잔액 부족
		return "need more balance";
	}

}
