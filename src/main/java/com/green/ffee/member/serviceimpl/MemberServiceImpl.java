package com.green.ffee.member.serviceimpl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.ffee.member.dao.MemberDAO;
import com.green.ffee.member.service.MemberService;
import com.green.ffee.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	//회원가입
	@Override
	public void register(MemberVO vo) {
		dao.register(vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

}
