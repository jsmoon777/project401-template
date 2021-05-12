package com.green.ffee.nboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.nboard.vo.BoardVo;

import com.green.ffee.sns.vo.SearchCriteria;
public interface NBoardDao {

	// 게시글 작성
	public void write(BoardVo boardVo, MultipartHttpServletRequest mpRequest);
		
	//게시물 목록 조회
	public List<BoardVo> list(SearchCriteria scri) throws Exception;
	
	//게시물 조회
	public BoardVo read(int nno);

	//게시물 총 개수
	public int listCount(SearchCriteria scri);

	//첨부파일 업로드
	public void insertFile(Map<String, Object> map);
		
	 // 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int nno) throws Exception;
		
	
    public void update(BoardVo boardVo);
    
    public void delete(int nno);
    
    //게시판 조회수
    public void nboardHit(int nno);

}
