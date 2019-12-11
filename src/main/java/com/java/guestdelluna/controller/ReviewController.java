package com.java.guestdelluna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.guestdelluna.dto.ReviewDto;
import com.java.guestdelluna.service.DellunaService;

@Controller
public class ReviewController {

	@Autowired
	private DellunaService dellunaService ;
	
	@RequestMapping(value="guestdelluna/review.do" , method=RequestMethod.GET)
	public ModelAndView reviewDo(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		mav.setViewName("guestdelluna/review.tiles");
		
		return mav;
	
	}
	
	@RequestMapping(value="guestdelluna/reviewOk.do" , method=RequestMethod.GET)
	public ModelAndView reviewOk(HttpServletRequest request , HttpServletResponse response, ReviewDto reviewDto) {
		
		HomeAscpect.logger.info(HomeAscpect.logMsg + reviewDto.toString());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		
		dellunaService.reviewOk(mav);
		
		return mav;
		
	}
	
	
	public ModelAndView reviewUpdate(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		dellunaService.reviewUpdate(mav);
		
		return mav;
		
	}
	
}
