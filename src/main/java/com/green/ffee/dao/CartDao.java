package com.green.ffee.dao;

import java.util.List;

import com.green.ffee.vo.CartVO;

public interface CartDao {

	int countCart(int productId, String userId);

	void updateCart(CartVO cartvo);

	void insert(CartVO cartvo);

	List<CartVO> listCart(String userId);

	void delete(int cartId);

	void modifyCart(CartVO cartvo);

	int sumMoney(String userId);

}
