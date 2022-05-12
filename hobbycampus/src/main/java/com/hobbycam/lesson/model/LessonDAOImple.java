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
	public List lessonUpdateForm(String lesson_idx) {
		List lists=sqlMap.selectList("selectUpdateLesson",lesson_idx);
		return lists;
	}
	
	@Override
	public int lessonUpdateSubmit(LessonDTO dto) {
		int count=sqlMap.update("updateLesson",dto);
		return count;
	}
	//명령 도표 작성 바람
	@Override
	public List lessonOnlineCont(int lesson_idx) {
		List lists=sqlMap.selectList("SelectOnlineLessonCont",lesson_idx);
		return lists;
	}
	
	@Override
	public List lessonOfflineCont(int lesson_idx) {
		List lists=sqlMap.selectList("SelectOfflineLessonCont",lesson_idx);
		return lists;
	}
	
	@Override
	public List lessonLiveCont(int lesson_idx) {
		List lists=sqlMap.selectList("SelectLiveLessonCont",lesson_idx);
		return lists;
	}
	
	@Override
	public String lessonContIndentify(int lesson_idx) {
		String type=sqlMap.selectOne("selectLessonType",lesson_idx);
		return type;
	}
	
	@Override
	public int lessonLike(int lesson_idx) {
		int like=sqlMap.selectOne("SelectLessonLikeCount",lesson_idx);
		return like;
	}
	
	@Override
	public List lessonReview(int lesson_idx) {
		List lists=sqlMap.selectList("SelectLessonReview",lesson_idx);
		return lists;
	}
}
