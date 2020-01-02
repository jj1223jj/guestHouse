package com.java.guestHouse.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.exreview.dto.ExReviewDto;
import com.java.guestHouse.service.GuestHouseService;
import com.java.guestReserve.dto.RequestPayDto;
import com.java.guestdelluna.dto.HouseReviewDto;

@Controller
public class GuestHouseController {
	
	@Autowired
	private GuestHouseService guestHouseService;
	
	
	@RequestMapping(value = "/guestHousePage/guestHouse.do",method = RequestMethod.GET)
	public ModelAndView guestHousePageRead(HttpServletRequest request, HttpServletResponse response, HouseReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("reviewDto",reviewDto);
		
		guestHouseService.guestHouseRead(mav);
		
		return mav;
	}
	
	// 후기 작성 눌렀을 때 
	@ResponseBody
	@RequestMapping(value = "/guestHousePage/review.do", method = RequestMethod.GET)
	public Map<String, Object> guestHousePageReview(HttpServletRequest request, HttpServletResponse response, HouseReviewDto reviewDto) {

		System.out.println("r@@@@@@@");

		return guestHouseService.review(request);
	}
	
	// 체험 후기 작성 완료
	@RequestMapping(value = "/guestHousePage/reviewOk.do", method = RequestMethod.GET)
	public ModelAndView guestHousePageReviewOk(HttpServletRequest request, HttpServletResponse response, HouseReviewDto reviewDto) {
		System.out.println("review write, list Ok");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("reviewDto", reviewDto);

		guestHouseService.reviewOk(mav);

		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto.toString());

		return mav;
	}
	
	// 후기 수정하기 눌렀을 때
	@RequestMapping(value = "/guestHousePage/reviewUpdate.do", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse response,
			HouseReviewDto reviewDto) {
		System.out.println("exReview 수정하기");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		
		mav.addObject("reviewDto", reviewDto);

		guestHouseService.reviewUpdate(mav);

		return mav;
	}

	// 수정 완료 눌렀을 때
	@RequestMapping(value = "/guestHousePage/reviewUpdateOk.do", method = RequestMethod.GET)
	public void exReviewUpdateOk(HttpServletRequest request, HttpServletResponse response,
			HouseReviewDto reviewDto) {
		System.out.println("exReview 수정완료");

		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("response",response);
		mav.addObject("reviewDto", reviewDto);

		guestHouseService.reviewUpdateOk(mav);

	}

	// 삭제 눌렀을 때
	@RequestMapping(value = "/guestHousePage/reviewDelete.do", method = RequestMethod.GET)
	public ModelAndView exReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("exReview 삭제하기");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		guestHouseService.reviewDelete(mav);

		return mav;
	}
	
	
	@RequestMapping(value="/guestHousePage/limitCheck.do",method = RequestMethod.GET)
	public ModelAndView limitCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		guestHouseService.limitCheck(mav);
		
		return mav;
	}
	
	@RequestMapping(value="guestHousePage/reservation.do",method = RequestMethod.GET)
	public ModelAndView guestHouseReserv(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		
		guestHouseService.guestHouseReserv(mav);
		
		return mav;		 
	}
	
	
	
	@RequestMapping(value ="/guestHousePage/reserveComplete.do", method = RequestMethod.GET)
	public ModelAndView reservComplete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		guestHouseService.reservComplete(mav);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/guestHousePage/reserveCompleteOk.do", method = RequestMethod.GET)
	public ModelAndView reservCompleteCheckOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		guestHouseService.kakaoPayCompleteOk(mav);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/guestHousePage/kakaoPay.do", method = RequestMethod.GET)
	public ModelAndView kakaoPaySuccess(HttpServletRequest request, HttpServletResponse response ) {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		  
		guestHouseService.kakaoPaySuccess(mav);
		
		return mav;
		 
	}
}
