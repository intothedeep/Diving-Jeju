package com.free.payment.service;

import java.util.List;

import com.free.payment.model.BookDto;

public interface BookService {
	int getNextBookSeq();
	int insertBookInfo(BookDto bookDto);
	List<BookDto> getBookInfoList(String bookedEmail);
}
