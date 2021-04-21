package com.green.ffee.user.dao;

import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.vo.UserVo;

public interface UserDao {

	UserVo login(LoginDTO loginDTO);

	void register(UserVo vo);

	int checkOverId(String user_id);

	int checkOverNickname(String nickname);
	
}
