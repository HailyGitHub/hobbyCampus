package com.hobbycam.coupon.model;
import java.sql.*;
public class CouponDTO {
	private int coupon_idx;
	private String   coupon_title;
	private int  coupon_rate;
	private String  coupon_img;
	private Date  coupon_start;
	private Date  coupon_end;
	private String  coupon_state;

	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}

	public CouponDTO(int coupon_idx, String coupon_title, int coupon_rate, String coupon_img, Date coupon_start,
			Date coupon_end, String coupon_state) {
		super();
		this.coupon_idx = coupon_idx;
		this.coupon_title = coupon_title;
		this.coupon_rate = coupon_rate;
		this.coupon_img = coupon_img;
		this.coupon_start = coupon_start;
		this.coupon_end = coupon_end;
		this.coupon_state = coupon_state;
	}

	public int getCoupon_idx() {
		return coupon_idx;
	}

	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}

	public String getCoupon_title() {
		return coupon_title;
	}

	public void setCoupon_title(String coupon_title) {
		this.coupon_title = coupon_title;
	}

	public int getCoupon_rate() {
		return coupon_rate;
	}

	public void setCoupon_rate(int coupon_rate) {
		this.coupon_rate = coupon_rate;
	}

	public String getCoupon_img() {
		return coupon_img;
	}

	public void setCoupon_img(String coupon_img) {
		this.coupon_img = coupon_img;
	}

	public Date getCoupon_start() {
		return coupon_start;
	}

	public void setCoupon_start(Date coupon_start) {
		this.coupon_start = coupon_start;
	}

	public Date getCoupon_end() {
		return coupon_end;
	}

	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}

	public String getCoupon_state() {
		return coupon_state;
	}

	public void setCoupon_state(String coupon_state) {
		this.coupon_state = coupon_state;
	}
	
	
	
}
