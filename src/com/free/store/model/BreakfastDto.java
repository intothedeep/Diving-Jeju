package com.free.store.model;

public class BreakfastDto extends GuesthouseDto {
	private int breakfastPrice;
	private int breakfastIs;
	private String startBreakfastTime;
	private String endBreakfastTime;
	private int guestSeq;
	public int getBreakfastPrice() {
		return breakfastPrice;
	}
	public void setBreakfastPrice(int breakfastPrice) {
		this.breakfastPrice = breakfastPrice;
	}
	public int getBreakfastIs() {
		return breakfastIs;
	}
	public void setBreakfastIs(int breakfastIs) {
		this.breakfastIs = breakfastIs;
	}
	public String getStartBreakfastTime() {
		return startBreakfastTime;
	}
	public void setStartBreakfastTime(String startBreakfastTime) {
		this.startBreakfastTime = startBreakfastTime;
	}
	public String getEndBreakfastTime() {
		return endBreakfastTime;
	}
	public void setEndBreakfastTime(String endBreakfastTime) {
		this.endBreakfastTime = endBreakfastTime;
	}
	public int getGuestSeq() {
		return guestSeq;
	}
	public void setGuestSeq(int guestSeq) {
		this.guestSeq = guestSeq;
	}

}
