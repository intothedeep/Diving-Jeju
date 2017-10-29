package com.free.store.model;

public class StoreTypeDto {
	/*
	 * 0. 기타
	 * 1. 게스트하우스
	 * 2. tour
	 * 3. 둘다
	 * 4. ...
	*/
	private int storeTypeSeq;
	private String storeTypeName;
	
	public int getStoreTypeSeq() {
		return storeTypeSeq;
	}
	public void setStoreTypeSeq(int storeTypeSeq) {
		this.storeTypeSeq = storeTypeSeq;
	}
	public String getStoreTypeName() {
		return storeTypeName;
	}
	public void setStoreTypeName(String storeTypeName) {
		this.storeTypeName = storeTypeName;
	}
}
