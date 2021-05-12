package com.green.ffee.event.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.dao.EventDAO;
import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;
import com.green.ffee.sns.vo.FileVo;

@Repository("eventdao")
public class EventDaoImpl implements EventDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void write(EventVO eventvo, MultipartHttpServletRequest mpRequest) {
		sqlsession.insert("eventMapper.insert",eventvo);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzz ::::" + map);
		sqlsession.insert("eventMapper.insertFile", map);
		System.out.println("db 저장하기" + map);
	
	}


	@Override
	public List<EventFileVO> selectEventList(EventFileVO eventvo) {
		List<EventFileVO> eventlist =sqlsession.selectList("eventMapper.selectEventList",eventvo);
		System.out.println("eventlist ======>" + eventlist);
		return eventlist;
	}

	@Override
	public List<EventFileVO> selectEventEndList(EventFileVO eventvo) {
		List<EventFileVO> eventendlist = sqlsession.selectList("eventMapper.selectEventEndList",eventvo);
		return eventendlist;
	}
	
	@Override
	public List<EventVO> eventlist(EventVO vo) {
		List<EventVO> list = sqlsession.selectList("eventMapper.selectlist",vo);
		System.out.println("list===============>"+vo);
		return list;
	}

	
	//이벤트 게시글 목록 조회
	@Override
	public EventVO read(int eno) {
		return sqlsession.selectOne("eventMapper.read",eno);
	}

	@Override
	public List<EventFileVO> selectFileList(int eno) {
		List<EventFileVO> filelist =  sqlsession.selectList("eventMapper.selectFileList", eno);
		System.out.println("파일 리스트 읽어오기selectFileList() fileList:" + filelist);
		return filelist;
	}


	
	
}
