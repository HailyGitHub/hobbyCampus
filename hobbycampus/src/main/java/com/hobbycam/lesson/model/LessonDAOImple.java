package com.hobbycam.lesson.model;

import java.util.HashMap;
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

	public List scheduleDate(int lesson_idx) {
		List lists = sqlMap.selectList("selectScheduleDate",lesson_idx);

		return lists;
	}
	
	@Override

	public List cate1List() {
		List lists=sqlMap.selectList("selectCate1List");
		return lists;
	}

	public List scheduleTime(String lessonDate) {
		List lists = sqlMap.selectList("selectScheduleTime",lessonDate);

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

	public String teacherEmail(int lesson_idx) {
		String teacherEmail = sqlMap.selectOne("selectTeacherEmail", lesson_idx);
		return teacherEmail;
	}
	
	public String getAddr(int lesson_idx) {
		String mapAddr = sqlMap.selectOne("selectMap",lesson_idx);
		return mapAddr;
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
	public void deleteLike(int lesson_idx,int u_idx) {
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
		return lessonScIdx;
	}
	
	@Override
	public String getThumbnail(int lesson_idx) {
		String thumbnail = sqlMap.selectOne("selectThumb", lesson_idx);
		return thumbnail;

	}
}


