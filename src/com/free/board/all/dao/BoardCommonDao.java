package com.free.board.all.dao;

import java.util.Map;

import com.free.board.all.model.ReboardDto;
import com.free.member.model.MemberDto;

public interface BoardCommonDao {
	
	int getNextSeq();
	ReboardDto getArticle(int seq);
	
//	페이징 처리
	int newArticleCount (int bcode);
	int totalArticleCount(Map<String, String> map);
	
	void updateHit (int seq);

	int plusUp(int seq);
	int plusDown(int seq);
	int getUp(int seq);
	int getDown(int seq);

	
	void updateHit(int seq, MemberDto loginInfo);
	MemberDto updateLoginInfo(MemberDto loginInfo);
	
}
