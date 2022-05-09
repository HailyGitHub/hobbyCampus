package com.hobbycam.admin.model;

public class AdminDTO {

	private int a_idx;
	private String a_email;
	private String a_pwd;
	private String a_name;
	private String a_img;
	
	public AdminDTO() {
		super();
	}

	public AdminDTO(int a_idx, String a_email, String a_pwd, String a_name, String a_img) {
		super();
		this.a_idx = a_idx;
		this.a_email = a_email;
		this.a_pwd = a_pwd;
		this.a_name = a_name;
		this.a_img = a_img;
	}

	public int getA_idx() {
		return a_idx;
	}

	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_img() {
		return a_img;
	}

	public void setA_img(String a_img) {
		this.a_img = a_img;
	}
	
}
