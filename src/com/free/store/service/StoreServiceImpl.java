package com.free.store.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.store.dao.StoreDao;
import com.free.store.model.StoreDto;
import com.free.store.model.StoreFileDto;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
	@Override
	public void storeFile(StoreFileDto storeFileDto) {
		sqlSession.getMapper(StoreDao.class).storeFile(storeFileDto);
	}
	
	@Override
	public void modify(StoreFileDto infoForAlbumDtoBeingModified) {
		sqlSession.getMapper(StoreDao.class).storeFile(infoForAlbumDtoBeingModified);
	}
	
	@Override
	public void deleteUpdatedToOne(int storeFileSeq) {
		sqlSession.getMapper(StoreDao.class).deleteUpdatedToOne(storeFileSeq);
		
	}	
	
	@Override
	public List<StoreFileDto> list(Map<String, String> map) {
		List<StoreFileDto> list = sqlSession.getMapper(StoreDao.class).list(map);
		return list;
	}

	@Override
	public StoreFileDto getFileInfo(int storeFileSeq) {
		return sqlSession.getMapper(StoreDao.class).getFileInfo(storeFileSeq);
	}
	

	@Override
	public int getNextStoreFileSeq() {
		return sqlSession.getMapper(StoreDao.class).getNextStoreFileSeq();
	}

	@Override
	public int getStoreSeq(String email) {
		return sqlSession.getMapper(StoreDao.class).getStoreSeq(email);
	}

	@Override
	public void isTitleAllTo0(int storeSeq) {
		sqlSession.getMapper(StoreDao.class).isTitleAllTo0(storeSeq);
	}

	@Override
	public void updateTitlePic(int storeSeq, int storeFileSeq) {
		StoreDao storeDao = sqlSession.getMapper(StoreDao.class);
		storeDao.isTitleAllTo0(storeSeq);
		storeDao.updateTitlePic(storeFileSeq);
	}

	@Override
	public StoreDto getStoreInfoWithGuestSeq(int guestSeq) {
		return sqlSession.getMapper(StoreDao.class).getStoreInfoWithGuestSeq(guestSeq);
	}
}
