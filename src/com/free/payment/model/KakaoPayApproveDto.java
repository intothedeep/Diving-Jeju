package com.free.payment.model;

public class KakaoPayApproveDto {
	private final String approveUrl = "https://kapi.kakao.com/v1/payment/approve";
	private final String cid = "TC0ONETIME";
	private String tid;
	private final String partner_order_id = "partner_order_id";
	private String partner_user_id;
	private String pg_token;
	
	
	
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getApproveUrl() {
		return approveUrl;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public String getCid() {
		return cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	
	
}
