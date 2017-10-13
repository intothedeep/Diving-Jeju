package com.free.board.all.service;

import java.util.Map;

import com.free.board.all.model.ReboardDto;
import com.free.member.model.MemberDto;
import com.free.util.PageNavigation;

public interface BoardCommonService {
	int getNextSeq();
	PageNavigation makePageNavigation(Map<String, String> queryString);
	
	void updateHit (int seq);
	
	int plusUp(int seq);
	int plusDown(int seq);

	void callCommonDaoUpdateHit (int seq, MemberDto loginInfo);
	MemberDto updateLoginInfo(MemberDto loginInfo);
}
