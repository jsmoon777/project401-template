package com.green.ffee.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.ffee.dao.CartDao;
import com.green.ffee.service.CartService;
import com.green.ffee.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Inject
	CartDao cartdao;

	//장바구니 상품확인
	@Override
	public int countCart(int productId, String userId) {
		return cartdao.countCart(productId,userId);
	}

	//장바구니 상품 수량 변경
	@Override
	public void updateCart(CartVO cartvo) {
		cartdao.updateCart(cartvo);
	}

	//장바구니 추가
	@Override
	public void insert(CartVO cartvo) {
		System.out.println("장바구니 vo : " + cartvo);
		cartdao.insert(cartvo);
	}

	//장바구니 목록
	@Override
	public List<CartVO> listCart(String userId) {
		return cartdao.listCart(userId);
	}
	
	//장바구니 금액 합계
	@Override
	public int sumMoney(String userId) {
		return cartdao.sumMoney(userId);
	}
	//장바구니 삭제
	@Override
	public void delete(int cartId) {
		cartdao.delete(cartId);
	}

	//장바구니 수정
	@Override
	public void modifyCart(CartVO cartvo) {
		cartdao.modifyCart(cartvo);
	}

}
