package com.free.member.service;

import java.util.List;
import java.util.Map;

import com.free.member.model.MemberDetailDto;
import com.free.member.model.MemberDto;
import com.free.member.model.ZipDto;

public interface MemberService {

	int idCheck(String id);
	List<ZipDto> zipSearch(String dong);
	int register(MemberDetailDto memberDetailDto);
	
	MemberDto loginId(String email);
	MemberDto loginPass(Map<String, String> map);
	
	MemberDetailDto getMember(String emgail);
	
	void modify(MemberDetailDto memberDetailDto);
	
	int delete(String id);
	
	int checkIfKakaoisInDB(MemberDto memberDto);
	
}
