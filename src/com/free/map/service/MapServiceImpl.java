package com.free.map.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.guesthouse.model.GuesthouseDto;
import com.free.map.dao.MapDao;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;

	@Override
	public List<GuesthouseDto> showGuesthouseList() {
		return sqlSession.getMapper(MapDao.class).showGuesthouseList();
	}
	
}
