package com.free.board.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
}
