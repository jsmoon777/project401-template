package com.green.ffee.regmenu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.ffee.regmenu.menudao.RMenuDao;
import com.green.ffee.regmenu.service.RMenuService;
import com.green.ffee.regmenu.vo.RMenuVo;

@Service("menuService")
public class RMenuServiceImpl implements RMenuService {
	
	@Autowired
	private  RMenuDao  menuDao;

	@Override
	public List<RMenuVo> getMenuList() {
		List<RMenuVo> menuList  = menuDao.getMenuList();	
		return   menuList;
	}

	@Override
	public void insertMenus(HashMap<String, Object> map) {
		
		menuDao.insertMenus(map);
		
	}

	@Override
	public List<RMenuVo> getMenuListSP(HashMap<String, Object> map) {
		
		List<RMenuVo> menuList = menuDao.getMenuList(map);
		//System.out.println("getMenuListSP() :" +  menuList);
		
		return  menuList;
	}

}






