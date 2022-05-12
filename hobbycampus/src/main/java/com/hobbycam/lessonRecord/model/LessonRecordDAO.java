package com.hobbycam.lessonRecord.model;

import java.util.List;

public interface LessonRecordDAO {
	
	public List teacherRecord(int t_idx, int cp, int listSize);
	public int teacherRecordCnt(int t_idx);
}
