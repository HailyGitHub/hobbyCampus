package com.hobbycam.payment.model;

import java.sql.*;

public class PaymentDTO {

	
	public int pay_list_idx;
	public int u_idx;
	public String pay_value;
	public String pay_type;
	public Date pay_date; 
	public int pay_point;
	
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}

	public PaymentDTO(int pay_list_idx, int u_idx, String pay_value, String pay_type, Date pay_date, int pay_point) {
		super();
		this.pay_list_idx = pay_list_idx;
		this.u_idx = u_idx;
		this.pay_value = pay_value;
		this.pay_type = pay_type;
		this.pay_date = pay_date;
		this.pay_point = pay_point;
	}

	public int getPay_list_idx() {
		return pay_list_idx;
	}

	public void setPay_list_idx(int pay_list_idx) {
		this.pay_list_idx = pay_list_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public String getPay_value() {
		return pay_value;
	}

	public void setPay_value(String pay_value) {
		this.pay_value = pay_value;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getPay_point() {
		return pay_point;
	}

	public void setPay_point(int pay_point) {
		this.pay_point = pay_point;
	}
	
	
	
}
