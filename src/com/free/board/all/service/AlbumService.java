package com.free.board.all.service;

import java.util.List;

import com.free.board.all.model.AlbumDto;

public interface AlbumService {
	int writeArticle(AlbumDto albumDto);
	AlbumDto getArticle(int seq);
	List<AlbumDto> listArticle(int bcode, int pg, String key, String word);
	int modifyArticle(AlbumDto albumDto);
	int deleteArticle(int seq);
	
	void storeFile(AlbumDto albumDto);
	List<AlbumDto> list(int bcode);
	AlbumDto getFileInfo(int aseq);
	
	void deleteUpdatedToOne(int aseq);
	void modify(AlbumDto infoForAlbumDtoBeingModified);
}
