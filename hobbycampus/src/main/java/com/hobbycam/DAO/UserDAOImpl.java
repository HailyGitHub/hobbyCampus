package com.hobbycam.DAO;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public UserVO getUser(int uIdx) {
		return sqlSessionTemplate.selectOne("userMapper.getUser", uIdx);
	}

	@Override
	public int updateUPoint(int uIdx, int newUPoint) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("newUPoint", newUPoint);
		return sqlSessionTemplate.update("userMapper.updateUPoint", map);
	}

	
}
