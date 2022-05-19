package com.hobbycam.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.VO.CouponVO;
import com.hobbycam.coupon.model.CouponDAO;

@Controller
public class MypageController {

   @Autowired
   private CouponDAO couponDAO;

   @RequestMapping("/myUserPage.do")
   public ModelAndView mypage() {

      ModelAndView mav = new ModelAndView();
      mav.setViewName("users/mylesson");
      return mav;
   }

   @RequestMapping("/mycoupon.do")
   public ModelAndView mycoupon(@RequestParam Map<String, Object> param , HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("mypage/mycoupon");
      HttpSession session = req.getSession();
      if (session.getAttribute("u_idx") == null) {
         mav.setViewName("redirect:/index.do");
         return mav;
      }
      
      
      int uIdx = (int) session.getAttribute("u_idx");

      boolean stat = true;
      if ("N".equals(param.get("stat"))) {
         stat = false;
      }

      List<CouponVO> couponList = couponDAO.getCouponsByUser(uIdx, stat);
      mav.addObject("couponList", couponList);
      return mav;
   }

}