package com.hobbycam.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hobbycam.VO.PayVO;
import com.hobbycam.VO.UserVO;

@Repository
public class PayDAOImpl implements PayDAO {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<PayVO> getPays(int uIdx, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("start", start);
		map.put("end", end);
		return sqlSessionTemplate.selectList("payMapper.getPays", map);
	}



	@Override
	public int getPayTotalCnt(int uIdx) {
		return sqlSessionTemplate.selectOne("payMapper.getPayTotalCnt", uIdx);
	}



	@Override
	public PayVO getPay(int payListIdx, int uIdx) {
		Map<String, Object> map = new HashMap<>();
		map.put("payListIdx", payListIdx);
		map.put("uIdx", uIdx);
		return sqlSessionTemplate.selectOne("payMapper.getPay", map);
	}



	@Override
	public int updatePayValue(int payListIdx, String payValue) {
		Map<String, Object> map = new HashMap<>();
		map.put("payListIdx", payListIdx);
		map.put("payValue", payValue);
		return sqlSessionTemplate.update("payMapper.updatePayValue", map);
	}

	
}
