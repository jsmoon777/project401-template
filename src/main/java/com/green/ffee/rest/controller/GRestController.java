package com.green.ffee.rest.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.ffee.pds.service.RPdsService;

// @RestController : @Controller + @ResponseBody
@RestController
public class GRestController {

	@Autowired
	private  RPdsService pdsService;
	
//	@RequestMapping(method=RequestMethod.GET,
//			   headers="Accept=application/json"  )
//	public List<UserVo> getList() {
//		List<UserVo> list = userService.getUserList();
//		return list;
//	}
	
	@RequestMapping(value = "/deleteFile",
			 method  = RequestMethod.GET,
			 headers = "Accept=application/json"  )
	public void  deleteFile(@RequestParam HashMap<String, Object> map) {
		
		pdsService.deleteUploadedFile(map); // file_num = 17
				
	}
}










