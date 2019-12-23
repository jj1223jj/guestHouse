package com.java.experience.service;

import org.springframework.web.servlet.ModelAndView;

public interface ExperienceService {

	public void exHostOk(ModelAndView mav);

	public void hostAddress(ModelAndView mav);

	public void exReview(ModelAndView mav);

	public void exReviewOk(ModelAndView mav);

	public void exReviewUpdate(ModelAndView mav);

	public void exReviewUpdateOk(ModelAndView mav);

	public void exReviewDelete(ModelAndView mav);

	public void exPage(ModelAndView mav);

	public void exReserve(ModelAndView mav);

	public void exReserveOk(ModelAndView mav);
// 달력
	public void exReserveCal(ModelAndView mav);

	
	
	
}
