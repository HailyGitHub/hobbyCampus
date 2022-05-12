package com.hobbycam.member.model;

import java.sql.*;

public class MemberTeacherDTO {
	
	private int t_idx;
	private int u_idx;
	private String lev_name;
	private String t_name;
	private String t_img;
	private String t_profile;
	private Date t_join_date;
	private String t_account_owner;
	private String t_account_number;
	private String t_account_bank;
	private int t_point;
	private String u_email;
	private String u_state;
	
	public MemberTeacherDTO() {
		super();
	}

	public MemberTeacherDTO(int t_idx, int u_idx, String lev_name, String t_name, String t_img, String t_profile,
			Date t_join_date, String t_account_owner, String t_account_number, String t_account_bank, int t_point,
			String u_email, String u_state) {
		super();
		this.t_idx = t_idx;
		this.u_idx = u_idx;
		this.lev_name = lev_name;
		this.t_name = t_name;
		this.t_img = t_img;
		this.t_profile = t_profile;
		this.t_join_date = t_join_date;
		this.t_account_owner = t_account_owner;
		this.t_account_number = t_account_number;
		this.t_account_bank = t_account_bank;
		this.t_point = t_point;
		this.u_email = u_email;
		this.u_state = u_state;
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

	public String getLev_name() {
		return lev_name;
	}

	public void setLev_name(String lev_name) {
		this.lev_name = lev_name;
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

	public String getU_state() {
		return u_state;
	}

	public void setU_state(String u_state) {
		this.u_state = u_state;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	

}
