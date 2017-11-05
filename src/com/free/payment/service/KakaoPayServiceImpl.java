package com.free.payment.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KakaoPayServiceImpl implements KakaoPayService {
	@Autowired
	private SqlSession sqlSession;
	
	
}
