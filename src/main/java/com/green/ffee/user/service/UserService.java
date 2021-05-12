package com.green.ffee.user.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.vo.ProfileVo;
import com.green.ffee.user.vo.UserVo;

public interface UserService {

	UserVo login(LoginDTO loginDTO);
	
	void register(UserVo vo);

	int idCheck(String user_id);

	int nicknameCheck(String nickname);

	void userUpdate(UserVo vo);

	void userDelete(String user_id);

	void insertProfile(HashMap<String, Object> map, HttpServletRequest request);

	ProfileVo readProfile(String user_id);

	UserVo getUser(String user_id);

	void deleteProfile(HashMap<String, Object> map);

	List<UserVo> getUserList(HashMap<String, Object> map);

	void adminDelete(String user_id);

}
