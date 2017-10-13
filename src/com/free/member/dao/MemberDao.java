package com.free.member.dao;

import java.util.List;
import java.util.Map;

import com.free.member.model.MemberDetailDto;
import com.free.member.model.MemberDto;
import com.free.member.model.ZipDto;

public interface MemberDao {

	int idCheck(String id);
	List<ZipDto> zipSearch(String dong);
	int register(MemberDetailDto memberDetailDto);
	
	MemberDto loginId(String email);
	MemberDto loginPass(Map<String, String> map);
	
	MemberDetailDto getMember(String email);
	
	int modifyMember(MemberDetailDto memberDetailDto);
	int modifyMemberDetail(MemberDetailDto memberDetailDto);
	
	int delete(String id);
	
}
