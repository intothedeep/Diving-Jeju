package com.free.member.model;

public class MemberUpDownDto {
	/*
	 * 이건 회원이 하루 동안 할 수 있는 추천 수
	 * up, down 각 5개
	 * 
	*/
	private int checkUp;
	private int checkDown;
	private String email;
	
	public int getCheckUp() {
		return checkUp;
	}
	public void setCheckUp(int checkUp) {
		this.checkUp = checkUp;
	}
	public int getCheckDown() {
		return checkDown;
	}
	public void setCheckDown(int checkDown) {
		this.checkDown = checkDown;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
