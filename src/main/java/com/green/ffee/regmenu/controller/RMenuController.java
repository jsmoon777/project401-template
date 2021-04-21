package com.green.ffee.regmenu.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.ffee.regmenu.service.RMenuService;
import com.green.ffee.regmenu.vo.RMenuVo;

@Controller
public class RMenuController {
	
	@Autowired
	private  RMenuService  menuService;
		
	@RequestMapping("/Menus/List")
	public  String  menuList ( Model model ) {
	
		List<RMenuVo> menuList = menuService.getMenuList();
		//System.out.println("MenuCont menuList():" + menuList);
		
		model.addAttribute("menuList", menuList );		
		return "menus/menulist";     
		
	}  
	
	// Stored Procedure GetList
	//  ModelAndView : 
	//  =   Model : 전달될 data
	//    + View  : 이동할 파일명  .jsp 정보
	@RequestMapping("/Menus/ListSP")
	public  ModelAndView  menuListSP (  ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("menu_id", "MENU01");
		
		// map 파라미터 : inout, output(cursor 돌려받는) 역활 
		List<RMenuVo> menuList = menuService.getMenuListSP(map);
		System.out.println("menuListSP() :" +  menuList);
		
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("menus/menulist");    // View
		mv.addObject("menuList", menuList);  // Model
		
		return  mv;     
		
	}  
	
	@RequestMapping("/Menus/WriteForm")
	public  String  menuWriteForm (  ) {		
		return "menus/menuwrite";     		
	}  
	
	@RequestMapping("/Menus/Write")
	public  String  menuWrite ( RMenuVo vo ) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu_name", vo.getMenu_name() );
		
		menuService.insertMenus( map );
		
		return  "redirect:/Menus/List";     		
	}  
	
}











