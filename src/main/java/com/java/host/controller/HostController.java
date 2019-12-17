package com.java.host.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.host.dto.HostDto;
import com.java.host.service.HostService;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;
	
	
	@RequestMapping(value="/host/register.do", method = RequestMethod.GET)
	public String hostRegister(HttpServletRequest request, HttpServletResponse response) {
		
		return "host/hostRegister2.tiles";
	}
	
	@RequestMapping(value="/host/guestRoom.do", method = {RequestMethod.POST})
	public ModelAndView hostRegister(HttpServletRequest request, HttpServletResponse response, HostDto hostDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("hostDto", hostDto);
		
		hostService.hostRegister(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/hostPage.do", method = RequestMethod.GET)
	public ModelAndView hostPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.hostPage(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/reservationView.do", method = RequestMethod.GET)
	public ModelAndView reservationView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.reservationView(mav);
		
		return mav;
	}
	

	@RequestMapping(value="/host/reservationOkView.do", method = RequestMethod.POST)
	public ModelAndView reservationOkView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.reservationOkView(mav);
		
		return mav;
	}

	@RequestMapping(value="/host/salesView.do", method = RequestMethod.GET)
	public ModelAndView salesView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.salesView(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/houseManagement.do", method = RequestMethod.GET)
	public ModelAndView houseManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.houseManagement(mav);
		
		return mav;
	}
	

	@RequestMapping(value="/host/hostCancel.do", method = RequestMethod.GET)
	public ModelAndView hostCancel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.hostCancel(mav);
		
		return mav;
	}
	

}
