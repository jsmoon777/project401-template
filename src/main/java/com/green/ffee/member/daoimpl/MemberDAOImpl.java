package com.green.ffee.member.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.member.dao.MemberDAO;
import com.green.ffee.member.vo.MemberVO;




@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired 
	SqlSession sqlsession;
	
	//회원가입
	@Override
	public void register(MemberVO vo) {
		sqlsession.insert("memberMapper.register",vo);

	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return sqlsession.selectOne("memberMapper.login",vo);
	}
}
