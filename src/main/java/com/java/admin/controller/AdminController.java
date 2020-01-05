package com.java.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.service.AdminService;
import com.java.aop.HomeAspect;
import com.java.member.dto.MemberDto;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/admin/memberList.do", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin memberManagement");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.memberList(mav);
		return mav;
	}
	
	@RequestMapping(value = "/admin/adminMemberRead.do", method = RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView  mav = new ModelAndView();
		mav.addObject("request",request);
		
		adminService.memberRead(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/memberUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		/*
		 * int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		 * HomeAspect.logger.info(HomeAspect.logMsg + pageNumber);
		 */
		
		  ModelAndView mav = new ModelAndView(); 
		  mav.addObject("request",request);
		  mav.addObject("memberDto",memberDto); 
		  adminService.memberUpdateOk(mav);
		 
		HomeAspect.logger.info(HomeAspect.logMsg+"adminController memberUpdateOk: "+memberDto.toString());
		/*
		 * mav.addObject("pageNumber",pageNumber);
		 */
		return mav;
	}
	
	// 게스트하우스 관리
	@RequestMapping(value = "/admin/houseList.do", method = RequestMethod.GET)
	public ModelAndView houseList(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin guestHouseManagement");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.houseList(mav);
		
		return mav;
	}
	
	// 체험 관리
	@RequestMapping(value = "/admin/experienceList.do", method = RequestMethod.GET)
	public ModelAndView experienceList(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin experienceManagement");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.experienceList(mav);
		 
		return mav;
	}
	
	@RequestMapping(value="/admin/exState.do", method = RequestMethod.GET)
	public ModelAndView exStateOk(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin exStateOk");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.experienceStateOK(mav);
		 
		return mav;
	}
	
	@RequestMapping(value="/admin/exStateNo.do", method = RequestMethod.GET)
	public ModelAndView exStateNo(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin exStateNO");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.experienceStateNo(mav);
		 
		return mav;
	}
	
	@RequestMapping(value="/admin/state.do", method = RequestMethod.GET)
	public ModelAndView guestHouseStateOk(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin exStateOk");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.guestHouseStateOK(mav);
		 
		return mav;
	}
	
	@RequestMapping(value="/admin/stateNo.do", method = RequestMethod.GET)
	public ModelAndView guestHouseStateNo(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"Admin exStateNO");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.guestHouseStateNo(mav);
		 
		return mav;
	}
}
