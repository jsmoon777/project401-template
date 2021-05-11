package com.green.ffee.pds.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.ffee.pds.service.RPdsService;
import com.green.ffee.pds.vo.RFilesVo;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.reg.service.RBoardService;
import com.green.ffee.reg.vo.RBoardVo;
import com.green.ffee.regmenu.service.RMenuService;
import com.green.ffee.regmenu.vo.RMenuVo;

@Controller
public class RPdsController {
	
	@Autowired
	private  RBoardService  boardService;
	
	@Autowired
	private RMenuService  menuService;
	
	@Autowired
	private RPdsService   pdsService;
	
	/*
	 * @RequestMapping("/") public ModelAndView home() { HashMap<String, Object> map
	 * = new HashMap<String, Object>();
	 * 
	 * map.put("menu_id", "MENU01");
	 * 
	 * List<RBoardVo> boardDateList = boardService.getBoardDateList( map );
	 * List<RBoardVo> boardLikeList = boardService.getBoardLikeList( map );
	 * List<RFilesVo> filesList = pdsService.getFileList( map );
	 * 
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * mv.addObject("boardLikeList", boardLikeList ); mv.addObject("boardDateList",
	 * boardDateList ); System.out.println(boardDateList); mv.addObject("filesList",
	 * filesList ); mv.setViewName("home"); // home.jsp
	 * System.out.println(filesList);
	 * 
	 * return mv; // 이동할 jsp 이름 }
	 */
	
	@RequestMapping("/PDS/List")	
	public ModelAndView pdsList(
		@RequestParam  HashMap<String, Object> map) {
		// {menu_id=MENU01, nowpage=1, pagecount=2, pagegrpnum=1}
		//System.out.println( "pdsList: " + map );
		List<RMenuVo> menuList  = menuService.getMenuListSP( map ); 
		List<RPdsVo>  pdsList   = pdsService.getPdsList( map ); 
		//System.out.println("pdsList():" + pdsList);
		
		String  menu_id  =  (String) map.get("menu_id");
		System.out.println();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList",   menuList);
		mv.addObject("pdsList",    pdsList);
		mv.addObject("menu_id",    menu_id);
		mv.addObject("menu_name",  "");
		
		mv.setViewName("pds/list");
		return mv;
	}
	
	@RequestMapping("/PDS/WriteForm")
	public  ModelAndView   writeForm(
		@RequestParam HashMap<String, Object> map ) {

		//System.out.println("writeForm() map:" + map);
		//writeForm() map:
		// {menu_id=MENU01, bnum=0, lvl=0, step=0, nref=0,
		// nowpage=, pagegrpnum=}
		
		// 메뉴 목록 조회
		List<RMenuVo> menuList = menuService.getMenuListSP( map );
				
		// 페이지 이동 
		ModelAndView  mv = new ModelAndView();
		mv.addObject("menuList", menuList );  //메뉴목록		
		mv.addObject("map",  map);
		mv.setViewName("pds/write");
		
		return   mv;
	}  
	
	//  파일정보를 받을려면 HttpServletRequest request  추가 필요
	//  새글쓰기         bnum=0, lvl=0, step=0, nref=0 
	//  답글쓰기         bnum=3, lvl=1, step=1, nref=3
	//  현재 메뉴정보    menu_id=MENU01	
	@RequestMapping("/PDS/Write")
	public  ModelAndView   write(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {
		    // MultipartHttpServletRequest request
		// map : form 안의 모든 정보
		//System.out.println("write():" + map);
			
		// 새글 저장 : MBoard        - 게시글 저장   - Dao
		//             Files         - 첨부파일 목록 - Dao  
		//             c:\\upload\\  - 첨부파일 저장 
		String menu_id = (String) map.get("menu_id");
				
		pdsService.setWrite(map, request);
				
		//System.out.println("write() map:" + map);
		
		ModelAndView  mv = new ModelAndView();		
		mv.addObject("map",  map);
		mv.setViewName("redirect:/PDS/List?menu_id=" + menu_id);
				
		return   mv;
	}  
	
    // <a href="/PDS/View?idx=${ pdsVo.idx }&menu_id=${ menu_id }"
	@RequestMapping("/PDS/View")
	public  ModelAndView   view(
		@RequestParam  HashMap<String, Object> map	) {
		
		// 매뉴 목록 : menuList
		List<RMenuVo>  menuList  =  menuService.getMenuListSP( map );
		// idx 로 조회된  pdsVo  - View 
		RPdsVo         pdsVo     =  pdsService.getPdsView( map );
		// idx 로 조회된  filesList
		List<RFilesVo>  filesList = pdsService.getFileList( map );
		   
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menuList",     menuList);
		mv.addObject("pdsVo",        pdsVo );
		mv.addObject("filesList",    filesList );
		mv.setViewName("pds/view");
		return mv;
		
	}
	
	// Update
	@RequestMapping("/PDS/UpdateForm")
	public   ModelAndView   updateForm(
		@RequestParam HashMap<String, Object> map ) {
				
		List<RMenuVo>   menuList  =  menuService.getMenuList();
		RPdsVo          pdsVo     =  pdsService.getPdsView( map ); 
		List<RFilesVo>  filesList =  pdsService.getFileList( map );
		
		System.out.println(pdsVo);
		
		ModelAndView  mv = new ModelAndView();
		mv.addObject("menuList",   menuList);
		mv.addObject("pdsVo",      pdsVo);
		mv.addObject("filesList",  filesList);
		mv.setViewName("pds/update");
		
		return  mv;
	}
	
	@RequestMapping("/PDS/Update")
	public   ModelAndView   update(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {
		
		pdsService.setUpdate( map, request ); 
		
		String   menu_id = (String) map.get("menu_id");
		
		ModelAndView  mv = new ModelAndView();
		
		mv.setViewName("redirect:/PDS/List?menu_id=" + menu_id);
		
		return  mv;
	}
	
	
	// Delete
	@RequestMapping("/PDS/Delete")
	public  ModelAndView  delete(
		@RequestParam  HashMap<String, Object> map	) {
		
		// 넘어온 값은? menu_id, idx, nref, lvl, step
		// 넘겨줄 값은? menu_id, idx, nref, lvl, step
		System.out.println("delete() map:" + map);
		pdsService.setDelete( map );
		
		
		String   menu_id   =  (String) map.get("menu_id");
		
		ModelAndView  mv =  new ModelAndView();
		mv.setViewName("redirect:/PDS/List?menu_id=" + menu_id);
		return  mv;
	} 
	
	//-------------------------------------------
	// {sfile}    :    .jpg 와 같은 . 포함 문자는 무시한다 
	// {sfile:.+} : 정규식문법 .문자가 한개이상(+) 있을때
	@RequestMapping(value="/download/{type}/{sfile:.+}", 
			method = RequestMethod.GET )
	public void downloadFile(
		HttpServletResponse response,
		@PathVariable("type") String type,
		@PathVariable("sfile") String sfile) throws IOException {
		
		String  INTERNAL_FILE        = sfile;
		String  EXTERNAL_FILE_PATH   = "c:\\upload\\" + sfile;
		
		File    file   =  null;
		if( type.equalsIgnoreCase("internal") ) {
			ClassLoader   classLoader = 
				Thread.currentThread().getContextClassLoader();
			file = new File(classLoader.getResource(INTERNAL_FILE).getFile() );
		} else {
			file  =  new File( EXTERNAL_FILE_PATH );
		}
				
		if(!file.exists() ) {
			String errorMessage = "죄송합니다. 파일이 없습니다";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
		}
		
		String  mimeType = URLConnection.guessContentTypeFromName(file.getName());
		mimeType = "application/octet-stream"; // 무조건 다운로드
		
		response.setContentType(mimeType);
		response.setHeader("Content-Disposition", 
			String.format("inline; filename=\"" + file.getName() + "\"" ) );
		
		response.setContentLength( (int) file.length() );
		
		InputStream  inputStream = new BufferedInputStream(
			new FileInputStream(file) );
		
		FileCopyUtils.copy(inputStream, response.getOutputStream() );
		
		inputStream.close();
		
	}
	
	
}





















