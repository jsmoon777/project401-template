/**
 * 
 */
package com.green.ffee.product.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;
import com.green.ffee.sns.vo.SearchCriteria;

public interface ProductService {

	//글작성부분 
	void write(ProductVO productvo, MultipartHttpServletRequest mpRequest) throws Exception;

	//목록리스트
	public List<ProductFileVO> selectproductlist(SearchCriteria scri) throws Exception;

	//리드 뷰 리스트
	Object read(int product_id);

	//리스트
	public List<ProductFileVO> selectFileList(int product_id);

	public List<ProductFileVO> selectThumnail(int product_id);

	//검색 : 게시글 총 갯수
	public int listCount(SearchCriteria scri);

	//상품삭제
	void delete(int product_id);


}
