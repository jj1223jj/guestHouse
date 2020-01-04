package com.java.experience.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface ExperienceService {

	public void exHostOk(ModelAndView mav);

	public void hostAddress(ModelAndView mav);

	public String exReview(ModelAndView mav);

	public void exReviewOk(ModelAndView mav);

	public void exReviewUpdate(ModelAndView mav);

	public void exReviewUpdateOk(ModelAndView mav);

	public void exReviewDelete(ModelAndView mav);

	public void exPage(ModelAndView mav);

	public void exReserve(ModelAndView mav);

	public void exReserveOk(ModelAndView mav);
	// 달력
	public void exReserveCal(ModelAndView mav);

	// 잭슨
	public Map<String, Object> exReview(HttpServletRequest request);

	// 카카오 페이
	public void kakaoPaySuccess(ModelAndView mav);

	public void kakaoPaySuccessOk(ModelAndView mav);

	public ArrayList<String> exDisableDates(String exCode, String people);

	
	
	
}
