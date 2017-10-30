package com.free.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.admin.dao.AdminDao;
import com.free.member.model.EmailAuthDto;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertEmailAuthInfo(EmailAuthDto eaDto) {
		return sqlSession.getMapper(AdminDao.class).insertEmailAuthInfo(eaDto);
	}

	@Override
	public void verifyEmail(String token) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		String email = adminDao.verifyEmail(token);
		adminDao.confirmEmail(email);
		
	}
	
}
