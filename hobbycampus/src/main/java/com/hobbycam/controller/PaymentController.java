package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.payment.model.PaymentDAO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentDAO paymentDao;
	
	@RequestMapping("/paymentList.do")
	public ModelAndView paymentList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt=paymentDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.PageModule.pageMake("couponList.do", totalCnt, listSize, pageSize, cp);
		
		List lists= paymentDao.getPaymentList(cp,listSize);
		
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("coupon/couponList");
		return mav;
	}
	
	@RequestMapping("/refund.do")
	public ModelAndView refund() {
		ModelAndView mav = new ModelAndView();
		paymentDao.updaterefundPoint(null);
		paymentDao.updateRefundstate(null);
		
		
		return mav;
	}
	
}
