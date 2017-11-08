package com.free.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.free.payment.model.BookDto;
import com.free.payment.model.PaymentDto;
import com.free.payment.service.BookService;
import com.free.payment.service.PaymentService;
import com.free.store.model.StoreDto;
import com.free.store.service.StoreService;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private StoreService storeService;

	@RequestMapping(value="/list", produces="application/json;charset=UTF-8", method=RequestMethod.GET)
	@ResponseBody
	public List<BookDto> listBookInfo(@RequestParam("email") String bookedEmail){
		List<BookDto> list = bookService.getBookInfoList(bookedEmail);
		return list;
	}

	
	@RequestMapping(value="/bookinfo", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertBookInfo(@ModelAttribute BookDto bookDto){		
		Map<String, String> map = new HashMap<>();

		//1 페이먼트seq를 생성해서
		int paySeq = paymentService.getNextPaySeq();
		
		//2 페이먼트 테이블에 결제 정보 저장
		bookDto.setPaySeq(paySeq);
		bookDto.setPayReceived(bookDto.getTotalPrice());
		PaymentDto payDto = (PaymentDto) bookDto;
		int statusForPayInfo = paymentService.insertPayInfo(payDto);
		if(statusForPayInfo == 0) {
			map.put("statusForPayInfo", "0");
			return map;
		}
		
		//3 bookSeq를 생성
		int bookSeq = bookService.getNextBookSeq();
		//4 이정보를 가지고 book 테이블에 정보 저장
		bookDto.setBookSeq(bookSeq);
		int statusForBookInfo = bookService.insertBookInfo(bookDto);
		//5 isPaid 컬럼은 카카오 페이가 끝난 뒤에 업데이트
		
		if(statusForBookInfo == 0) {
			map.put("statusForBookInfo", "0");
			return map;
		}
		
		map.put("statusForPayInfo", statusForPayInfo + "");
		map.put("statusForBookInfo", statusForBookInfo + "");
		
		return map;
	}

	
	@RequestMapping(value="bookstart", method=RequestMethod.GET)
	public ModelAndView moveToPayConfirm(@ModelAttribute BookDto bookDto, @RequestParam("guestSeq") int guestSeq) {
		StoreDto storeDto = storeService.getStoreInfoWithGuestSeq(guestSeq);
		bookDto.setStoreSeq(storeDto.getStoreSeq());
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookDto", bookDto);
		mav.addObject("storeDto", storeDto);
		mav.setViewName("/WEB-INF/payment/payconfirm");
		return mav;
	}
}
