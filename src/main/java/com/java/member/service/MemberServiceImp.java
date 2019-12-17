package com.java.member.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public void memberRegisterOk(ModelAndView mav) {

		Map <String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		
		memberDto.setMemberName(request.getParameter("memberName"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setPassword(request.getParameter("password"));
		
		memberDto.setPhone(request.getParameter("phone"));
		memberDto.setRegDate(new Date());	
		memberDto.setMemberLevel("A"); 	
		
		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());

		int check = memberDao.register(memberDto);
		
		HomeAspect.logger.info(HomeAspect.logMsg + "check: " + check);

		mav.addObject("check", check);
		
		mav.setViewName("member/registerOk.tiles");
	}

	@Override
	public void memberEmailCheck(ModelAndView mav) {
		Map <String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String email = request.getParameter("email");
		HomeAspect.logger.info(HomeAspect.logMsg +"입력한 email: " + email);
		
		int check = memberDao.emailCheck(email);
		HomeAspect.logger.info(HomeAspect.logMsg +"기존에 있는 이메일이면 1 / 아니면 0: " + check);
		
		mav.addObject("check", check);
		mav.addObject("email", email);
		
		mav.setViewName("member/emailCheck.empty");
		
	}
	
	@Override
	public void memberLoginOk(ModelAndView mav) {
		
		Map <String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HomeAspect.logger.info(HomeAspect.logMsg +"입력한 email: "+ email + "\t\t"+"입력한 password: " + password);
		
		String memberLevel = memberDao.login(email,password);	
		
		HomeAspect.logger.info(HomeAspect.logMsg +"회원등급 (회원이 아닐경우 null값): "+ memberLevel);
		
		if(memberLevel != null) {	
			mav.addObject("memberLevel", memberLevel);	
			mav.addObject("email", email);
		}
		
		mav.setViewName("member/loginOk.tiles");
		
	}
}
