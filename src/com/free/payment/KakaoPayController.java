package com.free.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.free.payment.model.KakaoPayApproveDto;
import com.free.payment.model.KakaoPayReadyDto;
import com.free.payment.service.KakaoPayService;

@Controller
@RequestMapping("/kakaopay")
public class KakaoPayController {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	private String adminKey = "1e479a3f02a3b22d0ae49cf155fb103f";

	@RequestMapping(value="initpay.html", method=RequestMethod.POST)
	@ResponseBody
	private ResponseEntity<String> initPay(
			@RequestParam("storeName") String storeName, 
			@RequestParam("authorization") String authorization,
			@RequestParam("partner_user_id") String partner_user_id,
			HttpSession session) {
		
		KakaoPayReadyDto kakaoPayReadyDto = new KakaoPayReadyDto();
		kakaoPayReadyDto.setItem_name(storeName);

		MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.add("cid", kakaoPayReadyDto.getCid());
		map.add("partner_order_id", kakaoPayReadyDto.getPartner_order_id());
		map.add("partner_user_id", partner_user_id);
		map.add("item_name", kakaoPayReadyDto.getItem_name());
		map.add("quantity", kakaoPayReadyDto.getQuantity() + "");
		map.add("total_amount", kakaoPayReadyDto.getTotal_amount() + "");
		map.add("vat_amount", kakaoPayReadyDto.getVat_amount() + "");
		map.add("tax_free_amount", kakaoPayReadyDto.getTax_free_amount() + "");
		map.add("approval_url", kakaoPayReadyDto.getApproval_url());
		map.add("fail_url", kakaoPayReadyDto.getFail_url());
		map.add("cancel_url", kakaoPayReadyDto.getCancel_url());
		  
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		어드민 키로 등록하기
//		headers.add("Authorization", "KakaoAK " + adminKey);
//		사용자 accessToken
		headers.add("Authorization", "Bearer " + authorization);
	    
	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<String> response = restTemplate.postForEntity(kakaoPayReadyDto.getReadyUrl(), request , String.class );
		System.out.println(response);
		
		String[] a1 = response.toString().split(",");
		String[] a2 = a1[1].split(":");
		String tid = a2[1].replaceAll("\"", "");
		//System.out.println(tid);
		
		session.setAttribute("authorization", authorization);
		session.setAttribute("partner_user_id", partner_user_id);
		session.setAttribute("tid", tid);
		
	    return response;
	}
	
	@RequestMapping(value="/payok", method=RequestMethod.GET)
	public ModelAndView payOk(@RequestParam(value="pg_token") String pg_token){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/payment/payok");
		mav.addObject("pg_token", pg_token);
		return mav;
	}
	
	@RequestMapping(value="/approvepay.html", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> approvePay(@RequestParam("pg_token") String pg_token, HttpSession session){

		KakaoPayApproveDto kakaoPayApproveDto = new KakaoPayApproveDto();
		kakaoPayApproveDto.setPg_token(pg_token);
		kakaoPayApproveDto.setTid((String) session.getAttribute("tid"));
		kakaoPayApproveDto.setPartner_user_id((String) session.getAttribute("partner_user_id"));
		String authorization = (String) session.getAttribute("authorization");
		
		//pg_token과 tid를 가져와야 한다. 어떻게 가져오지??? redirect 될 때 pg_token만 보내 주는데...
		MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
		map.add("cid",	kakaoPayApproveDto.getCid());
		map.add("partner_order_id",	kakaoPayApproveDto.getPartner_order_id());
		map.add("partner_user_id",	kakaoPayApproveDto.getPartner_user_id());
		map.add("pg_token",	kakaoPayApproveDto.getPg_token());
		map.add("tid",	kakaoPayApproveDto.getTid());
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		headers.add("Authorization", "Bearer " + authorization);

	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
	    RestTemplate restTemplate = new RestTemplate();
	    
	    ResponseEntity<String> response = restTemplate.postForEntity(kakaoPayApproveDto.getApproveUrl(), request , String.class);
	    System.out.println(response);
	    
	    session.removeAttribute("tid");
	    session.removeAttribute("partner_user_id");
	    session.removeAttribute("authorization");
	    
		return response;
		
	}
}
