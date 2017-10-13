package com.free.book.model;

public class BookGuestDto {
	private int bookGuesthouseSeq;
	private String startBookDate;
	private String endBookDate;
	private int roomSeq;
	private String email;
	private int guestSeq;
	private int bookSeq;
	
	public int getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}
	public int getGuestSeq() {
		return guestSeq;
	}
	public void setGuestSeq(int guestSeq) {
		this.guestSeq = guestSeq;
	}
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBookGuesthouseSeq() {
		return bookGuesthouseSeq;
	}
	public void setBookGuesthouseSeq(int bookGuesthouseSeq) {
		this.bookGuesthouseSeq = bookGuesthouseSeq;
	}
	public String getStartBookDate() {
		return startBookDate;
	}
	public void setStartBookDate(String startBookDate) {
		this.startBookDate = startBookDate;
	}
	public String getEndBookDate() {
		return endBookDate;
	}
	public void setEndBookDate(String endBookDate) {
		this.endBookDate = endBookDate;
	}
	
	
}
