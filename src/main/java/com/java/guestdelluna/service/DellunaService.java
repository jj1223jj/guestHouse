package com.java.guestdelluna.service;

import org.springframework.web.servlet.ModelAndView;

public interface DellunaService {


	void zzimlist(ModelAndView mav);

	String zzimCancle(ModelAndView mav);

	void reviewOk(ModelAndView mav);

	void reviewUpdate(ModelAndView mav);

	void reviewUpdateOk(ModelAndView mav);

	void review(ModelAndView mav);

	void reviewDelete(ModelAndView mav);

	void readMyReview(ModelAndView mav);

	void myReviewList(ModelAndView mav);

	void pointManage(ModelAndView mav);

	void reserveCheck(ModelAndView mav);

	void updateMember(ModelAndView mav);

	void updateMemberOk(ModelAndView mav);

	void deleteMember(ModelAndView mav);

	void deleteMemberOk(ModelAndView mav);

	void myReserveExp(ModelAndView mav);

	String reserveCancle(ModelAndView mav) throws Throwable;

	String expCancle(ModelAndView mav) throws Throwable;

	String zzimExpCancle(ModelAndView mav);

	

	

}
