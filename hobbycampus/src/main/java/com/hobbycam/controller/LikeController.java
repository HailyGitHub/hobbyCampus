package com.hobbycam.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.like.model.LikeDAO;
import com.hobbycam.like.model.LikeDTO;
import com.hobbycam.like.model.LikeVO;

@Controller
public class LikeController {

	@Autowired
	LikeDAO likeDao;
	
	@RequestMapping("/myLikeList.do")
	public ModelAndView myLike(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		
		HttpSession session=req.getSession();
		if(session.getAttribute("u_idx")==null) {
			mav.addObject("msg","로그인을 진행해 주세요");
			mav.addObject("gopage","index.do");
			mav.setViewName("users/usersMsg");
			return mav;
		}
		
		int idx=(int)session.getAttribute("u_idx");
		System.out.println("mylike u_idx="+idx);
		
	
		ArrayList<LikeVO> likeVo=likeDao.myLike(idx);

		
		System.out.println("likeVO");
		
		mav.addObject("likeVo",likeVo);
		mav.setViewName("users/myLike");
		return mav;
	}
	
	@RequestMapping("/myLike.do")
	public ModelAndView getMyLike(HttpServletRequest req, int lesson_idx) {
		ModelAndView mav=new ModelAndView();
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("u_idx");
		LikeDTO dto=new LikeDTO(idx, lesson_idx);
		System.out.println("idx="+idx+"lesson_idx"+lesson_idx);
		
		
		likeDao.getMyLike(dto);
		
		ArrayList<LikeVO> likeVo=likeDao.myLike(idx);
		mav.addObject("likeVo",likeVo);
		mav.setViewName("users/myLike");
		return mav;
	}
	
}
