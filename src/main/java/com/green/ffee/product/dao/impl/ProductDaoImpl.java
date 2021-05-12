package com.green.ffee.product.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.product.dao.ProductDAO;
import com.green.ffee.product.vo.ProductFileVO;
import com.green.ffee.product.vo.ProductVO;
import com.green.ffee.sns.vo.SearchCriteria;


@Repository("productdao")
public class ProductDaoImpl implements ProductDAO {

	
	@Autowired
	private SqlSession sqlsession;
	
	//글작성
	@Override
	public void write(ProductVO productvo, MultipartHttpServletRequest mpRequest) {
		sqlsession.insert("productMapper.insert",productvo);
	}

	//파일 작성
	@Override
	public void insertFile(Map<String, Object> map) {
		sqlsession.insert("productMapper.insertFile", map);
	}

	//상품리스트
	@Override
	public List<ProductFileVO> selectproductlist(SearchCriteria scri) {
		return sqlsession.selectList("productMapper.selectproductlist",scri);
	}

	@Override
	public Object read(int product_id) {
		return sqlsession.selectOne("productMapper.read",product_id);
	}

	@Override
	public List<ProductFileVO> selectFileList(int product_id) {
		
		List<ProductFileVO> productlist = sqlsession.selectList("productMapper.selectFileList",product_id);
		return productlist;
	}

	//썸네일 파일 
	@Override
	public List<ProductFileVO> selectThumnail(int product_id) {
		List<ProductFileVO> thumnailfile = sqlsession.selectList("productMapper.selectThumnailFile",product_id);
		
		return thumnailfile;
	}

	
	//검색 : 게시글 갯수
	
	@Override
	public int listCount(SearchCriteria scri) {
		return sqlsession.selectOne("productMapper.listCount",scri);
	}

	//삭제
	@Override
	public void delete(int product_id) {
		sqlsession.selectOne("productMapper.delete",product_id);
	}

}
