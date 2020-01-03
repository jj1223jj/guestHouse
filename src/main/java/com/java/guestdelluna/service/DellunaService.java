package com.java.guestdelluna.service;

import org.springframework.web.servlet.ModelAndView;

public interface DellunaService {


	void zzimlist(ModelAndView mav);

	void doZzim(String memberCode, String houseCode, String zzim);

	String zzimCancle(ModelAndView mav);

	String reviewUpdate(ModelAndView mav);

	void reviewUpdateOk(ModelAndView mav);
	
	void reviewDelete(ModelAndView mav);

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

	void listPay(ModelAndView mav);

	String deleteExpPayList(ModelAndView mav);

	String deleteExpPayHouse(ModelAndView mav);

	void myInfo(ModelAndView mav);

	void houseReviewDelete(ModelAndView mav);

	String scroll(ModelAndView mav);

	void deleteAllMsg(ModelAndView mav);

	void msgDelete(ModelAndView mav);

	void msgUpdate(ModelAndView mav);

	void houseReviewUpdateOk(ModelAndView mav);

	void pointManageUseAjax(ModelAndView mav);

	void pointManageAjax(ModelAndView mav);

	void payExpAjax(ModelAndView mav);

	void payHouseAjax(ModelAndView mav);

	void zzimExpAjax(ModelAndView mav);

	void zzimHouseAjax(ModelAndView mav);

	void revExpAjax(ModelAndView mav);

	void revHouseAjax(ModelAndView mav);

	void doExZzim(String memberCode, String exCode, String zzim);



}
