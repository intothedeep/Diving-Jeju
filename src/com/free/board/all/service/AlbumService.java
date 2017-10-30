package com.free.board.all.service;

import java.util.List;
import java.util.Map;

import com.free.board.all.model.AlbumDto;

public interface AlbumService {
	int writeArticle(AlbumDto albumDto);
	AlbumDto getArticle(int seq);
	List<AlbumDto> listArticle(int bcode, int pg, String key, String word);
	int modifyArticle(AlbumDto albumDto);
	int deleteArticle(int seq);

}
