package com.green.ffee.reg.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.ffee.pds.service.RPdsService;
import com.green.ffee.reg.service.RBoardService;
import com.green.ffee.reg.vo.RBoardFileVo;
import com.green.ffee.reg.vo.RBoardFileVo2;
import com.green.ffee.reg.vo.RBoardFileVo3;
import com.green.ffee.reg.vo.RBoardFileVo4;
import com.green.ffee.reg.vo.RBoardVo;
import com.green.ffee.regmenu.service.RMenuService;
import com.green.ffee.regmenu.vo.RMenuVo;
import com.green.ffee.user.vo.UserVo;

@Controller
public class RBoardController {
	
	@Autowired
	private  RBoardService  boardService;
	
	@Autowired
	private  RMenuService   menuService;
	
	@Autowired
	private RPdsService   pdsService;
	
		
	@RequestMapping("/") 
	public ModelAndView Home() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		/* map.put("menu_id", "MENU02"); */
		
		
		List<RBoardFileVo> rBoardFileList   = boardService.getRBoardFileList( map );
		List<RBoardFileVo2> rBoardFileList2 = boardService.getRBoardFileList2( map );
		List<RBoardFileVo3> rBoardFileList3 = boardService.getRBoardFileList3( map );
		List<RBoardFileVo4> rBoardFileList4 = boardService.getRBoardFileList4( map );
		/* System.out.println(rBoardFileList); */
		
//		 List<RBoardVo> boardDateList = boardService.getBoardDateList( map );
//		 List<RBoardVo> boardLikeList = boardService.getBoardLikeList( map );
//		 List<RFilesVo> filesList = pdsService.getFileList( map );
//		  System.out.println("contoller" + filesList);
		 
		/*
		 * System.out.println("date" + boardDateList.size()); System.out.println("like"
		 * + boardLikeList.size());
		 */
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");  // list.jsp
		mv.addObject("rBoardFileList",   rBoardFileList );
		mv.addObject("rBoardFileList2",  rBoardFileList2 );
		mv.addObject("rBoardFileList3",  rBoardFileList3 );
		mv.addObject("rBoardFileList4",  rBoardFileList4 );
		/* mv.addObject("filesList", filesList ); */
	
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
		@RequestParam	HashMap<String, Object> map, HttpSession session, UserVo uservo) {
		
		uservo = (UserVo) session.getAttribute("login");
		
		String menu_id  = (String) map.get("menu_id"); 
		
		List<RMenuVo> menuList = menuService.getMenuList();
				
		RBoardVo boardVo = boardService.getView( map ); 
		System.out.println(boardVo);
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menu_id",  menu_id);		
		mv.addObject("menuList", menuList);		
		mv.addObject("board",    boardVo);	
		mv.addObject("login",    uservo);	
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
	
	@RequestMapping(value="/MBoard/Like", method = RequestMethod.GET)

	public String likeBoard(RBoardVo vo ,@RequestParam int idx, RedirectAttributes rttr) throws Exception {
        boardService.likeBoard(idx);
        
        rttr.addAttribute("idx", vo.getIdx());
        rttr.addAttribute("likeNum", vo.getlikeNum());
        return "redirect:/MBoard/List";
	}
}















