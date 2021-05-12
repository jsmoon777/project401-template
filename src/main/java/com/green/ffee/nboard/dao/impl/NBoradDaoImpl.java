package com.green.ffee.nboard.dao.impl;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.nboard.dao.NBoardDao;
import com.green.ffee.nboard.vo.BoardVo;
import com.green.ffee.sns.vo.SearchCriteria;



@Repository("Daoo")
public class NBoradDaoImpl implements NBoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	
	//게시글작성
	@Override
	public void write(BoardVo boardVo, MultipartHttpServletRequest mpRequest) {
		//System.out.println("dao write() boardVo:" + boardVo);
		sqlSession.insert("nboardMapper.insert", boardVo);
		
	}

	//게시물목록조회

	@Override
	public List<BoardVo> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("nboardMapper.listPage",scri);
	}


    //게시물 조회
	@Override
	public BoardVo read(int nno){
		
		return sqlSession.selectOne("nboardMapper.read", nno);
	}


    //게시물 총개수
	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("nboardMapper.listCount", scri);
	}


	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map){
		sqlSession.insert("nboardMapper.insertFile", map);
	}

    //게시물 수정
	@Override
	public void update(BoardVo boardVo) {

		sqlSession.update("nboardMapper.update",boardVo);
	}


    //게시물 삭제
	@Override
	public void delete(int nno) {
        sqlSession.delete("nboardMapper.delete", nno);		
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int nno) throws Exception {
		return sqlSession.selectList("nboardMapper.selectFileList", nno);
	}

	@Override
	public void nboardHit(int nno) {
		sqlSession.update("nboardMapper.nboardHit", nno);
	}





}
