package com.green.ffee.reg.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.ffee.reg.service.RBoardService;
import com.green.ffee.reg.vo.RBoardVo;
import com.green.ffee.regmenu.service.RMenuService;
import com.green.ffee.regmenu.vo.RMenuVo;

@Controller
public class RBoardController {
	
	@Autowired
	private  RBoardService  boardService;
	
	@Autowired
	private  RMenuService   menuService;
		
	@RequestMapping("/MBoard")
	public ModelAndView Home() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu_id", "MENU01");
		
		List<RBoardVo> boardDateList = boardService.getBoardDateList( map );
		List<RBoardVo> boardLikeList = boardService.getBoardLikeList( map );
		/*
		 * System.out.println("date" + boardDateList.size()); System.out.println("like"
		 * + boardLikeList.size());
		 */
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/");  // list.jsp
		mv.addObject("boardLikeList",   boardLikeList );
		mv.addObject("boardDateList",  boardDateList );
		
		return mv;
	}
	
	@RequestMapping("/MBoard/List")
	public ModelAndView  mBoardList( String menu_id  ) {
		
		// map : 파라미터 in, out 모드로 사용
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu_id", menu_id); // 가지고 올 메뉴아이디 (in)
		
		// 메뉴 목록
		List<RMenuVo>  menuList = menuService.getMenuList(); 
		
		// 게시물 목록
		List<RBoardVo> boardList = boardService.getBoardList( map );
						
		ModelAndView mv = new ModelAndView();
		mv.setViewName("list");  // list.jsp
		mv.addObject("menu_id",   menu_id );
		mv.addObject("menuList",  menuList );
		mv.addObject("boardList", boardList );
		return  mv;
	} 
	
	@RequestMapping("/MBoard/WriteForm")
	public  ModelAndView   writeForm( RBoardVo vo ) {
		
		List<RMenuVo> menuList = menuService.getMenuList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id",  vo.getMenu_id() );
		mv.addObject("board",       vo );
		mv.addObject("menuList", menuList);
		mv.setViewName("pds/write");
		return  mv;
	}
	
	@RequestMapping("/MBoard/Write")
	public  String   write(  RBoardVo vo  ) {
		// menu_id, title, cont, writer
		System.out.println("write():" + vo);
		boardService.insertBoard( vo );
		String  menu_id = vo.getMenu_id();
		return  "redirect:/MBoard/List?menu_id=" + menu_id;
	}
	
	@RequestMapping("/MBoard/View")
	public  ModelAndView  view(
		@RequestParam	HashMap<String, Object> map ) {
		
		String menu_id  = (String) map.get("menu_id"); 
		
		List<RMenuVo> menuList = menuService.getMenuList();
				
		RBoardVo boardVo = boardService.getView( map ); 
		System.out.println(boardVo);
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menu_id",  menu_id);		
		mv.addObject("menuList", menuList);		
		mv.addObject("board",    boardVo);		
		mv.setViewName("view");
		return mv;
	} 

	
	@RequestMapping("/MBoard/UpdateForm")
	public  ModelAndView  updateForm(
			@RequestParam	HashMap<String, Object> map ) {
		
		String menu_id = (String) map.get("menu_id");
		
		List<RMenuVo> menuList = menuService.getMenuList();
		
		// 수정할 자료 조회
		RBoardVo boardVo = boardService.getView( map ); 
				
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menu_id",  menu_id);		
		mv.addObject("menuList", menuList);		
		mv.addObject("board",   boardVo);		
		mv.setViewName("update");
		return mv;
	} 
	
	@RequestMapping("/MBoard/Update")
	public  ModelAndView  update(
			@RequestParam	HashMap<String, Object> map ) {
		System.out.println("update():" + map);
		
		String  menu_id = (String) map.get("menu_id");
		
		boardService.updateBoard( map ); 
		
		ModelAndView  mv  = new ModelAndView();			
		mv.setViewName("redirect:/MBoard/List?menu_id=" + menu_id);
		return mv;
	} 
	
	@RequestMapping("/MBoard/Delete")
	public  ModelAndView  delete(
			@RequestParam	HashMap<String, Object> map ) {
		System.out.println("delete():" + map);
		
		String  menu_id = (String) map.get("menu_id");
		
		boardService.deleteBoard( map ); 
		
		ModelAndView  mv  = new ModelAndView();			
		mv.setViewName("redirect:/MBoard/List?menu_id=" + menu_id);
		return mv;
	} 
	
	@RequestMapping("/MBoard/Like")
	@ResponseBody
	public ResponseEntity<String> like(@RequestParam HashMap<String, Object> map) {
		System.out.println(map.get("menu_id"));
		System.out.println(map.get("idx"));
        boardService.likeBoard(map);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}















