package com.free.member.model;

public class JoinTypeDto {
	/*
	 * 회원이 가입을 어떻게 했는지
	 * 0. 기타
	 * 1. 내 싸이트 회원가입
	 * 2. gmail
	 * 3. facebook
	 * 4. twitter
	 * 5. kakao
	*/
	private int joinType;
	private String joinSourceName;
	
	public int getJoinType() {
		return joinType;
	}
	public void setJoinType(int joinType) {
		this.joinType = joinType;
	}
	public String getJoinSourceName() {
		return joinSourceName;
	}
	public void setJoinSourceName(String joinSourceName) {
		this.joinSourceName = joinSourceName;
	}
	
}
