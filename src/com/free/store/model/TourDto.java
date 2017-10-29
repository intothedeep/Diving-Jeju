package com.free.store.model;

public class TourDto extends StoreDto {
	private int tourSeq;
	private String tourName;
	private String tourLoc;
	private String tourContent;
	private String startTourTime;
	private String endTourTime;
	private int tourPrice;
	private String more;
	
	public int getTourSeq() {
		return tourSeq;
	}
	public void setTourSeq(int tourSeq) {
		this.tourSeq = tourSeq;
	}
	public String getTourName() {
		return tourName;
	}
	public void setTourName(String tourName) {
		this.tourName = tourName;
	}
	public String getTourLoc() {
		return tourLoc;
	}
	public void setTourLoc(String tourLoc) {
		this.tourLoc = tourLoc;
	}
	public String getTourContent() {
		return tourContent;
	}
	public void setTourContent(String tourContent) {
		this.tourContent = tourContent;
	}
	public String getStartTourTime() {
		return startTourTime;
	}
	public void setStartTourTime(String startTourTime) {
		this.startTourTime = startTourTime;
	}
	public String getEndTourTime() {
		return endTourTime;
	}
	public void setEndTourTime(String endTourTime) {
		this.endTourTime = endTourTime;
	}
	public int getTourPrice() {
		return tourPrice;
	}
	public void setTourPrice(int tourPrice) {
		this.tourPrice = tourPrice;
	}
	public String getMore() {
		return more;
	}
	public void setMore(String more) {
		this.more = more;
	}
}
