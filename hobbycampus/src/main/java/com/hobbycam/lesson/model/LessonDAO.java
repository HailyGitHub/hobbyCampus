package com.hobbycam.lesson.model;

import java.util.List;

public interface LessonDAO {

	public int lessonInsert(LessonDTO dto);
	
	public List lessonList(String t_name);
	
	public List lessonUpdateForm(String lesson_idx);
	
	public int lessonUpdateSubmit(LessonDTO dto);
	
	public List lessonOnlineCont(int lesson_idx);
	
	public List lessonOfflineCont(int lesson_idx);
	
	public List lessonLiveCont(int lesson_idx);
	
	public String lessonContIndentify(int lesson_idx);
	
	public int lessonLike(int lesson_idx);
	
	public List lessonReview(int lesson_idx);
	
	public List scheduleDate(int lesson_idx);
	
	public List scheduleTime(String lessonDate);
	
	public String teacherEmail(int lesson_idx);
	
	public boolean checkLike(int lesson_idx,int u_idx);
	
	public void deleteLike(int u_idx, int lesson_idx);
	
	public void insertLike(int u_idx, int lesson_idx);
	
	public int lessonScheduleIdx(int lesson_idx);
	
	public String getAddr(int lesson_idx);
	
}
