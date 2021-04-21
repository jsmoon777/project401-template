package com.green.ffee.notice.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.ffee.event.service.EventService;
import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.event.vo.EventVO;
import com.green.ffee.member.service.MemberService;
import com.green.ffee.member.vo.MemberVO;
import com.green.ffee.notice.service.NoticeService;
import com.green.ffee.notice.vo.NoticeVO;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	
	 @Inject NoticeService noticeservice;
	 
	 // 이벤트폼 이동
	@RequestMapping(value = "/noticeform", method = RequestMethod.GET)
	public void eventform() throws Exception {

	}

	// 이벤트폼 이동
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeVO noticevo , MultipartHttpServletRequest mpRequest) throws Exception {
		
		noticeservice.write(noticevo,mpRequest);
		
		return "redirect:/notice/noticelist";
		
	}


}