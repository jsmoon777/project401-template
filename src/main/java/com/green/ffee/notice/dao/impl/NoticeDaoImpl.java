package com.green.ffee.notice.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.notice.dao.NoticeDAO;
import com.green.ffee.notice.vo.NoticeVO;


@Repository("noticedao")
public class NoticeDaoImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void write(NoticeVO noticevo, MultipartHttpServletRequest mpRequest) {
		sqlsession.insert("noticeMapper.insert",noticevo);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		sqlsession.insert("noticeMapper.insertFile",map);
	}

}
