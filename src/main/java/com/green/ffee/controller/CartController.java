package com.green.ffee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.ffee.service.CartService;
import com.green.ffee.user.vo.UserVo;
import com.green.ffee.vo.CartVO;

@Controller
@RequestMapping("/shop/cart/*")
public class CartController {

    @Inject
    CartService cartService;

    
    // 1. 장바구니 추가
    @RequestMapping("insert.do")
    public String insert(@RequestParam HashMap<String, Object> map, CartVO cartvo, HttpSession session, UserVo uservo){
    	
    	uservo =  (UserVo) session.getAttribute("login");
    	String userId = uservo.getUser_id();
    	
    	int productid = cartvo.getProductId();
    	
        System.out.println("cartinsert"+userId);
        System.out.println("productid" + cartvo.getProductId());
        
        cartvo.setUserId(userId);
        // 장바구니에 기존 상품이 있는지 검사
        
        int count = cartService.countCart(cartvo.getProductId(), userId);
        //count == 0 ? cartService.updateCart(vo) : cartService.insert(vo);
        if(count == 0){
            // 없으면 insert
            cartService.insert(cartvo);
            
        } else {
            // 있으면 update
            cartService.updateCart(cartvo);
        }
        
        map.put("productId", productid);
        return "redirect:/shop/cart/list.do";
    }

    // 2. 장바구니 목록
    @RequestMapping("list.do")
    public ModelAndView list(HttpSession session, ModelAndView mav,UserVo uservo ,CartVO cartvo){
    	
    	uservo =  (UserVo) session.getAttribute("login");
    	String userId = uservo.getUser_id(); // session에 저장된 userId
    	System.out.println("리스트 cartinsert : "+userId);
    	
    	//int productid = cartvo.getProductId();
    	
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartVO> list = cartService.listCart(userId); // 장바구니 정보 
        int sumMoney = cartService.sumMoney(userId); // 장바구니 전체 금액 호출
        
        // 장바구니 전체 긍액에 따라 배송비 구분
        // 배송료(10만원이상 => 무료, 미만 => 2500원)
        int fee = sumMoney >= 100000 ? 0 : 2500;
        
        System.out.println("장바구니 리스트 출력"+list);
        map.put("list", list);                // 장바구니 정보를 map에 저장
        map.put("count", list.size());        // 장바구니 상품의 유무
        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
        map.put("fee", fee);                 // 배송금액
        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
        mav.setViewName("shop/cartList");    // view(jsp)의 이름 저장
        mav.addObject("map", map);            // map 변수 저장
        return mav;
    }

    // 3. 장바구니 삭제
    @RequestMapping("delete.do")
    public String delete(@RequestParam int cartId){
        cartService.delete(cartId);
        System.out.println("cartinsert"+cartId);
        return "redirect:/shop/cart/list.do";
        
    }

    // 4. 장바구니 수정
    @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session,UserVo uservo) {
        // session의 id
    	uservo =  (UserVo) session.getAttribute("login");
    	String userId = uservo.getUser_id();
    	
    	System.out.println("cartinsert"+userId);
        // 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<productId.length; i++){
            CartVO vo = new CartVO();
            vo.setUserId(userId);
            vo.setAmount(amount[i]);
            vo.setProductId(productId[i]);
            cartService.modifyCart(vo);
        }

        return "redirect:/shop/cart/list.do";
    }
}


