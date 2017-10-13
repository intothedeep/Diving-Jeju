package com.free.payment.model;

public class RefundDto {
	private int refundSeq;
	private int refundMoney;
	private int paySeq;
	
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public int getRefundSeq() {
		return refundSeq;
	}
	public void setRefundSeq(int refundSeq) {
		this.refundSeq = refundSeq;
	}
	public int getRefundMoney() {
		return refundMoney;
	}
	public void setRefundMoney(int refundMoney) {
		this.refundMoney = refundMoney;
	}
	
	
}
