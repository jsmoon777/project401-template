package com.green.ffee.reg.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.reg.dao.RBoardDao;
import com.green.ffee.reg.vo.RBoardVo;

@Repository("boardDao")
public class RBoardDaoImpl implements RBoardDao {

	@Autowired
	private  SqlSession  sqlSession; 
	
	@Override
	public List<RBoardVo> getBoardList(HashMap<String, Object> map) {
		
		sqlSession.selectList("MBoard.BoardList", map);
		
		List<RBoardVo> boardList = (List<RBoardVo>) map.get("result");
				
		return  boardList;
	}

	@Override
	public void insertBoard(RBoardVo vo) {
		
		sqlSession.insert("MBoard.InsertBoard", vo);
		
	}

	@Override
	public RBoardVo getView(HashMap<String, Object> map) {
		
		sqlSession.selectList("MBoard.BoardView", map);
		
		List<RBoardVo> boardList = (List<RBoardVo>) map.get("result"); 
		
		RBoardVo       vo = boardList.get(0);
				
		return  vo;
	}

	@Override
	public void updateBoard(HashMap<String, Object> map) {
		
		sqlSession.update("MBoard.UpdateBoard", map );
		
	}

	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		
		sqlSession.delete("MBoard.DeleteBoard", map );
		
	}

	@Override
	public void likeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("MBoard.LikeUpdateBoard", map);
	}

	@Override
	public List<RBoardVo> getBoardDateList(HashMap<String, Object> map) {
		sqlSession.selectList("MBoard.BoardDateList", map);
		
		List<RBoardVo> boardList = (List<RBoardVo>) map.get("result");
				
		return  boardList;
	}

	@Override
	public List<RBoardVo> getBoardLikeList(HashMap<String, Object> map) {
		sqlSession.selectList("MBoard.BoardLikeList", map);
		
		List<RBoardVo> boardList = (List<RBoardVo>) map.get("result");
				
		return  boardList;
	}

}





