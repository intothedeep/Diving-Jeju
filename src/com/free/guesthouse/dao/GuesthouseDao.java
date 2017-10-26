package com.free.guesthouse.dao;

import java.util.List;

import com.free.board.all.model.AlbumDto;
import com.free.guesthouse.model.GuesthouseDto;

public interface GuesthouseDao {
	GuesthouseDto getGuesthouse(int guestSeq);
	List<AlbumDto> hotGuesthouse ();

}
