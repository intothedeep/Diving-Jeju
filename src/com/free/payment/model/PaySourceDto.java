package com.free.payment.model;

public class PaySourceDto {
	/*
	 * 0. 기타
	 * 1. 방예약
	 * 2. 소셜예약
	 * 3. 투어예약
	 * 4. 아침예약
	 * 5. ...
	*/
	private int paySourceSeq;
	private String paySourceName;
	
	public int getPaySourceSeq() {
		return paySourceSeq;
	}

	public void setPaySourceSeq(int paySourceSeq) {
		this.paySourceSeq = paySourceSeq;
	}

	public String getPaySourceName() {
		return paySourceName;
	}

	public void setPaySourceName(String paySourceName) {
		this.paySourceName = paySourceName;
	}
	
}
