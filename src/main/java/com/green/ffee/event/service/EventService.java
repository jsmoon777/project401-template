package com.green.ffee.event.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;

public interface EventService {

void write(EventVO eventvo, MultipartHttpServletRequest mpRequest) throws Exception;

//진행중인 파일이미지리스트
public List<EventFileVO> selectEventList(EventFileVO eventvo);

// 리스트
public List<EventVO> eventlist(EventVO vo);

// 뷰페이지
public EventVO read(int eno);

// 첨부파일 조회
public List<EventFileVO> selectFileList(int eno);

//종료된 파일리스트
public List<EventFileVO> selectEventEndList(EventFileVO eventvo);


}
