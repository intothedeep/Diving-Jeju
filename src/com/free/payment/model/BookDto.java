package com.free.payment.model;

public class BookDto {
	private int bookSeq;
	private String whenBook;
	private String startBookDate;
	private String endBookDate;
	private int nights;
	private int paySeq;
	private int numOfPersons;
	private String roomType;
	private int storeSeq;
	private String email;  //예약하는 사람 이메일
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public String getWhenBook() {
		return whenBook;
	}
	public void setWhenBook(String whenBook) {
		this.whenBook = whenBook;
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
	public int getNights() {
		return nights;
	}
	public void setNights(int nights) {
		this.nights = nights;
	}
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public int getNumOfPersons() {
		return numOfPersons;
	}
	public void setNumOfPersons(int numOfPersons) {
		this.numOfPersons = numOfPersons;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
