package com.hobbycam.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.category.model.*;
import com.hobbycam.upload.*;


@Controller
public class CategoryController {
	
	@Autowired ServletContext servletContext;

	@Autowired
	private CategoryDAO categoryDao;
	
	@RequestMapping("/categoryList.do")
	public ModelAndView categoryList() {
		List lists = categoryDao.getCateOneList(); //GET Cate1 List
		int size = lists.size(); //GET List's size
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("size", size);
		mav.setViewName("category/categoryList");
		return mav;
	}
	
	@RequestMapping("/uploadCate1.do")
	public ModelAndView uploadCate1(String cate1_name, 
			@RequestParam(value = "cate1Upload") MultipartFile upload) {
		
		String fileName = upload.getOriginalFilename();
		String extension =  fileName.substring(fileName.length()-4, fileName.length()); // GET File Extension
		String savepath = servletContext.getRealPath("/hobbyImg/category1/"); //GET category1 File Path
		//System.out.println(savepath);
		String nextIdx = "" + (categoryDao.getCateOneMaxIdx() + 1); //GET Next cate1_idx
		
		//Save File to savePath
		UploadModule loadModule = new UploadModuleImg();
		boolean result = loadModule.copyInto(upload, nextIdx, savepath, extension);
		
		String msg = "이미지 업로드에 실패하였습니다."; //File Upload fail
		if(result==true) { //File Upload success -> Save DB
			int count = categoryDao.setCateOneInfo(cate1_name, nextIdx+extension);
			msg = count>0?  "등록 성공하였습니다." : "등록 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("category/categoryResult");
		return mav;
	}
	
	@RequestMapping("/categoryTwoList.do")
	public ModelAndView categoryTwoList(int cate1_idx) {
		
		List dtos = categoryDao.getCateTwoList(cate1_idx); //GET cateTwo List By IDX
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dtos", dtos);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
}
