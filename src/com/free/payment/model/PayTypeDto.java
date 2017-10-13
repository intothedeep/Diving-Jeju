package com.free.payment.model;

public class PayTypeDto {
	/*
	 * 0. 기타
	 * 1. 현금
	 * 2. 카드
	 * 3. 무통장
	 */
	private int payType;
	private String payTypeName;
	
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public String getPayTypeName() {
		return payTypeName;
	}
	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}
	
}
