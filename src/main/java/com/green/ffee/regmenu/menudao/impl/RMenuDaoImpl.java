package com.green.ffee.regmenu.menudao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.regmenu.menudao.RMenuDao;
import com.green.ffee.regmenu.vo.RMenuVo;

@Repository("menuDao")
public class RMenuDaoImpl implements RMenuDao {

	@Autowired
	private  SqlSession  sqlSession;
	
	@Override
	public List<RMenuVo> getMenuList() {
		
	//  일반 <select>
		List<RMenuVo> menuList = sqlSession.selectList("Menus.MenuList");
		
		return   menuList;
	}

	@Override
	public void insertMenus(HashMap<String, Object> map) {
		
		sqlSession.insert("Menus.MenuInsert", map);
		
	}

	@Override
	public List<RMenuVo> getMenuList(HashMap<String, Object> map) {
		
		// sp cursor 값을 map 으로 돌려받는 호출
		sqlSession.selectList("Menus.MenuListSP", map ); // map : out 의미
		
		List<RMenuVo> menuList  = (List<RMenuVo>) map.get("result"); 
		//System.out.println("menuDao() :" +  menuList);
		
		return   menuList;
	}

}








