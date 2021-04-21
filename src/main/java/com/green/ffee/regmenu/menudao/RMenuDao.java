package com.green.ffee.regmenu.menudao;

import java.util.HashMap;
import java.util.List;

import com.green.ffee.regmenu.vo.RMenuVo;

public interface RMenuDao {

	List<RMenuVo> getMenuList();

	void insertMenus(HashMap<String, Object> map);

	List<RMenuVo> getMenuList(HashMap<String, Object> map);

}
