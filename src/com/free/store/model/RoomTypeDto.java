package com.free.store.model;

public class RoomTypeDto {
	/*
	 * 0. 기타
	 * 1. 싱글
	 * 2. 더블
	 * 3. 패밀리
	 * 4. 모임
	 * 5. 도미토리
	 * 
	*/
	private int roomType;
	private String roomTypename;
	private String more;
	
	public String getMore() {
		return more;
	}
	public void setMore(String more) {
		this.more = more;
	}

	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}
	public String getRoomTypename() {
		return roomTypename;
	}
	public void setRoomTypename(String roomTypename) {
		this.roomTypename = roomTypename;
	}
}
