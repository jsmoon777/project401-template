package com.green.ffee.sns.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.sns.dao.SnsDao;
import com.green.ffee.sns.vo.BoardVO;
import com.green.ffee.sns.vo.Criteria;
import com.green.ffee.sns.vo.FileVo;
import com.green.ffee.sns.vo.SearchCriteria;

@Repository("Dao")
public class SnsDaoImpl implements SnsDao {

	@Autowired
	private  SqlSession sqlSession;

	//snslist 이미지 조회
	@Override
	public List<FileVo> selectSnsList(SearchCriteria scri) {
		return sqlSession.selectList("boardMapper.selectSnsList",scri);
	}

	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount",scri);
	}

	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
			
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("boardMapper.delete", bno);
	}
		
	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map){
		sqlSession.insert("boardMapper.insertFile", map);
	}

	// 첨부파일 조회
	@Override
	public List<FileVo> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		List<FileVo> fileList =  sqlSession.selectList("boardMapper.selectFileList", bno);
		System.out.println("selectFileList() fileList:" + fileList);
		return fileList;
	}

	
	
	//추천버튼
	@Override
	public void recommend(int bno) {
		sqlSession.update("boardMapper.recommend", bno);
	}

	
	//비추천 버튼
	@Override
	public void lowrecommend(int bno) {
		sqlSession.update("boardMapper.lowrecommend", bno);
	}

	//조회수
	@Override
	public void hit(int bno) {
		sqlSession.update("boardMapper.hit",bno);
	}

	//snslist게시물 총 갯수
	@Override
	public int snslistCount(SearchCriteria scri) {
		return sqlSession.selectOne("boardMapper.snslistCount",scri);
	}

	
}









