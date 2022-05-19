package com.hobbycam.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.web.bind.annotation.RequestParam;

import com.hobbycam.category.model.*;
import com.hobbycam.upload.*;

@Controller
public class CategoryController {
	
	@Autowired ServletContext servletContext;

	@Autowired
	private CategoryDAO categoryDao;
	
	public static final String CATEGORY_ONE_PATH = "/hobbyImg/category1/"; 
	public static final String CATEGORY_TWO_PATH = "/hobbyImg/category2/"; 
	
	
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
	

	@RequestMapping("/categoryTwoList.do")
	public ModelAndView categoryTwoList(int cate1_idx) {
		
		List dtos = categoryDao.getCateTwoList(cate1_idx); //GET cateTwo List By IDX
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dtos", dtos);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/uploadCateOne.do")
	public ModelAndView uploadCateOne(String cate1_name, 
			@RequestParam(value = "cate1Upload") MultipartFile upload) {
		
		String fileName = upload.getOriginalFilename();
		String extension =  fileName.substring(fileName.length()-4, fileName.length()); // GET File Extension
		String savepath = servletContext.getRealPath(CATEGORY_ONE_PATH); //GET category1 File Path

		int nextIdx = categoryDao.getCateOneMaxIdx(); //GET Next cate1_idx
		
		//Save File to savePath
		UploadModule loadModule = new UploadModuleImg();
		boolean result = loadModule.copyInto(upload, ""+nextIdx, savepath, extension);
		
		String msg = "이미지 업로드에 실패하였습니다."; //File Upload fail
		if(result==true) { //File Upload success -> Save DB
			int count = categoryDao.addCateOne(nextIdx, cate1_name, nextIdx+extension);
			msg = count>0?  "등록 성공하였습니다." : "등록 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("category/categoryResult");
		return mav;
	}
	
	@RequestMapping("uploadCateTwo.do")
	public ModelAndView uploadCateTwo(int cate1_idx, String cate2_name,
			@RequestParam(value = "cateTwoUpload") MultipartFile upload) {
		
		String fileName = upload.getOriginalFilename();
		String extension =  fileName.substring(fileName.length()-4, fileName.length()); // GET File Extension
		String savepath = servletContext.getRealPath(CATEGORY_TWO_PATH); //GET category2 File Path
		
		int nextIdx = categoryDao.getCateTwoMaxIdx(); //GET Next cate2_idx
		
		//Save File to savePath
		UploadModule loadModule = new UploadModuleImg();
		boolean result = loadModule.copyInto(upload, ""+nextIdx, savepath, extension);
		
		String msg = "이미지 업로드에 실패하였습니다."; //File Upload fail
		if(result==true) { //File Upload success -> Save DB
			int count = categoryDao.addCateTwo(nextIdx, cate1_idx, cate2_name, nextIdx+extension);
			msg = count>0?  "등록 성공하였습니다." : "등록 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("category/categoryResult");
		return mav;
	}
	
	@RequestMapping("/editCateOne.do")
	public ModelAndView editCateOne(int cate1_idx, String cate1_name, String cate1_img,
			@RequestParam(value = "cateOneUpload") MultipartFile upload) {
		
		String fileName = upload.getOriginalFilename();
		String extension =  fileName.substring(fileName.length()-4, fileName.length()); // GET File Extension
		String savepath = servletContext.getRealPath(CATEGORY_ONE_PATH); //GET category1 File Path
		
		UploadModule loadModule = new UploadModuleImg();
		boolean deleteResult = loadModule.deleteImg(savepath, cate1_img); // Delete old file
		boolean uploadResult = loadModule.copyInto(upload, ""+cate1_idx, savepath, extension); // Upload new file
		
		String msg = "카테고리 수정에 실패하였습니다.";
		if(deleteResult==true&&uploadResult==true) { //Update Category One DB
			int count = categoryDao.editCateOne(cate1_idx, cate1_name, ""+cate1_idx+extension);
			msg = count>0?  "수정 성공하였습니다." : "수정 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("category/categoryResult");
		return mav;
	}

	@RequestMapping("/editCateTwo.do")
	public ModelAndView editCateTwo(int cate2_idx, String cate2_name, String cate2_img,
			@RequestParam(value = "cateTwoUpload") MultipartFile upload) {
		
		String fileName = upload.getOriginalFilename();
		String extension =  fileName.substring(fileName.length()-4, fileName.length()); // GET File Extension
		String savepath = servletContext.getRealPath(CATEGORY_TWO_PATH); //GET category2 File Path
		
		UploadModule loadModule = new UploadModuleImg();
		//System.out.println(savepath+cate2_img);
		boolean deleteResult = loadModule.deleteImg(savepath, cate2_img); // Delete old file
		boolean uploadResult = loadModule.copyInto(upload, ""+cate2_idx, savepath, extension); // Upload new file
		
		String msg = "카테고리 수정에 실패하였습니다.";
		if(deleteResult==true&&uploadResult==true) { //Update Category Two DB
			int count = categoryDao.editCateTwo(cate2_idx, cate2_name, ""+cate2_idx+extension);
			msg = count>0?  "수정 성공하였습니다." : "수정 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("category/categoryResult");
		return mav;
		
	}
	
	@RequestMapping("/sideBarCateOne.do")
	public ModelAndView sideBarCateOne() {
		
		List cateOne = categoryDao.getCateOneList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cateOne", cateOne);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/sideBarCateTwo.do")
	public ModelAndView sideBarCateTwo(int cate1_idx) {
		
		List cateTwo = categoryDao.getCateTwoList(cate1_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cateTwo", cateTwo);
		mav.setViewName("hobbyJson");

		return mav;
	}
	
	
}
