package com.free.payment.model;

public class KakaoPayReadyDto {
	private final String readyUrl = "https://kapi.kakao.com/v1/payment/ready";
	private String authorization;
	private final String cid = "TC0ONETIME";
	private final String partner_order_id = "partner_order_id";
	private final String partner_user_id = "partner_user_id";
	private String item_name;
	private final int quantity = 3;
	private final int total_amount = 100000;
	private final int vat_amount = 200;
	private final int tax_free_amount = 0;
	private final String approval_url = "http://localhost/guest/kakaopay/payok";
	private final String fail_url = "http://localhost/guest/kakaopay/payfail";
	private final String cancel_url = "http://localhost/guest/";
	
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public String getAuthorization() {
		return authorization;
	}
	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getReadyUrl() {
		return readyUrl;
	}
	public String getCid() {
		return cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public int getVat_amount() {
		return vat_amount;
	}
	public int getTax_free_amount() {
		return tax_free_amount;
	}
	public String getApproval_url() {
		return approval_url;
	}
	public String getFail_url() {
		return fail_url;
	}
	public String getCancel_url() {
		return cancel_url;
	}
	
	//-H 'Authorization: KakaoAK xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
	//--data-urlencode 'cid=TC0ONETIME' \
	//--data-urlencode 'partner_order_id=partner_order_id' \
	//--data-urlencode 'partner_user_id=partner_user_id' \
	//--data-urlencode 'item_name=초코파이' \
	//--data-urlencode 'quantity=1' \
	//--data-urlencode 'total_amount=2200' \
	//--data-urlencode 'vat_amount=200' \
	//--data-urlencode 'tax_free_amount=0' \
	//--data-urlencode 'approval_url=http://localhost/testkakao/pay/payok.jsp' \
	//--data-urlencode 'fail_url=http://localhost/testkakao/pay/payfail.jsp' \
	//--data-urlencode 'cancel_url=http://localhost/testkakao/index.jsp'
	
	
}
