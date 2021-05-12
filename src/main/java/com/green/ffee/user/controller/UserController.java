package com.green.ffee.user.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.green.ffee.event.vo.EventFileVO;
import com.green.ffee.interceptor.Auth;
import com.green.ffee.pds.vo.RPdsVo;
import com.green.ffee.regmenu.vo.RMenuVo;
import com.green.ffee.user.logindto.LoginDTO;
import com.green.ffee.user.service.UserService;
import com.green.ffee.user.vo.ProfileVo;
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
		
		UserVo userVo = userService.login(loginDTO);

       if (userVo == null || !BCrypt.checkpw(loginDTO.getUser_pw(), userVo.getUser_pw())) {
           return;
       }
       model.addAttribute("user", userVo);
	}
	
	
	@RequestMapping(value="/logout")
	public	String logout( HttpSession session) {
		session.invalidate(); 
		return "redirect:/"; 
	}
	
	
	// 회원동의 
	@RequestMapping(value = "/registerPro", method = RequestMethod.GET)
	public  ModelAndView   registerPro( ) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/registerPro");
		return  mv;
	}
	
	//
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public  ModelAndView   registerForm( UserVo userVo ) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", userVo);
		mv.setViewName("user/register");
		return  mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public  String   register(  UserVo userVo, RedirectAttributes redirectAttributes  ) {
		String hashedPw = BCrypt.hashpw(userVo.getUser_pw(), BCrypt.gensalt());
		userVo.setUser_pw(hashedPw);
		userService.register( userVo );
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
	public ModelAndView userUpdateForm(UserVo userVo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userupdate");
		return  mv;
	}
	

	@RequestMapping(value = "/userupdate")
	public  String   userUpdate(  UserVo userVo, RedirectAttributes redirectAttributes  ) {
		String hashedPw = BCrypt.hashpw(userVo.getUser_pw(), BCrypt.gensalt());
		userVo.setUser_pw(hashedPw);
		userService.userUpdate( userVo );
		return  "redirect:/mypage";
	}
	
	@RequestMapping(value = "/userDelete")
	public String userDelete(UserVo userVo, HttpSession session) throws Exception{
		userVo = (UserVo) session.getAttribute("login");
		
		userService.userDelete(userVo.getUser_id());
		
		return "user/userdelete";
	}
	
	@RequestMapping(value="/idsearch", method=RequestMethod.GET)
	public String idSearch() {
		return "user/idsearch"; 
	}
	
	@Auth
	@RequestMapping(value="/mypage")
	public String myPage(HttpSession session, Model model, ProfileVo profileVo) {
		UserVo userVo = (UserVo)session.getAttribute("login");
		String user_id = userVo.getUser_id();
		userVo = userService.getUser(user_id);
		profileVo = userService.readProfile(user_id);
		System.out.println("profileVo : " + profileVo);
		
		model.addAttribute("profile",profileVo);
		model.addAttribute("userVo", userVo);
		if( userVo == null ) {
			return "redirect:/login";
		}
		
		return "/user/myPage";
	}
	@Auth
	@RequestMapping(value="/profilePhoto")
	public String profilePhoto(HttpSession session, Model model, ProfileVo profileVo) {
		UserVo userVo = (UserVo)session.getAttribute("login");
		String user_id = userVo.getUser_id();
		userVo = userService.getUser(user_id);
		profileVo = userService.readProfile(user_id);
		
		model.addAttribute("profile",profileVo);
		return "user/profilePhoto"; 
	}
	@Auth
	@RequestMapping("/uploadProfile")
	public  ModelAndView   uploadProfile(HttpSession session,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {
		    // MultipartHttpServletRequest request
		// map : form 안의 모든 정보
//		System.out.println("write():" + map);
		
		String   filePath  = "C:\\ffee\\user\\";
		
		// 새글 저장 : MBoard        - 게시글 저장   - Dao
		//             Files         - 첨부파일 목록 - Dao  
		//             c:\\upload\\  - 첨부파일 저장 
//		String user_id = (String) map.get("user_id");
		UserVo userVo = (UserVo)session.getAttribute("login");
		String user_id = userVo.getUser_id();
		ProfileVo profileVo =  userService.readProfile(user_id);
		if(profileVo != null) {
			if (profileVo.getSfilename() != null) { // 이미 프로필 사진이 있을경우
				File file = new File(filePath + profileVo.getSfilename()); // 경로 + 유저 프로필사진 이름을 가져와서
				file.delete(); // 원래파일 삭제
				userService.deleteProfile(map);
				
			}
		}
		
		userService.insertProfile(map, request);
				
		
		ModelAndView  mv = new ModelAndView();
		mv.addObject("map",  map);
		mv.setViewName("redirect:/mypage");
				
		return   mv;
	}
	
	@RequestMapping(value="/adminPost")
	public	String adminPost() {
		return "user/adminPost"; 
	}
	
	
}
