package com.hobbycam.lessonRecord.model;

import java.util.List;

public interface LessonRecordDAO {
	
	public List teacherRecord(int t_idx);
	
	public List lessonReqList(int t_idx);
}
