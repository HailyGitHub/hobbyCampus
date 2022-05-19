package com.hobbycam.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.review.model.ReviewDAO;
import com.hobbycam.review.model.ReviewDTO;
import com.hobbycam.review.model.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewDAO reviewDao;
	
	@RequestMapping("/review.do")
	public ModelAndView review(HttpServletRequest req) {
		
		ArrayList<ReviewVO> reviewVo=reviewDao.review(req);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("reviewVo",reviewVo);
		mav.setViewName("/review/review");
		return mav;
	}
	
	@RequestMapping("unreview.do")
	public ModelAndView unreview(HttpServletRequest req) {
			
		ArrayList<ReviewVO> reviewVo=reviewDao.unReview(req);
			
		ModelAndView mav=new ModelAndView();
		mav.addObject("reviewVo",reviewVo);
		mav.setViewName("/review/unReview");
		return mav;
		
	}
	

	@RequestMapping("/insertReview.do")
	public ModelAndView insertReview(ReviewDTO dto) {
		int count=reviewDao.insertReview(dto);
		String msg=count>0?"리뷰가 등록되었습니다.":"리뷰 등록 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("review/reviewMsg");
		return mav;
		
	}

	@RequestMapping("/updateReview.do")
	public ModelAndView updateReview(ReviewDTO dto) {
		int count=reviewDao.updateReview(dto);
		String msg=count>0?"리뷰가 수정되었습니다.":"리뷰 수정 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	
	@RequestMapping("/deleteReview.do")
	public ModelAndView deleteReview(int reviewidx) {
		int count=reviewDao.deleteReview(reviewidx);
		
		String msg=count>0?"리뷰가 삭제되었습니다.":"리뷰 삭제 실패";
		
		ModelAndView mav=new ModelAndView();

		mav.setViewName("review/reviewMsg");
		return mav;
	}


}
