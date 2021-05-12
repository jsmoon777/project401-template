package com.green.ffee.user.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.user.dao.UserDao;
import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.service.UserService;
import com.green.ffee.user.vo.ProfileVo;
import com.green.ffee.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public UserVo login(LoginDTO loginDTO) {
		UserVo userVo	= userDao.login(loginDTO);
		return userVo;
	}

	@Override
	public void register(UserVo vo) {
		userDao.register(vo);
		
	}

	@Override
	public int idCheck(String user_id) {
		int checkId	= userDao.checkOverId(user_id);
		return checkId;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int checknickname	= userDao.checkOverNickname(nickname);
		return checknickname;
	}

	@Override
	public void userUpdate(UserVo vo) {
		userDao.userUpdate(vo);
	}

	@Override
	public void userDelete(String user_id) {
		userDao.userDelete(user_id);
		
	}
	
	@Override
	public void insertProfile(HashMap<String, Object> map,
			HttpServletRequest request) {

		
		
		// db 와 관련없는 로직처리 - 비지니스 로직
		// 1. request 처리  - 넘어온 파일을 처리
	    ProfileUtil.profilesave(map, request);
		
		
		// 2. 넘어온 정보 db 저장
		userDao.insertProfile(map); 
		
	}

	@Override
	public ProfileVo readProfile(String user_id) {
		return userDao.readProfile(user_id);
	}

	@Override
	public UserVo getUser(String user_id) {
		
		return userDao.getUser(user_id);
	}

	@Override
	public void deleteProfile(HashMap<String, Object> map) {
		userDao.deleteProfile(map);
	}

	@Override
	public List<UserVo> getUserList(HashMap<String, Object> map) {
		List<UserVo> userList = userDao.getUserList( map );
		return userList;
	}

	@Override
	public void adminDelete(String user_id) {
		userDao.adminDelete(user_id);
		
	}


}
