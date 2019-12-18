package com.java.guestdelluna.service;

import org.springframework.web.servlet.ModelAndView;

public interface DellunaService {


	void zzimlist(ModelAndView mav);

	void zzimCancle(ModelAndView mav);

	void doZzim(String memberCode, String houseCode, String zzim);

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

	void myReserveHouse(ModelAndView mav);

	void myReserveExp(ModelAndView mav);

	

	

}
