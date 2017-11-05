package com.free.store.dao;

import java.util.List;
import java.util.Map;

import com.free.store.model.StoreDto;
import com.free.store.model.StoreFileDto;

public interface StoreDao {
	void storeFile(StoreFileDto storeFileDto);
	List<StoreFileDto> list(Map<String, String> map);
	StoreFileDto getFileInfo(int storeFileSeq);
	
	void deleteUpdatedToOne(int storeFileSeq);
	
	int getNextStoreFileSeq();
	int getStoreSeq(String email);
	StoreDto getStoreInfoWithGuestSeq(int guestSeq);

	void isTitleAllTo0(int storeSeq);
	void updateTitlePic(int storeFileSeq);
}
