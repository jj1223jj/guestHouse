package com.java.guestdelluna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.guestdelluna.dto.MemberDto;
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
		dellunaService.review(mav);
		
		return mav;
	
	}
	
	@RequestMapping(value="guestdelluna/reviewOk.do" , method=RequestMethod.POST)
	public ModelAndView reviewOk(HttpServletRequest request , HttpServletResponse response, ReviewDto reviewDto) {
		
		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto.toString());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		
		dellunaService.reviewOk(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="guestdelluna/reviewUpdate.do" , method=RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		dellunaService.reviewUpdate(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="guestdelluna/reviewUpdateOk.do" , method=RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request , HttpServletResponse response , ReviewDto reviewDto) {
		
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg + pageNumber);		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		
		dellunaService.reviewUpdateOk(mav);
				
		return mav;
		
	}
	
	//페이징 기법
	@RequestMapping(value="guestdelluna/reviewDelete.do" , method=RequestMethod.GET)
	public ModelAndView reviewDelete(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("request", request);
		mav.addObject("boardNumber", boardNumber);
		
		dellunaService.reviewDelete(mav);
		
		return mav;
		
	}

	@RequestMapping(value="guestdelluna/myReview.do" , method=RequestMethod.GET)
	public ModelAndView myReview(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.readMyReview(mav);
		
		return mav;
		
	}
	//내가 쓴 후기
	@RequestMapping(value="guestdelluna/allMyReview.do" , method=RequestMethod.GET)
	public ModelAndView myReivewList(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.myReviewList(mav);
		
		return mav;
		
	}
	

	
}
