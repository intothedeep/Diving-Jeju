package com.free.board.all.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.board.admin.model.BoardDto;
import com.free.board.all.dao.FreeBoardDao;
import com.free.board.all.model.ReboardDto;
import com.free.util.Constant;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
	@Override
	public int freeBoardWrite(ReboardDto reboardDto) {
		int cnt = sqlSession.getMapper(FreeBoardDao.class).freeBoardWrite(reboardDto);
		return cnt;
	}
	
	@Override
	public ReboardDto getArticle(int seq) {
		return sqlSession.getMapper(FreeBoardDao.class).getArticle(seq);
	}

	@Override
	public List<ReboardDto> listArticle(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * Constant.LIST_SIZE;
		int start = end - Constant.LIST_SIZE;
//		System.out.println(pg + "<<<<<<<<<<pg            " + start + "<<<<<<<<<<<<start" + end + "<<<<<<<<<<<<<<<<<<,,end");
//		System.out.println(queryString.get("bcode")+ "<<<<<<<<<<<<,bcode");
		
		queryString.put("start", start + "");
		queryString.put("end", end + "");
		
		List<ReboardDto> list = sqlSession.getMapper(FreeBoardDao.class).listArticle(queryString);
		
		return list;
	}

	@Override
	public void replyArticle(ReboardDto dto) {
		FreeBoardDao dao = sqlSession.getMapper(FreeBoardDao.class);
		dao.updateStep(dto);
		dao.replyArticle(dto);
		dao.updateReply(dto.getPseq());
	}

	@Override
	public int modifyArticle(BoardDto dto) {
		int cnt = sqlSession.getMapper(FreeBoardDao.class).modifyArticle(dto);
		return cnt;
	}

	@Override
	public void deleteArticle(int seq) {
		FreeBoardDao dao = sqlSession.getMapper(FreeBoardDao.class);
		int pseq = dao.selectDelete(seq);
		dao.deleteReboard(seq);
		dao.deleteBoard(seq);
		dao.update_ref_reply(pseq);
	}

	@Override
	public List<ReboardDto> getHotList() {
		return sqlSession.getMapper(FreeBoardDao.class).getHotList();
	}
}
