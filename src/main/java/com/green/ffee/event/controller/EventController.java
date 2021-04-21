  package com.green.ffee.event.controller;

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

@Controller
@RequestMapping("/event/*")
public class EventController {

	
	 @Inject EventService service;
	 
	 // 이벤트리스트 이동
	 @RequestMapping(value = "/eventlist", method = RequestMethod.GET)
	 public String eventlist(EventVO vo, EventFileVO eventvo,Model model) throws Exception {
		
		 List<EventVO> eventlist = service.eventlist(vo);
		 model.addAttribute("eventlist",eventlist);
		 
		 List<EventFileVO>  eventfile = service.selectEventList(eventvo);
		 model.addAttribute("eventfile",eventfile);
		 
		 return "event/eventlist";
		 
	 }


	 // 이벤트뷰 이동
	 @RequestMapping(value = "/eventview", method = RequestMethod.GET)
	 public String eventview(EventVO eventvo,EventFileVO filevo,Model model) throws Exception {
		
		 model.addAttribute("read",service.read(eventvo.getEno()));
		 
		 List<EventFileVO> eventlist = service.selectFileList(filevo.getEno());
		 model.addAttribute("eventlist",eventlist);
		 
		 
		 return "event/eventview";
		 
	 }     

	 
	 // 이벤트폼 이동
	@RequestMapping(value = "/eventform", method = RequestMethod.GET)
	public void eventform() throws Exception {

	} 

	// 이벤트폼 이동
	@RequestMapping(value = "/eventwrite", method = RequestMethod.POST)
	public String write(EventVO eventvo,MultipartHttpServletRequest mpRequest) throws Exception {
		
		service.write(eventvo,mpRequest);
		return "redirect:/event/eventlist";
		
	}


}