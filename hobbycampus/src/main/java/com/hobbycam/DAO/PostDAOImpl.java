package com.hobbycam.DAO;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.PostVO;

@Repository
public class PostDAOImpl implements PostDAO{

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public PostVO getPost(int uIdx) {
		return sqlSessionTemplate.selectOne("postMapper.getPost", uIdx);
	}

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSessionTemplate.insert("postMapper.insert", map);
	}
	

}
