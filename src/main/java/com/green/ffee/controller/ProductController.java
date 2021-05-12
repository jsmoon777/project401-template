package com.green.ffee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;
import com.green.ffee.product.service.ProductService;
import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.PageMaker;
import com.green.ffee.sns.vo.SearchCriteria;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Inject ProductService productservice;
	
	
	 // 상품폼 이동
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(ProductVO productvo,ProductFileVO filevo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	
		model.addAttribute("productlist",productservice.selectproductlist(scri));
	
		//페이징 및 검색
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(productservice.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		System.out.println("이벤트list 읽음");
		return "product/productList";
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
		 
		 
		 return "product/productview";
		 
	 }   
	
	
	//상품추가 폼
	@RequestMapping(value = "/productform", method = RequestMethod.GET)
	public void productform() throws Exception {
		
	} 
	
	//상품추가 
	@RequestMapping(value = "/productwrite", method = RequestMethod.POST)
	public String write(ProductVO productvo,MultipartHttpServletRequest mpRequest) throws Exception {
		
		productservice.write(productvo,mpRequest);
		System.out.println("이벤트 추가 완료");
		return "redirect:/product/productList";
		
	}
	
	
	//상품삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProductVO productvo) throws Exception{
		
		productservice.delete(productvo.getProduct_id());
		
		return "redirect:/product/productList";
	}
	
}
