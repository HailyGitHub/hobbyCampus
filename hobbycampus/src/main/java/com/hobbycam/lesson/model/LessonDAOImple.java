package com.hobbycam.lesson.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LessonDAOImple implements LessonDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public LessonDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int lessonInsert(LessonDTO dto) {
		int count=sqlMap.insert("insertLesson",dto);
		return count;
	}
	
	@Override
	public List lessonList(String t_name) {
		List lists=sqlMap.selectList("selectLesson",t_name);
		return lists;
	}
	
	@Override
	public List lessonUpdateForm(int lesson_idx) {
		// TODO Auto-generated method stub
		return null;
	}
}
