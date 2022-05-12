package com.hobbycam.DAO;

import com.hobbycam.VO.UserVO;

public interface UserDAO {
	UserVO getUser(int uIdx);
	int updateUPoint(int uIdx, int newUPoint);
}
