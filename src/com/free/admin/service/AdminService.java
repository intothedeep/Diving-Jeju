package com.free.admin.service;

import com.free.member.model.EmailAuthDto;

public interface AdminService {
	
	int insertEmailAuthInfo (EmailAuthDto eaDto);
	void verifyEmail(String token);
}
