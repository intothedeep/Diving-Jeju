package com.free.board.all.service;

import java.util.List;
import java.util.Map;

import com.free.board.admin.model.BoardDto;
import com.free.board.all.model.ReboardDto;

public interface FreeBoardService {
	int freeBoardWrite (ReboardDto dto);
	public ReboardDto getArticle(int seq);
	
	List<ReboardDto> listArticle(Map<String, String> queryString);
	void replyArticle(ReboardDto dto);
	
	int modifyArticle(BoardDto dto);
	void deleteArticle(int seq);
	
	List<ReboardDto> getHotList();
}
