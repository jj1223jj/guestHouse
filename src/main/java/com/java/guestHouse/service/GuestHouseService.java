package com.java.guestHouse.service;

import org.springframework.web.servlet.ModelAndView;

public interface GuestHouseService {
	public void guestHouseRead(ModelAndView mav);
	public void guestHouseReserv(ModelAndView mav);
	public void reservComplete(ModelAndView mav);
	public void kakaoPaySuccess(ModelAndView mav);
}
