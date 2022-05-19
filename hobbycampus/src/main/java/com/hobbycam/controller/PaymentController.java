package com.hobbycam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.payment.model.PaymentDAO;
import com.hobbycam.payment.model.PaymentDTO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentDAO paymentDao;
	
	
	public PaymentController(PaymentDAO paymentDao) {
		super();
		this.paymentDao = paymentDao;
	}

	@RequestMapping("/paymentList.do")
	public ModelAndView paymentList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		int totalCnt=paymentDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("paymentList.do", totalCnt, listSize, pageSize, cp);
		
		List lists= paymentDao.getPaymentList(cp,listSize);
		
		mav.addObject("lists",lists);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("payment/paymentList");
		return mav;
	}
	
	@RequestMapping("/refund.do")
	public ModelAndView refund(PaymentDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("controller dto.idx : "+dto.pay_list_idx);
		int state = paymentDao.updateRefundstate(dto);
		int point = paymentDao.updateRefundPoint(dto);
		System.out.println("controller point, state : "+ point+", "+state);
		if(point==1&&state==1) {
			mav.addObject("msg","완료");
		}else {
			mav.addObject("msg","거부됨");
		}
		mav.addObject("gopage","paymentList.do");
		mav.setViewName("hobbyJson");
		return mav;
	}
	
}
