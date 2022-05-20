package com.hobbycam.lesson.model;

import java.util.List;

public interface LessonDAO {

	public int lessonInsert(LessonDTO dto);
	
	public int onlineLessonInsert(LessonOnlineDTO dto,int idx);
	
	public int offlineLessonInsert(LessonOfflineDTO dto,int idx);
	
	public int liveLessonInsert(LessonLiveDTO dto,int idx);
	
	public List teacherLessonList(String t_name);
	
	public List lessonUpdateForm(String lesson_idx);
	
	public int lessonUpdateSubmit(LessonDTO dto);
	
	public List lessonOnlineCont(int lesson_idx);
	
	public List lessonOfflineCont(int lesson_idx);
	
	public List lessonLiveCont(int lesson_idx);
	
	public String lessonContIndentify(int lesson_idx);
	
	public int lessonLike(int lesson_idx);
	
	public List lessonReview(int lesson_idx);
	
	public int lessonTotalCnt(String lesson_type); //Add
	
	public int lessonTotalCntByCateTwo(String lesson_type, int cate2_idx); //Add
	
	public int lessonTotalCntByCateOne(int cate1_idx); //ADD
	
	public int lessonTotalCntByKeyword(String lesson_type, String keyword); //ADD
	
	public int lessonTotalCntByTeacherIdx(int t_idx); //ADD
	
	public List lessonList(int cp, int listSize, String lesson_type); // Fix 
	
	public List lessonListByCateTwo(int cp, int listSize, String lesson_type, int cate2_idx); //ADD
	
	public List lessonListByCateOne(int cp, int listSize, int cate1_idx); //ADD
	
	public List lessonListByKeyword(int cp, int listSize, String lesson_type, String keyword); //ADD
	
	public List lessonListByTeacherIdx(int cp, int listSize, int t_idx); //ADD
	
	public List cate1List();
	
	public List cate2List(int cate1_idx);
	
	public LessonDTO LessonListByTidx(int t_idx);
	
	public int countLessonList();
	
	public int SelectLessonIdxByLessonThumbnail(String th_count);
	
	public int lessonReqAccept(int idx);
	
	public int lessonReqCancel(int idx);

	public List scheduleDate(int lesson_idx);
	
	public List scheduleTime(String lessonDate);
	
	public String teacherEmail(int lesson_idx);
	
	public boolean checkLike(int lesson_idx,int u_idx);
	
	public void deleteLike(int u_idx, int lesson_idx);
	
	public void insertLike(int u_idx, int lesson_idx);
	
	public int lessonScheduleIdx(int lesson_idx);
	
	public String getAddr(int lesson_idx);
	
	public String getThumbnail(int lesson_idx);

	
}
