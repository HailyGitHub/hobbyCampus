package com.hobbycam.index.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class IndexDAOImple implements IndexDAO {
	
	private SqlSessionTemplate sqlMap;

	public IndexDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public List getCateOneList() {
		List lists = sqlMap.selectList("selectIndexCateOneList");
		return lists;
	}
	
	@Override
	public List getCateTwoList() {
		List lists = sqlMap.selectList("selectIndexCateTwoList");
		return lists;
	}
	
	@Override
	public int getTeacherCnt() {
		int count = sqlMap.selectOne("selectTeacherCnt");
		return count;
	}
	
	@Override
	public int getUserCnt() {
		int count = sqlMap.selectOne("selectUserCnt");
		return count;
	}
	
	@Override
	public int getLessonCnt() {
		int count = sqlMap.selectOne("selectLessonCnt");
		return count;
	}
	
	@Override
	public int getCategoryCnt() {
		int count = sqlMap.selectOne("selectCategoryCnt");
		return count;
	}
	
	@Override
	public List getLikeTeacher() {
		List lesson = sqlMap.selectList("selectLikeTeacherList");
		return lesson;
	}
	
	@Override
	public List getLikeLesson() {
		List lesson = sqlMap.selectList("selectLikelessonList");
		return lesson;
	}
	
	
}
