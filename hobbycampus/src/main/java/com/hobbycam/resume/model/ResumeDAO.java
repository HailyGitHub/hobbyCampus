package com.hobbycam.resume.model;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ResumeDAO {
	public int resumeInsert(ResumeDTO dto);
}
