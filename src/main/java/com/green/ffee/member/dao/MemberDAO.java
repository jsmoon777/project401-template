package com.green.ffee.member.dao;

import com.green.ffee.member.vo.MemberVO;

public interface MemberDAO {

	void register(MemberVO vo);

	MemberVO login(MemberVO vo);

}
