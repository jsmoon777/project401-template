package com.green.ffee.reg.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.ffee.reg.dao.RBoardDao;
import com.green.ffee.reg.service.RBoardService;
import com.green.ffee.reg.vo.CallFileVo;
import com.green.ffee.reg.vo.RBoardFileVo;
import com.green.ffee.reg.vo.RBoardFileVo2;
import com.green.ffee.reg.vo.RBoardFileVo3;
import com.green.ffee.reg.vo.RBoardFileVo4;
import com.green.ffee.reg.vo.RBoardVo;
import com.green.ffee.reg.vo.TestVo;

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
	public void likeBoard(int likeNum) {
		boardDao.likeBoard(likeNum);   
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

	@Override
	public List<String> getCallFile(int idx) {
		List<String> fileList = boardDao.getCallFile(idx);
		return fileList;
	}
	
	//test
	@Override
	public TestVo getRegBoardOne(int idx) {
		TestVo test= new TestVo();
		RBoardVo rvo=boardDao.getBoardOne(idx);
		List<String> fl=boardDao.getCallFile(idx);
		test.setRvo(rvo);
		test.setFilesList(fl);
		return null;
	}

	@Override  
	public List<RBoardFileVo> getRBoardFileList(HashMap<String, Object> map) {
		 
		List<RBoardFileVo> RBoardFileList  =  boardDao.getRBoardFileList( map ); 
		return   RBoardFileList;
}

	@Override  
	public List<RBoardFileVo2> getRBoardFileList2(HashMap<String, Object> map) {
		 
		List<RBoardFileVo2> RBoardFileList2  =  boardDao.getRBoardFileList2( map ); 
		return   RBoardFileList2;
}
	
	@Override  
	public List<RBoardFileVo3> getRBoardFileList3(HashMap<String, Object> map) {
		 
		List<RBoardFileVo3> RBoardFileList3  =  boardDao.getRBoardFileList3( map ); 
		return   RBoardFileList3;
}
	
	@Override  
	public List<RBoardFileVo4> getRBoardFileList4(HashMap<String, Object> map) {
		 
		List<RBoardFileVo4> RBoardFileList4  =  boardDao.getRBoardFileList4( map ); 
		return   RBoardFileList4;
}
	
	
	
	
}









