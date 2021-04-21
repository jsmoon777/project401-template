package com.green.ffee.reg.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.ffee.reg.dao.RBoardDao;
import com.green.ffee.reg.service.RBoardService;
import com.green.ffee.reg.vo.RBoardVo;

@Service("boardService")
public class RBoardServiceImpl implements RBoardService {

	@Autowired
	private RBoardDao boardDao;
	
	@Override
	public List<RBoardVo> getBoardList(HashMap<String, Object> map) {
		
		List<RBoardVo> boardList = boardDao.getBoardList( map );  
		
		for (int i = 0; i < boardList.size(); i++) {
			String title = boardList.get(i)
					 .getTitle().replace(" ", "&nbsp;&nbsp;" );
			boardList.get(i).setTitle(title);			
		}
		
		return boardList;
	}

	@Override
	public void insertBoard(RBoardVo vo) {
		
		boardDao.insertBoard( vo );
		
	}

	@Override
	public RBoardVo getView(HashMap<String, Object> map) {
		RBoardVo boardVo = boardDao.getView(map); 
		return  boardVo;
	}

	@Override
	public void updateBoard(HashMap<String, Object> map) {
		
		boardDao.updateBoard(map);
		
	}

	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		
		boardDao.deleteBoard(map);
		
	}

	@Override
	public void likeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardDao.likeBoard(map);
	}

	@Override
	public List<RBoardVo> getBoardDateList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<RBoardVo> boardList = boardDao.getBoardDateList( map );  
		
		return boardList;
	}

	@Override
	public List<RBoardVo> getBoardLikeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<RBoardVo> boardList = boardDao.getBoardLikeList( map );  
		
		return boardList;
	}

}









