package com.green.ffee.reg.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.ffee.reg.dao.RBoardDao;
import com.green.ffee.reg.vo.CallFileVo;
import com.green.ffee.reg.vo.RBoardFileVo;
import com.green.ffee.reg.vo.RBoardFileVo2;
import com.green.ffee.reg.vo.RBoardFileVo3;
import com.green.ffee.reg.vo.RBoardFileVo4;
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
	public void likeBoard(int likeNum) {
		sqlSession.update("MBoard.LikeUpdateBoard", likeNum);
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

	
	
	@Override
	public List<String> getCallFile(int idx) {
		List<String> fileList = sqlSession.selectList("MBoard.CallFile", idx);
		return fileList;
	}
	
	//test
	@Override
	public RBoardVo getBoardOne(int idx) {
		RBoardVo rvo=sqlSession.selectOne("MBoard.getBoardOne", idx);
		return rvo;
	}

	@Override
	public List<RBoardFileVo> getRBoardFileList(HashMap<String, Object> map) {
		
		List<RBoardFileVo>  RBoardFileList = sqlSession.selectList("MBoard.getNewCafe", map);
		return      RBoardFileList;
	}

	@Override
	public List<RBoardFileVo2> getRBoardFileList2(HashMap<String, Object> map) {
		
		List<RBoardFileVo2>  RBoardFileList2 = sqlSession.selectList("MBoard.getPopCafe", map);
		return      RBoardFileList2;
	}
	
	@Override
	public List<RBoardFileVo3> getRBoardFileList3(HashMap<String, Object> map) {
		
		List<RBoardFileVo3>  RBoardFileList3 = sqlSession.selectList("MBoard.getNewRes", map);
		return      RBoardFileList3;
	}
	
	@Override
	public List<RBoardFileVo4> getRBoardFileList4(HashMap<String, Object> map) {
		
		List<RBoardFileVo4>  RBoardFileList4 = sqlSession.selectList("MBoard.getPopRes", map);
		return      RBoardFileList4;
	}

}





