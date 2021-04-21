package com.green.ffee.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.notice.dao.NoticeDAO;
import com.green.ffee.notice.service.NoticeService;
import com.green.ffee.notice.utils.NoticeFile;
import com.green.ffee.notice.vo.NoticeVO;
import com.green.ffee.sns.utils.EventFile;

@Service("noticeservice")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name="noticefile")
	private NoticeFile noticefile;
	
	@Inject
	NoticeDAO noticedao;

	@Override
	public void write(NoticeVO noticevo, MultipartHttpServletRequest mpRequest) throws Exception{
		noticedao.write(noticevo,mpRequest);
		
		List<Map<String, Object>> list = noticefile.parseInsertFileInfo(noticevo, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			noticedao.insertFile(list.get(i));
		}
	
		
	}
}

