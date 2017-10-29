package com.free.store.service;

import java.util.List;
import java.util.Map;

import com.free.store.model.GuesthouseDto;
import com.free.store.model.StoreFileDto;

public interface GuesthouseService {
	GuesthouseDto getGuesthouse(int guestSeq);
	List<Map<String, String>> hotGuesthouse ();
	List<String> getPics(int guestSeq);
}
