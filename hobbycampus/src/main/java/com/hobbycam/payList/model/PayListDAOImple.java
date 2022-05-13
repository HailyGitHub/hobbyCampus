package com.hobbycam.payList.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class PayListDAOImple implements PayListDAO {

	SqlSessionTemplate sqlMap;
	
	
	
	public PayListDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int teacherPointExCnt(int t_idx) {
		int cnt = sqlMap.selectOne("tPointExCnt", t_idx);
		return cnt;
	}

	@Override
	public List teacherPayList(int t_idx, int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("t_idx", t_idx);
		
		List lists = sqlMap.selectList("tPointPayList", map);
		
		return lists;
	}

}
