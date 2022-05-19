package com.hobbycam.resume.model;

import java.util.List;

public interface ResumeDAO {
	public int resumeInsert(ResumeDTO dto);
	public List cate1List();
	public List cate2List(int cate1_idx); 
}
