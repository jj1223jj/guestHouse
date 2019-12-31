package com.java.admin.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminService {
	/* 회원 관리*/	
	public void memberList(ModelAndView mav);

	public void memberRead(ModelAndView mav);

	public void memberUpdateOk(ModelAndView mav);

	/* 게스트하우스 관리*/	
	public void houseList(ModelAndView mav);

	/* 체험 관리*/
	public void experienceList(ModelAndView mav);

	public void experienceStateOK(ModelAndView mav);

	public void experienceStateNo(ModelAndView mav);

	public void guestHouseStateOK(ModelAndView mav);
	
	public void guestHouseStateNo(ModelAndView mav);


}
