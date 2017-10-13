package com.free.guesthouse.model;

public class RoomInfoDto extends RoomsDto {
	private String roomName;
	private String roomNum;
	private int howManyRoom;
	private int howManyPeople;
	private int roomfloor;
	private int roomPrice;
	private String roomContent;
	private String restroomLoc;
	private int roomType;
	private int roomSeq;
	
	public int getHowManyRoom() {
		return howManyRoom;
	}
	public void setHowManyRoom(int howManyRoom) {
		this.howManyRoom = howManyRoom;
	}
	public int getHowManyPeople() {
		return howManyPeople;
	}
	public void setHowManyPeople(int howManyPeople) {
		this.howManyPeople = howManyPeople;
	}
	public int getRoomfloor() {
		return roomfloor;
	}
	public void setRoomfloor(int roomfloor) {
		this.roomfloor = roomfloor;
	}
	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}
	public int getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getRoomContent() {
		return roomContent;
	}
	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}
	public String getRestroomLoc() {
		return restroomLoc;
	}
	public void setRestroomLoc(String restroomLoc) {
		this.restroomLoc = restroomLoc;
	}
	
	
}
