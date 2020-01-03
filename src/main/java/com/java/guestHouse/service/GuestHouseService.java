package com.java.guestHouse.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface GuestHouseService {
	public void guestHouseRead(ModelAndView mav);
	public void guestHouseReserv(ModelAndView mav);
	public void reservComplete(ModelAndView mav);
	public void kakaoPaySuccess(ModelAndView mav);
	public void kakaoPayCompleteOk(ModelAndView mav);
	public void limitCheck(ModelAndView mav);
	public String review(ModelAndView mav);
	public void reviewOk(ModelAndView mav);
	public void reviewUpdate(ModelAndView mav);
	public void reviewUpdateOk(ModelAndView mav);
	public void reviewDelete(ModelAndView mav);
	
	public Map<String,Object> review(HttpServletRequest request);
}
