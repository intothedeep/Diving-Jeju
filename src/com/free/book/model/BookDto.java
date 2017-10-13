package com.free.book.model;

public class BookDto {
	private int bookSeq;
	private int whenBook;
	private int numOfPeople;
	private int paySeq;
	
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public int getWhenBook() {
		return whenBook;
	}
	public void setWhenBook(int whenBook) {
		this.whenBook = whenBook;
	}
	public int getNumOfPeople() {
		return numOfPeople;
	}
	public void setNumOfPeople(int numOfPeople) {
		this.numOfPeople = numOfPeople;
	}
	
	
}
