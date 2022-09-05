package com.cmb.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cmd.domain.MemberVO;
import com.cmd.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;

	@Autowired
	BCryptPasswordEncoder passEncoder; // 암호화
	  
	// 회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	 logger.info("get signup");
	}

	// 회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	 logger.info("post signup");
	  
	 String inputPass = vo.getUserPass();
	 String pass = passEncoder.encode(inputPass);
	 vo.setUserPass(pass);

	 service.signup(vo);

	 // 회원가입 시 입력하는 MemberVO에서, 패스워드(getUserPass)만 받아와서 
	 // encode로 암호화한뒤, 다시 패스워드(setUserPass)에 넣어줍니다.
	 return "redirect:/";
	}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	 logger.info("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post signin");
	   
	 MemberVO login = service.signin(vo);  
	 HttpSession session = req.getSession();
	 
	 boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
	 
	 // passMatch: 사용자가 입력한 패스워드와 DB에 저장된 패스워드 비교 후
	 // 동일하면 T, 불일치하면 F 반환
	 
	 if(login != null && passMatch) {
	  session.setAttribute("member", login);
	 } else {
	  session.setAttribute("member", null); // 세션값 제거
	  rttr.addFlashAttribute("msg", false); // false 값 부여
	  return "redirect:/member/signin";
	 }  	 
	  return "redirect:/";
	 }
	  
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");
		
		service.signout(session);
		
		return "redirect:/";
	}
}