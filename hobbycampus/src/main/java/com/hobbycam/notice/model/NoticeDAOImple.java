package com.hobbycam.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hobbycam.coupon.model.CouponDTO;

public class NoticeDAOImple implements NoticeDAO {

	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List getNoticeList(int cp, int listSize) {

		int start=(cp-1)*listSize+1;
		int end= cp*listSize;
		Map map= new HashMap();
		map.put("start",start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectNoticeList",map); 
		return lists;
	}
	
	@Override
	public List getTeacherNoticeList(int cp, int listSize) {

		int start=(cp-1)*listSize+1;
		int end= cp*listSize;
		Map map= new HashMap();
		map.put("start",start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectTeacherNoticeList",map); 
		return lists;
	}	
	
	@Override
	public List getAllNoticeList(int cp, int listSize) {

		int start=(cp-1)*listSize+1;
		int end= cp*listSize;
		Map map= new HashMap();
		map.put("start",start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectAllNoticeList",map); 
		return lists;
	}

	@Override
	public int setNotice(NoticeDTO dto) {
		int count = sqlMap.insert("insertNotice",dto); 
		return count;
	}

	@Override
	public NoticeDTO getNoticeInfo(int notice_idx) {
		NoticeDTO dto = sqlMap.selectOne("selectNotice",notice_idx);
		return dto;
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		int count = sqlMap.update("updateNotice",dto);
		return count;
	}

	@Override
	public int deleteNotice(NoticeDTO dto) {
		int count = sqlMap.delete("deleteNotice",dto);
		return count;
	}
	@Override
	public int getTotalCntS() {
		int cnt= sqlMap.selectOne("totalNoticeCntS");
		cnt=cnt==0?1:cnt;
		
		return cnt;
	}
	@Override
	public int getTotalCntT() {
		int cnt= sqlMap.selectOne("totalNoticeCntT");
		cnt=cnt==0?1:cnt;
		
		return cnt;
	}
	@Override
	public int getTotalCntA() {
		int cnt= sqlMap.selectOne("totalNoticeCntA");
		cnt=cnt==0?1:cnt;
		
		return cnt;
	}
	@Override
	public NoticeDTO getNoticeExpose() {
		NoticeDTO dto = sqlMap.selectOne("noticeExpose");
		return dto;
	}
}
