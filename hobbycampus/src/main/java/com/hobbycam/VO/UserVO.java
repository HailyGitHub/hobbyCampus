package com.hobbycam.VO;

public class UserVO {

	private int uIdx;
	private String uEmail;
	private String uName;
	private String uImg;
	private String uGender;
	private int uPoint;
	private String uTel;
	private String uState;
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuImg() {
		return uImg;
	}
	public void setuImg(String uImg) {
		this.uImg = uImg;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public int getuPoint() {
		return uPoint;
	}
	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}
	public String getuState() {
		return uState;
	}
	public void setuState(String uState) {
		this.uState = uState;
	}
	@Override
	public String toString() {
		return "UserVO [uIdx=" + uIdx + ", uEmail=" + uEmail + ", uName=" + uName + ", uImg=" + uImg + ", uGender="
				+ uGender + ", uPoint=" + uPoint + ", uTel=" + uTel + ", uState=" + uState + "]";
	}
	
	
}
