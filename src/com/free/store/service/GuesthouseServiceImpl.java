package com.free.store.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.store.dao.GuesthouseDao;
import com.free.store.model.GuesthouseDto;
import com.free.store.model.StoreFileDto;

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
	public List<Map<String, String>> hotGuesthouse() {
		return sqlSession.getMapper(GuesthouseDao.class).hotGuesthouse();
	}

	@Override
	public List<String> getPics(int guestSeq) {
		return sqlSession.getMapper(GuesthouseDao.class).getPics(guestSeq);
	}
	
}
