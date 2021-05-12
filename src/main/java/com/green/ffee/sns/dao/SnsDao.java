package com.green.ffee.sns.dao;

import java.util.List;
import java.util.Map;

import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.Criteria;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.SearchCriteria;


public interface SnsDao {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map);
	
	// 첨부파일 조회
	public List<FileVo> selectFileList(int bno) throws Exception;

	// snslist 이미지 조회
	public List<FileVo> selectSnsList(SearchCriteria scri);

	// 추천버튼 
	public void recommend(int bno);

	//비추천하기 
	public void lowrecommend(int bno);

	//조회수구하기
	public void hit(int bno);

	//snslist카운트
	public int snslistCount(SearchCriteria scri);


	
}
