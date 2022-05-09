package com.hobbycam.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.LessonVO;

@Repository
public class LessonDAOImpl implements LessonDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public LessonVO getLesson(int lessonIdx) {
		return sqlSessionTemplate.selectOne("lessonMapper.getLesson", lessonIdx);
	}

}
