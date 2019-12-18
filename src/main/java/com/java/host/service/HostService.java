package com.java.host.service;

import org.springframework.web.servlet.ModelAndView;

public interface HostService {

	public void hostRegister(ModelAndView mav);

	public void hostPage(ModelAndView mav);

	public void reservationView(ModelAndView mav);

	public void salesView(ModelAndView mav);

	public void houseManagement(ModelAndView mav);

	public void hostCancel(ModelAndView mav);

	public void reservationOkView(ModelAndView mav);

}