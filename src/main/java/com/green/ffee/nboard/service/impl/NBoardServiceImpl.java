package com.green.ffee.nboard.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.nboard.dao.NBoardDao;
import com.green.ffee.nboard.service.NBoardService;
import com.green.ffee.nboard.utils.FileUtils;
import com.green.ffee.nboard.vo.BoardVo;
import com.green.ffee.sns.vo.Criteria;
import com.green.ffee.sns.vo.PageMaker;
import com.green.ffee.sns.vo.SearchCriteria;



//@Component // 부품으로 사용될 객체
//세분화
//@Service     : 비지니스 로직  
//@Repository  : db 에 접근한다 
//@Entity      : 일반 DBMS type
//@Document    : MongoDB(NoSql) 도규먼트 type 과 연결
//@Controller, @RestController 
@Service("nboardService")
public class NBoardServiceImpl implements NBoardService{

	@Resource(name="noticefileUtils")
	private FileUtils noticefileUtils;
	
	@Inject
	private NBoardDao daoo;
	
	//게시물 목록조회
	@Override
	public List<BoardVo> list(SearchCriteria scri) throws Exception {
		return daoo.list(scri);
	}

	//게시글작성
	@Override
	public void write(BoardVo boardVo,MultipartHttpServletRequest mpRequest) throws Exception {
		daoo.write(boardVo,mpRequest);
		
		List<Map<String,Object>> list = noticefileUtils.parseInsertFileInfo(boardVo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			daoo.insertFile(list.get(i)); 
		}
	}

    //게시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) {
		return daoo.listCount(scri);
	}

    //게시물 목록조회
	@Override
	public BoardVo read(int nno){
		daoo.nboardHit(nno);
		return daoo.read(nno);
	}

	@Override
	public void update(BoardVo boardVo) {

		daoo.update(boardVo);
	}

	@Override
	public void delete(int nno) {

		daoo.delete(nno);
	}

	// 첨부파일 조회
		@Override
	public List<Map<String, Object>> selectFileList(int nno) throws Exception {
		// TODO Auto-generated method stub
		return daoo.selectFileList(nno);
	}

		@Override
		public int listCount() {
			// TODO Auto-generated method stub
			return 0;
		}


	
	
	
}
