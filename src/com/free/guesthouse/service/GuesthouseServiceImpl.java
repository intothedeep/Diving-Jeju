package com.free.guesthouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.board.all.model.AlbumDto;
import com.free.guesthouse.dao.GuesthouseDao;
import com.free.guesthouse.model.GuesthouseDto;

@Service
public class GuesthouseServiceImpl implements GuesthouseService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;

	@Override
	public GuesthouseDto getGuesthouse(int guestSeq) {
		return sqlSession.getMapper(GuesthouseDao.class).getGuesthouse(guestSeq);
	}

	@Override
	public List<AlbumDto> hotGuesthouse() {
		return sqlSession.getMapper(GuesthouseDao.class).hotGuesthouse();
	}
	
}
