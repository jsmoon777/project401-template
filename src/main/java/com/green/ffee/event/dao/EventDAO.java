package com.green.ffee.event.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;

public interface EventDAO {
	
	//이벤트 작성
	void write(EventVO eventvo, MultipartHttpServletRequest mpRequest);
	
	//이벤트 작성 및 파일 업로드
	void insertFile(Map<String, Object> map);
	
	//이벤트 이미지 리스트
	List<EventFileVO> selectEventList(EventFileVO eventvo);
	
	//종료된 이벤트 파일 리스트
	List<EventFileVO> selectEventEndList(EventFileVO eventvo);

	//이벤트 리스트
	List<EventVO> eventlist(EventVO vo);
	
	// 이벤트 게시글 조회 
	EventVO read(int eno);
	// 이벤트 첨부파일 조회
	List<EventFileVO> selectFileList(int eno);
	

}
