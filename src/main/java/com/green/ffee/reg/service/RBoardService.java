package com.green.ffee.reg.service;

import java.util.HashMap;
import java.util.List;

import com.green.ffee.reg.vo.RBoardFileVo;
import com.green.ffee.reg.vo.RBoardFileVo2;
import com.green.ffee.reg.vo.RBoardFileVo3;
import com.green.ffee.reg.vo.RBoardFileVo4;
import com.green.ffee.reg.vo.RBoardVo;
import com.green.ffee.reg.vo.TestVo;

public interface RBoardService {

	List<RBoardVo>   getBoardList(HashMap<String, Object> map);
	List<RBoardVo>   getBoardDateList(HashMap<String, Object> map);
	List<RBoardVo>   getBoardLikeList(HashMap<String, Object> map);
	//test
	TestVo getRegBoardOne(int idx); 
	List<String> getCallFile(int idx);

	void insertBoard(RBoardVo vo);

	RBoardVo getView(HashMap<String, Object> map);

	void updateBoard(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);
	
	public void likeBoard(int likeNum);
	
	List<RBoardFileVo> getRBoardFileList(HashMap<String, Object> map);
	
	List<RBoardFileVo2> getRBoardFileList2(HashMap<String, Object> map);
	
	List<RBoardFileVo3> getRBoardFileList3(HashMap<String, Object> map);
	
	List<RBoardFileVo4> getRBoardFileList4(HashMap<String, Object> map);

}
