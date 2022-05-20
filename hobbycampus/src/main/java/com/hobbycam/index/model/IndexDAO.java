package com.hobbycam.index.model;

import java.util.*;

public interface IndexDAO {
	
	public List getCateOneList();
	public List getCateTwoList();
	public int getTeacherCnt();
	public int getUserCnt();
	public int getLessonCnt();
	public int getCategoryCnt();
	public List getLikeTeacher();
	public List getLikeLesson();

}
