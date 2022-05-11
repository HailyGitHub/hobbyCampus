package com.hobbycam.level.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LevelDAOImple implements LevelDAO {

private SqlSessionTemplate sqlMap;



	public LevelDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public List getLevelList() {
		List lists = sqlMap.selectList("selectLevelList"); 
		return lists;
	}

	@Override
	public int updateLevel(LevelDTO dto) {
		int count = sqlMap.insert("updateLevel",dto);
		return count;
	}

	@Override
	public LevelDTO getUpdateLevelInfo(int lev_idx) {
		LevelDTO dto = sqlMap.selectOne("selectLevelInfo",lev_idx);
		return dto;
	}
}
