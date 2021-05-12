package com.green.ffee.sns.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.member.vo.MemberVO;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.Criteria;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.SearchCriteria;


public interface SnsService {
	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	//게시물 총 갯수 
	public int listCount(SearchCriteria scri) throws Exception;
	
	// snslist 조회
	public List<FileVo> selectSnsList(SearchCriteria scri);

	//snslist게시물 총 갯수 
	public int snslistCount(SearchCriteria scri) throws Exception;
	
	// 게시글 작성
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;

	// 게시물 목록 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;

	// 첨부파일 조회
	public List<FileVo> selectFileList(int bno) throws Exception;

	
	// 추천 체크
	public void recommend(int bno);

	// 비추천 체크
	public void lowrecommend(int bno);

	// 조회수
	public void hit(int bno);

	



	

}
