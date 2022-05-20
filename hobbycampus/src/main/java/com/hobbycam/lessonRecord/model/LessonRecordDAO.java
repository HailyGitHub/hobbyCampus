package com.hobbycam.lessonRecord.model;

import java.util.List;
import java.util.Map;

import com.hobbycam.VO.LessonRecordVO;

public interface LessonRecordDAO {

	public List lessonReqList(int t_idx);

	public List teacherRecord(int t_idx, int cp, int listSize);
	
	public int teacherRecordCnt(int t_idx);
	
	int insert(Map<String, Object> map);

	List<LessonRecordVO> getLessonRecords(int uIdx, String lessonRecordState);

	public String getLessonTime(int lesson_schedule_idx);

}
