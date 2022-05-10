package com.hobbycam.DAO;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LessonRecordDAOImpl implements LessonRecordDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSessionTemplate.insert("lessonRecordMapper.insert", map);
	}


}
