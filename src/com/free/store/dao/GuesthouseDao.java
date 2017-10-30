package com.free.store.dao;

import java.util.List;
import java.util.Map;

import com.free.store.model.GuesthouseDto;

public interface GuesthouseDao {
	GuesthouseDto getGuesthouse(int guestSeq);
	List<Map<String, String>> hotGuesthouse ();
	List<String> getPics(int guestSeq);


}
