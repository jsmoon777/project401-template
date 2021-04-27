package com.green.ffee.service;

import java.util.List;

import com.green.ffee.vo.CartVO;

public interface CartService {

	int countCart(int productId, String userId);

	void updateCart(CartVO cartvo);

	void insert(CartVO cartvo);

	List<CartVO> listCart(String userId);

	int sumMoney(String userId);

	void delete(int cartId);

	void modifyCart(CartVO cartvo);


	
}
