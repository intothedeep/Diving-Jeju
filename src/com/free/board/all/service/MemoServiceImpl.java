package com.free.board.all.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.board.all.dao.MemoDao;
import com.free.board.all.model.MemoDto;

@Service
public class MemoServiceImpl implements MemoService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getMseq() {
		return sqlSession.getMapper(MemoDao.class).getMseq();
	}
	
	@Override
	public void writeMemo(MemoDto memoDto) {
		int mseq = getMseq();
		memoDto.setMseq(mseq);
		sqlSession.getMapper(MemoDao.class).writeMemo(memoDto);		
	}

	@Override
	public List<MemoDto> listMemo(int seq) {
		return sqlSession.getMapper(MemoDao.class).listMemo(seq);
	}

	@Override
	public void modifyMemo(MemoDto memoDto) {
		sqlSession.getMapper(MemoDao.class).modifyMemo(memoDto);
	}

	@Override
	public void deleteMemo(int mseq) {
		sqlSession.getMapper(MemoDao.class).deleteMemo(mseq);
	}

	@Override
	public void plusUp(int mseq) {
		sqlSession.getMapper(MemoDao.class).plusUp(mseq);
	}


}
