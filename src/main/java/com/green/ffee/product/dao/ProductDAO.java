package com.green.ffee.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;
import com.green.ffee.sns.vo.SearchCriteria;

public interface ProductDAO {

	void write(ProductVO productvo, MultipartHttpServletRequest mpRequest);

	void insertFile(Map<String, Object> map);

	//상품리스트
	public List<ProductFileVO> selectproductlist(SearchCriteria scri);

	//검색 : 게시글 총 갯수
	public int listCount(SearchCriteria scri);

	//리드뷰
	Object read(int product_id);

	List<ProductFileVO> selectFileList(int product_id);

	//썸네일
	List<ProductFileVO> selectThumnail(int product_id);

	//삭제
	void delete(int product_id);



}
