package com.free.store.model;

import com.free.member.model.MemberDetailDto;

public class StoreDto extends MemberDetailDto {
	private int storeSeq;
	private String storeLoc;
	private String storeAccountNum;
	private String biz_license_num;
	private int storeTypeSeq;
	private int evaluation;

	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}
	public int getStoreTypeSeq() {
		return storeTypeSeq;
	}
	public void setStoreTypeSeq(int storeTypeSeq) {
		this.storeTypeSeq = storeTypeSeq;
	}

	public int getStoreSeq() {
		return storeSeq;
	}
	public void setStoreSeq(int storeSeq) {
		this.storeSeq = storeSeq;
	}
	public String getStoreLoc() {
		return storeLoc;
	}
	public void setStoreLoc(String storeLoc) {
		this.storeLoc = storeLoc;
	}

	public String getStoreAccountNum() {
		return storeAccountNum;
	}
	public void setStoreAccountNum(String storeAccountNum) {
		this.storeAccountNum = storeAccountNum;
	}
	public String getBiz_license_num() {
		return biz_license_num;
	}
	public void setBiz_license_num(String biz_license_num) {
		this.biz_license_num = biz_license_num;
	}
	
	
}
