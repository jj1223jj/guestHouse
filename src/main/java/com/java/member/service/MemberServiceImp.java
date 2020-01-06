package com.java.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Printer;
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

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		MemberDto memberDto = (MemberDto) map.get("memberDto");

		memberDto.setMemberName(request.getParameter("memberName"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setPassword(request.getParameter("password"));

		memberDto.setPhone(request.getParameter("phone"));
		memberDto.setRegDate(new Date());
		memberDto.setMemberLevel("A");
		memberDto.setMemberInfo("");

		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());

		int check = memberDao.register(memberDto);

		HomeAspect.logger.info(HomeAspect.logMsg + "check: " + check);

		mav.addObject("check", check);

		mav.setViewName("member/registerOk.tiles");
	}

	@Override
	public void memberEmailCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		String email = request.getParameter("email");
		HomeAspect.logger.info(HomeAspect.logMsg + "입력한 email: " + email);

		int check = memberDao.emailCheck(email);
		HomeAspect.logger.info(HomeAspect.logMsg + "기존에 있는 이메일이면 1 / 아니면 0: " + check);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// mav.setViewName("member/emailAjax.empty");

	}

	@Override
	public void memberLoginOk(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		HomeAspect.logger.info(HomeAspect.logMsg + "입력한 email: " + email + "\t\t" + "입력한 password: " + password);

		MemberDto memberDto = memberDao.memberSel(email, password);
		// HomeAspect.logger.info(HomeAspect.logMsg +"memberDto: "+
		// memberDto.toString());

		if (memberDto != null) {

			int memberCode = memberDto.getMemberCode();
			String memberLevel = memberDto.getMemberLevel();
			HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());

			HomeAspect.logger.info(
					HomeAspect.logMsg + "회원등급 (회원이 아닐경우 null값): " + memberLevel + "		memberCode:" + memberCode);

			if (memberLevel != null) {
				mav.addObject("memberLevel", memberLevel);
				mav.addObject("email", email);
				mav.addObject("memberCode", memberCode);
			}

			// memberDto가 null일 경우
		} else {
			String memberLevel = null;
		}

	}

	@Override
	public void kakaoLogin(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String email = request.getParameter("email");
		String memberImgPath = request.getParameter("memberImgPath");
		String memberName = request.getParameter("memberName");

		String memberLevel = "A";

		int emailChk = memberDao.kakaoEmailChk(email);
		int check = 0;

		if (emailChk == 0) {
			check = memberDao.inserKakao(email, memberImgPath, memberName);

		} else {
			check = emailChk;
		}

		HomeAspect.logger.info(HomeAspect.logMsg + "check: " + check);

		int memberCode = memberDao.getMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + "memberCode: " + memberCode);

		mav.addObject("check", check);
		mav.addObject("memberLevel", memberLevel);
		mav.addObject("email", email);
		mav.addObject("memberCode", memberCode);

	}
}
