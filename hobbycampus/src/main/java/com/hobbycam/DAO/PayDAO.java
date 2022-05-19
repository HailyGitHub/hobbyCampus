package com.hobbycam.DAO;

import java.util.List;
import java.util.Map;

import com.hobbycam.VO.PayVO;
import com.hobbycam.VO.UserVO;

public interface PayDAO {
	List<PayVO> getPays(int uIdx, int start, int end);
	int getPayTotalCnt(int uIdx);
	PayVO getPay(int payListIdx, int uIdx);
	int updatePayValue(int payListIdx, String payValue);
	int insertPay(Map<String, Object> map);
}
