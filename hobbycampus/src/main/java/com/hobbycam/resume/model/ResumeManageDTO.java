package com.hobbycam.resume.model;

public class ResumeManageDTO {
	
	private int resume_idx;
	private String u_email;
	private String u_gender;
	private String cate1_name;
	private String cate1_img;
	private String cate2_name;
	private String cate2_img;
	private String resume_name;
	private String resume_img;
	private String resume_intro;
	private String resume_plan;
	private String interview_date_param;
	private String interview_state;
	private String interview_result;
	
	public ResumeManageDTO() {
		super();
	}

	public ResumeManageDTO(int resume_idx, String u_email, String u_gender, String cate1_name, String cate1_img,
			String cate2_name, String cate2_img, String resume_name, String resume_img, String resume_intro,
			String resume_plan, String interview_date_param, String interview_state, String interview_result) {
		super();
		this.resume_idx = resume_idx;
		this.u_email = u_email;
		this.u_gender = u_gender;
		this.cate1_name = cate1_name;
		this.cate1_img = cate1_img;
		this.cate2_name = cate2_name;
		this.cate2_img = cate2_img;
		this.resume_name = resume_name;
		this.resume_img = resume_img;
		this.resume_intro = resume_intro;
		this.resume_plan = resume_plan;
		this.interview_date_param = interview_date_param;
		this.interview_state = interview_state;
		this.interview_result = interview_result;
	}

	public int getResume_idx() {
		return resume_idx;
	}

	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getCate1_name() {
		return cate1_name;
	}

	public void setCate1_name(String cate1_name) {
		this.cate1_name = cate1_name;
	}

	public String getCate1_img() {
		return cate1_img;
	}

	public void setCate1_img(String cate1_img) {
		this.cate1_img = cate1_img;
	}

	public String getCate2_name() {
		return cate2_name;
	}

	public void setCate2_name(String cate2_name) {
		this.cate2_name = cate2_name;
	}

	public String getCate2_img() {
		return cate2_img;
	}

	public void setCate2_img(String cate2_img) {
		this.cate2_img = cate2_img;
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

	public String getInterview_date_param() {
		return interview_date_param;
	}

	public void setInterview_date_param(String interview_date_param) {
		this.interview_date_param = interview_date_param;
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
	
}
