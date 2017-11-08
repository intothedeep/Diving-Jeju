package com.free.payment.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.payment.dao.PaymentDao;
import com.free.payment.model.PaymentDto;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;

	@Override
	public int getNextPaySeq() {
		return sqlSession.getMapper(PaymentDao.class).getNextPaySeq();
	}

	@Override
	public int insertPayInfo(PaymentDto payDto) {
		return sqlSession.getMapper(PaymentDao.class).insertPayInfo(payDto);
	}
	
}
