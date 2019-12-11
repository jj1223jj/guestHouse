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
		
		return "host/hostRegister.tiles";
	}
	
	@RequestMapping(value="/host/guestRoom.do", method = RequestMethod.GET)
	public ModelAndView hostRegister(HttpServletRequest request, HttpServletResponse response, HostDto hostDto) {
		HomeAscpect.logger.info(HomeAscpect.logMsg + hostDto.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("hostDto", hostDto);
		
		hostService.hostRegister(mav);
		
		
		
		return mav;
	}
	
}
