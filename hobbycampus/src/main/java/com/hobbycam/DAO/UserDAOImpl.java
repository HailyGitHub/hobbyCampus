package com.hobbycam.DAO;

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

	
}
