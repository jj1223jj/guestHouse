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

/**
 * @author : 정승현
 * @Date : 2019. 12. 18.
 * @Content : 후기 입력까지 완료, 리스트, 별점 뿌리기 해야 함,
 * 			  exhost.jsp에서 exAddress에 address랑 detailAddress가 합친 값이 DB들어갔는지 확인해야 함
 * 			  hidden때문에 뷰 깨지는지 확인해야 함 
 * 
 */

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
		public ModelAndView exReview(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
			System.out.println("exReview write,list");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("exReviewDto",exReviewDto);
			
			experienceService.exReview(mav);
			
			return mav;
		}
	
	// 체험 후기 작성 완료
		@RequestMapping(value="/experience/exReviewOk.do", method = RequestMethod.GET)
		public ModelAndView exReviewOk(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
			System.out.println("exReview write, list Ok");
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("response",response);
			mav.addObject("exReviewDto", exReviewDto);

			experienceService.exReviewOk(mav);
			
			HomeAspect.logger.info(HomeAspect.logMsg + exReviewDto.toString());

			
			return mav;
		}
	
	// 후기 수정하기 눌렀을 때
	@RequestMapping(value="/experience/exReviewUpdate.do", method  = RequestMethod.GET)
	public ModelAndView exReviewUpdate(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
		System.out.println("exReview 수정하기");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("exReviewDto",exReviewDto);
		
		experienceService.exReviewUpdate(mav);
		
		return mav;
	}
	// 수정 완료 눌렀을 때
	@RequestMapping(value="/experience/exReviewUpdateOk", method = RequestMethod.GET)
	public ModelAndView exReviewUpdateOk(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
		System.out.println("exReview 수정완료");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("exReviewDto", exReviewDto);
		
		experienceService.exReviewUpdateOk(mav);
		
		return mav;
	}
	
	// 삭제 눌렀을 때
	@RequestMapping(value="/experience/exReviewDelete.do", method = RequestMethod.GET)
	public ModelAndView exReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("exReview 삭제하기");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		experienceService.exReviewDelete(mav);
		
		return mav;
	}
	
	// 체험 페이지 눌렀을 때 
	@RequestMapping(value="/experience/exPage.do", method = RequestMethod.GET)
	public ModelAndView exPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("체험페이지");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		experienceService.exPage(mav);
		
		return mav;
	}
	
}
