package com.java.guestHouse.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.guestHouse.service.GuestHouseService;

@Controller
public class GuestHouseController {
	
	@Autowired
	private GuestHouseService guestHouseService;
	
	
	@RequestMapping(value = "guestHousePage/guestHouse.do",method = RequestMethod.GET)
	public ModelAndView guestHousePageRead(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		//mav.addObject("response",response);
		
		guestHouseService.guestHouseRead(mav);
		
		return mav;
	}
	
	@RequestMapping(value="guestHousePage/reservation.do",method = RequestMethod.GET)
	public void guestHouseReserv(HttpServletRequest request, HttpServletResponse response) {
		
		//System.out.println("ok");
		
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		
		guestHouseService.guestHouseReserv(mav);
		
		//return "guestHousePage/guestHouseReserv.tiles";
		 
	}

}
