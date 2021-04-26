package com.green.ffee.user.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.user.dao.UserDao;
import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVo login(LoginDTO loginDTO) {
		UserVo	userVo	=	sqlSession.selectOne("User.Login", loginDTO);
		return userVo;
	}

	@Override
	public void register(UserVo vo) {
		sqlSession.insert("User.Register", vo);
		
	}

	@Override
	public int checkOverId(String user_id) {
		int	result	=	sqlSession.selectOne("User.checkOverId", user_id);
		return result;
		
	}

	@Override
	public int checkOverNickname(String nickname) {
		int	result	=	sqlSession.selectOne("User.checkOverNickname", nickname);
		return result;
	}

	@Override
	public void userUpdate(UserVo vo) {
		sqlSession.update("User.userUpdate", vo);
		
	}

	@Override
	public void userDelete(String user_id) {
		sqlSession.delete("User.userDelete", user_id);
		
	}

}
