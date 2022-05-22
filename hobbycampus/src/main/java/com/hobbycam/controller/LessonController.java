package com.hobbycam.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.hobbycam.email.HobbyEmailGoogle;
import com.hobbycam.lesson.model.LessonDAO;
import com.hobbycam.lesson.model.LessonDTO;
import com.hobbycam.lesson.model.LessonLiveDTO;
import com.hobbycam.lesson.model.LessonOfflineDTO;
import com.hobbycam.lesson.model.LessonOnlineDTO;
import com.hobbycam.lessonRecord.model.LessonRecordDAO;
import com.hobbycam.page.PageModule;
import com.hobbycam.teacher.model.TeacherDTO;
import com.hobbycam.upload.ImgUplod;
import com.hobbycam.upload.getLessonImg;

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
	
	@RequestMapping("/getLessonReq.do")
	public ModelAndView lessonReqCnt(@RequestParam("t_idx")int t_idx) {
		
		ModelAndView mav=new ModelAndView();
		int reqCnt = lrdao.lessonReqCnt(t_idx);
		
		mav.addObject("reqCnt", reqCnt);
		mav.setViewName("hobbyJson");
		return mav;
		
	}
	
	@RequestMapping(value =  "/lessonBasicForm.do",method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam("thumbnail")MultipartFile thumbnail,LessonDTO dto,
							   @RequestParam("lesson_type")String type,
							   @RequestParam("lesson_subj")String subj,
							   HttpServletRequest req){
							  
		
		
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
		HttpSession session=req.getSession();
		int idx=(int)session.getAttribute("t_idx");
		dto.setT_idx(idx);
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
		mav.addObject("gopage","mylessonList.do");
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
		mav.addObject("gopage","mylessonList.do");
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
		mav.addObject("gopage","mylessonList.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	
	@RequestMapping("/lessonList.do")
	public ModelAndView lessonList(
			@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "lesson_type", defaultValue = "라이브") String lesson_type,
			@RequestParam(value = "cate2_idx", defaultValue = "0") int cate2_idx) {
		
		int listSize = 12;
		int pageSize = 10;
		String pageStr = "";
		List lists = null;
		
		if(cate2_idx==0) { // Without cate2_idx
			int totalCnt = ldao.lessonTotalCnt(lesson_type); // Count By lesson_type
			String addParam = "&lesson_type=" + lesson_type;
			pageStr = com.hobbycam.page.BootstrapPageModule2.pageMake("lessonList.do", totalCnt, listSize, pageSize, cp, addParam); //Get pagination code
			lists = ldao.lessonList(cp, listSize, lesson_type);
		}else if(cate2_idx>0) {
			int totalCnt = ldao.lessonTotalCntByCateTwo(lesson_type, cate2_idx);
			String addParam = "&lesson_type="+lesson_type+"&cate2_idx="+cate2_idx;
			pageStr = com.hobbycam.page.BootstrapPageModule2.pageMake("lessonList.do", totalCnt, listSize, pageSize, cp, addParam); //Get pagination code
			lists = ldao.lessonListByCateTwo(cp, listSize, lesson_type, cate2_idx);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.addObject("type",lesson_type);
		mav.setViewName("/lesson/lessonList");
		return mav;
	}
	
	
	@RequestMapping("/findLessonByKeyword.do")
	public ModelAndView findLessonByKeyword(String lesson_type, String keyword,
			@RequestParam(value = "cp", defaultValue = "1") int cp) {
		
		int totalCnt = ldao.lessonTotalCntByKeyword(lesson_type, keyword);
		int listSize = 12;
		int pageSize = 10;
		
		String addParam = "&lesson_type=" + lesson_type + "&keyword=" + keyword;
		String pageStr = com.hobbycam.page.BootstrapPageModule2.pageMake("findLessonByKeyword.do", totalCnt, listSize, pageSize, cp, addParam); //Get pagination code
		List lists = ldao.lessonListByKeyword(cp, listSize, lesson_type, keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.addObject("type",lesson_type);
		mav.setViewName("/lesson/lessonList");
		return mav;
	}
	
	
	@RequestMapping("/lessonListByCateOne.do")
	public ModelAndView lessonListByCateOne(
			@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "cate1_idx", defaultValue = "0") int cate1_idx) {
		
		int totalCnt = ldao.lessonTotalCntByCateOne(cate1_idx);
		int listSize = 12;
		int pageSize = 10;
		
		String addParam = "&cate1_idx=" + cate1_idx;
		String pageStr = com.hobbycam.page.BootstrapPageModule2.pageMake("lessonListByCateOne.do", totalCnt, listSize, pageSize, cp, addParam);
		List lists = ldao.lessonListByCateOne(cp, listSize, cate1_idx);

		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonList");
		return mav;
	}
	
	@RequestMapping("/lessonListByTeacherIdx.do")
	public ModelAndView lessonListByTeacherIdx(
			@RequestParam(value = "cp", defaultValue = "1") int cp, int t_idx) {
		
		int totalCnt = ldao.lessonTotalCntByTeacherIdx(t_idx); //Get Total lesson List By t_idx
		int listSize = 12;
		int pageSize = 10;
		
		String addParam = "&t_idx=" + t_idx;
		String pageStr = com.hobbycam.page.BootstrapPageModule2.pageMake("lessonListByTeacherIdx.do", totalCnt, listSize, pageSize, cp, addParam);
		List lists = ldao.lessonListByTeacherIdx(cp, listSize, t_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/lessonList");
		return mav;
	}
	
	//lesson List view
	@RequestMapping("/teacherLessonList.do")
	public ModelAndView teacherLessonList(@RequestParam(value = "cp", defaultValue = "1") int cp,
										  HttpServletRequest req) {
		
		
		HttpSession session=req.getSession();
		int t_idx=(int)session.getAttribute("t_idx");
		
		int totalCnt=ldao.selectTeacherLessonCount(t_idx);
		int listSize = 6;
		int pageSize = 5;
		String pageStr = "";
		
		pageStr=com.hobbycam.page.BootstrapPageModule.pageMake("teacherLessonList.do", totalCnt, listSize, pageSize, cp);
		
		List lists=ldao.teacherLessonList(cp,listSize,t_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		mav.setViewName("/lesson/teacherLessonList");
		return mav;
		
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.GET)
	public ModelAndView lessonUpdateForm(int lesson_idx) {
		
		ModelAndView mav=new ModelAndView();
		
		LessonDTO dto=ldao.lessonUpdateForm(lesson_idx);
		String thumbnail=dto.getLesson_thumbnail();
		mav.addObject("dto",dto);
		mav.setViewName("/lesson/lessonUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/lessonUpdate.do",method = RequestMethod.POST)
	public ModelAndView lessonUpdateSubmit(@RequestParam("thumbnail")MultipartFile thumbnail,LessonDTO dto,
									       @RequestParam("lesson_type")String type,
									       @RequestParam("lesson_subj")String subj,
										   HttpServletRequest req){
		
		
		
		
		ModelAndView mav=new ModelAndView();
		
		int result=ldao.lessonUpdateSubmit(dto);
		String msg=result>0?"강의 수정 성공":"강의 수정 실패";
		mav.addObject("msg",msg);
		mav.addObject("gopage","mylessonList.do");
		mav.setViewName("/teacher/msg");
		return mav;
	}
	
	
	
	@RequestMapping("/lessonReqList.do")
	public ModelAndView lessonReqList(HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		int t_idx=(int)session.getAttribute("t_idx");
		
		
		
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
	

	/**get lesson Content by lesson_idx*/
	@RequestMapping("/lessonCont.do")
	public ModelAndView lessonCont(int lesson_idx, HttpServletRequest req) {

		HttpSession session=req.getSession();
		int u_idx=0;
		
		if(session.getAttribute("u_idx")==null||session.getAttribute("u_idx").equals("")) {
			u_idx=0;
		}else {
			u_idx=(int)session.getAttribute("u_idx");
		}
	    
		String type=ldao.lessonContIndentify(lesson_idx);
		ModelAndView mav=new ModelAndView();
		
		//get review list
		List lists=null;
		List review=ldao.lessonReview(lesson_idx);
		
		//get like cnt
		int like=ldao.lessonLike(lesson_idx);
		
		//get t_email
		String tEmail = ldao.teacherEmail(lesson_idx);
		
		//whether the like button
		boolean likeCheck = ldao.checkLike(lesson_idx, u_idx);
		String setViewName = "";
		
		int lessonScIdx = 0;
		List scheduleDate = null;
		
		//get thumbnail column by lesson_idx
		String lesson_thumbnail = ldao.getThumbnail(lesson_idx);
		
		//get lesson imges
		getLessonImg gi = new getLessonImg();
		List imgLists = gi.getImages(lesson_thumbnail, servletContext); 	
		
		//get content 
		switch (type) {
		case "온라인":
			lists=ldao.lessonOnlineCont(lesson_idx);
			
			//get lesson date
			setViewName="lesson/lessonCont_online";
			
			
			break;
		case "오프라인":
			lists=ldao.lessonOfflineCont(lesson_idx);
			
			//get map address
			String mapAddr = ldao.getAddr(lesson_idx);
			mav.addObject("map", mapAddr);
			
			//get lesson date
			scheduleDate = ldao.scheduleDate(lesson_idx);
			mav.addObject("scheduleDate",scheduleDate);
			setViewName="lesson/lessonCont_offline";
			
			
			
			break;
		case "라이브":
			lists=ldao.lessonLiveCont(lesson_idx);
			//get lesson date
			scheduleDate = ldao.scheduleDate(lesson_idx);
			mav.addObject("scheduleDate",scheduleDate);
			setViewName="lesson/lessonCont_live";
			break;
		}
		mav.addObject("lessonType", type);
		mav.addObject("thumbnail", lesson_thumbnail);
		mav.addObject("imgLists", imgLists);
		mav.addObject("like",like);
		mav.addObject("review",review);
		mav.addObject("lists",lists);
		mav.addObject("tEmail",tEmail);		
		mav.addObject("likeCheck",likeCheck);
		mav.addObject("u_idx",u_idx);
		mav.addObject("lesson_idx",lesson_idx);
		mav.setViewName(setViewName);
		return mav;
		
	}



	
	/**send email to teacher*/
	@RequestMapping("/sendEmail.do")
	public ModelAndView sendEmail(@RequestParam("lesson_idx")String lesson_idx , @RequestParam("teacherEmail")String tEmail, @RequestParam("userMail")String uEmail,@RequestParam("mailSubject")String subject, @RequestParam("mailContent")String content ) {
		ModelAndView mav=new ModelAndView();
		HobbyEmailGoogle heg = new HobbyEmailGoogle();
		boolean result = false;
		subject = "<br>[hobbycampus/수업 문의]"+subject;
		content = "<br>[답변 받을 학생 이메일]  "+uEmail+"<br>[문의 내용]"+content;
		try {
			heg.emailSend(tEmail, subject, content);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		
		mav.addObject("result", result);
		mav.addObject("lesson_idx", lesson_idx);
		mav.setViewName("lesson/lessonContEmailOk");
		return mav;
		
	}
	
	/**get like count by lesson_idx*/
	@RequestMapping("/likeBtnCk.do")
	public ModelAndView getLikeCnt(int lesson_idx,  String btState, HttpServletRequest req) {
		
		HttpSession session=req.getSession();
	    int u_idx=(int)session.getAttribute("u_idx");
	      
		if(  btState=="false"||btState.equals("false")) {
			ldao.deleteLike(lesson_idx, u_idx);
		}else {
			ldao.insertLike(u_idx, lesson_idx);
		}
		int likeCnt=ldao.lessonLike(lesson_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("likeCnt",likeCnt);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	/**get lessonScheduleIdx by lesson_idx*/
	@RequestMapping("/scIdx.do")
	public ModelAndView getLessonScheduleIdx(int lesson_idx) {
		int lessonScheduleIdx = ldao.lessonScheduleIdx(lesson_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("lscIdx", lessonScheduleIdx);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	/**get lesson time by specific lesson date*/
	@RequestMapping("/lessonTime.do")
	public ModelAndView getLessonTime(String lessonDate) {
		List scheduleTime = ldao.scheduleTime(lessonDate);
		ModelAndView mav=new ModelAndView();
		mav.addObject("scheduleTime",scheduleTime);
		mav.setViewName("hobbyJson");
		return mav;
	}
	
	

}