package com.hobbycam.lesson.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int onlineLessonInsert(LessonOnlineDTO dto,int idx) {
		
		Map map=new HashMap();
		map.put("dto",dto );
		map.put("idx",idx);
		int count=sqlMap.insert("insertOnlineLesson",map);
		return count;
	}
	
	@Override
	public int offlineLessonInsert(LessonOfflineDTO dto,int idx) {
		Map map=new HashMap();
		map.put("dto", dto);
		map.put("idx", idx);
		int count=sqlMap.insert("insertOfflineLesson",map);
		return count;
	}
	
	@Override
	public int liveLessonInsert(LessonLiveDTO dto,int idx) {
		Map map=new HashMap();
		map.put("dto", dto);
		map.put("idx", idx);
		int count=sqlMap.insert("insertLiveLesson",map);
		return count;
	}
	
	@Override
	public List teacherLessonList(String t_name) {
		List lists=sqlMap.selectList("selectTeacherLesson",t_name);
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
	
	@Override
	public List lessonList() {
		List lists=sqlMap.selectList("selectLessonList");
		return lists;
	}
	
	@Override
	public List cate1List() {
		List lists=sqlMap.selectList("selectCate1List");
		return lists;
	}
	
	@Override
	public List cate2List(int cate1_idx) {
		List lists=sqlMap.selectList("selectCate2List",cate1_idx);
		return lists;
	}
	
	@Override
	public LessonDTO LessonListByTidx(int t_idx) {
		LessonDTO dto=sqlMap.selectOne("selectLessonListByTidx",t_idx);
		return dto;
	}
	
	@Override
	public int countLessonList() {
		int count=sqlMap.selectOne("countLessonList");
		return count;
	}
	
	@Override
	public int SelectLessonIdxByLessonThumbnail(String th_count) {
		int l_idx=sqlMap.selectOne("SelectLessonIdxByLessonThumbnail",th_count);
		return l_idx;
	}
	
	@Override
	public int lessonReqAccept(int idx) {
		int count=sqlMap.update("lessonReqAccept",idx);
		return count;
	}
	
	@Override
	public int lessonReqCancel(int idx) {
		int count=sqlMap.update("lessonReqCancel",idx);
		return count;
	}
}
