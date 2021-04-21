package com.green.ffee.regmenu.service;

import java.util.HashMap;
import java.util.List;

import com.green.ffee.regmenu.vo.RMenuVo;

public interface RMenuService {

	List<RMenuVo> getMenuList();

	void insertMenus(HashMap<String, Object> map);

	List<RMenuVo> getMenuListSP(HashMap<String, Object> map);
	
}
