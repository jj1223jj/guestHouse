package com.java.experience.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.experience.dto.ExperienceDto;
import com.java.experience.service.ExperienceService;
import com.java.exreserve.dto.ExReserveDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.host.dto.HostDto;

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
		
		  HomeAspect.logger.info(HomeAspect.logMsg+"experience exHost");
		  
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
		HomeAspect.logger.info(HomeAspect.logMsg+"exHost reservation Ok");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("experienceDto",experienceDto);
		
		experienceService.exHostOk(mav);
		
		return mav;
	}
	
	// 체험 후기 리스트
	/*
	 * @RequestMapping(value="/experience/exReview.do", method = RequestMethod.GET)
	 * public void exReview(HttpServletRequest request, HttpServletResponse
	 * response, ExReviewDto exReviewDto) {
	 * 
	 * //System.out.println("exReview write,list");
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("request",request);
	 * mav.addObject("response",response);
	 * 
	 * mav.addObject("exReviewDto",exReviewDto);
	 * 
	 * String jsonText = experienceService.exReview(mav);
	 * 
	 * if (jsonText != null) {
	 * response.setContentType("application/x-json;charset=utf-8"); try {
	 * PrintWriter out; out = response.getWriter(); out.print(jsonText);
	 * out.close(); } catch (IOException e) { e.printStackTrace(); } }
	 * 
	 * // experienceService.exReview(mav);
	 * 
	 * 
	 * //return mav; }
	 */
		
		// jackson
		@ResponseBody
		@RequestMapping(value="/experience/exReview.do", method = RequestMethod.GET)
		public Map<String, Object> list(HttpServletRequest request, HttpServletResponse response){
			//System.out.println("@@@@@@@");
			
			return experienceService.exReview(request);
			
		}
	
	// 체험 후기 작성 완료
		@RequestMapping(value="/experience/exReviewOk.do", method = RequestMethod.GET)
		public ModelAndView exReviewOk(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
			HomeAspect.logger.info(HomeAspect.logMsg+"exReview write, list Ok");
			
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
		HomeAspect.logger.info(HomeAspect.logMsg+"exReview 수정하기");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("exReviewDto",exReviewDto);
		
		experienceService.exReviewUpdate(mav);
		
		return mav;
	}
	// 수정 완료 눌렀을 때
	@RequestMapping(value="/experience/exReviewUpdateOk", method = RequestMethod.GET)
	public void exReviewUpdateOk(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
		HomeAspect.logger.info(HomeAspect.logMsg+"exReview 수정완료");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		mav.addObject("exReviewDto", exReviewDto);
		
		experienceService.exReviewUpdateOk(mav);
		
	}
	
	// 삭제 눌렀을 때
	@RequestMapping(value="/experience/exReviewDelete.do", method = RequestMethod.GET)
	public ModelAndView exReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		HomeAspect.logger.info(HomeAspect.logMsg+"exReview 삭제하기");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		experienceService.exReviewDelete(mav);
		
		return mav;
	}
	
	// 체험 페이지 눌렀을 때 
	@RequestMapping(value="/experience/exPage.do", method = RequestMethod.GET)
	public ModelAndView exPage(HttpServletRequest request, HttpServletResponse response, ExReviewDto exReviewDto) {
		HomeAspect.logger.info(HomeAspect.logMsg+"체험페이지");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("response",response);
		mav.addObject("exReviewDto", exReviewDto);
	
		experienceService.exPage(mav);
		
		return mav;
	}
	
	// 체험 날짜 불가능한 것
	@RequestMapping(value="/experience/exDisableDates.do", method = RequestMethod.GET)
	public void exDisableDates(HttpServletRequest request, HttpServletResponse response) {
		String exCode=request.getParameter("exCode");
		String people=request.getParameter("people");
		HomeAspect.logger.info(HomeAspect.logMsg+"exCode: "+exCode+", people: "+people);
		
		ArrayList<String> disabled = experienceService.exDisableDates(exCode, people);
		HomeAspect.logger.info(HomeAspect.logMsg+"disabled: "+disabled.toString());
		
		response.setContentType("application/text;charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			out.print(disabled);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 예약하기 눌렀을 때
	@RequestMapping(value="/experience/exReserve.do", method = RequestMethod.GET)
	public ModelAndView exReserve(HttpServletRequest request, HttpServletResponse response, ExReserveDto exReserveDto) {
		//System.out.println("체험예약하기");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);
		mav.addObject("exReserveDto",exReserveDto);
		
		experienceService.exReserve(mav);
		
		return mav;
	}
	// 예약 요청하기 눌렀을 때(무통장결제 일 경우)
	@RequestMapping(value="/experience/exReserveOk.do", method = RequestMethod.GET)
	public ModelAndView exReserveOk(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("체험예약완료");
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		experienceService.exReserveOk(mav);
		
		return mav;
	}
	
	// 카카오 페이
	@RequestMapping(value = "/experience/kakaoPay.do", method = RequestMethod.GET)
	public ModelAndView kakaoPaySuccess(HttpServletRequest request, HttpServletResponse response ) {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		  
		experienceService.kakaoPaySuccess(mav);
		
		return mav;
		 
	}
	
	// 카카오 페이 결제 완료 시
	@RequestMapping(value = "/experience/kakaoPayOk.do", method = RequestMethod.GET)
	public ModelAndView reservCompleteCheckOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		experienceService.kakaoPaySuccessOk(mav);
		
		return mav;
	}
	
	
	
}
