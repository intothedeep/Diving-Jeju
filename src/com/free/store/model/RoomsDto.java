package com.free.store.model;

public class RoomsDto extends GuesthouseDto {
	private int roomSeq;
	private int bookable;
	private int guestSeq;
	
	public int getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}
	public int getBookable() {
		return bookable;
	}
	public void setBookable(int bookable) {
		this.bookable = bookable;
	}
	public int getGuestSeq() {
		return guestSeq;
	}
	public void setGuestSeq(int guestSeq) {
		this.guestSeq = guestSeq;
	}

}
