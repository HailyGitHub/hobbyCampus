package com.hobbycam.total.model;

public class TotalGenderDTO {
	
	private int male;
	private int female;
	
	public TotalGenderDTO() {
		super();
	}

	public TotalGenderDTO(int male, int female) {
		super();
		this.male = male;
		this.female = female;
	}

	public int getMale() {
		return male;
	}

	public void setMale(int male) {
		this.male = male;
	}

	public int getFemale() {
		return female;
	}

	public void setFemale(int female) {
		this.female = female;
	}

}
