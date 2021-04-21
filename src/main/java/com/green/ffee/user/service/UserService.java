package com.green.ffee.user.service;

import java.util.HashMap;

import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.vo.UserVo;

public interface UserService {

	UserVo login(LoginDTO loginDTO);
	
	void register(UserVo vo);

	int idCheck(String user_id);

	int nicknameCheck(String nickname);

//	UserVo getUser(String user_id);
	
}
