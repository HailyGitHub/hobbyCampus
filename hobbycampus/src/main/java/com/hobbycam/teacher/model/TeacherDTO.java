package com.hobbycam.teacher.model;

import java.sql.Date;

public class TeacherDTO {
	private int t_idx;
	private int u_idx;
	private int lev_idx;
	private String t_name;
	private String t_img;
	private String t_profile;
	private Date t_join_date;
	private String t_account_owner;
	private String t_account_number;
	private String t_account_bank;
	private int t_point;
	
	public TeacherDTO() {
		// TODO Auto-generated constructor stub
	}

	public TeacherDTO(int t_idx, int u_idx, int lev_idx, String t_name, String t_img, String t_profile,
			Date t_join_date, String t_account_owner, String t_account_number, String t_account_bank, int t_point) {
		super();
		this.t_idx = t_idx;
		this.u_idx = u_idx;
		this.lev_idx = lev_idx;
		this.t_name = t_name;
		this.t_img = t_img;
		this.t_profile = t_profile;
		this.t_join_date = t_join_date;
		this.t_account_owner = t_account_owner;
		this.t_account_number = t_account_number;
		this.t_account_bank = t_account_bank;
		this.t_point = t_point;
	}

	public int getT_idx() {
		return t_idx;
	}

	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public int getLev_idx() {
		return lev_idx;
	}

	public void setLev_idx(int lev_idx) {
		this.lev_idx = lev_idx;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_img() {
		return t_img;
	}

	public void setT_img(String t_img) {
		this.t_img = t_img;
	}

	public String getT_profile() {
		return t_profile;
	}

	public void setT_profile(String t_profile) {
		this.t_profile = t_profile;
	}

	public Date getT_join_date() {
		return t_join_date;
	}

	public void setT_join_date(Date t_join_date) {
		this.t_join_date = t_join_date;
	}

	public String getT_account_owner() {
		return t_account_owner;
	}

	public void setT_account_owner(String t_account_owner) {
		this.t_account_owner = t_account_owner;
	}

	public String getT_account_number() {
		return t_account_number;
	}

	public void setT_account_number(String t_account_number) {
		this.t_account_number = t_account_number;
	}

	public String getT_account_bank() {
		return t_account_bank;
	}

	public void setT_account_bank(String t_account_bank) {
		this.t_account_bank = t_account_bank;
	}

	public int getT_point() {
		return t_point;
	}

	public void setT_point(int t_point) {
		this.t_point = t_point;
	}
	
	
	
}
