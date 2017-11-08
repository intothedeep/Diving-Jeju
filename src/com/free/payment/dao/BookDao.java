package com.free.payment.dao;

import java.util.List;

import com.free.payment.model.BookDto;

public interface BookDao {
	int getNextBookSeq();
	int insertBookInfo(BookDto bookDto);
	List<BookDto> getBookInfoList(String bookedEmail);

}
