package com.free.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.free.member.dao.MemberDao;
import com.free.member.model.MemberDetailDto;
import com.free.member.model.MemberDto;
import com.free.member.model.ZipDto;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	//@Qualifier("name")
	private SqlSession sqlSession;
	
	@Override
	public MemberDto loginId(String email) {
		return sqlSession.getMapper(MemberDao.class).loginId(email);
	}

	@Override
	public MemberDto loginPass(Map<String, String> map) {
		return sqlSession.getMapper(MemberDao.class).loginPass(map);
	}
	
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ZipDto> zipSearch(String dong) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(MemberDetailDto memberDetailDto) {
		int cnt = sqlSession.getMapper(MemberDao.class).register(memberDetailDto);
		return cnt;
	}

	@Override
	public MemberDetailDto getMember(String email) {
		MemberDetailDto memberInfo = sqlSession.getMapper(MemberDao.class).getMember(email);
		return memberInfo;
	}

	@Override
	public void modify(MemberDetailDto memberDetailDto) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.modifyMember(memberDetailDto);
		dao.modifyMemberDetail(memberDetailDto);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIfKakaoisInDB(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).checkIfKakaoisInDB(memberDto);

	}
}
