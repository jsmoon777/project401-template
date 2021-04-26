package com.green.ffee.user.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.ffee.interceptor.Auth;
import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.service.UserService;
import com.green.ffee.user.vo.UserVo;

@Controller
public class UserController {
	
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "user/loginForm"; 
	}
	
	@RequestMapping(value = "/user/loginPost", method = RequestMethod.POST)
	 public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		
		UserVo vo = userService.login(loginDTO);

       if (vo == null || !BCrypt.checkpw(loginDTO.getUser_pw(), vo.getUser_pw())) {
           return;
       }
       model.addAttribute("user", vo);
	}
	
	
	@RequestMapping(value="/logout")
	public	String logout( HttpSession session) {
		session.invalidate(); 
		return "redirect:/"; 
	}
	
	
	// 회원동의 
	@RequestMapping(value = "/registerPro", method = RequestMethod.GET)
	public  ModelAndView   registerPro( UserVo vo ) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/registerPro");
		return  mv;
	}
	
	//
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public  ModelAndView   registerForm( UserVo vo ) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/register");
		return  mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public  String   register(  UserVo vo, RedirectAttributes redirectAttributes  ) {
		String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt());
        vo.setUser_pw(hashedPw);
		userService.register( vo );
		return  "redirect:/login";
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) {

		return userService.idCheck(user_id);
	}
	
	@RequestMapping(value = "/nicknamecheck", method = RequestMethod.GET)
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		
		return userService.nicknameCheck(nickname);
	}
	
	@RequestMapping(value="/selfcheckUForm")
	public String selfCheckUForm() {
		return "user/selfcheckU"; 
	}
	
	@RequestMapping(value="/selfcheckDForm")
	public String selfCheckDForm() {
		return "user/selfcheckD"; 
	}
	
	@RequestMapping(value="/selfcheckU")
	public String selfCheckU(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		
		UserVo vo = userService.login(loginDTO);

       if (vo == null || !BCrypt.checkpw(loginDTO.getUser_pw(), vo.getUser_pw())) {
           return"user/catchPostU";
       }
       
		return "redirect:/userupdateForm";
	}
	
	@RequestMapping(value="/selfcheckD")
	public String selfCheckD(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		
		UserVo vo = userService.login(loginDTO);
		
		if (vo == null || !BCrypt.checkpw(loginDTO.getUser_pw(), vo.getUser_pw())) {
			return"user/catchPostD";
		}
		
		return "redirect:/userDelete";
	}
	
	
	
	@RequestMapping(value="/userupdateForm")
	public ModelAndView userUpdateForm(UserVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userupdate");
		return  mv;
	}
	

	@RequestMapping(value = "/userupdate")
	public  String   userUpdate(  UserVo vo, RedirectAttributes redirectAttributes  ) {
		String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt());
        vo.setUser_pw(hashedPw);
		userService.userUpdate( vo );
		return  "redirect:/mypage";
	}
	
	@RequestMapping(value = "/userDelete")
	public String userDelete(UserVo vo, HttpSession session) throws Exception{
		vo = (UserVo) session.getAttribute("login");
		
		System.out.println("delete-------------" + vo);
		userService.userDelete(vo.getUser_id());
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/idsearch", method=RequestMethod.GET)
	public String idSearch() {
		return "user/idsearch"; 
	}
	
	@Auth
	@RequestMapping(value="/mypage")
	public String myPage(HttpSession session, Model model) {
//		UserVo vo = (UserVo)session.getAttribute("login");
//		vo = userService.getUser(vo.getUser_id());
//		
//		model.addAttribute("vo", vo);
//		if( vo == null ) {
//			return "redirect:/login";
//		}
		
		return "/user/myPage";
	}
}
