package com.java.host.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.java.aop.HomeAspect;
import com.java.host.dto.HostDto;
import com.java.host.service.HostService;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;
	
	
	@RequestMapping(value="/host/register.do", method = RequestMethod.GET)
	public ModelAndView hostRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.hostRegisterPage(mav);
		
		return mav;
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
	

	@RequestMapping(value="/host/reservationOkView.do", method = RequestMethod.GET)
	public ModelAndView reservationOkView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		hostService.reservationOkView(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/exReservationView.do", method = RequestMethod.GET)
	public ModelAndView exReservationView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.exReservationView(mav);
		
		return mav;
	}
	

	@RequestMapping(value="/host/exReservationOkView.do", method = RequestMethod.GET)
	public ModelAndView exReservationOkView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		hostService.exReservationOkView(mav);
		
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
	
	@RequestMapping(value="/host/houseManagementView.do", method = RequestMethod.GET)
	public ModelAndView houseManagementView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.houseManagementView(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/exManagement.do", method = RequestMethod.GET)
	public ModelAndView exManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.exManagement(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/exManagementView.do", method = RequestMethod.GET)
	public ModelAndView exManagementView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.exManagementView(mav);
		
		return mav;
	}
	

	@RequestMapping(value="/host/hostCancel.do", method = RequestMethod.GET)
	public ModelAndView hostCancel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.hostCancel(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/exCancel.do", method = RequestMethod.GET)
	public ModelAndView exCancel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.exCancel(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/searchDate.do", method = RequestMethod.GET)
	public ModelAndView searchDate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		hostService.searchDate(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/host/houseNameCheck.do", method = RequestMethod.GET)
	public void houseNameCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		hostService.houseNameCheck(mav);
		
	}
	
	
	
	
	

}
