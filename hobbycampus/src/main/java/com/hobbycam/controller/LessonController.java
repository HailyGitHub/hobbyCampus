package com.hobbycam.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hobbycam.lesson.model.LessonDAO;
import com.hobbycam.lesson.model.LessonDTO;
import com.hobbycam.lesson.model.LessonLiveDTO;
import com.hobbycam.lesson.model.LessonOfflineDTO;
import com.hobbycam.lesson.model.LessonOnlineDTO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;
import com.hobbycam.teacher.model.TeacherDTO;
import com.hobbycam.upload.ImgUplod;

@Controller
public class LessonController {
	
	@Autowired
	private LessonDAO ldao;
	
	@Autowired
	private LessonRecordDAO lrdao;
	
	@Autowired
	ServletContext servletContext;
	
	
	
	@RequestMapping("/lessonBasicForm.do")
	public ModelAndView lessonBasicForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/lesson/lessonBasicForm");
		return mav;
	}
	
	@RequestMapping(value =  "/lessonBasicForm.do",method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam("thumbnail")MultipartFile thumbnail,LessonDTO dto,
							   @RequestParam("lesson_type")String type,
							   @RequestParam("lesson_subj")String subj){
							  
		
		
		
		int count=ldao.countLessonList();
		int th_count=count+1;
		String thumbnailName = thumbnail.getOriginalFilename();
		String savePaththumbnail = "";
		
		
		if(thumbnailName==null||thumbnailName.equals("")) {
			savePaththumbnail="default";//change
		}else {	
			String fileExtension = thumbnailName.substring(thumbnailName.length()-4, thumbnailName.length());
			String savePathFolder =servletContext.getRealPath("hobbyImg/lesson/"+th_count+"/"); 
			File f=new File(savePathFolder);
			if(!f.exists()) {
				try {
					f.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
		
			ImgUplod iu = new ImgUplod();
			
			savePaththumbnail = iu.copyInto(thumbnail,"thumbnail", savePathFolder, fileExtension);}
		
		dto.setLesson_thumbnail(""+th_count);
		
		ModelAndView mav=new ModelAndView();
		
		ldao.lessonInsert(dto);
		
		String s_th_count=Integer.toString(th_count);
		int l_idx=ldao.SelectLessonIdxByLessonThumbnail(s_th_count);
		mav.addObject("l_idx",l_idx);
		mav.addObject("save",s_th_count);
		
		switch (type) {
		case "온라인":
			
			mav.setViewName("/lesson/onlineLessonForm");break;
		
		case "오프라인":
			mav.setViewName("/lesson/offlineLessonForm");break;
		
		case "라이브":
			mav.setViewName("/lesson/liveLessonForm");break;
		}
		
		return mav;
		
		
	}
	@RequestMapping("/onlineLessonForm.do")
	public ModelAndView onlineLessonForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/lesson/onlineLessonForm");
		return mav;
	}
	
	@RequestMapping(value =  "/onlineLessonForm.do",method = RequestMethod.POST)
	public ModelAndView onlineLessonSubmit(@RequestParam("onlineImg")MultipartFile img,
										   @RequestParam("onlineFile")MultipartFile video,
										   @RequestParam("l_idx")String idx,
										   @RequestParam("save")String save,
										   LessonOnlineDTO ldto) {
		
		String imgName = img.getOriginalFilename();
		String videoName = video.getOriginalFilename();
		String savePathImg = "";
		String savePathVideo = "";
		
		if(imgName==null||imgName.equals("")) {
			savePathImg="default";
		}else {
			String imgExtension = imgName.substring(imgName.length()-4, imgName.length());
			String savePathImgFolder =servletContext.getRealPath("hobbyImg/lesson/"+save+"/img/");
			File f=new File(savePathImgFolder);
			if(!f.exists()) {
				try {
					f.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			ImgUplod iu = new ImgUplod();
			
			savePathImg = iu.copyInto(img,"temp", savePathImgFolder, imgExtension);
			
		}
		
		ldto.setOnline_img(savePathImg);
		
		if(videoName==null||videoName.equals("")) {
			savePathVideo="default";
		}else {
			String videoExtension = videoName.substring(videoName.length()-4, videoName.length());
			String savePathVideoFolder =servletContext.getRealPath("hobbyImg/lesson/"+save+"/video/");
			File f=new File(savePathVideoFolder);
			if(!f.exists()) {
				try {
					f.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			ImgUplod iu = new ImgUplod();
			savePathVideo = iu.copyInto(video,"temp", savePathVideoFolder, videoExtension);
		}
		
		ImgUplod iu = new ImgUplod();
		
		
		ldto.setOnline_file(savePathVideo);
			
		ModelAndView mav=new ModelAndView();
		
		int i_idx=Integer.parseInt(idx);
		
		int result=ldao.onlineLessonInsert(ldto,i_idx);
		String msg=result>0?"강의 등록 성공":"강의 등록 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	
	@RequestMapping("/offlineLessonForm.do")
	public ModelAndView offlineLessonForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/lesson/offlineLessonForm");
		return mav;
	}
	
	@RequestMapping(value = "/offlineLessonForm.do",method = RequestMethod.POST)
	public ModelAndView offlineLessonSubmit(@RequestParam("offlineFolder")MultipartFile img,
											@RequestParam("l_idx")String idx,
											@RequestParam("save")String save,
											LessonOfflineDTO ldto) {
		
		ModelAndView mav=new ModelAndView();
		String imgName = img.getOriginalFilename();
		String savePathImg = "";
		
		if(imgName==null||imgName.equals("")) {
			savePathImg="default";
		}else {
			String imgExtension = imgName.substring(imgName.length()-4, imgName.length());
			String savePathImgFolder =servletContext.getRealPath("hobbyImg/lesson/"+save+"/img/");
			File f=new File(savePathImgFolder);
			if(!f.exists()) {
				try {
					f.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			ImgUplod iu = new ImgUplod();
			
			savePathImg = iu.copyInto(img,"temp", savePathImgFolder, imgExtension);
			
		}
		
		ldto.setOffline_folder(savePathImg);
		int i_idx=Integer.parseInt(idx);
		int result=ldao.offlineLessonInsert(ldto,i_idx);
	   
		String msg=result>0?"강의 등록 성공":"강의 등록 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
		
	}
	
	@RequestMapping("/liveLessonForm.do")
	public ModelAndView liveLessonForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/lesson/liveLessonForm");
		return mav;
	}
	
	@RequestMapping(value = "/liveLessonForm.do",method = RequestMethod.POST)
	public ModelAndView liveLessonSubmit(@RequestParam("liveFolder")MultipartFile img,
										@RequestParam("l_idx")String idx,
										@RequestParam("save")String save,
										LessonLiveDTO ldto) {
		
		ModelAndView mav=new ModelAndView();
		
		String imgName = img.getOriginalFilename();
		String savePathImg = "";
		
		if(imgName==null||imgName.equals("")) {
			savePathImg="default";
		}else {
			String imgExtension = imgName.substring(imgName.length()-4, imgName.length());
			String savePathImgFolder =servletContext.getRealPath("hobbyImg/lesson/"+save+"/img/");
			File f=new File(savePathImgFolder);
			if(!f.exists()) {
				try {
					f.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			ImgUplod iu = new ImgUplod();
			
			savePathImg = iu.copyInto(img,"temp", savePathImgFolder, imgExtension);
			
		}
		
		ldto.setLive_folder(savePathImg);
		int i_idx=Integer.parseInt(idx);
		
		int result=ldao.liveLessonInsert(ldto,i_idx);
		String msg=result>0?"강의 등록 성공":"강의 등록 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	
	
	@RequestMapping("/lessonList.do")
	public ModelAndView lessonList() {
		ModelAndView mav=new ModelAndView();
		
		
		
		List lists=ldao.lessonList();
		List cate1=ldao.cate1List();
		List cate2=ldao.cate2List(1);
		mav.addObject("cate1",cate1);
		mav.addObject("lists",lists);
		mav.addObject("cate2",cate2);
		mav.setViewName("/lesson/lessonList");
		return mav;
	}
	
	//lesson List view
	@RequestMapping("/teacherLessonList.do")
	public ModelAndView teacherLessonList(String t_name) {
		
		ModelAndView mav=new ModelAndView();
		
		List lists=ldao.teacherLessonList(t_name);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/teacherLessonList");
		return mav;
		
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.GET)
	public ModelAndView lessonUpdateForm(String lesson_idx) {
		
		
		ModelAndView mav=new ModelAndView();
		
		List lists=ldao.lessonUpdateForm(lesson_idx);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.POST)
	public ModelAndView lessonUpdateSubmit(LessonDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=ldao.lessonUpdateSubmit(dto);
		String msg=result>0?"강의 수정 성공":"강의 수정 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	@RequestMapping("/lessonReqList.do")
	public ModelAndView lessonReqList(int t_idx) {
		ModelAndView mav=new ModelAndView();
		List lists=lrdao.lessonReqList(t_idx);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonReqList");
		return mav;
	}
	
	@RequestMapping("/lessonReqAccept.do")
	public ModelAndView lessonReqAccept(@RequestParam("lesson_record_idx")int idx) {
		
		int result=ldao.lessonReqAccept(idx);
		String msg =result>0?"수락 되었습니다.":"";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	@RequestMapping("/lessonReqCancel.do")
	public ModelAndView lessonReqCancel(@RequestParam("lesson_record_idx")int idx) {
		
		int result=ldao.lessonReqCancel(idx);
		String msg =result>0?"취소 되었습니다.":"";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	
	
	@RequestMapping("/lessonCont.do")
	public ModelAndView lessonCont(int lesson_idx) {
		ModelAndView mav=new ModelAndView();
		
		String type=ldao.lessonContIndentify(lesson_idx);
		
		List lists=null;
		
		List review=ldao.lessonReview(lesson_idx);
		int like=ldao.lessonLike(lesson_idx);
		
		switch (type) {
		case "온라인":
			lists=ldao.lessonOnlineCont(lesson_idx);
			break;
		case "오프라인":
			lists=ldao.lessonOfflineCont(lesson_idx);
			break;
		case "라이브":
			lists=ldao.lessonLiveCont(lesson_idx);
			break;
		}
		mav.addObject("like",like);
		mav.addObject("review",review);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonCont");
		return mav;
		
	}

}
