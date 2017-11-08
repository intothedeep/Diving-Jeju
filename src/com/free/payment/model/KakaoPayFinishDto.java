package com.free.payment.model;

public class KakaoPayFinishDto {
	private String aid;
	private String tid;
	private String cid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private String item_name;
	private String quantity;
	private String created_at;
	private String approved_at;
	private String total;
	private String tax_free;
	private String vat;
	private String point;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getPayment_method_type() {
		return payment_method_type;
	}
	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getApproved_at() {
		return approved_at;
	}
	public void setApproved_at(String approved_at) {
		this.approved_at = approved_at;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTax_free() {
		return tax_free;
	}
	public void setTax_free(String tax_free) {
		this.tax_free = tax_free;
	}
	public String getVat() {
		return vat;
	}
	public void setVat(String vat) {
		this.vat = vat;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	
	/* 	[Response]
	요청이 성공하면 응답 바디에 JSON 객체로 아래의 값을 포함합니다.
	키	설명	타입
	aid	Request 고유 번호	String
	tid	결제 고유 번호	String
	cid	가맹점 코드	String
	sid	subscription id. 정기(배치)결제 CID로 결제요청한 경우 발급	String
	partner_order_id	가맹점 주문번호	String
	partner_user_id	가맹점 회원 id	String
	payment_method_type	결제 수단. CARD, MONEY 중 하나	String
	amount	결제 금액 정보	JSON Object
	card_info	결제 상세 정보(결제수단이 카드일 경우만 포함)	JSON Object
	item_name	상품 이름. 최대 100자	String
	item_code	상품 코드. 최대 100자	String
	quantity	상품 수량	Integer
	created_at	결제 준비 요청 시각	Datetime
	approved_at	결제 승인 시각	Datetime
	payload	Request로 전달한 값	String
	amount 정보
	키	설명	타입
	total	전체 결제 금액	Integer
	tax_free	비과세 금액	Integer
	vat	부가세 금액	Integer
	point	사용한 포인트 금액	Integer
	card_info 정보
	키	설명	타입
	purchase_corp	매입카드사 한글명	String
	purchase_corp_code	매입카드사 코드	String
	issuer_corp	카드발급사 한글명	String
	issuer_corp_code	카드발급사 코드	String
	bin	카드 BIN	String
	card_type	카드타입	String
	install_month	할부개월수	String
	approved_id	카드사 승인번호	String
	card_mid	카드사 가맹점번호	String */
}
