package com.hobbycam.lessonRecord.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hobbycam.VO.LessonRecordVO;

public class LessonRecordDAOImple implements LessonRecordDAO {

	SqlSessionTemplate sqlMap;
	
	
	
	public LessonRecordDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	/**Get list if losson_record using by t_idx*/
	@Override
	public List teacherRecord(int t_idx, int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("t_idx", t_idx);
		List lists = sqlMap.selectList("selectLessonRecord", map);
		return lists;
	}
	
	/**get count total lessonRecord List*/
	@Override
	public int teacherRecordCnt(int t_idx) {
		int cnt = sqlMap.selectOne("selectRecordCnt", t_idx);
		return cnt;
	}

	//Get list lesson request by teacher my page
	@Override
	public List lessonReqList(int t_idx) {
		List lists= sqlMap.selectList("SelectLessonReq",t_idx);
		return lists;
	}
	
	@Override
	public int lessonReqCnt(int t_idx) {
		List lists= sqlMap.selectList("SelectLessonReq",t_idx);
		int reqCnt =lists.size();
		return reqCnt;

	}
	
	@Override
	public int insert(Map<String, Object> map) {
		return sqlMap.insert("lessonRecordMapper.insertRecordLesson", map);
	}

	@Override
	public List<LessonRecordVO> getLessonRecords(int uIdx, String lessonRecordState) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("lessonRecordState", lessonRecordState);
		return sqlMap.selectList("lessonRecordMapper.getLessonRecords", map);
	}



}
