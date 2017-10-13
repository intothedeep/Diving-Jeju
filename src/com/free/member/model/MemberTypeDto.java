package com.free.member.model;

public class MemberTypeDto {
	
	/*
	 * 0. 기타
	 * 1. 관리자
	 * 2. 사업자
	 * 3. 회원
	 */
	
	private int memberType;
	private String memberTypeName;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMemberType() {
		return memberType;
	}
	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}
	public String getMemberTypeName() {
		return memberTypeName;
	}
	public void setMemberTypeName(String memberTypeName) {
		this.memberTypeName = memberTypeName;
	}
	
	
}
