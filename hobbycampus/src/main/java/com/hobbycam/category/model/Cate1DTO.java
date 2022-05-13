package com.hobbycam.category.model;

public class Cate1DTO {

	private int cate1_idx;
	private String cate1_name;
	private String cate1_img;
	
	public Cate1DTO() {
		// TODO Auto-generated constructor stub
	}

	public Cate1DTO(int cate1_idx, String cate1_name, String cate1_img) {
		super();
		this.cate1_idx = cate1_idx;
		this.cate1_name = cate1_name;
		this.cate1_img = cate1_img;
	}

	public int getCate1_idx() {
		return cate1_idx;
	}

	public void setCate1_idx(int cate1_idx) {
		this.cate1_idx = cate1_idx;
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
}
