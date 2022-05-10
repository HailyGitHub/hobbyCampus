package com.hobbycam.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.LessonScheduleVO;

@Repository
public class LessonScheduleDAOImpl implements LessonScheduleDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public LessonScheduleVO getLessonSchedule(int lessonIdx) {
		return sqlSessionTemplate.selectOne("lessonScheduleMapper.getLessonSchedule", lessonIdx);
	}

}
