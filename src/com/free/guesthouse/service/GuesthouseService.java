package com.free.guesthouse.service;

import java.util.List;

import com.free.board.all.model.AlbumDto;
import com.free.guesthouse.model.GuesthouseDto;

public interface GuesthouseService {
	GuesthouseDto getGuesthouse(int guestSeq);
	List<AlbumDto> hotGuesthouse ();
}
