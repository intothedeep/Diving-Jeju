package com.free.guesthouse.model;

public class GuestSocial {
	private int socialSeq;
	private String socialName;
	private String startSocialTime;
	private String endSocialTime;
	private int socialPrice;
	private String socialLoc;
	private int guestSeq;

	public int getGuestSeq() {
		return guestSeq;
	}
	public void setGuestSeq(int guestSeq) {
		this.guestSeq = guestSeq;
	}
	public int getSocialSeq() {
		return socialSeq;
	}
	public void setSocialSeq(int socialSeq) {
		this.socialSeq = socialSeq;
	}
	public String getSocialName() {
		return socialName;
	}
	public void setSocialName(String socialName) {
		this.socialName = socialName;
	}
	public String getStartSocialTime() {
		return startSocialTime;
	}
	public void setStartSocialTime(String startSocialTime) {
		this.startSocialTime = startSocialTime;
	}
	public String getEndSocialTime() {
		return endSocialTime;
	}
	public void setEndSocialTime(String endSocialTime) {
		this.endSocialTime = endSocialTime;
	}
	public int getSocialPrice() {
		return socialPrice;
	}
	public void setSocialPrice(int socialPrice) {
		this.socialPrice = socialPrice;
	}
	public String getSocialLoc() {
		return socialLoc;
	}
	public void setSocialLoc(String socialLoc) {
		this.socialLoc = socialLoc;
	}
	
	
}
