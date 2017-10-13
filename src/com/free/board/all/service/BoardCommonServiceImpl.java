package com.free.board.all.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.board.all.dao.BoardCommonDao;
import com.free.board.all.model.ReboardDto;
import com.free.member.model.MemberDto;
import com.free.util.Constant;
import com.free.util.PageNavigation;

@Service
public class BoardCommonServiceImpl implements BoardCommonService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
	@Override
	public int getNextSeq() {
		return sqlSession.getMapper(BoardCommonDao.class).getNextSeq();
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> queryString) {
		PageNavigation pageNavigation = new PageNavigation();
		int newArticleCount = sqlSession.getMapper(BoardCommonDao.class).newArticleCount(Integer.parseInt(queryString.get("bcode")));
		pageNavigation.setNewArticleCount(newArticleCount);
		int totalArticleCount = sqlSession.getMapper(BoardCommonDao.class).totalArticleCount(queryString);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / Constant.LIST_SIZE + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		int pg = Integer.parseInt(queryString.get("pg"));
		pageNavigation.setNowFirst(pg <= Constant.PAGE_SIZE);
		pageNavigation.setNowEnd((totalPageCount - 1) / Constant.PAGE_SIZE * Constant.PAGE_SIZE < pg);
		pageNavigation.setPageNo(pg);	
		return pageNavigation;
	}

	@Override
	public void updateHit(int seq) {
		sqlSession.getMapper(BoardCommonDao.class).updateHit(seq);
	}

	@Override
	public int plusUp(int seq) {
		BoardCommonDao dao = sqlSession.getMapper(BoardCommonDao.class);
		dao.plusUp(seq);
		return dao.getUp(seq);
	}

	@Override
	public int plusDown(int seq) {
		BoardCommonDao dao = sqlSession.getMapper(BoardCommonDao.class);
		dao.plusDown(seq);
		return dao.getDown(seq);
	}

	@Override
	public void callCommonDaoUpdateHit(int seq, MemberDto loginInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDto updateLoginInfo(MemberDto loginInfo) {
		// TODO Auto-generated method stub
		return null;
	}

}
