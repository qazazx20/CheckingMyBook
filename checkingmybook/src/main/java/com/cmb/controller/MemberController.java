package com.cmb.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	BCryptPasswordEncoder passEncoder;
	  
	// 회원가입 get
	@GetMapping("/signup")
	public void getSignup() throws Exception {
	 logger.info("get signup");
	}

	// 회원가입 post
	@PostMapping("/signup")
	public String postSignup(MemberVO vo) throws Exception {
	 logger.info("post signup");
	  
	 String input = vo.getUserPass();
	 String pwd = passEncoder.encode(input);
	 vo.setUserPass(pwd);

	 service.signup(vo);

	 return "redirect:/";
	}
	
	// 로그인 get
	@GetMapping("/signin")
	public void getSignin() throws Exception {
	 logger.info("get signin");
	}

	// 로그인 post
	@PostMapping("/signin")
	public String postSignin(MemberVO vo, HttpServletRequest request, RedirectAttributes redirect) throws Exception {
	 logger.info("post signin");
	   
	 MemberVO login = service.signin(vo);  
	 HttpSession session = request.getSession();
	 
	  boolean pwdMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
	 
	 if(login != null && pwdMatch) {
		 session.setAttribute("member", login);
	 } else {
		 session.setAttribute("member", null);
		 redirect.addFlashAttribute("msg", false);
	  return "redirect:/member/signin";
	 }  	 
	  return "redirect:/";
	 }
	  
	
	// 로그아웃
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) throws Exception {
		logger.info("get logout");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
}