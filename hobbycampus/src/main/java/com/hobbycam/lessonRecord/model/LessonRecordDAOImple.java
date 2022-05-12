package com.hobbycam.lessonRecord.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LessonRecordDAOImple implements LessonRecordDAO {

	SqlSessionTemplate sqlMap;
	
	
	
	public LessonRecordDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	/**Get list if losson_record using by t_idx*/
	@Override
	public List teacherRecord(int t_idx) {
		List lists = sqlMap.selectList("selectLessonRecord", t_idx);
		return lists;
	}
	
	//Get list lesson request by teacher my page
	@Override
	public List lessonReqList(int t_idx) {
		List lists= sqlMap.selectList("SelectLessonReq",t_idx);
		return lists;
	}
}
