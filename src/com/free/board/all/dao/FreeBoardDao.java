package com.free.board.all.dao;

import java.util.List;
import java.util.Map;

import com.free.board.admin.model.BoardDto;
import com.free.board.all.model.ReboardDto;

public interface FreeBoardDao {
	int freeBoardWrite (ReboardDto reboardDto);
	
	public ReboardDto getArticle(int seq);
	
//	페이지 불러올 때 pg가 아닌 int start, int end로 
	List<ReboardDto> listArticle(Map<String, String> map);
	//답글달기!
	void replyArticle(ReboardDto dto);
	void updateStep(ReboardDto reboardDto);
	void updateReply(int pseq);
	
	int modifyArticle(BoardDto dto);
	
	//삭제하기!
	int selectDelete(int seq);
	void deleteReboard(int seq);
	void deleteBoard(int seq);
	void update_ref_reply(int pseq);
		
	List<ReboardDto> getHotList();
}
