package com.free.payment.dao;

import com.free.payment.model.PaymentDto;

public interface PaymentDao {
	int getNextPaySeq();
	int insertPayInfo(PaymentDto payDto);
}
