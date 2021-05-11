package com.green.ffee.event.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.event.dao.EventDAO;
import com.green.ffee.event.service.EventService;
import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;
import com.green.ffee.sns.utils.EventFile;
import com.green.ffee.sns.utils.FileUtils;

@Service("service")
public class EventServiceImpl implements EventService {
	
	@Resource(name="eventfile")
	private EventFile eventfile;
	
	@Inject
	EventDAO dao;
	
	
	//이벤트 작성
	@Override
	public void write(EventVO eventvo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(eventvo,mpRequest);
		
		List<Map<String, Object>> list = eventfile.parseInsertFileInfo(eventvo, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			dao.insertFile(list.get(i));
		}
	}

	//진행중인 이벤트 리스트
	@Override
	public List<EventFileVO> selectEventList(EventFileVO eventvo) {
		return dao.selectEventList(eventvo);
	}

	
	//종료된 이벤트 파일리스트
	@Override
	public List<EventFileVO> selectEventEndList(EventFileVO eventvo) {
		return dao.selectEventEndList(eventvo);
	}
		
	
	@Override
	public List<EventVO> eventlist(EventVO vo) {
		
		return dao.eventlist(vo);
	}

	
	//이벤트 목록 조회
	@Override
	public EventVO read(int eno) {
		return dao.read(eno);
	}
	
	//이벤트 첨부파일 조회
	@Override
	public List<EventFileVO> selectFileList(int eno) {
		return dao.selectFileList(eno);
	}

	
	

}
