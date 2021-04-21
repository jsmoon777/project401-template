package com.green.ffee.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/mat/*")
public class ApiController {

	
	
	
	@RequestMapping(value="/map", method = RequestMethod.GET)
	public String map() {
		return "mat/map";
		
	}
	
	@RequestMapping(value="/map2", method = RequestMethod.GET)
	public String map2() {
		return "mat/map2";
		
	}
	@RequestMapping(value="/map3", method = RequestMethod.GET)
	public String map3() {
		return "mat/map3";
		
	}
	
	@RequestMapping(value="/map4", method = RequestMethod.GET)
	public String map4() {
		return "mat/map4";
		
	}
	
	@RequestMapping(value="/map5", method = RequestMethod.GET)
	public String map5() {
		return "mat/map5";
		
	}
	
	@RequestMapping(value="/map6", method = RequestMethod.GET)
	public String map6() {
		return "mat/map6";
		
	}
	@RequestMapping(value="/map7", method = RequestMethod.GET)
	public String map7() {
		return "mat/map7";
		
	}
	@RequestMapping(value="/map8", method = RequestMethod.GET)
	public String map8() {
		return "mat/map8";
		
	}
	@RequestMapping(value="/map9", method = RequestMethod.GET)
	public String map9() {
		return "mat/map9";
		
	}
	@RequestMapping(value="/map10", method = RequestMethod.GET)
	public String map10() {
		return "mat/map10";
		
	}
	

	
	
	
}















