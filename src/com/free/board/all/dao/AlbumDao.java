package com.free.board.all.dao;

import java.util.List;
import java.util.Map;

import com.free.board.all.model.AlbumDto;

public interface AlbumDao {
	int writeArticle(AlbumDto albumDto);
	AlbumDto getArticle(int seq);
	List<AlbumDto> listArticle(Map<String, String> map);		
	int modifyArticle(AlbumDto albumDto);
	int deleteArticle(int seq);
	
	void storeFile(AlbumDto albumDto);
	List<AlbumDto> list(int bcode);
	AlbumDto getFileInfo(int aseq);
	
	void deleteUpdatedToOne(int aseq);
}
