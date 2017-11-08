package com.free.payment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.payment.dao.BookDao;
import com.free.payment.model.BookDto;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;

	@Override
	public int getNextBookSeq() {
		return sqlSession.getMapper(BookDao.class).getNextBookSeq();
	}

	@Override
	public int insertBookInfo(BookDto bookDto) {
		return sqlSession.getMapper(BookDao.class).insertBookInfo(bookDto);
	}

	@Override
	public List<BookDto> getBookInfoList(String bookedEmail) {
		return sqlSession.getMapper(BookDao.class).getBookInfoList(bookedEmail);
	}
	
}
