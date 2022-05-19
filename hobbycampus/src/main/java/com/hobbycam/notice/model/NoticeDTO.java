package com.hobbycam.notice.model;

import java.sql.Date;

public class NoticeDTO {

	public int notice_idx;
	public int a_idx;
	public String notice_subj;
	public String notice_viewer;
	public Date notice_date;	
	public String notice_cont;

	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int notice_idx, int a_idx, String notice_subj, String notice_viewer, Date notice_date,
			String notice_cont) {
		super();
		this.notice_idx = notice_idx;
		this.a_idx = a_idx;
		this.notice_subj = notice_subj;
		this.notice_viewer = notice_viewer;
		this.notice_date = notice_date;
		this.notice_cont = notice_cont;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public int getA_idx() {
		return a_idx;
	}

	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}

	public String getNotice_subj() {
		return notice_subj;
	}

	public void setNotice_subj(String notice_subj) {
		this.notice_subj = notice_subj;
	}

	public String getNotice_viewer() {
		return notice_viewer;
	}

	public void setNotice_viewer(String notice_viewer) {
		this.notice_viewer = notice_viewer;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_cont() {
		return notice_cont;
	}

	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	
	
}
