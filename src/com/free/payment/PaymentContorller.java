package com.free.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.free.payment.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentContorller {
	
	@Autowired
	private PaymentService paymentService;
	

}
