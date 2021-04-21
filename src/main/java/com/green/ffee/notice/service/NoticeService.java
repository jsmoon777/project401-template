package com.green.ffee.notice.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.ffee.notice.vo.NoticeVO;

public interface NoticeService {

	void write(NoticeVO noticevo, MultipartHttpServletRequest mpRequest) throws Exception;

}
