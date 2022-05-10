package com.hobbycam.lesson.model;

import java.util.List;

public interface LessonDAO {

	public int lessonInsert(LessonDTO dto);
	
	public List lessonList(String t_name);
	
	public List lessonUpdateForm(int lesson_idx);
}
