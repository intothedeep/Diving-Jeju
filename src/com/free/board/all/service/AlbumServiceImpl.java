package com.free.board.all.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.board.all.dao.AlbumDao;
import com.free.board.all.dao.BoardCommonDao;
import com.free.board.all.model.AlbumDto;

@Service
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(AlbumDto albumDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AlbumDto getArticle(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AlbumDto> listArticle(int bcode, int pg, String key, String word) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyArticle(AlbumDto albumDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}




}
