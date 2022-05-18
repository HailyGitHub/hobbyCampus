package com.hobbycam.level.model;

public class LevelDTO {

	public int lev_idx;
	public String lev_name;
	public String lev_img;
	public int lev_rate; //discount rate
	public int lev_sales;
	
	public LevelDTO() {
		// TODO Auto-generated constructor stub
	}

	public LevelDTO(int lev_idx, String lev_name, String lev_img, int lev_rate, int lev_sales) {
		super();
		this.lev_idx = lev_idx;
		this.lev_name = lev_name;
		this.lev_img = lev_img;
		this.lev_rate = lev_rate;
		this.lev_sales = lev_sales;
	}

	public int getLev_idx() {
		return lev_idx;
	}

	public void setLev_idx(int lev_idx) {
		this.lev_idx = lev_idx;
	}

	public String getLev_name() {
		return lev_name;
	}

	public void setLev_name(String lev_name) {
		this.lev_name = lev_name;
	}

	public String getLev_img() {
		return lev_img;
	}

	public void setLev_img(String lev_img) {
		this.lev_img = lev_img;
	}

	public int getLev_rate() {
		return lev_rate;
	}

	public void setLev_rate(int lev_rate) {
		this.lev_rate = lev_rate;
	}

	public int getLev_sales() {
		return lev_sales;
	}

	public void setLev_sales(int lev_sales) {
		this.lev_sales = lev_sales;
	}
	
}
