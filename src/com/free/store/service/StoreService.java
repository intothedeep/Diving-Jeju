package com.free.store.service;

import java.util.List;
import java.util.Map;

import com.free.store.model.StoreFileDto;

public interface StoreService {
	
	void storeFile(StoreFileDto storeFileDto);
	List<StoreFileDto> list(Map<String, String> map);
	StoreFileDto getFileInfo(int storeFileSeq);
	
	int getNextStoreFileSeq();
	int getStoreSeq(String email);
	
	void deleteUpdatedToOne(int storeFileSeq);
	void modify(StoreFileDto infoForAlbumDtoBeingModified);
	
	void isTitleAllTo0(int storeSeq);
	void updateTitlePic(int storeSeq, int storeFileSeq);
}
