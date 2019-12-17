package com.java.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import com.fasterxml.jackson.databind.JsonNode;
import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;

@Controller
public class MemController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/register.do", method = RequestMethod.GET)
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Member Register");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mav.setViewName("member/register.tiles");
		return mav;
	}
	
	@RequestMapping(value="/member/registerOk.do", method = RequestMethod.POST)
	public ModelAndView memberRegisterOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		System.out.println("Member Register Ok");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("memberDto",memberDto);
	
		memberService.memberRegisterOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/emailCheck.do", method = RequestMethod.GET)
	public ModelAndView memberIdCheck(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Email Check");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		memberService.memberEmailCheck(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/login.do", method = RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("member Login");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		mav.setViewName("member/login.tiles");
		
		return mav;
	}
	
	@RequestMapping(value="/member/loginOk.do", method = RequestMethod.POST)
	public ModelAndView memberLoginOk(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("member LoginOk");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		memberService.memberLoginOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/logout.do", method = RequestMethod.GET)
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("member Logout");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		mav.setViewName("member/logout.tiles");
			
		return mav;
	}
	
	
	
	
	
	
	/*
	 * @RequestMapping(value = "kakaologin", produces = "application/json", method =
	 * {RequestMethod.GET, RequestMethod.POST}) public ModelAndView
	 * KakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
	 * HttpServletResponse response, HttpSession session) throws Exception {
	 * System.out.println("code: " + code);
	 * 
	 * ModelAndView mav = new ModelAndView(); JsonNode node =
	 * KakaoController.getAccessToken(code);
	 * 
	 * return mav; }
	 */
	
	
}
