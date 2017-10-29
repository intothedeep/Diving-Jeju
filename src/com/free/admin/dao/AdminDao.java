package com.free.admin.dao;

import com.free.member.model.EmailAuthDto;

public interface AdminDao {
	int insertEmailAuthInfo (EmailAuthDto eaDto);
	String verifyEmail(String token);
	void confirmEmail(String email);
}
