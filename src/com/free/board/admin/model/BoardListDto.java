package com.free.board.admin.model;

public class BoardListDto {
	/*
		BCODE	BTYPE	BNAME	
		0		1		공지사항	
		1		1		자유게시판	
		2		1		게스트하우스후기	
		3		2		투어후기
		4		2		게스트하우스가게사진
		5		2		투어가게사진
	 */
	private int bcode;
	private int btype;
	private String bname;
	
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	
	
}
