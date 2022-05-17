package com.hobbycam.lesson.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
	
	@Override
	public List scheduleDate(int lesson_idx) {
		List lists = sqlMap.selectList("selectScheduleDate",lesson_idx);
		return lists;
	}
	
	@Override
	public List scheduleTime(String lessonDate) {
		List lists = sqlMap.selectList("selectScheduleTime",lessonDate);
		return lists;
	}
	
	@Override
	public String teacherEmail(int lesson_idx) {
		String teacherEmail = sqlMap.selectOne("selectTeacherEmail", lesson_idx);
		return teacherEmail;
	}
	
	@Override
	public boolean checkLike(int lesson_idx,int u_idx) {;
		Map map = new HashedMap();
		map.put("u_idx", u_idx);
		map.put("lesson_idx", lesson_idx);
		int result = sqlMap.selectOne("checkLike", map);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public void deleteLike(int u_idx, int lesson_idx) {
		Map map = new HashedMap();
		map.put("u_idx", u_idx);
		map.put("lesson_idx", lesson_idx);
		sqlMap.delete("deleteLike", map);
	}
	
	public void insertLike(int u_idx, int lesson_idx) {
		Map map = new HashedMap();
		map.put("u_idx", u_idx);
		map.put("lesson_idx", lesson_idx);
		sqlMap.insert("insertLike", map);
	}
	
	@Override
	public int lessonScheduleIdx(int lesson_idx) {
		int lessonScIdx = sqlMap.selectOne("selectScIdx", lesson_idx);
		System.out.println("127번줄 : "+lesson_idx);
		System.out.println("128번줄 : "+lessonScIdx);
		return lessonScIdx;
	}
}


