package com.green.ffee.user.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		System.out.println(" service idcheck():" + user_id);
		int checkId	= userDao.checkOverId(user_id);
		return checkId;
	}

	@Override
	public int nicknameCheck(String nickname) {
		System.out.println(" service nicknamecheck():" + nickname);
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

		//System.out.println("service1 map:" + map);
		
		// db 와 관련없는 로직처리 - 비지니스 로직
		// 1. request 처리  - 넘어온 파일을 처리
	    ProfileUtil.save(map, request);
		
	    //	System.out.println("service2 map:" + map);
		
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


}
