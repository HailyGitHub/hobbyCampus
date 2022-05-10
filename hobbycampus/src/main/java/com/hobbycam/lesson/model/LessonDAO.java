package com.hobbycam.lesson.model;

import java.util.List;

public interface LessonDAO {

	public int lessonInsert(LessonDTO dto);
	
	public List lessonList(String t_name);
	
	public List lessonUpdateForm(String lesson_idx);
	
	public int lessonUpdateSubmit(LessonDTO dto);
	
	public List lessonReqList();
}
