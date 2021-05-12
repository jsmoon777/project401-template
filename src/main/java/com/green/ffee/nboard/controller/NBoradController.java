package com.green.ffee.nboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.interceptor.Auth;
import com.green.ffee.interceptor.Auth.Role;
import com.green.ffee.nboard.service.NBoardService;
import com.green.ffee.nboard.vo.BoardVo;
import com.green.ffee.sns.vo.PageMaker;
import com.green.ffee.sns.vo.SearchCriteria;
 




@Controller
@RequestMapping("/nboard/*")
public class NBoradController {

	
	
	
	@Autowired
	private NBoardService nboardService;
	
	//게시판 목록 조회
		@RequestMapping(value="/list", method = RequestMethod.GET)
		public String list(Model model, SearchCriteria scri) throws Exception{
			
			model.addAttribute("list", nboardService.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(nboardService.listCount());
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "nboard/list";
			
		}
	
	// 게시판 글 작성 화면
	@RequestMapping(value="/nboard/writeView", method=RequestMethod.GET)
	public String writeView() {
		return "nboard/writeView";
		
	}
	

	// 게시판 글 작성
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String write(BoardVo boardVo, MultipartHttpServletRequest mpRequest) throws Exception{
			//logger.info("write");
			nboardService.write(boardVo, mpRequest);
			
			return "redirect:/nboard/list";
		}
	
	
	//게시판조회
	@RequestMapping(value="/readView", method=RequestMethod.GET)
	public String read(BoardVo boardVo, Model model) throws Exception{
		
		model.addAttribute("read", nboardService.read(boardVo.getNno()));
		
		List<Map<String, Object>> fileList = nboardService.selectFileList(boardVo.getNno());


		model.addAttribute("file", fileList);
		System.out.println("게시판 조회 컨트롤러: "+fileList);
		
		
		
		return "nboard/readView";
	}
	
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVo boardVo, Model model) {
		
		model.addAttribute("update", nboardService.read(boardVo.getNno()));
		
		return "nboard/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVo boardVo) {
		
		nboardService.update(boardVo);
		
		return "redirect:/nboard/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVo boardVO) throws Exception{
		
		nboardService.delete(boardVO.getNno());
		
		return "redirect:/nboard/list";
	}
	
	
	
}
	
	
	

