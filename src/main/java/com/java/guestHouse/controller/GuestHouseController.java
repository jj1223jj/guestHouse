package com.java.guestHouse.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GuestHouseController {
	
	@RequestMapping(value = "guestHousePage/guestHouse.do",method = RequestMethod.GET)
	public String test(HttpServletRequest request, HttpServletResponse response) {
		
		return "guestHousePage/guestPage.tiles";
	}
}
