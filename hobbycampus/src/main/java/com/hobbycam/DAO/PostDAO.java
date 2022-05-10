package com.hobbycam.DAO;

import java.util.Map;

import com.hobbycam.VO.PostVO;

public interface PostDAO {
	PostVO getPost(int uIdx);
	int insert(Map<String, Object> map);
}
