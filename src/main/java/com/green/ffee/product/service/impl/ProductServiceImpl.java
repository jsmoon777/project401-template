package com.green.ffee.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.vo.EventVO;
import com.green.ffee.product.dao.ProductDAO;
import com.green.ffee.product.service.ProductService;
import com.green.ffee.product.utils.ProductFile;
import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;
import com.green.ffee.sns.vo.SearchCriteria;

@Service("productservice")
public class ProductServiceImpl implements ProductService {

	@Resource(name="productfile")
	private ProductFile productfile;
	
	@Inject
	ProductDAO productdao;
	
	
	//상품작성
	@Override
	public void write(ProductVO productvo, MultipartHttpServletRequest mpRequest) throws Exception {
		productdao.write(productvo,mpRequest);
		
		List<Map<String, Object>> list = productfile.parseInsertFileInfo(productvo, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			productdao.insertFile(list.get(i));
			
		}
	}

	//상품리스트
	@Override
	public List<ProductFileVO> selectproductlist(SearchCriteria scri) throws Exception{
		return productdao.selectproductlist(scri);
	}

	//검색 : 게시글 총 갯수
	@Override
	public int listCount(SearchCriteria scri) {
		return productdao.listCount(scri);
	}
	
	//리드뷰
	@Override
	public Object read(int product_id) {
		return productdao.read(product_id);
	}

	//첨부파일 조회
	@Override
	public List<ProductFileVO> selectFileList(int product_id) {
		return productdao.selectFileList(product_id);
	}

	//썸네일 가져오기
	@Override
	public List<ProductFileVO> selectThumnail(int product_id) {
		return productdao.selectThumnail(product_id);
	}

	//상품삭제
	@Override
	public void delete(int product_id) {
		productdao.delete(product_id);
	}


	

	
}
