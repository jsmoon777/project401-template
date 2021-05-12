package com.green.ffee.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.vo.ProfileVo;
import com.green.ffee.user.vo.UserVo;

public interface UserDao {

	UserVo login(LoginDTO loginDTO);

	void register(UserVo vo);

	int checkOverId(String user_id);

	int checkOverNickname(String nickname);

	void userUpdate(UserVo vo);

	void userDelete(String user_id);

	void insertProfile(Map<String, Object> map);

	ProfileVo readProfile(String user_id);

	UserVo getUser(String user_id);

	void deleteProfile(Map<String, Object> map);

	List<UserVo> getUserList(HashMap<String, Object> map);

	void adminDelete(String user_id);
	
}
