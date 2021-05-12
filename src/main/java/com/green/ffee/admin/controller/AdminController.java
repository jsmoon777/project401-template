package com.green.ffee.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.ffee.event.service.EventService;
import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;
import com.green.ffee.interceptor.Auth;
import com.green.ffee.interceptor.Auth.Role;
import com.green.ffee.nboard.service.NBoardService;
import com.green.ffee.nboard.vo.BoardVo;
import com.green.ffee.product.service.ProductService;
import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;

import com.green.ffee.interceptor.Auth;
import com.green.ffee.sns.service.ReplyService;
import com.green.ffee.sns.service.SnsService;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.PageMaker;
import com.green.ffee.sns.vo.ReplyVO;
import com.green.ffee.sns.vo.SearchCriteria;
import com.green.ffee.user.service.UserService;
import com.green.ffee.user.vo.UserVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject ProductService productservice;
	@Inject EventService   eventservice; 
	@Inject SnsService     snsservice;
	@Inject ReplyService   replyService;
	@Inject NBoardService  nboardService;
	@Inject UserService  userService;
	
	//관리자 메인페이지
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/adminmainpage" , method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		return "/admin/adminmainpage";
	}
	
	
	//상품 주문 관리자페이지
    //상품폼 이동
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(ProductVO productvo,ProductFileVO filevo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	
		model.addAttribute("productlist",productservice.selectproductlist(scri));
	
		//페이징 및 검색
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productservice.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/productList";
	} 

	// 상품뷰 이동
	@RequestMapping(value = "/productview", method = RequestMethod.GET)
	 public String eventview(ProductVO productvo,ProductFileVO filevo,Model model) throws Exception {
		
		 model.addAttribute("read",productservice.read(productvo.getProduct_id()));
		 
		 List<ProductFileVO> productlist = productservice.selectFileList(filevo.getProduct_id());
		 model.addAttribute("productlist",productlist);
		 
		 //썸네일
		 List<ProductFileVO> thumnailfile = productservice.selectThumnail(filevo.getProduct_id());
		 model.addAttribute("thumnailfile",thumnailfile);
		 
		 
		 return "admin/productview";
		 
	 }   
	
	
	//상품추가 폼
	@RequestMapping(value = "/productform", method = RequestMethod.GET)
	public void productform() throws Exception {
		
	} 
	
	//상품추가 
	@RequestMapping(value = "/productwrite", method = RequestMethod.POST)
	public String write(ProductVO productvo,MultipartHttpServletRequest mpRequest) throws Exception {
		
		productservice.write(productvo,mpRequest);
		return "redirect:/admin/productList";
		
	}
	
	//상품삭제
	@RequestMapping(value = "/productdelete", method = RequestMethod.POST)
	public String delete(ProductVO productvo) throws Exception{
		
		productservice.delete(productvo.getProduct_id());
		
		return "redirect:/admin/productList";
	}
	
	
	//--------------------------------------------------
	//이벤트 관리자페이지
	//이벤트 진행중인 리스트 이동
	
	 // 이벤트 진행중인 리스트 이동
	 @RequestMapping(value = "/eventlist", method = RequestMethod.GET)
	 public String eventlist(EventVO vo, EventFileVO eventvo,Model model) throws Exception {
		
		
	    List<EventVO> eventlist = eventservice.eventlist(vo);
	    model.addAttribute("eventlist",eventlist);
		 
		 
		 List<EventFileVO>  eventfile = eventservice.selectEventList(eventvo);
		 model.addAttribute("eventfile",eventfile);
		 
		 System.out.println("진행중인이벤트읽음");
		 
		 return "admin/eventlist";
		 
	 }

	 
	 // 이벤트 종료된 리스트 이동
	 @RequestMapping(value = "/eventendlist", method = RequestMethod.GET)
	 public String eventendlist(EventVO vo, EventFileVO eventvo,Model model) throws Exception {
		 
		 
		 List<EventFileVO> eventendlist = eventservice.selectEventEndList(eventvo);
		 model.addAttribute("eventendlist",eventendlist);
		 
		 
		 return "admin/eventendlist";
		 
	 }


	 // 이벤트뷰 이동
	 @RequestMapping(value = "/eventview", method = RequestMethod.GET)
	 public String eventview(EventVO eventvo,EventFileVO filevo,Model model) throws Exception {
		
		 model.addAttribute("read",eventservice.read(eventvo.getEno()));
		 
		 List<EventFileVO> eventlist = eventservice.selectFileList(filevo.getEno());
		 model.addAttribute("eventlist",eventlist);
		 
		 
		 return "admin/eventview";
		 
	 }     

	 
	 // 이벤트폼 이동
	@RequestMapping(value = "/eventform", method = RequestMethod.GET)
	public void eventform() throws Exception {
		
	} 
		
	// 이벤트폼 이동
	@RequestMapping(value = "/eventwrite", method = RequestMethod.POST)
	public String write(EventVO eventvo,MultipartHttpServletRequest mpRequest) throws Exception {
		
		eventservice.write(eventvo,mpRequest);
		System.out.println("이벤트 추가 완료");
		return "redirect:/admin/eventlist";
		
	}
	
	
	
	//--------------------------------------------------	
	//sns관리자페이지

		
		
		// 게시판 목록 조회
		@RequestMapping(value = "/snslist", method = RequestMethod.GET)
			public String snslist(FileVo filevo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			
			
			model.addAttribute("snsfile", snsservice.selectSnsList(scri));
			model.addAttribute("list", snsservice.list(scri));
			
			//페이징 및 검색
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(snsservice.snslistCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/snslist";
			
		}

	/*
	 * // 게시판 목록 조회
	 * 
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public String
	 * list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws
	 * Exception{
	 * 
	 * model.addAttribute("list", snsservice.list(scri));
	 * 
	 * //페이징 및 검색 PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
	 * pageMaker.setTotalCount(snsservice.listCount(scri));
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "admin/list";
	 * 
	 * }
	 */
		
		// 게시판 글 작성 화면
		@Auth
		@RequestMapping(value = "/admin/writeView", method = RequestMethod.GET)
		public void snswriteView() throws Exception{
		}
		
		// 게시판 글 작성
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
			//logger.info("write");
			snsservice.write(boardVO, mpRequest);
			
			return "redirect:/admin/snslist";
		}

		// 게시판 조회
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(BoardVO boardVO,FileVo filevo,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			//logger.info("read");
			
			model.addAttribute("read", snsservice.read(boardVO.getBno()));
			model.addAttribute("scri", scri);
			
			List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
			model.addAttribute("replyList",replyList);
			
			//List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
			List<FileVo> fileList = snsservice.selectFileList(boardVO.getBno());
			model.addAttribute("file", fileList);
			
			List<FileVo> snsfile = snsservice.selectSnsList(scri);
			model.addAttribute("snsfile", snsfile);
			
			//조회수
			snsservice.hit(boardVO.getBno());
			
			
			return "admin/readView";
		}
		

		
		
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String snsupdateView(BoardVO boardVO, Model model) throws Exception{
			//logger.info("updateView");
			
			model.addAttribute("update", snsservice.read(boardVO.getBno()));
			
			return "admin/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO) throws Exception{
			//logger.info("update");
			
			snsservice.update(boardVO);
			
			return "redirect:/admin/snslist";
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO) throws Exception{
			//logger.info("delete");
			
			snsservice.delete(boardVO.getBno());
			
			return "redirect:/admin/snslist";
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
				
				return "redirect:/admin/readView";
			}
			
			//댓글 수정 GET
			@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
			public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
				//logger.info("reply Write");
				
				model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
				model.addAttribute("scri", scri);
				
				return "admin/replyUpdateView";
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
				
				return "redirect:/admin/readView";
			}
			
			//댓글 삭제 GET
			@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
			public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
				//logger.info("reply Write");
				
				model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
				model.addAttribute("scri", scri);
				

				return "admin/replyDeleteView";
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
				
				return "redirect:/admin/readView";
			}
			
			//게시물 추천 관련 메소드
			@RequestMapping(value="/recommend" ,method = RequestMethod.GET)
		    public String recommend (BoardVO vo ,@RequestParam int bno,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		        
				snsservice.recommend(bno);
		    
		        rttr.addAttribute("bno", vo.getBno());
		        rttr.addAttribute("like_cnt", vo.getLike_cnt());
				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
		        
		        return "redirect:/admin/readView"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
		    }
			//게시물 비추천 관련 메소드
			@RequestMapping(value="/lowrecommend" ,method = RequestMethod.GET)
			public String lowrecommend (BoardVO vo ,@RequestParam int bno,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
				
				snsservice.lowrecommend(bno);
				
				rttr.addAttribute("bno", vo.getBno());
				rttr.addAttribute("like_cnt", vo.getLike_cnt());
				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
				
				return "redirect:/admin/readView"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
			}

		//--------------------------------------------------------
		//공지관리---------------------------------------------------
			   
			  
			   
	   //게시판 목록 조회
	      @RequestMapping(value="/list", method = RequestMethod.GET)
	      public String list(Model model, SearchCriteria scri) throws Exception{
	         
	         model.addAttribute("list", nboardService.list(scri));
	         
	         PageMaker pageMaker = new PageMaker();
	         pageMaker.setCri(scri);
	         pageMaker.setTotalCount(nboardService.listCount());
	         
	         model.addAttribute("pageMaker", pageMaker);
	         
	         return "admin/list";
	         
	      }
	      
	   // 게시판 글 작성 화면
	      @RequestMapping(value="/admin/nwriteView", method=RequestMethod.GET)
	      public String writeView() {
	         return "admin/nwriteView";
	         
	      } 
	   

      // 게시판 글 작성
         @RequestMapping(value = "/nwrite", method = RequestMethod.POST)
         public String write(BoardVo boardVo, MultipartHttpServletRequest mpRequest) throws Exception{
            //logger.info("write");
            nboardService.write(boardVo, mpRequest);
            
            return "redirect:/admin/list";
         }    
		
         
       //게시판조회
         @RequestMapping(value="/nreadView", method=RequestMethod.GET)
         public String read(BoardVo boardVo, Model model) throws Exception{
            
            model.addAttribute("read", nboardService.read(boardVo.getNno()));
            
            List<Map<String, Object>> fileList = nboardService.selectFileList(boardVo.getNno());


            model.addAttribute("file", fileList);
            System.out.println("게시판 조회 컨트롤러: "+fileList);
            
            
            
            return "admin/nreadView";
         }   
         
         @RequestMapping(value = "/nupdateView", method = RequestMethod.GET)
         public String updateView(BoardVo boardVo, Model model) {
            
            model.addAttribute("update", nboardService.read(boardVo.getNno()));
            
            return "admin/nupdateView";
         }
         
         
         
         // 게시판 수정
         @RequestMapping(value = "/nupdate", method = RequestMethod.POST)
         public String update(BoardVo boardVo) {
            
            nboardService.update(boardVo);
            
            return "redirect:/admin/list";
         }

         // 게시판 삭제
         @RequestMapping(value = "/ndelete", method = RequestMethod.POST)
         public String delete(BoardVo boardVO) throws Exception{
            
            nboardService.delete(boardVO.getNno());
            
            return "redirect:/admin/list";
         }
         
        @RequestMapping("/admin/adminUserList")	
     	public ModelAndView adminUserList(
     		@RequestParam  HashMap<String, Object> map) {
     		List<UserVo>  userList   = userService.getUserList( map ); 
     		System.out.println("userList" + userList);
     		
     		ModelAndView mv = new ModelAndView();
     		mv.addObject("userList",   userList);
     		
     		mv.setViewName("admin/adminUserList");
     		return mv;
     	}
     	
     	@RequestMapping(value = "/admin/adminDelete")
     	public String adminDelete(UserVo userVo, HttpSession session) throws Exception{
     		
     		userService.adminDelete(userVo.getUser_id());
     		
     		return "redirect:/admin/adminUserList";
     	}

     	
     	
}

