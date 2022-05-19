package com.hobbycam.payment.model;

import java.util.*;

public interface PaymentDAO {
	
	public List getPaymentList(int cp, int listSize);
	public int updateRefundstate(PaymentDTO dto);
	public int updateRefundPoint(PaymentDTO dto);
	public int getTotalCnt();
}
