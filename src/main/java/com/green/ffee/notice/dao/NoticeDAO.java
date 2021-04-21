package com.green.ffee.notice.dao;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.notice.vo.NoticeVO;

public interface NoticeDAO {

	
	//공지 글작성
	void write(NoticeVO noticevo, MultipartHttpServletRequest mpRequest);

	//공지 파일 업로드
	void insertFile(Map<String, Object> map);

}
