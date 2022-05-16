package com.hobbycam.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.category.model.Cate1DTO;
import com.hobbycam.category.model.Cate2DTO;
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
		
		List oneList = totalDao.getCateOne(); //GET Category One List
		List oneRate = new ArrayList(); //GET Category One Rate
		for(int i=0; i<oneList.size(); i++) {
			Cate1DTO dto = (Cate1DTO) oneList.get(i);
			int count = totalDao.getCateOneRate(dto.getCate1_idx());
			oneRate.add(count);
		}
		
		List twoList = totalDao.getCateTwo(); //GET Category Two List
		List twoRate = new ArrayList(); //GET Category Two Rate
		for(int i=0; i<twoList.size(); i++) {
			Cate2DTO dto = (Cate2DTO) twoList.get(i);
			int count = totalDao.getCateTwoRate(dto.getCate2_idx(), first, last);
			twoRate.add(count);
		}
		
		TotalMonthDTO total = totalDao.getSalesTotal(first, last); //GET sales total
		TotalMonthDTO refund = totalDao.getSalesRefund(first, last); //GET sales total
		TotalMonthDTO exchange = totalDao.getSalesExchange(first, last); //GET sales total
		
		/*
		List test = totalDao.getTest(first, last);
		for(int i=0; i<test.size(); i++) {
			System.out.println(test.get(i));
		}
		*/
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ug", ug); 
		mav.addObject("tg", tg); 
		mav.addObject("um", um); 
		mav.addObject("tm", tm);
		mav.addObject("oneList", oneList);
		mav.addObject("oneRate", oneRate);
		mav.addObject("twoList", twoList);
		mav.addObject("twoRate", twoRate);
		mav.addObject("total", total); 
		mav.addObject("refund", refund); 
		mav.addObject("exchange", exchange); 
		mav.setViewName("total/totalList");
		return mav;
	}

}
