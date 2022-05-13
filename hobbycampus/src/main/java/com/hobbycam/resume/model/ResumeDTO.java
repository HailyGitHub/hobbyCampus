package com.hobbycam.resume.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ResumeDTO {
	
	private int resume_idx;
	private int u_idx;
	private int cate2_idx;
	private String resume_name;
	private String resume_img;
	private String resume_intro;
	private String resume_plan;
	private Date interview_date;
	private String interview_state;
	private String interview_result;
	private String interview_date_param;
	
	public ResumeDTO() {
		// TODO Auto-generated constructor stub
	}

	public ResumeDTO(int resume_idx, int u_idx, int cate2_idx, String resume_name, String resume_img,
			String resume_intro, String resume_plan, Date interview_date, String interview_state,
			String interview_result, String interview_date_param) {
		super();
		this.resume_idx = resume_idx;
		this.u_idx = u_idx;
		this.cate2_idx = cate2_idx;
		this.resume_name = resume_name;
		this.resume_img = resume_img;
		this.resume_intro = resume_intro;
		this.resume_plan = resume_plan;
		this.interview_date = interview_date;
		this.interview_state = interview_state;
		this.interview_result = interview_result;
		this.interview_date_param = interview_date_param;
	}

	public int getResume_idx() {
		return resume_idx;
	}

	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getCate2_idx() {
		return cate2_idx;
	}

	public void setCate2_idx(int cate2_idx) {
		this.cate2_idx = cate2_idx;
	}

	public String getResume_name() {
		return resume_name;
	}

	public void setResume_name(String resume_name) {
		this.resume_name = resume_name;
	}

	public String getResume_img() {
		return resume_img;
	}

	public void setResume_img(String resume_img) {
		this.resume_img = resume_img;
	}

	public String getResume_intro() {
		return resume_intro;
	}

	public void setResume_intro(String resume_intro) {
		this.resume_intro = resume_intro;
	}

	public String getResume_plan() {
		return resume_plan;
	}

	public void setResume_plan(String resume_plan) {
		this.resume_plan = resume_plan;
	}

	public Date getInterview_date() {
		return interview_date;
	}

	public void setInterview_date(Date interview_date) {
		this.interview_date = interview_date;
	}

	public String getInterview_state() {
		return interview_state;
	}

	public void setInterview_state(String interview_state) {
		this.interview_state = interview_state;
	}

	public String getInterview_result() {
		return interview_result;
	}

	public void setInterview_result(String interview_result) {
		this.interview_result = interview_result;
	}

	public String getInterview_date_param() {
		return interview_date_param;
	}

	public void setInterview_date_param(String interview_date_param) {
		this.interview_date_param = interview_date_param;
	}


	
	
}
