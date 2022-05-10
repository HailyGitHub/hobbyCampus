package com.hobbycam.payment.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class PaymentDAOImple implements PaymentDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public PaymentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List getPaymentList(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end= cp*listSize;
		Map map= new HashMap();
		map.put("start",start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectPayList",map); 
		return lists;
	}

	@Override
	public int updateRefundstate(PaymentDTO dto) {
		int count = sqlMap.update("updateRefundstate",dto);
		return count;
	}

	@Override
	public int updaterefundPoint(PaymentDTO dto) {
		int count = sqlMap.update("updaterefundPoint",dto);
		return count;
	}
	
	@Override
	public int getTotalCnt() {
		int cnt= sqlMap.selectOne("totalPayCnt");
		cnt=cnt==0?1:cnt;
		
		return cnt;
	}
	
	
}
