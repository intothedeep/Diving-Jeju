package com.free.payment.service;

import com.free.payment.model.PaymentDto;

public interface PaymentService {
	int getNextPaySeq();
	int insertPayInfo(PaymentDto payDto);
	
}
