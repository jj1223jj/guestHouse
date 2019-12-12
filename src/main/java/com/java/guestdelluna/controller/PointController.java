package com.java.guestdelluna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.guestdelluna.service.DellunaService;

@Controller
public class PointController {

	@Autowired
	private DellunaService dellunaService;
	
	@RequestMapping(value="guestdelluna/managePoint.do" , method=RequestMethod.GET)
	public ModelAndView managePoint(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.pointManage(mav);
		
		return mav;
		
	}
	
}
