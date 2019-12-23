package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;


public interface MemberService {

	public void memberRegisterOk(ModelAndView mav);

	public void memberEmailCheck(ModelAndView mav);

	public void memberLoginOk(ModelAndView mav);

	public void kakaoLogin(ModelAndView mav);




}
