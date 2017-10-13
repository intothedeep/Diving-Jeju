package com.free.store.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
}
