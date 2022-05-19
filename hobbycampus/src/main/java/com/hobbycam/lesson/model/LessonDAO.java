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
	
	public List lessonList();
	
	public List cate1List();
	
	public List cate2List(int cate1_idx);
	
	public LessonDTO LessonListByTidx(int t_idx);
	
	public int countLessonList();
	
	public int SelectLessonIdxByLessonThumbnail(String th_count);
	
	public int lessonReqAccept(int idx);
	
	public int lessonReqCancel(int idx);
	
}
