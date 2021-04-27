package com.green.ffee.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.dao.CartDao;
import com.green.ffee.vo.CartVO;

@Repository("cartdao")
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession sqlsession;
	
	//1.장바구니 추가
	@Override
	public void insert(CartVO cartvo) {
		sqlsession.insert("cart.insertCart",cartvo);
		System.out.println("cart.insertCart mapping : " + cartvo );
	}

	//2.장바구니 목록
	@Override
	public List<CartVO> listCart(String userId) {
		return sqlsession.selectList("cart.listCart",userId);
	}

	//3.장바구니 삭제
	@Override
	public void delete(int cartId) {
		sqlsession.delete("cart.delectCart",cartId);
	}

	//4.장바구니 수정
	@Override
	public void modifyCart(CartVO cartvo) {
		sqlsession.update("cart.modifyCart",cartvo);
	}
	
	//5.장바구니 합계
	@Override
	public int sumMoney(String userId) {
		return sqlsession.selectOne("cart.sumMoney",userId);
		
	}
	//6.장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(int productId, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productId", productId);
		map.put("userId", userId);
		System.out.println("countcart map : "+ "product:"+productId +"userId:" +userId + "map:"+map);
		
		
		return sqlsession.selectOne("cart.countCart",map);
	}

	//7.장바구니 상품수량 수정
	@Override
	public void updateCart(CartVO cartvo) {
		sqlsession.update("cart.updateCart",cartvo);
	}




}
