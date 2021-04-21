package com.green.ffee.member.service;

import com.green.ffee.member.vo.MemberVO;

public interface MemberService {

	void register(MemberVO vo);

	MemberVO login(MemberVO vo);

}
