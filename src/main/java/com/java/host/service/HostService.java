package com.java.host.service;

import org.springframework.web.servlet.ModelAndView;

public interface HostService {
	public void hostRegisterPage(ModelAndView mav);

	public void hostRegister(ModelAndView mav);

	public void hostPage(ModelAndView mav);

	public void reservationView(ModelAndView mav);

	public void salesView(ModelAndView mav);

	public void houseManagement(ModelAndView mav);

	public void hostCancel(ModelAndView mav);

	public void reservationOkView(ModelAndView mav);

	public void exManagement(ModelAndView mav);

	public void searchDate(ModelAndView mav);

	public void houseManagementView(ModelAndView mav);

	public void exManagementView(ModelAndView mav);

	public void exCancel(ModelAndView mav);

	public void exReservationView(ModelAndView mav);

	public void exReservationOkView(ModelAndView mav);

	public void houseNameCheck(ModelAndView mav);



}
