package com.hobbycam.VO;

import java.sql.Date;

public class CouponVO {

	private long couponIdx;
	private String couponTitle;
	private int couponRate;
	private String couponImg;
	private Date couponStart;
	private Date couponEnd;
	private String couponState;
	public long getCouponIdx() {
		return couponIdx;
	}
	public void setCouponIdx(long couponIdx) {
		this.couponIdx = couponIdx;
	}
	public String getCouponTitle() {
		return couponTitle;
	}
	public void setCouponTitle(String couponTitle) {
		this.couponTitle = couponTitle;
	}
	public int getCouponRate() {
		return couponRate;
	}
	public void setCouponRate(int couponRate) {
		this.couponRate = couponRate;
	}
	public String getCouponImg() {
		return couponImg;
	}
	public void setCouponImg(String couponImg) {
		this.couponImg = couponImg;
	}
	public Date getCouponStart() {
		return couponStart;
	}
	public void setCouponStart(Date couponStart) {
		this.couponStart = couponStart;
	}
	public Date getCouponEnd() {
		return couponEnd;
	}
	public void setCouponEnd(Date couponEnd) {
		this.couponEnd = couponEnd;
	}
	public String getCouponState() {
		return couponState;
	}
	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}
	@Override
	public String toString() {
		return "CouponVO [couponIdx=" + couponIdx + ", couponTitle=" + couponTitle + ", couponRate=" + couponRate
				+ ", couponImg=" + couponImg + ", couponStart=" + couponStart + ", couponEnd=" + couponEnd
				+ ", couponState=" + couponState + "]";
	}
	
	
}
