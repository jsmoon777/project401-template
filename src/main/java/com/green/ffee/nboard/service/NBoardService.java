package com.green.ffee.nboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.nboard.vo.BoardVo;
import com.green.ffee.nboard.vo.Criteria;
import com.green.ffee.nboard.vo.SearchCriteria;

public interface NBoardService {

	//게시물 목록 조회
	public List<BoardVo> list(Criteria cri) throws Exception;

	//게시글 총 개수
	public int listCount();
	
	// 게시글 작성
	public void write(BoardVo boardVo, MultipartHttpServletRequest mpRequest) throws Exception;

	//게시물 조회
	public BoardVo read(int nno);

	//게시물 수정
    public void update(BoardVo boardVo);

    //게시물 삭제
    public void delete(int nno);
    
    // 첨부파일 조회
 	public List<Map<String, Object>> selectFileList(int nno) throws Exception;
     

}
