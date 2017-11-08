package com.free.payment.model;

public class BookDto extends PaymentDto{
	private int bookSeq;
	private String bookedName;
	private String bookedTel;
	private String bookedEmail;  //예약하는 사람 이메일
	private String whenBook;
	private String startBookDate;
	private String endBookDate;
	private int numOfPersons;
	private String roomType;
	private int paySeq;
	private int storeSeq;
	private int nights;
	private int isPaid = 0; // 0: 미결제, 1: 결제
	
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public String getBookedName() {
		return bookedName;
	}
	public void setBookedName(String bookedName) {
		this.bookedName = bookedName;
	}
	public String getBookedTel() {
		return bookedTel;
	}
	public void setBookedTel(String bookedTel) {
		this.bookedTel = bookedTel;
	}
	public String getBookedEmail() {
		return bookedEmail;
	}
	public void setBookedEmail(String bookedEmail) {
		this.bookedEmail = bookedEmail;
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
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public int getNights() {
		return nights;
	}
	public void setNights(int nights) {
		this.nights = nights;
	}	

	
}
