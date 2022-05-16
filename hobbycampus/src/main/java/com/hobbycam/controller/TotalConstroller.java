package com.hobbycam.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.total.model.*;

@Controller
public class TotalConstroller {
	
	@Autowired
	private TotalDAO totalDao;
	
	@RequestMapping("totalList.do")
	public ModelAndView totalList() {
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		String first = year + "0101"; //this year + 0101 (20220101)
		String last = year + "1231"; //this year + 1231 (20221231)
		
		TotalGenderDTO ug = totalDao.getUserGenderCnt(); //GET user gender count
		TotalGenderDTO tg = totalDao.getTeacherGenderCnt(); //GET teacher gender count
		
		TotalMonthDTO um = totalDao.getUserSignUPCnt(first, last); //GET user sign-up count group by month
		TotalMonthDTO tm = totalDao.getTeacherSignUPCnt(first, last); //GET teacher sign-up count group by month
		

		ModelAndView mav = new ModelAndView();
		mav.addObject("ug", ug); //User Gender count
		mav.addObject("tg", tg); //Teacher Gender count
		mav.addObject("um", um); //User sign-up count group by Month
		mav.addObject("tm", tm); //Teacher sign-up count group by Month
		mav.setViewName("total/totalList");
		return mav;
	}

}
