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
public class ReserveCheckController {

	@Autowired
	private DellunaService dellunaService;
	
	@RequestMapping(value= "guestdelluna/checkReserve.do" , method=RequestMethod.GET)
	public ModelAndView checkReservation(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.reserveCheck(mav);
		
		return mav;
	
	}

	@RequestMapping(value="/guestdelluna/viewMyReserveHouse.do" , method=RequestMethod.GET)
	public ModelAndView viewMyReserve(HttpServletRequest request , HttpServletResponse response) {
		
		//예약상품을 클릭하면 예약코드에 맞는 dto를 보여 줄 수 있게 해줌
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.myReserveHouse(mav);
		
		return mav;
		
		
	}
	
	@RequestMapping(value = "guestdelluna/viewMyReserveExp.do" , method=RequestMethod.GET)
	public ModelAndView viewMyExp(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.myReserveExp(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="guestdelluna/cancelReserve.do" , method=RequestMethod.GET)
	public void cancleReservation(HttpServletRequest request , HttpServletResponse response) {
		
		
		//예약취소를 하면 memberCode에 해당하는 dto를 삭제하면 된다
		
	}
	
}
