package com.hobbycam.resume.model;

import java.util.*;

public interface ResumeManageDAO {

	public int getResumeTotalCnt();
	public int getApplyTotalCnt();
	public int getResultTotalCnt();
	public List getResumeList(int cp, int listSize);
	public List getResumeApplyList(int cp, int listSize);
	public List getResumeResultList(int cp, int listSize);
	public ResumeManageDTO getResumeInfo(int resume_idx);
	public int resumeChangeState(int resume_idx, String interview_state, String interview_result);
	public int getUserIdx(int resume_idx);
	public void setTeacher(int u_idx);
	
}
