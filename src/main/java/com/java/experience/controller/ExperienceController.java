package com.java.experience.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.experience.dto.ExperienceDto;
import com.java.experience.service.ExperienceService;
import com.java.exreview.dto.ExReviewDto;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

@Controller
public class ExperienceController {

	@Autowired
	private ExperienceService experienceService;
	
	// 체험 등록 눌렀을 때
	@RequestMapping(value="/experience/exHost.do", method = RequestMethod.GET)
		public ModelAndView exHost(HttpServletRequest request, HttpServletResponse response, HostDto hostDto) {
		
		  System.out.println("experience exHost");
		  
		  ModelAndView mav = new ModelAndView(); 
		  mav.addObject("request", request);
		  mav.addObject("hostDto",hostDto);

		  experienceService.hostAddress(mav);
		  		  
		  mav.setViewName("experience/exHost.tiles"); 
		  return mav;
		 
	}
	
	// 체험 등록에서 다음 눌렀을 때
	@RequestMapping(value="/experience/exHostOk.do", method = RequestMethod.POST)
	public ModelAndView exHostOk(HttpServletRequest request, HttpServletResponse response, ExperienceDto experienceDto) {
		System.out.println("exHost reservation Ok");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("experienceDto",experienceDto);
		
		experienceService.exHostOk(mav);
		
		return mav;
	}
	
	// 체험 후기 작성 눌렀을 때 
		@RequestMapping(value="/experience/exReview.do", method = RequestMethod.GET)
		public ModelAndView exReview(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
			System.out.println("exReview write,list");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("response", response);
			mav.addObject("memberDto",memberDto);
			experienceService.exReview(mav);
			
			return mav;
		}
	
	// 체험 후기 작성 완료
		/*@RequestMapping(value="/experience/exReviewOk.do", method = RequestMethod.GET)
		public ModelAndView exReviewOk(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
			System.out.println("exReview write, list Ok");
			
			HomeAscpect.logger.info(HomeAscpect.logMsg + exReviewDto.toString());
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("request",request);
			experienceService.exReviewOk(mav);
			
			mav.addObject("exReviewDto", exReviewDto);
			
			experienceService.exReviewOk(mav);
			
			return mav;
		}*/
		
	// 체험 페이지 눌렀을 때 (x)
	@RequestMapping(value="/experience/exPage.do", method = RequestMethod.GET)
	public ModelAndView exPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		experienceService.exHostOk(mav);
		return mav;
	}
	
	
	
	
}
