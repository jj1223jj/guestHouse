package com.java.guestdelluna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.service.DellunaService;

@Controller
public class DellMemberController {

	@Autowired
	private DellunaService dellunaService;
	
	//회원수정
	@RequestMapping(value="guestdelluna/memberUpdate.do" , method=RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.updateMember(mav);
		
		return mav;
		
	}
	
	//수정ok
	@RequestMapping(value="guestdelluna/memberUpdateOk.do" , method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request , HttpServletResponse response , MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		
		dellunaService.updateMemberOk(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "guestdelluna/memberDelete.do" , method=RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.deleteMember(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "guestdelluna/memberDeleteOk.do" , method=RequestMethod.GET)
	public ModelAndView memberDeleteOk(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
	
		dellunaService.deleteMemberOk(mav);
		
		return mav;
		
		
	}
	
}
