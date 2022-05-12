package com.hobbycam.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.LessonRecordVO;

@Repository
public class LessonRecordDAOImpl implements LessonRecordDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSessionTemplate.insert("lessonRecordMapper.insert", map);
	}

	@Override
	public List<LessonRecordVO> getLessonRecords(int uIdx, String lessonRecordState) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("lessonRecordState", lessonRecordState);
		return sqlSessionTemplate.selectList("lessonRecordMapper.getLessonRecords", map);
	}


}
