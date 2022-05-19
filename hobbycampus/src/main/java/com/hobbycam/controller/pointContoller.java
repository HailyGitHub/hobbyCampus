package com.hobbycam.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hobbycam.DAO.PayDAO;
import com.hobbycam.DAO.PostDAO;
import com.hobbycam.VO.PayVO;
import com.hobbycam.VO.UserVO;
import com.hobbycam.lesson.model.LessonDTO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;
import com.hobbycam.page.BootstrapPageModule;
import com.hobbycam.users.model.UsersDAO;

@Controller
public class pointContoller {

   @Autowired
   private UsersDAO userDAO;

   @Autowired
   private PostDAO postDAO;

   @Autowired
   private PayDAO payDAO;

   @RequestMapping("/pointShop.do")
   public ModelAndView pointShop(@RequestParam Map<String, String> param, HttpServletRequest req) {

      HttpSession session = req.getSession();
      ModelAndView mav = new ModelAndView();
      if (session.getAttribute("u_idx") == null) {
         mav.setViewName("redirect:/index.do");
         return mav;
      }
      
      
      int uIdx = (int) session.getAttribute("u_idx");
      UserVO userVO = userDAO.getUser(uIdx);

      String postReceiver = param.get("postReceiver");
      String postTel = param.get("postTel");
      String postAddr = param.get("postAddr");
      String postEtc = param.get("postEtc");
      // postReceiver OX
      if (postReceiver != null) {
         //post save
         Map<String, Object> map = new HashMap<>();
         map.put("uIdx", uIdx);
         map.put("postReceiver", postReceiver);
         map.put("postTel", postTel);
         map.put("postAddr", postAddr);
         map.put("postEtc", postEtc);
         postDAO.insert(map);
      }

      // point url
      String rurl = param.get("rurl");
      mav.setViewName("mypage/pointShop");
      mav.addObject("userVO", userVO);
      mav.addObject("rurl", rurl);

      try {
         int lessonScheduleIdx = Integer.valueOf(param.get("lessonScheduleIdx"));
         mav.addObject("lessonScheduleIdx", lessonScheduleIdx);
      } catch (Exception e) {
         e.printStackTrace();
      }

      return mav;

   }

   @RequestMapping("/myPointList.do")
   public ModelAndView myPointList(@RequestParam Map<String, String> param, HttpServletRequest req) {

      HttpSession session = req.getSession();
      ModelAndView mav = new ModelAndView();
      if (session.getAttribute("u_idx") == null) {
         mav.setViewName("redirect:/index.do");
         return mav;
      }
      
      
      int uIdx = (int) session.getAttribute("u_idx");
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
      Date now = new Date();
      for (int i = 0; i < payList.size(); i++) {
         PayVO payVO = payList.get(i);

         try {
            Date payDate = new SimpleDateFormat("yyyy-MM-dd").parse(payVO.getPayDate());

            long diffSec = (now.getTime() - payDate.getTime()) / 1000;
            long diffDays = diffSec / (24 * 60 * 60);

            if (diffDays >= 7 && "입금".equals(payVO.getType())) {
               payList.get(i).setType("환불불가");
            }
         } catch (Exception e) {

         }
      }

      int totalCnt = payDAO.getPayTotalCnt(uIdx);
      int pageSize = 5;
      String pageMake = BootstrapPageModule.pageMake("myPointList.do", totalCnt, listSize, pageSize, cp);

   
      mav.setViewName("mypage/myPoint");

      mav.addObject("userVO", userVO);
      mav.addObject("payList", payList);

      mav.addObject("pageMake", pageMake);

      return mav;
   }

   // page move
   @RequestMapping("/payComplete.do")
   public ModelAndView payComlete() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("payment/payComplete");
      return mav;
   }

   @RequestMapping("/myPointRefund.do")
   @ResponseBody
   public String myPointRefund(@RequestParam Map<String, String> param, HttpServletRequest req) {
      int payListIdx = 0;
      try {
         payListIdx = Integer.valueOf(param.get("payListIdx"));
      } catch (Exception e) {
         return "payListIdx is not ";
      }
      
      HttpSession session = req.getSession();
      ModelAndView mav = new ModelAndView();
      if (session.getAttribute("u_idx") == null) {
         mav.setViewName("redirect:/index.do");

      }
      
      int uIdx = (int) session.getAttribute("u_idx");

      UserVO userVO = userDAO.getUser(uIdx);

      PayVO payVO = payDAO.getPay(payListIdx, uIdx);
      Date now = new Date();
      long diffDays = 8;
      try {
         Date payDate = new SimpleDateFormat("yyyy-MM-dd").parse(payVO.getPayDate());

         long diffSec = (now.getTime() - payDate.getTime()) / 1000;
         diffDays = diffSec / (24 * 60 * 60);
      } catch (Exception e) {

      }

      // refund
      if (userVO.getuPoint() >= payVO.getPoint() && diffDays < 7) {
         try {
            int newUPoint = userVO.getuPoint() - payVO.getPoint();
            System.out.println("newUPoint : " + newUPoint);
            // user point -
            userDAO.updateUPoint(uIdx, newUPoint);

            // payListIdx update
            int result = payDAO.updatePayValue(payListIdx, "환불");
            if (result == 0) {
               return "update fail";
            }
            return "success";
         } catch (Exception e) {
            e.printStackTrace();
            return "db error";
         }
      }

      // point shot
      return "need more balance";
   }

   @RequestMapping(value = "/payComplete.do", method = RequestMethod.POST)
   @ResponseBody
   public String payComplete(@RequestBody String response) {
      System.out.println("response : " + response);

      ObjectMapper mapper = new ObjectMapper();

      Map<String, Object> param = null;
      try {
         param = mapper.readValue(response, Map.class);
         for (String key : param.keySet()) {
            System.out.println("key : " + key + ", value : " + param.get(key));
         }

      } catch (Exception e) {
         return "parsing FAIL";
      }

      int uIdx = (int) param.get("uIdx");
      int point = (int) param.get("paid_amount");

      System.out.println("uIdx : " + uIdx + ", point : " + point);

      // point update

      Map<String, Object> map = new HashMap<>();
      map.put("uIdx", uIdx);
      map.put("payValue", "충전");
      map.put("payType", "카드");
      map.put("point", point);
      if (payDAO.insertPay(map) == 0) {
         return "insert FAIL";
      }

      if (userDAO.addUPoint(uIdx, point) == 0) {
         return "update FAIL";
      }

      return "OK";
   }

}