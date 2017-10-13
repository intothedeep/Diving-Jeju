package com.free.board.all.dao;

import java.util.List;

import com.free.board.all.model.MemoDto;

public interface MemoDao {
	int getMseq();
	void writeMemo(MemoDto memoDto);
	List<MemoDto> listMemo(int seq);
	void modifyMemo(MemoDto memoDto);
	void deleteMemo(int mseq);
	void plusUp(int mseq);
}
