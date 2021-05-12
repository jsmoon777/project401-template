package com.green.ffee.sns.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.ffee.interceptor.Auth;
import com.green.ffee.sns.service.ReplyService;
import com.green.ffee.sns.service.SnsService;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.PageMaker;
import com.green.ffee.sns.vo.ReplyVO;
import com.green.ffee.sns.vo.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private  SnsService  service;

	@Autowired
	private  ReplyService  replyService;
	
	// 게시판 목록 조회
	@RequestMapping(value = "/snslist", method = RequestMethod.GET)
		public String snslist(FileVo filevo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		//logger.info("snslist");
		
		
		model.addAttribute("snsfile", service.selectSnsList(scri));
		model.addAttribute("list", service.list(scri));
		
		//페이징 및 검색
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.snslistCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/snslist";
		
	}

	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", service.list(scri));
		
		//페이징 및 검색
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	// 게시판 글 작성 화면
	@Auth
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
	}
		
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/test", method = RequestMethod.GET)
	public void test() throws Exception{
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		//logger.info("write");
		service.write(boardVO, mpRequest);
		
		return "redirect:/board/snslist";
	}

	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO,FileVo filevo,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		//logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList",replyList);
		
		//List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		List<FileVo> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		
		List<FileVo> snsfile = service.selectSnsList(scri);
		model.addAttribute("snsfile", snsfile);
		
		//조회수
		service.hit(boardVO.getBno());
		
		
		return "board/readView";
	}
	

	
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		//logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		//logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/snslist";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		//logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/board/snslist";
	}

	
	
	//댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			//logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			//logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			
			return "board/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			//logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			//logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			//logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
		//게시물 추천 관련 메소드
		@RequestMapping(value="/recommend" ,method = RequestMethod.GET)
	    public String recommend (BoardVO vo ,@RequestParam int bno,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	        
	        service.recommend(bno);
	    
	        rttr.addAttribute("bno", vo.getBno());
	        rttr.addAttribute("like_cnt", vo.getLike_cnt());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
	        
	        return "redirect:/board/readView"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
	    }
		//게시물 비추천 관련 메소드
		@RequestMapping(value="/lowrecommend" ,method = RequestMethod.GET)
		public String lowrecommend (BoardVO vo ,@RequestParam int bno,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			service.lowrecommend(bno);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("like_cnt", vo.getLike_cnt());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
		}



		
}