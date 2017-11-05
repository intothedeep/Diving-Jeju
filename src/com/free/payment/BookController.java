package com.free.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.free.payment.model.BookDto;
import com.free.payment.service.BookService;
import com.free.store.model.StoreDto;
import com.free.store.service.StoreService;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private StoreService storeService;

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
