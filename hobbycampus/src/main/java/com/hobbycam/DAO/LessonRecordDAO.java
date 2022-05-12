package com.hobbycam.DAO;

import java.util.List;
import java.util.Map;

import com.hobbycam.VO.LessonRecordVO;

public interface LessonRecordDAO {
	int insert(Map<String, Object> map);
	
	List<LessonRecordVO> getLessonRecords(int uIdx, String lessonRecordState);

}
