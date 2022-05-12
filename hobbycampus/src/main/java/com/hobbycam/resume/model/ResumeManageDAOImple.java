package com.hobbycam.resume.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ResumeManageDAOImple implements ResumeManageDAO {
	
	private SqlSessionTemplate sqlMap;

	public ResumeManageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int getResumeTotalCnt() {
		int count = sqlMap.selectOne("selectResumeTotalCnt"); //Get Resume list total count
		return count;
	}
	
	@Override
	public int getApplyTotalCnt() {
		int count = sqlMap.selectOne("selectApplyTotalCnt"); //Get Apply list total count
		return count;
	}
	
	@Override
	public int getResultTotalCnt() {
		int count = sqlMap.selectOne("selectResultTotalCnt"); //Get Result list total count
		return count;
	}
	
	@Override
	public List getResumeList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectResumeList", map);
		
		return lists;
	}
	
	@Override
	public List getResumeApplyList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectResumeApplyList", map);
		return lists;
	}
	
	@Override
	public List getResumeResultList(int cp, int listSize) {
		int start = ((cp-1)*listSize)+1;
		int end = cp*listSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		List lists = sqlMap.selectList("selectResumeResultList", map);
		return lists;
	}
	
	@Override
	public ResumeManageDTO getResumeInfo(int resume_idx) {
		ResumeManageDTO dto = sqlMap.selectOne("selectResumeInfo", resume_idx);
		return dto;
	}
	
	@Override
	public int resumeChangeState(int resume_idx, String interview_state, String interview_result) {
		Map map = new HashMap();
		map.put("resume_idx", resume_idx);
		map.put("interview_state",interview_state);
		map.put("interview_result",interview_result);
		int count = sqlMap.update("updateResumeState", map);
		
		return count;
	}
	
	@Override
	public int getUserIdx(int resume_idx) {
		int u_idx = sqlMap.selectOne("selectUserIdxByIdx", resume_idx);
		return u_idx;
	}
	
	@Override
	public void setTeacher(int u_idx) {
		
		String  t_name = "강사" + u_idx;
		
		Map map = new HashMap();
		map.put("u_idx", u_idx);
		map.put("t_name",t_name);
		sqlMap.insert("insertTeacherByIdx", map);
	}

}
