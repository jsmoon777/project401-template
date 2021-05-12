package com.green.ffee.sns.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.sns.dao.SnsDao;
import com.green.ffee.sns.service.SnsService;
import com.green.ffee.sns.utils.FileUtils;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.Criteria;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.SearchCriteria;

// @Component // 부품으로 사용될 객체
//  세분화
//  @Service     : 비지니스 로직  
//  @Repository  : db 에 접근한다 
//  @Entity      : 일반 DBMS type
//  @Document    : MongoDB(NoSql) 도규먼트 type 과 연결
//  @Controller, @RestController 

@Service("Service")
public class SnsServiceImpl implements SnsService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private   SnsDao  dao;

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	// 게시물 목록 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
		
	}

	// 게시글 작성
	@Override
	public void write(BoardVO boardVO,MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(boardVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}
	
	//게시글 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}

	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
	
	// 첨부파일 조회
	@Override
	public List<FileVo> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	//snslsit 이미지 조회
	@Override
	public List<FileVo> selectSnsList(SearchCriteria scri) {
		return dao.selectSnsList(scri);
	}

	//추천하기
	@Override
	public void recommend(int bno) {
		dao.recommend(bno);
	}

	//비추천하기
	@Override
	public void lowrecommend(int bno) {
		dao.lowrecommend(bno);
	}

	//조회수
	@Override
	public void hit(int bno) {
		dao.hit(bno);
	}

	//snslist 총 게시글
	@Override
	public int snslistCount(SearchCriteria scri) {
		return dao.snslistCount(scri);
	}
	
}


	
	







