package com.free.payment.model;

public class PaymentDto {
	private int paySeq;
	private String payContent;
	private int totalPrice;
	private int payReceived;
	private int payLeft;
	private int payType;
	private int paySourceSeq;
	
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public int getPaySourceSeq() {
		return paySourceSeq;
	}
	public void setPaySourceSeq(int paySourceSeq) {
		this.paySourceSeq = paySourceSeq;
	}
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public String getPayContent() {
		return payContent;
	}
	public void setPayContent(String payContent) {
		this.payContent = payContent;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPayReceived() {
		return payReceived;
	}
	public void setPayReceived(int payReceived) {
		this.payReceived = payReceived;
	}
	public int getPayLeft() {
		return payLeft;
	}
	public void setPayLeft(int payLeft) {
		this.payLeft = payLeft;
	}
}
