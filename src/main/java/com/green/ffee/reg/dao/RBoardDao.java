package com.green.ffee.reg.dao;

import java.util.HashMap;
import java.util.List;

import com.green.ffee.reg.vo.RBoardVo;

public interface RBoardDao {

	List<RBoardVo> getBoardList(HashMap<String, Object> map);
	List<RBoardVo> getBoardDateList(HashMap<String, Object> map);
	List<RBoardVo> getBoardLikeList(HashMap<String, Object> map);

	void insertBoard(RBoardVo vo);

	RBoardVo getView(HashMap<String, Object> map);

	void updateBoard(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);
	
	void likeBoard(HashMap<String, Object> map);

}
