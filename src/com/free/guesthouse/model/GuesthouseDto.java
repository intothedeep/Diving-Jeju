package com.free.guesthouse.model;

import com.free.store.model.StoreDto;

public class GuesthouseDto extends StoreDto{
	private int guestSeq;
	private int wifi;
	private int cafe;
	private int eat;
	private String sleepTime;
	private String checkin;
	private String checkout;
	private int laundryServed;
	private String more;
	
	public int getGuestSeq() {
		return guestSeq;
	}
	public void setGuestSeq(int guestSeq) {
		this.guestSeq = guestSeq;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getCafe() {
		return cafe;
	}
	public void setCafe(int cafe) {
		this.cafe = cafe;
	}
	public int getEat() {
		return eat;
	}
	public void setEat(int eat) {
		this.eat = eat;
	}
	public String getSleepTime() {
		return sleepTime;
	}
	public void setSleepTime(String sleepTime) {
		this.sleepTime = sleepTime;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getLaundryServed() {
		return laundryServed;
	}
	public void setLaundryServed(int laundryServed) {
		this.laundryServed = laundryServed;
	}
	public String getMore() {
		return more;
	}
	public void setMore(String more) {
		this.more = more;
	}
}
